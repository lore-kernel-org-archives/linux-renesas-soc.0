Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58021 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754037AbeFKIGz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jun 2018 04:06:55 -0400
Date: Mon, 11 Jun 2018 10:06:51 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] phy: Renesas R-Car gen3 PCIe PHY driver
Message-ID: <20180611080650.wx4sykuz33vdssys@verge.net.au>
References: <04384ce6-b696-715d-2072-345654e3fccf@cogentembedded.com>
 <9e69a1ea-b52b-4295-c898-e1ac4df26f97@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e69a1ea-b52b-4295-c898-e1ac4df26f97@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Jun 10, 2018 at 09:24:13PM +0300, Sergei Shtylyov wrote:
> This PHY is  still  mostly undocumented -- the only documented registers
> exist on R-Car V3H (R8A77980) SoC where this PHY stays in a powered-down
> state after a reset and thus  we  must power it up for PCIe to work...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> Changes in version 2:
> - split the bindings into their own patch;
> - fixed the PHY name in the heading comment;
> - removed 'rcar_gen3_phy_pcie_ops' and the generic R-Car gen3 PCIe PHY entry in
>   rcar_gen3_phy_pcie_match_table[];
> - replaced the 'of_device_id::data' initializer with an explicit argument to
>   devm_phy_create();
> - uppercased the acronym in the comment;
> - cleaned up the patch description.
> 
>  drivers/phy/renesas/Kconfig              |    7 +
>  drivers/phy/renesas/Makefile             |    1 
>  drivers/phy/renesas/phy-rcar-gen3-pcie.c |  151 +++++++++++++++++++++++++++++++
>  3 files changed, 159 insertions(+)
> 
> Index: linux-phy/drivers/phy/renesas/Kconfig
> ===================================================================
> --- linux-phy.orig/drivers/phy/renesas/Kconfig
> +++ linux-phy/drivers/phy/renesas/Kconfig
> @@ -8,6 +8,13 @@ config PHY_RCAR_GEN2
>  	help
>  	  Support for USB PHY found on Renesas R-Car generation 2 SoCs.
>  
> +config PHY_RCAR_GEN3_PCIE
> +	tristate "Renesas R-Car generation 3 PCIe PHY driver"
> +	depends on ARCH_RENESAS
> +	select GENERIC_PHY
> +	help
> +	  Support for the PCIe PHY found on Renesas R-Car generation 3 SoCs.
> +
>  config PHY_RCAR_GEN3_USB2
>  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
>  	depends on ARCH_RENESAS
> Index: linux-phy/drivers/phy/renesas/Makefile
> ===================================================================
> --- linux-phy.orig/drivers/phy/renesas/Makefile
> +++ linux-phy/drivers/phy/renesas/Makefile
> @@ -1,3 +1,4 @@
>  obj-$(CONFIG_PHY_RCAR_GEN2)		+= phy-rcar-gen2.o
> +obj-$(CONFIG_PHY_RCAR_GEN3_PCIE)	+= phy-rcar-gen3-pcie.o
>  obj-$(CONFIG_PHY_RCAR_GEN3_USB2)	+= phy-rcar-gen3-usb2.o
>  obj-$(CONFIG_PHY_RCAR_GEN3_USB3)	+= phy-rcar-gen3-usb3.o
> Index: linux-phy/drivers/phy/renesas/phy-rcar-gen3-pcie.c
> ===================================================================
> --- /dev/null
> +++ linux-phy/drivers/phy/renesas/phy-rcar-gen3-pcie.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas R-Car Gen3 PCIe PHY driver
> + *
> + * Copyright (C) 2018 Cogent Embedded, Inc.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +
> +#define PHY_CTRL		0x4000		/* R8A77980 only */
> +
> +/* PHY control register (PHY_CTRL) */
> +#define PHY_CTRL_PHY_PWDN	0x00000004

nit: Can you use BIT(2) ?

> +
> +struct rcar_gen3_phy {
> +	struct phy *phy;
> +	spinlock_t lock;
> +	void __iomem *base;
> +};
> +
> +static void rcar_gen3_phy_pcie_modify_reg(struct phy *p, unsigned int reg,
> +					  u32 clear, u32 set)
> +{
> +	struct rcar_gen3_phy *phy = phy_get_drvdata(p);
> +	void __iomem *base = phy->base;
> +	unsigned long flags;
> +	u32 value;
> +
> +	spin_lock_irqsave(&phy->lock, flags);
> +
> +	value = readl(base + reg);
> +	value &= ~clear;
> +	value |= set;
> +	writel(value, base + reg);
> +
> +	spin_unlock_irqrestore(&phy->lock, flags);
> +}
> +
> +static int r8a77980_phy_pcie_power_on(struct phy *p)
> +{
> +	/* Power on the PCIe PHY */
> +	rcar_gen3_phy_pcie_modify_reg(p, PHY_CTRL, PHY_CTRL_PHY_PWDN, 0);
> +
> +	return 0;
> +}
> +
> +static int r8a77980_phy_pcie_power_off(struct phy *p)
> +{
> +	/* Power off the PCIe PHY */
> +	rcar_gen3_phy_pcie_modify_reg(p, PHY_CTRL, 0, PHY_CTRL_PHY_PWDN);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops r8a77980_phy_pcie_ops = {
> +	.power_on	= r8a77980_phy_pcie_power_on,
> +	.power_off	= r8a77980_phy_pcie_power_off,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static const struct of_device_id rcar_gen3_phy_pcie_match_table[] = {
> +	{ .compatible = "renesas,r8a77980-pcie-phy" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, rcar_gen3_phy_pcie_match_table);
> +
> +static int rcar_gen3_phy_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct phy_provider *provider;
> +	struct rcar_gen3_phy *phy;
> +	struct resource *res;
> +	void __iomem *base;
> +	int error;
> +
> +	if (!dev->of_node) {
> +		dev_err(dev,
> +			"This driver must only be instantiated from the device tree\n");
> +		return -EINVAL;
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&phy->lock);
> +
> +	phy->base = base;
> +
> +	/*
> +	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
> +	 * And then, phy-core will manage runtime PM for this device.
> +	 */
> +	pm_runtime_enable(dev);
> +
> +	phy->phy = devm_phy_create(dev, NULL, &r8a77980_phy_pcie_ops);
> +	if (IS_ERR(phy->phy)) {
> +		dev_err(dev, "Failed to create PCIe PHY\n");
> +		error = PTR_ERR(phy->phy);
> +		goto error;
> +	}
> +	phy_set_drvdata(phy->phy, phy);
> +
> +	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(provider)) {
> +		dev_err(dev, "Failed to register PHY provider\n");
> +		error = PTR_ERR(provider);
> +		goto error;
> +	}
> +
> +	return 0;
> +
> +error:
> +	pm_runtime_disable(dev);
> +
> +	return error;
> +}
> +
> +static int rcar_gen3_phy_pcie_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return 0;
> +};
> +
> +static struct platform_driver rcar_gen3_phy_driver = {
> +	.driver = {
> +		.name		= "phy_rcar_gen3_pcie",
> +		.of_match_table	= rcar_gen3_phy_pcie_match_table,
> +	},
> +	.probe	= rcar_gen3_phy_pcie_probe,
> +	.remove = rcar_gen3_phy_pcie_remove,
> +};
> +
> +module_platform_driver(rcar_gen3_phy_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Renesas R-Car Gen3 PCIe PHY");
> +MODULE_AUTHOR("Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>");
> 
