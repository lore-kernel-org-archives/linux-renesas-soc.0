Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECBAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 13:00:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59FE120828
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 13:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbfDANAd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 09:00:33 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:6954 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726752AbfDANAc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 09:00:32 -0400
X-IronPort-AV: E=Sophos;i="5.60,296,1549897200"; 
   d="scan'208";a="11720725"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Apr 2019 22:00:29 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9C1D840104F3;
        Mon,  1 Apr 2019 22:00:25 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jianguo Sun <sunjianguo1@huawei.com>,
        Avi Fishman <AviFishman70@gmail.com>,
        Ofer Heifetz <oferh@marvell.com>,
        Lubomir Rintel <lkundrak@v3.sk>, Ran Wang <ran.wang_1@nxp.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 04/12] usb: host: ehci-r8a77470: Add EHCI support for Renesas RZ/G1C devices
Date:   Mon,  1 Apr 2019 13:53:44 +0100
Message-Id: <1554123232-58942-5-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
References: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds the glue code required to ensure the on-chip EHCI
controller works on RZ/G1C(a.k.a R8A77470) SoC's from Renesas.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
  * New patch
---
 drivers/usb/host/Kconfig         |   9 ++
 drivers/usb/host/Makefile        |   1 +
 drivers/usb/host/ehci-r8a77470.c | 327 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 337 insertions(+)
 create mode 100644 drivers/usb/host/ehci-r8a77470.c

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index d809671..a474aa9 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -237,6 +237,15 @@ config USB_EHCI_HCD_STI
 	  Enable support for the on-chip EHCI controller found on
 	  STMicroelectronics consumer electronics SoC's.
 
+config USB_EHCI_HCD_R8A77470
+	tristate "Support for Renesas R8A77470 on-chip EHCI USB controller"
+	depends on ARCH_R8A77470 && OF
+	select GENERIC_PHY
+	select USB_EHCI_HCD_PLATFORM
+	help
+	  Enable support for the on-chip EHCI controller found on
+	  Renesas RZ/G1C(R8A77470) SoC's.
+
 config USB_EHCI_HCD_AT91
         tristate  "Support for Atmel on-chip EHCI USB controller"
         depends on USB_EHCI_HCD && ARCH_AT91
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index 84514f7..785a1d1 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_USB_EHCI_HCD_OMAP)	+= ehci-omap.o
 obj-$(CONFIG_USB_EHCI_HCD_ORION)	+= ehci-orion.o
 obj-$(CONFIG_USB_EHCI_HCD_SPEAR)	+= ehci-spear.o
 obj-$(CONFIG_USB_EHCI_HCD_STI)	+= ehci-st.o
+obj-$(CONFIG_USB_EHCI_HCD_R8A77470)	+= ehci-r8a77470.o
 obj-$(CONFIG_USB_EHCI_EXYNOS)	+= ehci-exynos.o
 obj-$(CONFIG_USB_EHCI_HCD_AT91) += ehci-atmel.o
 obj-$(CONFIG_USB_EHCI_TEGRA)	+= ehci-tegra.o
diff --git a/drivers/usb/host/ehci-r8a77470.c b/drivers/usb/host/ehci-r8a77470.c
new file mode 100644
index 0000000..d57f6f1
--- /dev/null
+++ b/drivers/usb/host/ehci-r8a77470.c
@@ -0,0 +1,327 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas R8A77470 ehci driver
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ *
+ * Derived from ehci-platform.c
+ */
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/hrtimer.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+#include <linux/usb/ehci_pdriver.h>
+#include <linux/usb/of.h>
+
+#include "ehci.h"
+
+/******* USB2.0 Host registers (original offset is +0x100) *******/
+#define USB2_INT_ENABLE			0x100
+#define USB2_SPD_RSM_TIMSET		0x20c
+#define USB2_OC_TIMSET			0x210
+
+#define USB2_INT_ENABLE_USBH_INTB_EN	BIT(2)
+#define USB2_INT_ENABLE_USBH_INTA_EN	BIT(1)
+#define USB2_INT_ENABLE_INIT		(USB2_INT_ENABLE_USBH_INTB_EN | \
+					 USB2_INT_ENABLE_USBH_INTA_EN)
+
+#define USB2_SPD_RSM_TIMSET_INIT	0x014e029b
+#define USB2_OC_TIMSET_INIT		0x000209ab
+
+#define DRIVER_DESC "EHCI renesas r8a77470 driver"
+#define EHCI_MAX_CLKS 4
+#define hcd_to_ehci_priv(h) ((struct ehci_platform_priv *)hcd_to_ehci(h)->priv)
+
+struct ehci_platform_priv {
+	struct clk *clks[EHCI_MAX_CLKS];
+	struct reset_control *rsts;
+	bool reset_on_resume;
+};
+
+static const char hcd_name[] = "ehci-r8a77470";
+
+static int r8a77470_ehci_platform_reset(struct usb_hcd *hcd)
+{
+	struct platform_device *pdev = to_platform_device(hcd->self.controller);
+	struct usb_ehci_pdata *pdata = dev_get_platdata(&pdev->dev);
+	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
+
+	ehci->caps = hcd->regs + pdata->caps_offset;
+	return ehci_setup(hcd);
+}
+
+static int r8a77470_ehci_platform_power_on(struct platform_device *dev)
+{
+	struct usb_hcd *hcd = platform_get_drvdata(dev);
+	struct ehci_platform_priv *priv = hcd_to_ehci_priv(hcd);
+	int clk, ret;
+
+	for (clk = 0; clk < EHCI_MAX_CLKS && priv->clks[clk]; clk++) {
+		ret = clk_prepare_enable(priv->clks[clk]);
+		if (ret)
+			goto err_disable_clks;
+	}
+
+	writel(USB2_INT_ENABLE_INIT, hcd->regs + USB2_INT_ENABLE);
+	writel(USB2_SPD_RSM_TIMSET_INIT, hcd->regs + USB2_SPD_RSM_TIMSET);
+	writel(USB2_OC_TIMSET_INIT, hcd->regs + USB2_OC_TIMSET);
+	return 0;
+
+err_disable_clks:
+	while (--clk >= 0)
+		clk_disable_unprepare(priv->clks[clk]);
+
+	return ret;
+}
+
+static void r8a77470_ehci_platform_power_off(struct platform_device *dev)
+{
+	struct usb_hcd *hcd = platform_get_drvdata(dev);
+	struct ehci_platform_priv *priv = hcd_to_ehci_priv(hcd);
+	int clk;
+
+	writel(0, hcd->regs + USB2_INT_ENABLE);
+	for (clk = EHCI_MAX_CLKS - 1; clk >= 0; clk--)
+		if (priv->clks[clk])
+			clk_disable_unprepare(priv->clks[clk]);
+}
+
+static struct hc_driver __read_mostly ehci_platform_hc_driver;
+
+static const struct ehci_driver_overrides platform_overrides __initconst = {
+	.reset =		r8a77470_ehci_platform_reset,
+	.extra_priv_size =	sizeof(struct ehci_platform_priv),
+};
+
+static struct usb_ehci_pdata ehci_platform_defaults = {
+	.power_on =		r8a77470_ehci_platform_power_on,
+	.power_suspend =	r8a77470_ehci_platform_power_off,
+	.power_off =		r8a77470_ehci_platform_power_off,
+};
+
+static int r8a77470_ehci_platform_probe(struct platform_device *dev)
+{
+	struct usb_hcd *hcd;
+	struct resource *res_mem;
+	struct usb_ehci_pdata *pdata = dev_get_platdata(&dev->dev);
+	struct ehci_platform_priv *priv;
+	struct ehci_hcd *ehci;
+	int err, irq, clk = 0;
+
+	if (usb_disabled())
+		return -ENODEV;
+
+	/*
+	 * Use reasonable defaults so platforms don't have to provide these
+	 * with DT probing on ARM.
+	 */
+	if (!pdata)
+		pdata = &ehci_platform_defaults;
+
+	err = dma_coerce_mask_and_coherent(&dev->dev,
+		pdata->dma_mask_64 ? DMA_BIT_MASK(64) : DMA_BIT_MASK(32));
+	if (err) {
+		dev_err(&dev->dev, "Error: DMA mask configuration failed\n");
+		return err;
+	}
+
+	irq = platform_get_irq(dev, 0);
+	if (irq < 0) {
+		dev_err(&dev->dev, "no irq provided");
+		return irq;
+	}
+
+	hcd = usb_create_hcd(&ehci_platform_hc_driver, &dev->dev,
+			     dev_name(&dev->dev));
+	if (!hcd)
+		return -ENOMEM;
+
+	platform_set_drvdata(dev, hcd);
+	dev->dev.platform_data = pdata;
+	priv = hcd_to_ehci_priv(hcd);
+	ehci = hcd_to_ehci(hcd);
+
+	if (pdata == &ehci_platform_defaults && dev->dev.of_node) {
+		for (clk = 0; clk < EHCI_MAX_CLKS; clk++) {
+			priv->clks[clk] = of_clk_get(dev->dev.of_node, clk);
+			if (IS_ERR(priv->clks[clk])) {
+				err = PTR_ERR(priv->clks[clk]);
+				if (err == -EPROBE_DEFER)
+					goto err_put_clks;
+				priv->clks[clk] = NULL;
+				break;
+			}
+		}
+	}
+
+	priv->rsts = devm_reset_control_array_get_optional_shared(&dev->dev);
+	if (IS_ERR(priv->rsts)) {
+		err = PTR_ERR(priv->rsts);
+		goto err_put_clks;
+	}
+
+	err = reset_control_deassert(priv->rsts);
+	if (err)
+		goto err_put_clks;
+
+	res_mem = platform_get_resource(dev, IORESOURCE_MEM, 0);
+	hcd->regs = devm_ioremap_resource(&dev->dev, res_mem);
+	if (IS_ERR(hcd->regs)) {
+		err = PTR_ERR(hcd->regs);
+		goto err_reset;
+	}
+	hcd->rsrc_start = res_mem->start;
+	hcd->rsrc_len = resource_size(res_mem);
+
+	if (pdata->power_on) {
+		err = pdata->power_on(dev);
+		if (err < 0)
+			goto err_reset;
+	}
+
+	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
+	if (err)
+		goto err_power;
+
+	device_wakeup_enable(hcd->self.controller);
+	device_enable_async_suspend(hcd->self.controller);
+	platform_set_drvdata(dev, hcd);
+
+	return err;
+
+err_power:
+	if (pdata->power_off)
+		pdata->power_off(dev);
+err_reset:
+	reset_control_assert(priv->rsts);
+err_put_clks:
+	while (--clk >= 0)
+		clk_put(priv->clks[clk]);
+
+	if (pdata == &ehci_platform_defaults)
+		dev->dev.platform_data = NULL;
+
+	usb_put_hcd(hcd);
+
+	return err;
+}
+
+static int r8a77470_ehci_platform_remove(struct platform_device *dev)
+{
+	struct usb_hcd *hcd = platform_get_drvdata(dev);
+	struct usb_ehci_pdata *pdata = dev_get_platdata(&dev->dev);
+	struct ehci_platform_priv *priv = hcd_to_ehci_priv(hcd);
+	int clk;
+
+	usb_remove_hcd(hcd);
+
+	if (pdata->power_off)
+		pdata->power_off(dev);
+
+	reset_control_assert(priv->rsts);
+
+	for (clk = 0; clk < EHCI_MAX_CLKS && priv->clks[clk]; clk++)
+		clk_put(priv->clks[clk]);
+
+	usb_put_hcd(hcd);
+
+	if (pdata == &ehci_platform_defaults)
+		dev->dev.platform_data = NULL;
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int ehci_platform_suspend(struct device *dev)
+{
+	struct usb_hcd *hcd = dev_get_drvdata(dev);
+	struct usb_ehci_pdata *pdata = dev_get_platdata(dev);
+	struct platform_device *pdev = to_platform_device(dev);
+	bool do_wakeup = device_may_wakeup(dev);
+	int ret;
+
+	ret = ehci_suspend(hcd, do_wakeup);
+	if (ret)
+		return ret;
+
+	if (pdata->power_suspend)
+		pdata->power_suspend(pdev);
+
+	return ret;
+}
+
+static int ehci_platform_resume(struct device *dev)
+{
+	struct usb_hcd *hcd = dev_get_drvdata(dev);
+	struct usb_ehci_pdata *pdata = dev_get_platdata(dev);
+	struct platform_device *pdev = to_platform_device(dev);
+	struct ehci_platform_priv *priv = hcd_to_ehci_priv(hcd);
+	struct device *companion_dev;
+	int err;
+
+	if (pdata->power_on) {
+		err = pdata->power_on(pdev);
+		if (err < 0)
+			return err;
+	}
+
+	companion_dev = usb_of_get_companion_dev(hcd->self.controller);
+	if (companion_dev) {
+		device_pm_wait_for_dev(hcd->self.controller, companion_dev);
+		put_device(companion_dev);
+	}
+
+	ehci_resume(hcd, priv->reset_on_resume);
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static const struct of_device_id r8a77470_ehci_ids[] = {
+	{ .compatible = "renesas,ehci-r8a77470", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, r8a77470_ehci_ids);
+
+static SIMPLE_DEV_PM_OPS(ehci_platform_pm_ops, ehci_platform_suspend,
+	ehci_platform_resume);
+
+static struct platform_driver ehci_platform_driver = {
+	.probe		= r8a77470_ehci_platform_probe,
+	.remove		= r8a77470_ehci_platform_remove,
+	.shutdown	= usb_hcd_platform_shutdown,
+	.driver		= {
+		.name	= "r8a77470-ehci",
+		.pm	= &ehci_platform_pm_ops,
+		.of_match_table = r8a77470_ehci_ids,
+	}
+};
+
+static int __init ehci_platform_init(void)
+{
+	if (usb_disabled())
+		return -ENODEV;
+
+	pr_info("%s: " DRIVER_DESC "\n", hcd_name);
+
+	ehci_init_driver(&ehci_platform_hc_driver, &platform_overrides);
+	return platform_driver_register(&ehci_platform_driver);
+}
+module_init(ehci_platform_init);
+
+static void __exit ehci_platform_cleanup(void)
+{
+	platform_driver_unregister(&ehci_platform_driver);
+}
+module_exit(ehci_platform_cleanup);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_AUTHOR("Biju Das <biju.das@bp.renesas.com>");
+MODULE_LICENSE("GPL");
-- 
2.7.4

