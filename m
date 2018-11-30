Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1310134.outbound.protection.outlook.com ([40.107.131.134]:63644
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726423AbeK3Q6G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 11:58:06 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: "kishon@ti.com" <kishon@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] phy: renesas: rcar-gen3-usb2: follow the hardware manual
 procedure
Date: Fri, 30 Nov 2018 05:49:50 +0000
Message-ID: <TY2PR01MB22970F60265A2EAB114373E4D8D30@TY2PR01MB2297.jpnprd01.prod.outlook.com>
References: <1542787663-32142-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181126093911.npr3ktohqciuq5my@verge.net.au>
In-Reply-To: <20181126093911.npr3ktohqciuq5my@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon-san,

Thank you for your review!

> From: Simon Horman, Sent: Monday, November 26, 2018 6:39 PM
>=20
> On Wed, Nov 21, 2018 at 08:10:06AM +0000, Yoshihiro Shimoda wrote:
> > This patch modifies rcar_gen3_init_otg() procedure to follow Figure
> > 73.4 of "R-Car Series, 3rd Generation User's Manual: Hardware Rev.1.00"=
.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  This patch is based on the latest linux-phy / next branch
> > (commit id =3D 0eb86fa77f0f0c81631a030f10679a45c05df33a).
> >
> >  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 17 +++++++++++------
> >  1 file changed, 11 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/ren=
esas/phy-rcar-gen3-usb2.c
> > index d0f412c..a9e53e8 100644
> > --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > @@ -307,16 +307,21 @@ static void rcar_gen3_init_otg(struct rcar_gen3_c=
han *ch)
> >  	void __iomem *usb2_base =3D ch->base;
> >  	u32 val;
> >
> > +	rcar_gen3_set_linectrl(ch, 0, 1);
> > +	val =3D readl(usb2_base + USB2_LINECTRL1);
> > +	writel(val | USB2_LINECTRL1_DPRPD_EN | USB2_LINECTRL1_DMRPD_EN,
> > +	       usb2_base + USB2_LINECTRL1);
>=20
> I am wondering if as well as the above
> USB2_LINECTRL1_DPRPD_EN should be set and
> USB2_LINECTRL1_DP_RPD should be cleared.

I assumed rcar_gen3_set_linectrl(ch, 0, 1); did
"USB2_LINECTRL1_DP_RPD should be cleared ".
But, the patch is not readable. So, I will fix this.

> > +
> >  	val =3D readl(usb2_base + USB2_VBCTRL);
> >  	writel(val | USB2_VBCTRL_DRVVBUSSEL, usb2_base + USB2_VBCTRL);
> > -	writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
> > -	rcar_gen3_control_otg_irq(ch, 1);
> >  	val =3D readl(usb2_base + USB2_ADPCTRL);
> >  	writel(val | USB2_ADPCTRL_IDPULLUP, usb2_base + USB2_ADPCTRL);
> > -	val =3D readl(usb2_base + USB2_LINECTRL1);
> > -	rcar_gen3_set_linectrl(ch, 0, 0);
> > -	writel(val | USB2_LINECTRL1_DPRPD_EN | USB2_LINECTRL1_DMRPD_EN,
> > -	       usb2_base + USB2_LINECTRL1);
> > +
> > +	msleep(20);
> > +
> > +	writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
>=20
> I wonder if it is appropriate to write 0xffffffff to USB2_OBINTSTA

Also, I'll fix this.

> and then USB2_OBINT_BITS to USB2_OBINTEN here.

I assumed the rcar_gen3_control_otg_irq() below did that.
However, since rcar_gen3_control_otg_irq() does read-modify-write the regis=
ter,
it is not good as the initial routine because a boot loader wrote the regis=
ter
with other value. So, I also fix this not to call rcar_gen3_control_otg_irq=
().

> > +
> > +	rcar_gen3_control_otg_irq(ch, 1);

Best regards,
Yoshihiro Shimoda

> >  	rcar_gen3_device_recognition(ch);
> >  }
> > --
> > 1.9.1
> >
