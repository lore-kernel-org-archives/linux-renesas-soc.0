Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:55107 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750812AbdHRKZw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2017 06:25:52 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH ] ARM: multi_v7_defconfig: Enable BQ32000 RTC driver
Date: Fri, 18 Aug 2017 10:25:47 +0000
Message-ID: <KL1PR06MB17029FA6365BDD6C1C38C42DB8800@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1502975345-4209-1-git-send-email-biju.das@bp.renesas.com>
 <20170818080621.GI9175@verge.net.au>
In-Reply-To: <20170818080621.GI9175@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



> -----Original Message-----
> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: 18 August 2017 09:06
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Russell King <linux@armlinux.org.uk>; Magnus Damm
> <magnus.damm@gmail.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>; Chris Paterson
> <Chris.Paterson2@renesas.com>; linux-renesas-soc@vger.kernel.org; linux-
> arm-kernel@lists.infradead.org
> Subject: Re: [PATCH ] ARM: multi_v7_defconfig: Enable BQ32000 RTC driver
>
> On Thu, Aug 17, 2017 at 02:09:05PM +0100, Biju Das wrote:
> > The iWave RZ/G1M Q7 SOM supports RTC (TI BQ32000).
> > To increase hardware support enable the driver in the
> > multi_v7_defconfig multiplatform configuration.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> > This patch is tested against linux-next tag next-20170817 as well as
> > renesas-dev tag renesas-devel-20170815-v4.13-rc5 .
> >
> >  arch/arm/configs/multi_v7_defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/configs/multi_v7_defconfig
> > b/arch/arm/configs/multi_v7_defconfig
> > index 18e1f80..02dc373 100644
> > --- a/arch/arm/configs/multi_v7_defconfig
> > +++ b/arch/arm/configs/multi_v7_defconfig
> > @@ -766,6 +766,7 @@ CONFIG_RTC_DRV_MAX8997=3Dm
> > CONFIG_RTC_DRV_MAX77686=3Dy  CONFIG_RTC_DRV_RK808=3Dm
> > CONFIG_RTC_DRV_RS5C372=3Dm
> > +CONFIG_RTC_DRV_BQ32K=3Dy
>
> My assumption is that multi_v7_defconfig produces a very large kernel ima=
ge
> and that we should try to avoid making it larger by using modules where
> possible. Is it practical to enable this option as a module (m) rather th=
an a built-
> in (y)?

I have tested this as module and it works. OK I will send v2.


> >  CONFIG_RTC_DRV_PALMAS=3Dy
> >  CONFIG_RTC_DRV_ST_LPC=3Dy
> >  CONFIG_RTC_DRV_TWL4030=3Dy
> > --
> > 1.9.1
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
