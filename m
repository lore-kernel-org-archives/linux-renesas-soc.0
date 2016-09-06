Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:36725 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753413AbcIFI7t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 04:59:49 -0400
Received: by mail-oi0-f68.google.com with SMTP id u131so4192954oif.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Sep 2016 01:59:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1473150352-31081-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1473150352-31081-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1473150352-31081-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Sep 2016 10:59:47 +0200
Message-ID: <CAMuHMdVzd9k7CMxKG0JzDOTgaL6GEhHatAkFjcr6ma7-heWy2g@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: shmobile: r8a7796: Add RAVB clock
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Sep 6, 2016 at 10:25 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> index cfd5ffb77dfe..868dfe30dfe7 100644
> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -99,6 +99,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
>  static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
>         DEF_MOD("scif2",                 310,   R8A7796_CLK_S3D4),
>         DEF_MOD("intc-ap",               408,   R8A7796_CLK_S3D1),
> +       DEF_MOD("etheravb",              812,   R8A7796_CLK_S3D2),

According to the datasheet, the parent clock on M3-W (and H3 ES2.0!) is S0D6,
not S3D2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
