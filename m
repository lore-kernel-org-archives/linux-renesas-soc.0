Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:57122 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733261AbeKMXN2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 18:13:28 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Eric Auger <eric.auger@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, kvm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5] vfio: platform: Add generic reset controller support
Date: Tue, 13 Nov 2018 14:15:08 +0100
Message-Id: <20181113131508.18246-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Vfio-platform requires dedicated reset support, provided either by ACPI,
or, on DT platforms, by a device-specific reset driver matching against
the device's compatible value.

On many SoCs, devices are connected to an SoC-internal reset controller.
If the reset hierarchy is described in DT using "resets" properties, or
in lookup tables in platform code, and devices have exactly one
dedicated reset each, such devices can be reset in a generic way through
the reset controller subsystem.  Hence add support for this, avoiding
the need to write device-specific reset drivers for each single device
on affected SoCs.

Devices that do require a more complex reset procedure can still provide
a device-specific reset driver, as that takes precedence.

Note that this functionality depends on CONFIG_RESET_CONTROLLER=y, and
becomes a no-op (as in: "No reset function found for device") if reset
controller support is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
This depends on "[PATCH] reset: Add reset_control_get_count()"
(https://lore.kernel.org/lkml/20181113124744.7769-1-geert+renesas@glider.be/).

v5:
  - Use reset_control_get_exclusive() instead of rejected
    reset_control_get_dedicated(), as exclusive already implies a
    dedicated reset line,
  - Ensure the device has exactly one reset,

v4:
  - Add Reviewed-by,
  - Use new RFC reset_control_get_dedicated() instead of
    of_reset_control_get_exclusive(), to (a) make it more generic, and
    (b) make sure the reset returned is really a dedicated reset, and
    does not affect other devices,

v3:
  - Add Reviewed-by,
  - Merge similar checks in vfio_platform_has_reset(),

v2:
  - Don't store error values in vdev->reset_control,
  - Use of_reset_control_get_exclusive() instead of
    __of_reset_control_get(),
  - Improve description.
---
 drivers/vfio/platform/vfio_platform_common.c  | 29 +++++++++++++++++--
 drivers/vfio/platform/vfio_platform_private.h |  1 +
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index c0cd824be2b767be..ce2aad8e0a8159f9 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
@@ -113,11 +114,14 @@ static bool vfio_platform_has_reset(struct vfio_platform_device *vdev)
 	if (VFIO_PLATFORM_IS_ACPI(vdev))
 		return vfio_platform_acpi_has_reset(vdev);
 
-	return vdev->of_reset ? true : false;
+	return vdev->of_reset || vdev->reset_control;
 }
 
 static int vfio_platform_get_reset(struct vfio_platform_device *vdev)
 {
+	struct reset_control *rstc;
+	int count;
+
 	if (VFIO_PLATFORM_IS_ACPI(vdev))
 		return vfio_platform_acpi_has_reset(vdev) ? 0 : -ENOENT;
 
@@ -128,8 +132,24 @@ static int vfio_platform_get_reset(struct vfio_platform_device *vdev)
 		vdev->of_reset = vfio_platform_lookup_reset(vdev->compat,
 							&vdev->reset_module);
 	}
+	if (vdev->of_reset)
+		return 0;
+
+	/* Generic reset handling needs a single, dedicated reset line */
+	count = reset_control_get_count(vdev->device);
+	if (count < 0)
+		return count;
+
+	if (count != 1)
+		return -EINVAL;
 
-	return vdev->of_reset ? 0 : -ENOENT;
+	rstc = reset_control_get_exclusive(vdev->device, NULL);
+	if (!IS_ERR(rstc)) {
+		vdev->reset_control = rstc;
+		return 0;
+	}
+
+	return PTR_ERR(rstc);
 }
 
 static void vfio_platform_put_reset(struct vfio_platform_device *vdev)
@@ -139,6 +159,8 @@ static void vfio_platform_put_reset(struct vfio_platform_device *vdev)
 
 	if (vdev->of_reset)
 		module_put(vdev->reset_module);
+
+	reset_control_put(vdev->reset_control);
 }
 
 static int vfio_platform_regions_init(struct vfio_platform_device *vdev)
@@ -218,6 +240,9 @@ static int vfio_platform_call_reset(struct vfio_platform_device *vdev,
 	} else if (vdev->of_reset) {
 		dev_info(vdev->device, "reset\n");
 		return vdev->of_reset(vdev);
+	} else if (vdev->reset_control) {
+		dev_info(vdev->device, "reset\n");
+		return reset_control_reset(vdev->reset_control);
 	}
 
 	dev_warn(vdev->device, "no reset function found!\n");
diff --git a/drivers/vfio/platform/vfio_platform_private.h b/drivers/vfio/platform/vfio_platform_private.h
index 85ffe5d9d1abd94e..a56e80ae5986540b 100644
--- a/drivers/vfio/platform/vfio_platform_private.h
+++ b/drivers/vfio/platform/vfio_platform_private.h
@@ -60,6 +60,7 @@ struct vfio_platform_device {
 	const char			*compat;
 	const char			*acpihid;
 	struct module			*reset_module;
+	struct reset_control		*reset_control;
 	struct device			*device;
 
 	/*
-- 
2.17.1
