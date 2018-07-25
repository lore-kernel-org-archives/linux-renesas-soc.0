Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:58224 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729093AbeGYPqS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 11:46:18 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        qemu-arm@nongnu.org, qemu-devel@nongnu.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 3/4] hw/arm/virt: Allow dynamic sysbus devices again
Date: Wed, 25 Jul 2018 16:34:12 +0200
Message-Id: <20180725143413.9728-4-geert+renesas@glider.be>
In-Reply-To: <20180725143413.9728-1-geert+renesas@glider.be>
References: <20180725143413.9728-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Allow the instantation of generic dynamic sysbus devices again, without
the need to create a new device-specific vfio type.

This is more or less a partial revert of commit 6f2062b9758ebc64
("hw/arm/virt: Allow only supported dynamic sysbus devices").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Drop RFC state,

v2:
  - Restrict from TYPE_SYS_BUS_DEVICE to TYPE_VFIO_PLATFORM, as
    suggested by Eric Auger.
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 281ddcdf6e26236d..24c1d8e28c7c4285 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1724,6 +1724,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
-- 
2.17.1
