Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:51212 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751866AbdHDBLe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2017 21:11:34 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Rob Herring <robh@kernel.org>
CC: "balbi@kernel.org" <balbi@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 3/3] usb: gadget: udc: renesas_usb3: add support for R-Car
 M3-W
Date: Fri, 4 Aug 2017 01:11:29 +0000
Message-ID: <TY1PR06MB099220C834EFE0F92E26D5F1D8B60@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1501244219-11840-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1501244219-11840-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20170803222808.v24lt5bzvpzmjwcj@rob-hp-laptop>
In-Reply-To: <20170803222808.v24lt5bzvpzmjwcj@rob-hp-laptop>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Rob,

> -----Original Message-----
> From: Rob Herring
> Sent: Friday, August 4, 2017 7:28 AM
>=20
> On Fri, Jul 28, 2017 at 09:16:59PM +0900, Yoshihiro Shimoda wrote:
> > This patch adds support for R-Car M3-W. This patch also adds R-Car
> > Gen3 generic version's compatible.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  Documentation/devicetree/bindings/usb/renesas_usb3.txt | 16 ++++++++++=
+++---
> >  drivers/usb/gadget/udc/renesas_usb3.c                  |  8 ++++++++
> >  2 files changed, 21 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > index 8d52766..e280258 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > @@ -3,20 +3,30 @@ Renesas Electronics USB3.0 Peripheral driver
> >  Required properties:
> >    - compatible: Must contain one of the following:
> >  	- "renesas,r8a7795-usb3-peri"
> > +	- "renesas,r8a7796-usb3-peri"
> > +	- "renesas,rcar-gen3-usb3-peri" for a generic R-Car Gen3 compatible
> > +	  device
> > +
> > +    When compatible with the generic version, nodes must list the
> > +    SoC-specific version corresponding to the platform first
> > +    followed by the generic version.
> > +
> >    - reg: Base address and length of the register for the USB3.0 Periph=
eral
> >    - interrupts: Interrupt specifier for the USB3.0 Peripheral
> >    - clocks: clock phandle and specifier pair
> >
> > -Example:
> > +Example of R-Car H3 ES1.x:
> >  	usb3_peri0: usb@ee020000 {
> > -		compatible =3D "renesas,r8a7795-usb3-peri";
> > +		compatible =3D "renesas,r8a7795-usb3-peri",
> > +			     "renesas,rcar-gen3-usb3-peri";
> >  		reg =3D <0 0xee020000 0 0x400>;
> >  		interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> >  		clocks =3D <&cpg CPG_MOD 328>;
> >  	};
> >
> >  	usb3_peri1: usb@ee060000 {
> > -		compatible =3D "renesas,r8a7795-usb3-peri";
> > +		compatible =3D "renesas,r8a7795-usb3-peri",
> > +			     "renesas,rcar-gen3-usb3-peri";
> >  		reg =3D <0 0xee060000 0 0x400>;
> >  		interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> >  		clocks =3D <&cpg CPG_MOD 327>;
> > diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget=
/udc/renesas_usb3.c
> > index aa2b185..45410f3 100644
> > --- a/drivers/usb/gadget/udc/renesas_usb3.c
> > +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> > @@ -2506,6 +2506,14 @@ static void renesas_usb3_init_ram(struct renesas=
_usb3 *usb3, struct device *dev,
> >  		.compatible =3D "renesas,r8a7795-usb3-peri",
> >  		.data =3D &renesas_usb3_priv_gen3,
> >  	},
> > +	{
> > +		.compatible =3D "renesas,r8a7796-usb3-peri",
> > +		.data =3D &renesas_usb3_priv_gen3,
> > +	},
> > +	{
> > +		.compatible =3D "renesas,rcar-gen3-usb3-peri",
> > +		.data =3D &renesas_usb3_priv_gen3,
>=20
> What's the point of a common fallback if you list all the compatibles in
> the driver?

Thank you for the comment!
The renesas,r8a779[56]-usb3-peri don't need anymore.
So, I will fix this patch.

Best regards,
Yoshihiro Shimoda

> > +	},
> >  	{ },
> >  };
> >  MODULE_DEVICE_TABLE(of, usb3_of_match);
> > --
> > 1.9.1
> >
