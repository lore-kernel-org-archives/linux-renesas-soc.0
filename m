Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:36600 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751402AbdGROAF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jul 2017 10:00:05 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] ARM: shmobile: rcar-gen2: Correct arch timer frequency on
 RZ/G1E
Date: Tue, 18 Jul 2017 13:59:58 +0000
Message-ID: <KL1PR06MB1702B09E7C1EFE352D759E5BB8A10@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1500384557-22123-1-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1500384557-22123-1-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

It looks good to me.

Regards,
Biju

> -----Original Message-----
> From: Geert Uytterhoeven [mailto:geert+renesas@glider.be]
> Sent: 18 July 2017 14:29
> To: Simon Horman <horms@verge.net.au>; Magnus Damm
> <magnus.damm@gmail.com>
> Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>; Biju Das
> <biju.das@bp.renesas.com>; linux-renesas-soc@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; Geert Uytterhoeven <geert+renesas@glider.be>
> Subject: [PATCH] ARM: shmobile: rcar-gen2: Correct arch timer frequency o=
n
> RZ/G1E
>
> According to the datasheet, the frequency of the ARM architecture timer o=
n
> RZ/G1E depends on the frequency of the ZS clock, just like on R-Car
> E2 and V2H.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Untested due to lack of hardware.
>
> v2:
>   - Rebased to avoid dependencies.
> ---
>  arch/arm/mach-shmobile/setup-rcar-gen2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-
> shmobile/setup-rcar-gen2.c
> index 3bd505da31726869..7ab1690fab8299eb 100644
> --- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
> +++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> @@ -70,7 +70,8 @@ void __init rcar_gen2_timer_init(void)
>  void __iomem *base;
>  u32 freq;
>
> -if (of_machine_is_compatible("renesas,r8a7792") ||
> +if (of_machine_is_compatible("renesas,r8a7745") ||
> +    of_machine_is_compatible("renesas,r8a7792") ||
>      of_machine_is_compatible("renesas,r8a7794")) {
>  freq =3D 260000000 / 8;/* ZS / 8 */
>  /* CNTVOFF has to be initialized either from non-secure
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
