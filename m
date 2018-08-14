Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:4085 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727689AbeHNLE6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Aug 2018 07:04:58 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Chris Paterson <Chris.Paterson2@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 2/2] pinctrl: sh-pfc: r8a7796: Add R8A774A1 PFC support
Date: Tue, 14 Aug 2018 08:18:44 +0000
Message-ID: <OSAPR01MB209892F965BBCA9FAB4268CAB8380@OSAPR01MB2098.jpnprd01.prod.outlook.com>
References: <1534168353-4177-1-git-send-email-biju.das@bp.renesas.com>
 <1534168353-4177-3-git-send-email-biju.das@bp.renesas.com>
 <TYAPR01MB22852C09EE0730343974A6FFB7380@TYAPR01MB2285.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB22852C09EE0730343974A6FFB7380@TYAPR01MB2285.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

Thanks for the feedback.

> Subject: RE: [PATCH 2/2] pinctrl: sh-pfc: r8a7796: Add R8A774A1 PFC suppo=
rt
>
> Hello Biju,
>
> > From: Biju Das <biju.das@bp.renesas.com>
> > Sent: 13 August 2018 14:53
> >
> > Renesas RZ/G2M (r8a774a1) is pin compatible with R-Car M3-W (r8a7796),
> > however it doesn't have several automotive specific peripherals. Add a
> > r8a7796 specific pin groups/functions along with common pin
> > groups/functions for supporting both r8a7796 and r8a7794a1 SoC.
> s|r8a7794a1|r8a774a1

Will fix this and send v2.

Regards,
Biju

> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  drivers/pinctrl/sh-pfc/Kconfig       |   5 +
> >  drivers/pinctrl/sh-pfc/Makefile      |   1 +
> >  drivers/pinctrl/sh-pfc/core.c        |   6 +
> >  drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 837
> > ++++++++++++++++++-------------
> > ----
> >  drivers/pinctrl/sh-pfc/sh_pfc.h      |   1 +
> >  5 files changed, 453 insertions(+), 397 deletions(-)
> >
> > diff --git a/drivers/pinctrl/sh-pfc/Kconfig
> > b/drivers/pinctrl/sh-pfc/Kconfig index 43d950c1..6a7254c 100644
> > --- a/drivers/pinctrl/sh-pfc/Kconfig
> > +++ b/drivers/pinctrl/sh-pfc/Kconfig
> > @@ -49,6 +49,11 @@ config PINCTRL_PFC_R8A77470
> >          depends on ARCH_R8A77470
> >          select PINCTRL_SH_PFC
> >
> > +config PINCTRL_PFC_R8A774A1
> > +        def_bool y
> > +        depends on ARCH_R8A774A1
> > +        select PINCTRL_SH_PFC
> > +
> >  config PINCTRL_PFC_R8A7778
> >  def_bool y
> >  depends on ARCH_R8A7778
> > diff --git a/drivers/pinctrl/sh-pfc/Makefile
> > b/drivers/pinctrl/sh-pfc/Makefile index d0b29c5..9510a48 100644
> > --- a/drivers/pinctrl/sh-pfc/Makefile
> > +++ b/drivers/pinctrl/sh-pfc/Makefile
> > @@ -7,6 +7,7 @@ obj-$(CONFIG_PINCTRL_PFC_R8A7740)+=3D pfc-
> > r8a7740.o
> >  obj-$(CONFIG_PINCTRL_PFC_R8A7743)+=3D pfc-r8a7791.o
> >  obj-$(CONFIG_PINCTRL_PFC_R8A7745)+=3D pfc-r8a7794.o
> >  obj-$(CONFIG_PINCTRL_PFC_R8A77470)+=3D pfc-r8a77470.o
> > +obj-$(CONFIG_PINCTRL_PFC_R8A774A1)+=3D pfc-r8a7796.o
> >  obj-$(CONFIG_PINCTRL_PFC_R8A7778)+=3D pfc-r8a7778.o
> >  obj-$(CONFIG_PINCTRL_PFC_R8A7779)+=3D pfc-r8a7779.o
> >  obj-$(CONFIG_PINCTRL_PFC_R8A7790)+=3D pfc-r8a7790.o
> > diff --git a/drivers/pinctrl/sh-pfc/core.c
> > b/drivers/pinctrl/sh-pfc/core.c index
> > c671c3c..0122471 100644
> > --- a/drivers/pinctrl/sh-pfc/core.c
> > +++ b/drivers/pinctrl/sh-pfc/core.c
> > @@ -509,6 +509,12 @@ static const struct of_device_id sh_pfc_of_table[]




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
