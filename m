Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34416 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753950AbdA0GVt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 01:21:49 -0500
Received: by mail-pf0-f195.google.com with SMTP id y143so17954909pfb.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2017 22:21:04 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        joro@8bytes.org, linux-renesas-soc@vger.kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
Date: Fri, 27 Jan 2017 15:14:45 +0900
Message-Id: <148549768562.22203.6722636560743534786.sendpatchset@little-apple>
In-Reply-To: <148549764733.22203.16459470412085471955.sendpatchset@little-apple>
References: <148549764733.22203.16459470412085471955.sendpatchset@little-apple>
Subject: [PATCH/RFC v2 3/4] iommu/ipmmu-vmsa: Opt-in slave devices based on ES version
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Match on r8a7795 ES2 and enable a certain DMA controller.
In other cases the IPMMU driver remains disabled.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V1:
 - Perform white list check in ->xlate() instead of ->add_device()

 drivers/iommu/ipmmu-vmsa.c |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

--- 0009/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-01-27 13:14:47.470607110 +0900
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/sys_soc.h>
 
 #if defined(CONFIG_ARM) && !defined(CONFIG_IOMMU_DMA)
 #include <asm/dma-iommu.h>
@@ -1032,9 +1033,33 @@ static void ipmmu_remove_device_dma(stru
 	iommu_group_remove_device(dev);
 }
 
+static const struct soc_device_attribute r8a7795es2[] = {
+	{ .soc_id = "r8a7795", .revision = "ES2.*" },
+	{ /* sentinel */ }
+};
+
+static int ipmmu_slave_whitelist(struct device *dev)
+{
+	/* Opt-in slave devices based on SoC and ES version */
+	if (soc_device_match(r8a7795es2)) {
+		if (!strcmp(dev_name(dev), "e7310000.dma-controller"))
+			return 0;
+	}
+
+	/* By default, do not allow use of IPMMU */
+	return -ENODEV;
+}
+
 static int ipmmu_of_xlate_dma(struct device *dev,
 			      struct of_phandle_args *spec)
 {
+	int ret;
+
+	/* Opt-in devices based on SoC and ES version */
+	ret = ipmmu_slave_whitelist(dev);
+	if (ret)
+		return ret;
+
 	/* For now only tested on R-Car Gen3 with ARM64 arch init order
 	 * TODO: Test R-Car Gen2 with ARM32 arch init order
 	 */
