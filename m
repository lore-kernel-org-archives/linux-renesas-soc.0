Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ty1jpn01on0135.outbound.protection.outlook.com ([104.47.93.135]:2579
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729486AbeJ2SSc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Oct 2018 14:18:32 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
CC: Kishon Vijay Abraham I <kishon@ti.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/7] phy: renesas: phy-rcar-gen2: Add support for r8a77470
Date: Mon, 29 Oct 2018 09:30:36 +0000
Message-ID: <OSBPR01MB21031ECA3AC00EF8ED398009B8F30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
 <1540475819-47950-3-git-send-email-biju.das@bp.renesas.com>
 <OSBPR01MB2293C2FDDAD8CFF1D0E2AC7FD8F30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2293C2FDDAD8CFF1D0E2AC7FD8F30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-San,

Thanks for the feedback.

> Subject: RE: [PATCH 2/7] phy: renesas: phy-rcar-gen2: Add support for
> r8a77470
>
> Hi Biju-san,
>
> > From: Biju Das, Sent: Thursday, October 25, 2018 10:57 PM
> >
> > This patch adds support for RZ/G1C (r8a77470) SoC. RZ/G1C SoC has a
> > PLL register shared between hsusb0 and hsusb1. Compared to other RZ/G1
> > and R-Car Gen2/3, USB Host needs to deassert the pll reset.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> > This patch is tested against phy-next
>
> Thank you for the patch!
>
> > ---
> >  drivers/phy/renesas/phy-rcar-gen2.c | 188
> > +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 184 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/phy/renesas/phy-rcar-gen2.c
> > b/drivers/phy/renesas/phy-rcar-gen2.c
> > index 72eeb06..3d3ebc8 100644
> > --- a/drivers/phy/renesas/phy-rcar-gen2.c
> > +++ b/drivers/phy/renesas/phy-rcar-gen2.c
> > @@ -4,6 +4,7 @@
> >   *
> >   * Copyright (C) 2014 Renesas Solutions Corp.
> >   * Copyright (C) 2014 Cogent Embedded, Inc.
> > + * Copyright (C) 2018 Renesas Electronics Corp.
> >   */
> >
> >  #include <linux/clk.h>
> > @@ -15,6 +16,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/atomic.h>
> > +#include <linux/sys_soc.h>
> >
> >  #define USBHS_LPSTS0x02
> >  #define USBHS_UGCTRL0x80
> > @@ -35,10 +37,36 @@
> >  #define USBHS_UGCTRL2_USB0SEL0x00000030
> >  #define USBHS_UGCTRL2_USB0SEL_PCI0x00000010
> >  #define USBHS_UGCTRL2_USB0SEL_HS_USB0x00000030
> > +#define USBHS_UGCTRL2_USB0SEL_USB200x00000010
> > +#define USBHS_UGCTRL2_USB0SEL_HS_USB_USB200x00000020
> >
> >  /* USB General status register (UGSTS) */
> >  #define USBHS_UGSTS_LOCK0x00000100 /* From technical
> update */
> >
> > +/* USB2.0 Host registers (original offset is +0x200) */
> > +#define USB2_INT_ENABLE0x000
> > +#define USB2_USBCTR0x00c
> > +#define USB2_SPD_RSM_TIMSET0x10c
> > +#define USB2_OC_TIMSET0x110
> > +
> > +/* RZ/G1C shared PLL RESET REG */
> > +#define USBHS_UGCTRL_PLL_RESET_REG0xE6590180
>
> I don't think this is acceptable for upstream...
> This register area may be mapped by usbphy0 on this driver's probe as bas=
e.

I was under the impression that  ioremap with same cachetype won't be a pro=
blem.
OK, will change this.

> > +
> > +/* INT_ENABLE */
> > +#define USB2_INT_ENABLE_USBH_INTB_ENBIT(2)
> > +#define USB2_INT_ENABLE_USBH_INTA_ENBIT(1)
> > +#define USB2_INT_ENABLE_INIT
> (USB2_INT_ENABLE_USBH_INTB_EN | \
> > + USB2_INT_ENABLE_USBH_INTA_EN)
> > +
> > +/* USBCTR */
> > +#define USB2_USBCTR_PLL_RSTBIT(1)
> > +
> > +/* SPD_RSM_TIMSET */
> > +#define USB2_SPD_RSM_TIMSET_INIT0x014e029b
> > +
> > +/* OC_TIMSET */
> > +#define USB2_OC_TIMSET_INIT0x000209ab
> > +
> >  #define PHYS_PER_CHANNEL2
> >
> >  struct rcar_gen2_phy {
> > @@ -57,8 +85,8 @@ struct rcar_gen2_channel {  };
> >
> >  struct rcar_gen2_phy_driver {
> > -void __iomem *base;
> > -struct clk *clk;
> > +void __iomem *base, *host_base;
> > +struct clk *clk, *host_clk;
> >  spinlock_t lock;
> >  int num_channels;
> >  struct rcar_gen2_channel *channels;
> > @@ -180,6 +208,111 @@ static int rcar_gen2_phy_power_off(struct phy
> *p)
> >  return 0;
> >  }
> >
> > +/* UGCTRL PLLRESET is shared between HSUSB0 and HSUSB1 */ static void
> > +__iomem *pll_reg_base;
>
> HSUSB0 (usbphy0) has this register.
> So, mapping this register on usbphy1 is not good, I think.

OK, will change this.

> > +static atomic_t pll_reset_ref_cnt;
> >
> > +static int rz_g1c_phy_init(struct phy *p) {
> > +struct rcar_gen2_phy *phy =3D phy_get_drvdata(p);
> > +struct rcar_gen2_channel *channel =3D phy->channel;
> > +struct rcar_gen2_phy_driver *drv =3D channel->drv;
> > +int retval;
> > +
> > +retval =3D rcar_gen2_phy_init(p);
> > +if (retval)
> > +return retval;
> > +
> > +/* Initialize USB2 part */
> > +if (phy->select_value !=3D USBHS_UGCTRL2_USB0SEL_HS_USB_USB20)
> {
> > +clk_prepare_enable(drv->host_clk);
> > +writel(USB2_INT_ENABLE_INIT, drv->host_base +
> USB2_INT_ENABLE);
> > +writel(USB2_SPD_RSM_TIMSET_INIT,
> > +drv->host_base +
> USB2_SPD_RSM_TIMSET);
> > +writel(USB2_OC_TIMSET_INIT, drv->host_base +
> USB2_OC_TIMSET);
> > +}
> > +
> > +return 0;
> > +}
> > +
> > +static int rz_g1c_phy_exit(struct phy *p) {
> > +struct rcar_gen2_phy *phy =3D phy_get_drvdata(p);
> > +struct rcar_gen2_channel *channel =3D phy->channel;
> > +struct rcar_gen2_phy_driver *drv =3D channel->drv;
> > +
> > +if (phy->select_value !=3D USBHS_UGCTRL2_USB0SEL_HS_USB_USB20)
> {
> > +writel(0, drv->host_base + USB2_INT_ENABLE);
> > +clk_disable_unprepare(channel->drv->host_clk);
> > +}
> > +
> > +clk_disable_unprepare(channel->drv->clk);
> > +
> > +channel->selected_phy =3D -1;
> > +
> > +return 0;
> > +}
> > +
> > +static int rz_g1c_phy_power_on(struct phy *p) {
> > +struct rcar_gen2_phy *phy =3D phy_get_drvdata(p);
> > +struct rcar_gen2_phy_driver *drv =3D phy->channel->drv;
> > +void __iomem *base =3D drv->base;
> > +unsigned long flags;
> > +u32 value;
> > +
> > +spin_lock_irqsave(&drv->lock, flags);
> > +
> > +/* Power on USBHS PHY */
> > +if (atomic_read(&pll_reset_ref_cnt) =3D=3D 0) {
> > +value =3D readl(pll_reg_base);
> > +value &=3D ~USBHS_UGCTRL_PLLRESET;
> > +writel(value, pll_reg_base);
>
> How about this register is only accessed by usbphy0 and usb channel 1
> (ehci1/ohci1/hsusb1) nodes enable both usbphy0 and usbphy1?
> Of course, usb channel 1 has to enable usbphy0 first.
> After that, we don't need these pll_reset_ref_cnt and pll_reg_base.

Ok. Will check this.

Regards,
Biju

>
> > +/* As per the data sheet wait 340 micro sec for power stable
> */
> > +udelay(340);
> > +}
> > +
> > +atomic_inc(&pll_reset_ref_cnt);
> > +
> > +if (phy->select_value =3D=3D
> USBHS_UGCTRL2_USB0SEL_HS_USB_USB20) {
> > +value =3D readw(base + USBHS_LPSTS);
> > +value |=3D USBHS_LPSTS_SUSPM;
> > +writew(value, base + USBHS_LPSTS);
> > +}
> > +
> > +spin_unlock_irqrestore(&drv->lock, flags);
> > +
> > +return 0;
> > +}
> > +



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
