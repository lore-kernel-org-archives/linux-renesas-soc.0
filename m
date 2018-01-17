Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:35287 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753705AbeAQQMF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 11:12:05 -0500
Received: by mail-qt0-f195.google.com with SMTP id u10so23155152qtg.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jan 2018 08:12:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1516203716-4606-3-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1516203716-4606-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1516203716-4606-3-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jan 2018 17:12:03 +0100
Message-ID: <CAMuHMdU5s0eacQEWT7SZK2=wOZiRRUx7H15L1d=cK5ocjw745Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: rcar-gen3: Add ZG clock divider support
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Wed, Jan 17, 2018 at 4:41 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> This patch adds ZG clock divider support for R-Car Gen3 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -76,6 +76,7 @@ static void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
>  #define CPG_FRQCRC                     0x000000e0
>  #define CPG_FRQCRC_ZFC_MASK            GENMASK(12, 8)
>  #define CPG_FRQCRC_Z2FC_MASK           GENMASK(4, 0)
> +#define CPG_FRQCRC_ZGFC_MASK           GENMASK(28, 24)

According to the BSP, these bits are in FRQCRB, not FRQCRC?

Note that the R-Car Gen3 Hardware User's Manual does not document these
bits, and declares them read-only, always zero...

> @@ -563,6 +564,10 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
>                 return cpg_z_clk_register(core->name, __clk_get_name(parent),
>                                           base, CPG_FRQCRC_Z2FC_MASK);
>
> +       case CLK_TYPE_GEN3_ZG:
> +               return cpg_z_clk_register(core->name, __clk_get_name(parent),
> +                                         base, CPG_FRQCRC_ZGFC_MASK);

I don't think you can do it like that.
ZG uses FRQCRB instead of FRQCRC, and uses a fixed divider of 4 instead of 2.
While the rest of the handling is similar, both differences need to be taken
into account.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
