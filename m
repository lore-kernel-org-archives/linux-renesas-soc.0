Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D046C10F14
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 08:15:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E82A7204FD
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 08:15:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729128AbfDJIPR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 04:15:17 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:36407 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727281AbfDJIPR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 04:15:17 -0400
X-IronPort-AV: E=Sophos;i="5.60,332,1549897200"; 
   d="scan'208";a="12836963"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Apr 2019 17:15:15 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8138C426FF85;
        Wed, 10 Apr 2019 17:15:13 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH V4 02/13] phy: renesas: phy-rcar-gen2: Add support for r8a77470
Date:   Wed, 10 Apr 2019 09:08:24 +0100
Message-Id: <1554883715-41725-3-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
References: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds support for RZ/G1C (r8a77470) SoC. RZ/G1C SoC has a
PLL register shared between hsusb0 and hsusb1. Compared to other RZ/G1
and R-Car Gen2/3, USB Host needs to deassert the pll reset.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
V3-->V4
  * No Change
V2-->V3
 * No change
V1-->V2
 * Incorporated shimoda-san's review comment
 Ref: https://patchwork.kernel.org/patch/10655855/
---
 drivers/phy/renesas/phy-rcar-gen2.c | 86 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index 72eeb06..5897386 100644
--- a/drivers/phy/renesas/phy-rcar-gen2.c
+++ b/drivers/phy/renesas/phy-rcar-gen2.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2014 Renesas Solutions Corp.
  * Copyright (C) 2014 Cogent Embedded, Inc.
+ * Copyright (C) 2019 Renesas Electronics Corp.
  */
 
 #include <linux/clk.h>
@@ -15,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/atomic.h>
+#include <linux/sys_soc.h>
 
 #define USBHS_LPSTS			0x02
 #define USBHS_UGCTRL			0x80
@@ -35,6 +37,8 @@
 #define USBHS_UGCTRL2_USB0SEL		0x00000030
 #define USBHS_UGCTRL2_USB0SEL_PCI	0x00000010
 #define USBHS_UGCTRL2_USB0SEL_HS_USB	0x00000030
+#define USBHS_UGCTRL2_USB0SEL_USB20	0x00000010
+#define USBHS_UGCTRL2_USB0SEL_HS_USB20	0x00000020
 
 /* USB General status register (UGSTS) */
 #define USBHS_UGSTS_LOCK		0x00000100 /* From technical update */
@@ -180,6 +184,60 @@ static int rcar_gen2_phy_power_off(struct phy *p)
 	return 0;
 }
 
+static int rz_g1c_phy_power_on(struct phy *p)
+{
+	struct rcar_gen2_phy *phy = phy_get_drvdata(p);
+	struct rcar_gen2_phy_driver *drv = phy->channel->drv;
+	void __iomem *base = drv->base;
+	unsigned long flags;
+	u32 value;
+
+	spin_lock_irqsave(&drv->lock, flags);
+
+	/* Power on USBHS PHY */
+	value = readl(base + USBHS_UGCTRL);
+	value &= ~USBHS_UGCTRL_PLLRESET;
+	writel(value, base + USBHS_UGCTRL);
+
+	/* As per the data sheet wait 340 micro sec for power stable */
+	udelay(340);
+
+	if (phy->select_value == USBHS_UGCTRL2_USB0SEL_HS_USB20) {
+		value = readw(base + USBHS_LPSTS);
+		value |= USBHS_LPSTS_SUSPM;
+		writew(value, base + USBHS_LPSTS);
+	}
+
+	spin_unlock_irqrestore(&drv->lock, flags);
+
+	return 0;
+}
+
+static int rz_g1c_phy_power_off(struct phy *p)
+{
+	struct rcar_gen2_phy *phy = phy_get_drvdata(p);
+	struct rcar_gen2_phy_driver *drv = phy->channel->drv;
+	void __iomem *base = drv->base;
+	unsigned long flags;
+	u32 value;
+
+	spin_lock_irqsave(&drv->lock, flags);
+	/* Power off USBHS PHY */
+	if (phy->select_value == USBHS_UGCTRL2_USB0SEL_HS_USB20) {
+		value = readw(base + USBHS_LPSTS);
+		value &= ~USBHS_LPSTS_SUSPM;
+		writew(value, base + USBHS_LPSTS);
+	}
+
+	value = readl(base + USBHS_UGCTRL);
+	value |= USBHS_UGCTRL_PLLRESET;
+	writel(value, base + USBHS_UGCTRL);
+
+	spin_unlock_irqrestore(&drv->lock, flags);
+
+	return 0;
+}
+
 static const struct phy_ops rcar_gen2_phy_ops = {
 	.init		= rcar_gen2_phy_init,
 	.exit		= rcar_gen2_phy_exit,
@@ -188,6 +246,14 @@ static const struct phy_ops rcar_gen2_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct phy_ops rz_g1c_phy_ops = {
+	.init		= rcar_gen2_phy_init,
+	.exit		= rcar_gen2_phy_exit,
+	.power_on	= rz_g1c_phy_power_on,
+	.power_off	= rz_g1c_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
 static const struct of_device_id rcar_gen2_phy_match_table[] = {
 	{ .compatible = "renesas,usb-phy-r8a7790" },
 	{ .compatible = "renesas,usb-phy-r8a7791" },
@@ -224,11 +290,20 @@ static const u32 select_mask[] = {
 	[2]	= USBHS_UGCTRL2_USB2SEL,
 };
 
-static const u32 select_value[][PHYS_PER_CHANNEL] = {
+static const u32 pci_select_value[][PHYS_PER_CHANNEL] = {
 	[0]	= { USBHS_UGCTRL2_USB0SEL_PCI, USBHS_UGCTRL2_USB0SEL_HS_USB },
 	[2]	= { USBHS_UGCTRL2_USB2SEL_PCI, USBHS_UGCTRL2_USB2SEL_USB30 },
 };
 
+static const u32 usb20_select_value[][PHYS_PER_CHANNEL] = {
+	{ USBHS_UGCTRL2_USB0SEL_USB20, USBHS_UGCTRL2_USB0SEL_HS_USB20 },
+};
+
+static struct soc_device_attribute soc_r8a77470[] = {
+	{ .soc_id = "r8a77470" },
+	{ /* sentinel */ }
+};
+
 static int rcar_gen2_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -238,6 +313,8 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *base;
 	struct clk *clk;
+	const struct phy_ops *gen2_phy_ops = &rcar_gen2_phy_ops;
+	const u32 (*select_value)[PHYS_PER_CHANNEL]  = pci_select_value;
 	int i = 0;
 
 	if (!dev->of_node) {
@@ -266,6 +343,11 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 	drv->clk = clk;
 	drv->base = base;
 
+	if (soc_device_match(soc_r8a77470)) {
+		select_value = usb20_select_value;
+		gen2_phy_ops = &rz_g1c_phy_ops;
+	}
+
 	drv->num_channels = of_get_child_count(dev->of_node);
 	drv->channels = devm_kcalloc(dev, drv->num_channels,
 				     sizeof(struct rcar_gen2_channel),
@@ -297,7 +379,7 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 			phy->select_value = select_value[channel_num][n];
 
 			phy->phy = devm_phy_create(dev, NULL,
-						   &rcar_gen2_phy_ops);
+						   gen2_phy_ops);
 			if (IS_ERR(phy->phy)) {
 				dev_err(dev, "Failed to create PHY\n");
 				return PTR_ERR(phy->phy);
-- 
2.7.4

