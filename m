Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:40113 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751559AbeAQPwb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 10:52:31 -0500
Received: by mail-qk0-f194.google.com with SMTP id d18so25789508qke.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jan 2018 07:52:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1516203716-4606-2-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1516203716-4606-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1516203716-4606-2-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jan 2018 16:52:30 +0100
Message-ID: <CAMuHMdU9qHC+XMW_NebxTbZ1ht5YwGnL8px7v0k_RRWi6WYmOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r8a7796: Add ZG clock
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 17, 2018 at 4:41 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> This patch adds ZG clock for R8A7796 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -76,6 +76,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
>         /* Core Clock Outputs */
>         DEF_BASE("z",           R8A7796_CLK_Z,     CLK_TYPE_GEN3_Z, CLK_PLL0),
>         DEF_BASE("z2",          R8A7796_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2),
> +       DEF_BASE("zg",          R8A7796_CLK_ZG,    CLK_TYPE_GEN3_ZG, CLK_PLL4),

Given this uses CLK_TYPE_GEN3_ZG, it should be the second patch in the series.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
