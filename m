Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:5587 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751445AbdERCxT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 May 2017 22:53:19 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Petre Pircalabu <petre.pircalabu@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "horms@verge.net.au" <horms@verge.net.au>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>
CC: "mirea_bogdan@mentor.com" <mirea_bogdan@mentor.com>,
        Petre Pircalabu <Petre_Pircalabu@mentor.com>
Subject: RE: [PATCH] phy: rcar-gen3-usb3: Initial support for xhci phy
Date: Thu, 18 May 2017 02:53:15 +0000
Message-ID: <TY1PR06MB09928E2327894F8E9E7738D4D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1495043888-20934-1-git-send-email-Petre_Pircalabu@mentor.com>
In-Reply-To: <1495043888-20934-1-git-send-email-Petre_Pircalabu@mentor.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Petre,

Thank you for the patch!

I'm also developing a similar driver now :)
(I don't submit it though...)
My developing driver has SSC and VBUS_EN setting.

Anyway, I have some comments about your patch.

> -----Original Message-----
> From: Petre Pircalabu
> Sent: Thursday, May 18, 2017 2:58 AM
>=20
> The USB30PHY of a RCAR-Gen3 XHCI device can select the reference clock
> source. The 2 available options are the differential input clock pair
> supplied on pins USB3S0_CLK_P / USB3S0_CLK_M (default) and the on-chip
> clock source supplied through USB_XTAL/USB_EXTAL.
>=20
> The device can be configured to use the on-chip source by adding the
> "renesas,use-on-chip-clk" option in the corresponding device tree node.
>=20
> Signed-off-by: Petre Pircalabu <Petre_Pircalabu@mentor.com>
> ---
>  .../devicetree/bindings/phy/rcar-gen3-phy-usb3.txt |  22 +++
>  arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi       |   8 +
>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/phy/Kconfig                                |   8 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-rcar-gen3-usb3.c                   | 166 +++++++++++++++=
++++++

I think you should separate 3 patches as below:

1) Add phy-rcar-gen3-usb3 driver
2) Add a device node to r8a7795-es1.dtsi
3) Enable the phy driver on defconfig

And when we submit a generic phy driver's patch (e.g. 1) above), we should =
send to the phy maintainer(s).
Also, when we submit a patch that is related to device tree(e.g. both 1) an=
d 2) above),
we should send to the device tree maintainer(s).

> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
> b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
> new file mode 100644
> index 0000000..aa9657c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
> @@ -0,0 +1,22 @@
> +* Renesas R-Car generation 3 USB 3.0 PHY
> +
> +This file provides information on what the device node for the R-Car gen=
eration
> +3 USB 3.0 PHY contains.
> +
> +Required properties:
> +- compatible: "renesas,rcar-gen3-usb3-phy" for a generic R-Car Gen3 comp=
atible device.

I would like to add "renesas,usb3-phy-r8a7795" and "renesas,usb3-phy-r8a779=
6".

> +- reg: offset and length of the partial USB 3.0 Host PHY register block.
> +- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.

I think we should add "clocks" property as required.

> +Optional properties:

You should add "renesas,use-on-chip-clk" here.
And, the name of "use-on-chip-clk" is not good to me.
FYI, my developing patch names "renesas,usb-extal".

> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index a534cf5..aeda949 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_PHY_MIPHY28LP) 		+=3D phy-miphy28lp.o
>  obj-$(CONFIG_PHY_MIPHY365X)		+=3D phy-miphy365x.o
>  obj-$(CONFIG_PHY_RCAR_GEN2)		+=3D phy-rcar-gen2.o
>  obj-$(CONFIG_PHY_RCAR_GEN3_USB2)	+=3D phy-rcar-gen3-usb2.o
> +obj-$(CONFIG_PHY_RCAR_GEN3_USB3)	+=3D phy-rcar-gen3-usb3.o

The latest linux-phy.git / next branch doesn't update yet though,
the directory will be changed to ./drivers/phy/renesas.

http://www.spinics.net/lists/linux-usb/msg156875.html

> diff --git a/drivers/phy/phy-rcar-gen3-usb3.c b/drivers/phy/phy-rcar-gen3=
-usb3.c
> new file mode 100644
> index 0000000..87fa24d
> --- /dev/null
> +++ b/drivers/phy/phy-rcar-gen3-usb3.c
> @@ -0,0 +1,166 @@
> +/*
> + * Renesas R-Car Gen3 for USB3.0 PHY driver
> + *
> + * Copyright (C) 2017 Mentor Graphics Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or (at you=
r
> + * option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTAB=
ILITY
> + * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Lice=
nse
> + * for more details.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>

We can remove this "linux/of_address.h".

> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#define USB30_CLKSET0 0x34
> +#define USB30_CLKSET1 0x36
> +
> +#define USB30_CLKSET0_FSEL_MASK                 0x003F
> +#define USB30_CLKSET0_FSEL_USB_XTAL             0x0002
> +#define USB30_CLKSET0_FSEL_USB3S0_CLK           0x0027
> +
> +#define USB30_CLKSET1_PLL_MULTI_MASK            0x1FC0
> +#define USB30_CLKSET1_PLL_MULTI_USB_XTAL        (0x64 << 6)
> +#define USB30_CLKSET1_PLL_MULTI_USB3S0_CLK      (0x00 << 6)

I prefer the "6" becomes a definition.

> +#define USB30_CLKSET1_REF_CLKDIV                BIT(3)
> +#define USB30_CLKSET1_USB_SEL                   BIT(0)
> +
> +struct rcar_gen3_usb3_phy {
> +	void __iomem *base;
> +	struct phy *phy;
> +	u8 use_on_chip_clk;
> +};
> +
> +static int rcar_gen3_phy_usb3_init(struct phy *p)
> +{
> +	struct rcar_gen3_usb3_phy *phy_dev =3D phy_get_drvdata(p);
> +	void __iomem *usb3_base =3D phy_dev->base;
> +
> +	u16 clkset0, clkset1;
> +
> +	clkset0 =3D readw(usb3_base + USB30_CLKSET0);
> +	clkset1 =3D readw(usb3_base + USB30_CLKSET1);
> +
> +	dev_dbg(&p->dev, "USB30_CLKSET0 initial value =3D 0x%04X\n", clkset0);
> +	dev_dbg(&p->dev, "USB30_CLKSET1 initial value =3D 0x%04X\n", clkset1);

I guess the generic phy maintainer prefer dev_vdbg() (like phy-rcar-gen3-us=
b2.c).

> +	clkset0 &=3D ~USB30_CLKSET0_FSEL_MASK;
> +	clkset1 &=3D ~(USB30_CLKSET1_PLL_MULTI_MASK | USB30_CLKSET1_REF_CLKDIV =
|
> +			USB30_CLKSET1_USB_SEL);
> +
> +	if (phy_dev->use_on_chip_clk) {
> +		/* Select 50MHz clock */
> +		dev_info(&p->dev, "USE USB_XTAL clock (50MHz)\n");
> +		clkset0 |=3D USB30_CLKSET0_FSEL_USB_XTAL;
> +		clkset1 |=3D USB30_CLKSET1_PLL_MULTI_USB_XTAL |
> +			USB30_CLKSET1_REF_CLKDIV;
> +		clkset1 &=3D ~USB30_CLKSET1_USB_SEL;

Since USB30_CLKSET1_USB_SEL bit is cleared before, I don't think this code =
needs.

> +	} else {
> +		/* Select 100MHz clock */
> +		dev_info(&p->dev, "USE USB3S0_CLK reference (100MHz)\n");
> +		clkset0 |=3D USB30_CLKSET0_FSEL_USB3S0_CLK;
> +		clkset1 |=3D USB30_CLKSET1_PLL_MULTI_USB3S0_CLK |
> +			USB30_CLKSET1_USB_SEL;
> +		clkset1 &=3D ~USB30_CLKSET1_REF_CLKDIV;

Since USB30_CLKSET1_REF_CLKDIV bit is cleared before, I don't think this co=
de needs.

> +	}
> +
> +	dev_dbg(&p->dev, "USB30_CLKSET0 new value =3D 0x%04X\n", clkset0);
> +	dev_dbg(&p->dev, "USB30_CLKSET1 new value =3D 0x%04X\n", clkset1);
> +
> +	writew(clkset0, usb3_base + USB30_CLKSET0);
> +	writew(clkset1, usb3_base + USB30_CLKSET1);
> +
> +	return 0;
> +}
> +
> +static int rcar_gen3_phy_usb3_exit(struct phy *p)
> +{
> +	return 0;
> +}

We can remove this function.

> +
> +static struct phy_ops rcar_gen3_phy_usb3_ops =3D {
> +	.init		=3D rcar_gen3_phy_usb3_init,
> +	.exit		=3D rcar_gen3_phy_usb3_exit,

We can remove this .exit.

> +	.owner		=3D THIS_MODULE,
> +};
> +
> +static const struct of_device_id rcar_gen3_phy_usb3_match_table[] =3D {
> +	{ .compatible =3D "renesas,rcar-gen3-usb3-phy" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, rcar_gen3_phy_usb3_match_table);
> +
> +static int rcar_gen3_phy_usb3_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct rcar_gen3_usb3_phy *phy_dev;
> +	struct phy_provider *provider;
> +	struct resource *res;
> +
> +	if (!dev->of_node) {
> +		dev_err(dev, "This driver needs a device tree node\n");
> +		return -EINVAL;
> +	}
> +
> +	phy_dev =3D devm_kzalloc(dev, sizeof(*phy_dev), GFP_KERNEL);
> +	if (!phy_dev)
> +		return -ENOMEM;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	phy_dev->base =3D devm_ioremap_resource(dev, res);
> +	if (IS_ERR(phy_dev->base))
> +		return PTR_ERR(phy_dev->base);
> +
> +	phy_dev->use_on_chip_clk =3D device_property_read_bool(dev,
> +			"renesas,use-on-chip-clk");
> +
> +	pm_runtime_enable(dev);
> +	phy_dev->phy =3D devm_phy_create(dev, NULL, &rcar_gen3_phy_usb3_ops);
> +	if (IS_ERR(phy_dev->phy)) {

You should call pm_runtime_disable(dev); here.
I prefer using "goto" and though :)

> +		dev_err(dev, "Failed to create Rcar Gen3 USB3 PHY\n");
> +		return PTR_ERR(phy_dev->phy);
> +	}
> +
> +	platform_set_drvdata(pdev, phy_dev);
> +	phy_set_drvdata(phy_dev->phy, phy_dev);
> +
> +	provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(provider)) {

You should call pm_runtime_disable(dev); here.

> +		dev_err(dev, "Failed to register PHY provider\n");
> +		return PTR_ERR(provider);
> +	}
> +
> +	dev_info(&pdev->dev, "Initialized RCAR Gen3 USB3 PHY module\n");
> +	return 0;
> +}
> +
> +static int rcar_gen3_phy_usb3_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_disable(&pdev->dev);
> +	return 0;
> +}
> +
> +static struct platform_driver rcar_gen3_phy_usb3_driver =3D {
> +	.driver =3D {
> +		.name		=3D "phy_rcar_gen3_usb3",
> +		.of_match_table	=3D rcar_gen3_phy_usb3_match_table,
> +	},
> +	.probe	=3D rcar_gen3_phy_usb3_probe,
> +	.remove	=3D rcar_gen3_phy_usb3_remove,
> +};
> +module_platform_driver(rcar_gen3_phy_usb3_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Renesas R-Car Gen3 USB 3.0 PHY");
> +MODULE_AUTHOR("Petre Pircalabu <petre_pircalabu@mentor.com>");
> --
> 1.9.1
