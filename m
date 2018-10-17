Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:32851 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727288AbeJQRJM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 13:09:12 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v4 2/6] pinctrl: sh-pfc: r8a77470: Add SDHI support
Date: Wed, 17 Oct 2018 09:14:19 +0000
Message-ID: <TY1PR01MB1770CFA1D3E90130BC97BB76C0FF0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1539686023-7487-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181017084358.zq5lnxvcba2kftkv@verge.net.au>
In-Reply-To: <20181017084358.zq5lnxvcba2kftkv@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Simon,

Thank you for your feedback.

> >
> > +static int r8a77470_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pi=
n,
> > +   u32 *pocctrl)
> > +{
> > +int bit =3D -EINVAL;
> > +
> > +*pocctrl =3D 0xe60600b0;
> > +
> > +if (pin >=3D RCAR_GP_PIN(0, 5) && pin <=3D RCAR_GP_PIN(0, 10))
> > +bit =3D 0;
>
> Is it intentional that the range above excludes GP0_11 and 12?

Yes, it is, GPO_11 and GPO_12 can't be voltage controlled, they only work a=
t 3.3V

>
> > +
> > +if (pin >=3D RCAR_GP_PIN(0, 13) && pin <=3D RCAR_GP_PIN(0, 22))
> > +bit =3D 2;
> > +
> > +if (pin >=3D RCAR_GP_PIN(4, 14) && pin <=3D RCAR_GP_PIN(4, 19))
>
> And likewise GP4_20 and 21 here.

Same thing here, GP4_20 and GP4_21 can't be voltage controlled, they only w=
ork at 3.3V

Thanks, Fab



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
