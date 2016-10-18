Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36223 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759132AbcJRIbL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 04:31:11 -0400
Received: by mail-io0-f194.google.com with SMTP id o141so12187366ioe.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Oct 2016 01:31:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1476738753-24304-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1476738753-24304-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1476738753-24304-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Oct 2016 10:31:10 +0200
Message-ID: <CAMuHMdUAdEEzqjm_qZCa0C65r96mbe+u5NC_Z8gytv8oWQY-zw@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r8a7796: Add DU and LVDS clocks
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 17, 2016 at 11:12 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>  drivers/clk/renesas/r8a7796-cpg-mssr.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> index 679054658f99..20bd0643b238 100644
> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -134,6 +134,10 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
>         DEF_MOD("vspd0",                 623,   R8A7796_CLK_S0D2),
>         DEF_MOD("vspb",                  626,   R8A7796_CLK_S0D1),
>         DEF_MOD("vspi0",                 631,   R8A7796_CLK_S0D1),
> +       DEF_MOD("du2",                   722,   R8A7796_CLK_S0D2),
> +       DEF_MOD("du1",                   723,   R8A7796_CLK_S0D2),
> +       DEF_MOD("du0",                   724,   R8A7796_CLK_S0D2),

I'll fix up the DU parent clock to S2D1 now we got confirmation.

> +       DEF_MOD("lvds",                  727,   R8A7796_CLK_S0D4),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
