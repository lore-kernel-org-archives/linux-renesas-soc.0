Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:56462 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752125AbeC0Ovw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Mar 2018 10:51:52 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>,
        Russell King <linux@armlinux.org.uk>
CC: Biju Das <biju.das@bp.renesas.com>,
        Tony Lindgren <tony@atomide.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Marek Szyprowski" <m.szyprowski@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        "Borislav Petkov" <bp@suse.de>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH  12/12] ARM: multi_v7_defconfig: Enable r8a77470 SoC
Date: Tue, 27 Mar 2018 14:51:43 +0000
Message-ID: <TY1PR01MB1770FC01BEB7430AE352F5D0C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
 <1522161443-54428-13-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1522161443-54428-13-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Biju,

thank you for your patch.

> Subject: [PATCH 12/12] ARM: multi_v7_defconfig: Enable r8a77470 SoC
>
> Enable recently added r8a77470 (RZ/G1C) SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi=
_v7_defconfig
> index c1e045a..3623900 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -90,6 +90,7 @@ CONFIG_ARCH_R8A73A4=3Dy
>  CONFIG_ARCH_R8A7740=3Dy
>  CONFIG_ARCH_R8A7743=3Dy
>  CONFIG_ARCH_R8A7745=3Dy
> +CONFIG_ARCH_R8A7747=3Dy

s/CONFIG_ARCH_R8A7747/CONFIG_ARCH_R8A77470/


Thanks,
Fab

>  CONFIG_ARCH_R8A7778=3Dy
>  CONFIG_ARCH_R8A7779=3Dy
>  CONFIG_ARCH_R8A7790=3Dy
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
