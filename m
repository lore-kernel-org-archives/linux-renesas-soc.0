Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:5798 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751268AbeBLRue (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 12:50:34 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "Ramesh Shanmugasundaram" <ramesh.shanmugasundaram@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC 01/11] clk: renesas: r8a7792: Add rwdt clock
Date: Mon, 12 Feb 2018 17:50:27 +0000
Message-ID: <TY1PR06MB0895EAF0145A06D1A11F5B32C0F70@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1518086057-19448-1-git-send-email-geert+renesas@glider.be>
 <1518086057-19448-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1518086057-19448-2-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> Subject: [PATCH/RFC 01/11] clk: renesas: r8a7792: Add rwdt clock
>
> Add "rwdt" clock to r8a7792_mod_clks. Also, since we may need to access
> the watchdog registers at any time, declare the clock as critical.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  drivers/clk/renesas/r8a7792-cpg-mssr.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/renesas/r8a7792-cpg-mssr.c b/drivers/clk/renesas=
/r8a7792-cpg-mssr.c
> index 7f85bbf20bf782b7..609a540804965c40 100644
> --- a/drivers/clk/renesas/r8a7792-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7792-cpg-mssr.c
> @@ -98,6 +98,7 @@ static const struct mssr_mod_clk r8a7792_mod_clks[] __i=
nitconst =3D {
>  DEF_MOD("tpu0", 304,R8A7792_CLK_CP),
>  DEF_MOD("sdhi0", 314,R8A7792_CLK_SD),
>  DEF_MOD("cmt1", 329,R8A7792_CLK_R),
> +DEF_MOD("rwdt", 402,R8A7792_CLK_R),
>  DEF_MOD("irqc", 407,R8A7792_CLK_CP),
>  DEF_MOD("intc-sys", 408,R8A7792_CLK_ZS),
>  DEF_MOD("audio-dmac0", 502,R8A7792_CLK_HP),
> @@ -154,6 +155,7 @@ static const struct mssr_mod_clk r8a7792_mod_clks[] _=
_initconst =3D {
>  };
>
>  static const unsigned int r8a7792_crit_mod_clks[] __initconst =3D {
> +MOD_CLK_ID(402),/* RWDT */
>  MOD_CLK_ID(408),/* INTC-SYS (GIC) */
>  };
>
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
