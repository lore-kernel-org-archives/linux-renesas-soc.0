Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:44870 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933662AbdLRJqa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 04:46:30 -0500
Received: by mail-qk0-f195.google.com with SMTP id h19so17572980qkj.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Dec 2017 01:46:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1513350890-2446-2-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1513350890-2446-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1513350890-2446-2-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Dec 2017 10:46:29 +0100
Message-ID: <CAMuHMdV4LiHQ16woAMgABgd8hHiei9Kbfkym3ouGAUUtMGUCBA@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: r8a7796: Add ZG clock
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
> This patch adds ZG clock for R8A7796 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Forgot to add you're own SoB?

> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -76,6 +76,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
>         /* Core Clock Outputs */
>         DEF_BASE("z",           R8A7796_CLK_Z,     CLK_TYPE_GEN3_Z, CLK_PLL0),
>         DEF_BASE("z2",          R8A7796_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2),
> +       DEF_FIXED("zg",         R8A7796_CLK_ZG,    CLK_PLL4,       4, 1),

Shouldn't this be a variable clock of type CLK_TYPE_GEN3_ZG?
What else is the purpose of "[PATCH 2/4] clk: renesas: rcar-gen3: Add ZG
clock divider support"?

> @@ -117,6 +118,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
>  };
>
>  static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
> +       DEF_MOD("3dge",                  112,   R8A7796_CLK_ZG),
>         DEF_MOD("scif5",                 202,   R8A7796_CLK_S3D4),
>         DEF_MOD("scif4",                 203,   R8A7796_CLK_S3D4),
>         DEF_MOD("scif3",                 204,   R8A7796_CLK_S3D4),
> --

This part is fine.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
