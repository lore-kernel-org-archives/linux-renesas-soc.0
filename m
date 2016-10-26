Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:35094 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755270AbcJZMRq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Oct 2016 08:17:46 -0400
MIME-Version: 1.0
In-Reply-To: <13815645.d8PJGpIqtG@wasted.cogentembedded.com>
References: <19700058.YBgRO3SXUI@wasted.cogentembedded.com> <13815645.d8PJGpIqtG@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Oct 2016 14:17:45 +0200
Message-ID: <CAMuHMdUZc9ZPGAm=93586wDARhvE-wAz1jk1HRnda35GQjzG+g@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: cpg-mssr: add common R-Car Gen2 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 5, 2016 at 10:52 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the common R-Car  Gen2 (and RZ/G) Clock Pulse Generator / Module Standby
> and Software Reset support code, using the CPG/MSSR driver core.
>
> Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
> <geert+renesas@glider.be>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> --- /dev/null
> +++ renesas/drivers/clk/renesas/rcar-gen2-cpg.c

> +
> +/*
> + * Reset register definitions.
> + */
> +#define MODEMR 0xe6160060
> +
> +u32 __init rcar_gen2_read_modemr(void)
> +{
> +       void __iomem *modemr = ioremap_nocache(MODEMR, 4);
> +       u32 mode;
> +
> +       BUG_ON(!modemr);
> +       mode = ioread32(modemr);
> +       iounmap(modemr);
> +
> +       return mode;
> +}

Once we have "[PATCH v4 00/23] soc: renesas: Add R-Car RST driver for obtaining
mode pin state" in place, we can make the RST node in DT mandatory
for SoCs using CPG/MSSR, and drop this helper function.

> --- /dev/null
> +++ renesas/drivers/clk/renesas/rcar-gen2-cpg.h
> @@ -0,0 +1,42 @@

> +u32 rcar_gen2_read_modemr(void);

Likewise.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
