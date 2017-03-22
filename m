Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:36956 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759810AbdCVNZe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Mar 2017 09:25:34 -0400
MIME-Version: 1.0
In-Reply-To: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
References: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Mar 2017 14:25:26 +0100
Message-ID: <CAMuHMdXcqsOp=W-M0Z4vCmDkq8yCwu9vq3+zUVJiPXGBzKAo9g@mail.gmail.com>
Subject: Re: [PATCH 0/7] clk: renesas: rcar-gen3: Misc fixes and cleanups
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Mar 13, 2017 at 5:19 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series contains miscellaneous fixes and cleanups for the
> Renesas R-Car Gen3 (H3 and M3-W) clock drivers:
>   - Correct parent clock for Audio DMACs,
>   - Correct names of watchdog clocks,
>   - Reformat core clock tables for easier comparisons between drivers,
>   - Add workaround for PLL0/2/4 errata on R-Car H3 ES1.0.
>
> I plan to queue these up in clk-renesas-for-v4.12.

Queued up with Morimoto-san's grammar fix and Acked-by.

> Geert Uytterhoeven (7):
>   clk: renesas: r8a7795: Correct parent clock and sort order for Audio
>     DMACs
>   clk: renesas: r8a7795: Correct name of watchdog clock
>   clk: renesas: r8a7796: Correct name of watchdog clock
>   clk: renesas: r8a7795: Reformat core clock table
>   clk: renesas: r8a7796: Reformat core clock table
>   clk: renesas: rcar-gen3-cpg: Pass mode pins to rcar_gen3_cpg_init()
>   clk: renesas: rcar-gen3: Add workaround for PLL0/2/4 errata on H3
>     ES1.0

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
