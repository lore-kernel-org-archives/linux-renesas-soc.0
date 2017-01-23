Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36434 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751016AbdAWMT0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 07:19:26 -0500
Received: by mail-pf0-f193.google.com with SMTP id 19so9948051pfo.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2017 04:19:25 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        joro@8bytes.org, linux-renesas-soc@vger.kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Jan 2017 21:12:25 +0900
Message-Id: <148517354599.18128.1970642879780864733.sendpatchset@little-apple>
In-Reply-To: <148517349585.18128.10696161017872202809.sendpatchset@little-apple>
References: <148517349585.18128.10696161017872202809.sendpatchset@little-apple>
Subject: [PATCH/RFC 2/2] iommu/ipmmu-vmsa: Opt-in slave devices based on ES version
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Match on r8a7795 ES2 and enable a certain DMA controller.
In other cases the IPMMU driver remains disabled.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

--- 0001/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-01-23 20:57:02.620607110 +0900
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/sys_soc.h>
 
 #if defined(CONFIG_ARM) && !defined(CONFIG_IOMMU_DMA)
 #include <asm/dma-iommu.h>
@@ -1002,16 +1003,39 @@ static void ipmmu_domain_free_dma(struct
 	}
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
 static int ipmmu_add_device_dma(struct device *dev)
 {
 	struct ipmmu_vmsa_archdata *archdata = dev->archdata.iommu;
 	struct iommu_group *group;
+	int ret;
 
 	/* only accept devices with iommus property */
 	if (of_count_phandle_with_args(dev->of_node, "iommus",
 				       "#iommu-cells") < 0)
 		return -ENODEV;
 
+	/* opt-in devices based on SoC and ES version */
+	ret = ipmmu_slave_whitelist(dev);
+	if (ret)
+		return ret;
+
 	group = iommu_group_get_for_dev(dev);
 	if (IS_ERR(group))
 		return PTR_ERR(group);
