Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:42756 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752167AbeBIPRM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Feb 2018 10:17:12 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Baptiste Reynal <b.reynal@virtualopensystems.com>,
        Alex Williamson <alex.williamson@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexander Graf <agraf@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        kvm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        qemu-devel@nongnu.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/6] vfio: platform: Allow runtime override of reset_required
Date: Fri,  9 Feb 2018 16:16:48 +0100
Message-Id: <1518189413-2761-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1518189413-2761-1-git-send-email-geert+renesas@glider.be>
References: <1518189413-2761-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Currently reset_required can be configured using a module parameter.
But it cannot be overridden at runtime through sysfs, as the parameter
is read-only.

Make it writeable for root, as this is useful if vfio-platform is
builtin, so the following works:

    echo 0 > /sys/module/vfio_platform/parameters/reset_required

Not-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
TODO: Implement a vfio reset driver instead.
---
 drivers/vfio/platform/vfio_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/platform/vfio_platform.c b/drivers/vfio/platform/vfio_platform.c
index 6561751a1063ee29..ef89146deddcea80 100644
--- a/drivers/vfio/platform/vfio_platform.c
+++ b/drivers/vfio/platform/vfio_platform.c
@@ -24,7 +24,7 @@
 #define DRIVER_DESC     "VFIO for platform devices - User Level meta-driver"
 
 static bool reset_required = true;
-module_param(reset_required, bool, 0444);
+module_param(reset_required, bool, 0644);
 MODULE_PARM_DESC(reset_required, "override reset requirement (default: 1)");
 
 /* probing devices from the linux platform bus */
-- 
2.7.4
