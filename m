Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:38574 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758416AbdLRJyD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 04:54:03 -0500
Received: by mail-qt0-f195.google.com with SMTP id d4so19259035qtj.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Dec 2017 01:54:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1513350890-2446-3-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1513350890-2446-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1513350890-2446-3-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Dec 2017 10:54:02 +0100
Message-ID: <CAMuHMdVaaXmYB0-KZuSNKAWBnf_Ek0tNy685b_OODkUXO=RvKw@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: rcar-gen3: Add ZG clock divider support
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Fri, Dec 15, 2017 at 4:14 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds ZG clock divider support for R-Car Gen3 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>

SoB?

> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -73,6 +73,8 @@ static void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
>   */
>  #define CPG_FRQCRB                     0x00000004
>  #define CPG_FRQCRB_KICK                        BIT(31)
> +#define CPG_FRQCRB_ZGFC_MASK           (0x1f << 24)
> +#define CPG_FRQCRB_ZGFC_SHIFT          24
>  #define CPG_FRQCRC                     0x000000e0
>  #define CPG_FRQCRC_ZFC_MASK            GENMASK(12, 8)
>  #define CPG_FRQCRC_Z2FC_MASK           GENMASK(4, 0)
> @@ -197,6 +199,120 @@ static struct clk * __init cpg_z_clk_register(const char *name,
>         return clk;
>  }
>
> +static unsigned long cpg_zg_clk_recalc_rate(struct clk_hw *hw,
> +                                           unsigned long parent_rate)
> +{

I think this can be consolidated with the Z/Z2 clock support, like Simon
did for the Z2 clock:
https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git/commit/?h=topic/rcar-gen3-z-clk-v3&id=fda8dbe29dd1f04b61c443147a106962cf5d3f14

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
