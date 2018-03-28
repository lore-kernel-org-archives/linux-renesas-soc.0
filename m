Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45768 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751114AbeC1I0o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Mar 2018 04:26:44 -0400
Date: Wed, 28 Mar 2018 10:26:40 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Russell King <linux@armlinux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Borislav Petkov <bp@suse.de>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH  12/12] ARM: multi_v7_defconfig: Enable r8a77470 SoC
Message-ID: <20180328082640.py5bjsjg5dcm6c66@verge.net.au>
References: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
 <1522161443-54428-13-git-send-email-biju.das@bp.renesas.com>
 <TY1PR01MB1770FC01BEB7430AE352F5D0C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <OSBPR01MB21032F67E2F7463BF4CEA875B8AC0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB21032F67E2F7463BF4CEA875B8AC0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 27, 2018 at 02:57:28PM +0000, Biju Das wrote:
> Hello Fabrizio,
> 
> Thanks for the feedback.
> 
> > > Subject: [PATCH 12/12] ARM: multi_v7_defconfig: Enable r8a77470 SoC
> > >
> > > Enable recently added r8a77470 (RZ/G1C) SoC.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > ---
> > >  arch/arm/configs/multi_v7_defconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/arm/configs/multi_v7_defconfig
> > > b/arch/arm/configs/multi_v7_defconfig
> > > index c1e045a..3623900 100644
> > > --- a/arch/arm/configs/multi_v7_defconfig
> > > +++ b/arch/arm/configs/multi_v7_defconfig
> > > @@ -90,6 +90,7 @@ CONFIG_ARCH_R8A73A4=y
> > CONFIG_ARCH_R8A7740=y
> > > CONFIG_ARCH_R8A7743=y  CONFIG_ARCH_R8A7745=y
> > > +CONFIG_ARCH_R8A7747=y
> >
> > s/CONFIG_ARCH_R8A7747/CONFIG_ARCH_R8A77470/
> 
> Will send V2.

Thanks, when posting v2 please include all patches that have
not been accepted.
