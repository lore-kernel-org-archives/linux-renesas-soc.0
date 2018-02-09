Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:39784 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751098AbeBIPRu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Feb 2018 10:17:50 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>,
        Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>, Alexander Graf <agraf@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        qemu-arm@nongnu.org, qemu-devel@nongnu.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 3/5] hw/arm/virt: Allow dynamic sysbus devices again
Date: Fri,  9 Feb 2018 16:17:34 +0100
Message-Id: <1518189456-2873-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Allow the instantation of generic dynamic sysbus devices again, without
the need to create a new device-specific vfio type.

This is a partial revert of commit  6f2062b9758ebc64 ("hw/arm/virt:
Allow only supported dynamic sysbus devices").

Not-Yet-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b334c82edae9fb1f..fa83784fc08ed076 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1596,6 +1596,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 255;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
-- 
2.7.4
