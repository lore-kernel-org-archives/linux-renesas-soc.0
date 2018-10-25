Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:38796 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727475AbeJYWhk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Oct 2018 18:37:40 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/7] phy: renesas: phy-rcar-gen2: Add support for r8a77470
Date: Thu, 25 Oct 2018 14:56:54 +0100
Message-Id: <1540475819-47950-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
References: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds support for RZ/G1C (r8a77470) SoC. RZ/G1C SoC has a
PLL register shared between hsusb0 and hsusb1. Compared to other RZ/G1
and R-Car Gen2/3, USB Host needs to deassert the pll reset.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch is tested against phy-next
---
 drivers/phy/renesas/phy-rcar-gen2.c | 188 +++++++++++++++++++++++++++++++++++-
 1 file changed, 184 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index 72eeb06..3d3ebc8 100644
--- a/drivers/phy/renesas/phy-rcar-gen2.c
+++ b/drivers/phy/renesas/phy-rcar-gen2.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2014 Renesas Solutions Corp.
  * Copyright (C) 2014 Cogent Embedded, Inc.
+ * Copyright (C) 2018 Renesas Electronics Corp.
  */
 
 #include <linux/clk.h>
@@ -15,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/atomic.h>
+#include <linux/sys_soc.h>
 
 #define USBHS_LPSTS			0x02
 #define USBHS_UGCTRL			0x80
@@ -35,10 +37,36 @@
 #define USBHS_UGCTRL2_USB0SEL		0x00000030
 #define USBHS_UGCTRL2_USB0SEL_PCI	0x00000010
 #define USBHS_UGCTRL2_USB0SEL_HS_USB	0x00000030
+#define USBHS_UGCTRL2_USB0SEL_USB20	0x00000010
+#define USBHS_UGCTRL2_USB0SEL_HS_USB_USB20	0x00000020
 
 /* USB General status register (UGSTS) */
 #define USBHS_UGSTS_LOCK		0x00000100 /* From technical update */
 
+/* USB2.0 Host registers (original offset is +0x200) */
+#define USB2_INT_ENABLE		0x000
+#define USB2_USBCTR		0x00c
+#define USB2_SPD_RSM_TIMSET	0x10c
+#define USB2_OC_TIMSET		0x110
+
+/* RZ/G1C shared PLL RESET REG */
+#define USBHS_UGCTRL_PLL_RESET_REG		0xE6590180
+
+/* INT_ENABLE */
+#define USB2_INT_ENABLE_USBH_INTB_EN	BIT(2)
+#define USB2_INT_ENABLE_USBH_INTA_EN	BIT(1)
+#define USB2_INT_ENABLE_INIT		(USB2_INT_ENABLE_USBH_INTB_EN | \
+					 USB2_INT_ENABLE_USBH_INTA_EN)
+
+/* USBCTR */
+#define USB2_USBCTR_PLL_RST	BIT(1)
+
+/* SPD_RSM_TIMSET */
+#define USB2_SPD_RSM_TIMSET_INIT	0x014e029b
+
+/* OC_TIMSET */
+#define USB2_OC_TIMSET_INIT		0x000209ab
+
 #define PHYS_PER_CHANNEL	2
 
 struct rcar_gen2_phy {
@@ -57,8 +85,8 @@ struct rcar_gen2_channel {
 };
 
 struct rcar_gen2_phy_driver {
-	void __iomem *base;
-	struct clk *clk;
+	void __iomem *base, *host_base;
+	struct clk *clk, *host_clk;
 	spinlock_t lock;
 	int num_channels;
 	struct rcar_gen2_channel *channels;
@@ -180,6 +208,111 @@ static int rcar_gen2_phy_power_off(struct phy *p)
 	return 0;
 }
 
+/* UGCTRL PLLRESET is shared between HSUSB0 and HSUSB1 */
+static void __iomem *pll_reg_base;
+static atomic_t pll_reset_ref_cnt;
+
+static int rz_g1c_phy_init(struct phy *p)
+{
+	struct rcar_gen2_phy *phy = phy_get_drvdata(p);
+	struct rcar_gen2_channel *channel = phy->channel;
+	struct rcar_gen2_phy_driver *drv = channel->drv;
+	int retval;
+
+	retval = rcar_gen2_phy_init(p);
+	if (retval)
+		return retval;
+
+	/* Initialize USB2 part */
+	if (phy->select_value != USBHS_UGCTRL2_USB0SEL_HS_USB_USB20) {
+		clk_prepare_enable(drv->host_clk);
+		writel(USB2_INT_ENABLE_INIT, drv->host_base + USB2_INT_ENABLE);
+		writel(USB2_SPD_RSM_TIMSET_INIT,
+					drv->host_base + USB2_SPD_RSM_TIMSET);
+		writel(USB2_OC_TIMSET_INIT, drv->host_base + USB2_OC_TIMSET);
+	}
+
+	return 0;
+}
+
+static int rz_g1c_phy_exit(struct phy *p)
+{
+	struct rcar_gen2_phy *phy = phy_get_drvdata(p);
+	struct rcar_gen2_channel *channel = phy->channel;
+	struct rcar_gen2_phy_driver *drv = channel->drv;
+
+	if (phy->select_value != USBHS_UGCTRL2_USB0SEL_HS_USB_USB20) {
+		writel(0, drv->host_base + USB2_INT_ENABLE);
+		clk_disable_unprepare(channel->drv->host_clk);
+	}
+
+	clk_disable_unprepare(channel->drv->clk);
+
+	channel->selected_phy = -1;
+
+	return 0;
+}
+
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
+	if (atomic_read(&pll_reset_ref_cnt) == 0) {
+		value = readl(pll_reg_base);
+		value &= ~USBHS_UGCTRL_PLLRESET;
+		writel(value, pll_reg_base);
+
+		/* As per the data sheet wait 340 micro sec for power stable */
+		udelay(340);
+	}
+
+	atomic_inc(&pll_reset_ref_cnt);
+
+	if (phy->select_value == USBHS_UGCTRL2_USB0SEL_HS_USB_USB20) {
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
+	if (phy->select_value == USBHS_UGCTRL2_USB0SEL_HS_USB_USB20) {
+		value = readw(base + USBHS_LPSTS);
+		value &= ~USBHS_LPSTS_SUSPM;
+		writew(value, base + USBHS_LPSTS);
+	}
+
+	if (atomic_dec_and_test(&pll_reset_ref_cnt)) {
+		value = readl(pll_reg_base);
+		value |= USBHS_UGCTRL_PLLRESET;
+		writel(value, pll_reg_base);
+	}
+
+	spin_unlock_irqrestore(&drv->lock, flags);
+
+	return 0;
+}
+
 static const struct phy_ops rcar_gen2_phy_ops = {
 	.init		= rcar_gen2_phy_init,
 	.exit		= rcar_gen2_phy_exit,
@@ -188,6 +321,14 @@ static const struct phy_ops rcar_gen2_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct phy_ops rz_g1c_phy_ops = {
+	.init		= rz_g1c_phy_init,
+	.exit		= rz_g1c_phy_exit,
+	.power_on	= rz_g1c_phy_power_on,
+	.power_off	= rz_g1c_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
 static const struct of_device_id rcar_gen2_phy_match_table[] = {
 	{ .compatible = "renesas,usb-phy-r8a7790" },
 	{ .compatible = "renesas,usb-phy-r8a7791" },
@@ -224,11 +365,22 @@ static const u32 select_mask[] = {
 	[2]	= USBHS_UGCTRL2_USB2SEL,
 };
 
-static const u32 select_value[][PHYS_PER_CHANNEL] = {
+static const u32 pci_select_value[][PHYS_PER_CHANNEL] = {
 	[0]	= { USBHS_UGCTRL2_USB0SEL_PCI, USBHS_UGCTRL2_USB0SEL_HS_USB },
 	[2]	= { USBHS_UGCTRL2_USB2SEL_PCI, USBHS_UGCTRL2_USB2SEL_USB30 },
 };
 
+static const u32 usb20_select_value[][PHYS_PER_CHANNEL] = {
+	{ USBHS_UGCTRL2_USB0SEL_USB20, USBHS_UGCTRL2_USB0SEL_HS_USB_USB20 },
+};
+
+static const struct soc_device_attribute soc_r8a77470[] = {
+	{
+		.soc_id = "r8a77470",
+	},
+	{ /* sentinel */ }
+};
+
 static int rcar_gen2_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -238,6 +390,8 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *base;
 	struct clk *clk;
+	const struct phy_ops *gen2_phy_ops = &rcar_gen2_phy_ops;
+	const u32 (*select_value)[PHYS_PER_CHANNEL]  = pci_select_value;
 	int i = 0;
 
 	if (!dev->of_node) {
@@ -266,6 +420,32 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 	drv->clk = clk;
 	drv->base = base;
 
+	if (soc_device_match(soc_r8a77470)) {
+		clk = devm_clk_get(dev, "usb20_host");
+		if (IS_ERR(clk)) {
+			dev_err(dev, "Can't get USB2.0 Host clock\n");
+			return PTR_ERR(clk);
+		}
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+		base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		if (pll_reg_base == NULL) {
+			pll_reg_base = devm_ioremap(dev,
+					USBHS_UGCTRL_PLL_RESET_REG, 4);
+			if (IS_ERR(pll_reg_base))
+				return PTR_ERR(pll_reg_base);
+			atomic_set(&pll_reset_ref_cnt, 0);
+		}
+
+		drv->host_clk = clk;
+		drv->host_base = base;
+		select_value = usb20_select_value;
+		gen2_phy_ops = &rz_g1c_phy_ops;
+	}
+
 	drv->num_channels = of_get_child_count(dev->of_node);
 	drv->channels = devm_kcalloc(dev, drv->num_channels,
 				     sizeof(struct rcar_gen2_channel),
@@ -297,7 +477,7 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 			phy->select_value = select_value[channel_num][n];
 
 			phy->phy = devm_phy_create(dev, NULL,
-						   &rcar_gen2_phy_ops);
+						   gen2_phy_ops);
 			if (IS_ERR(phy->phy)) {
 				dev_err(dev, "Failed to create PHY\n");
 				return PTR_ERR(phy->phy);
-- 
2.7.4
