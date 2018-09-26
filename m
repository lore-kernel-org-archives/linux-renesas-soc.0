Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f195.google.com ([209.85.221.195]:42946 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbeIZPhJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Sep 2018 11:37:09 -0400
MIME-Version: 1.0
References: <20180924164937.36536-1-chris.brandt@renesas.com> <20180924164937.36536-3-chris.brandt@renesas.com>
In-Reply-To: <20180924164937.36536-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Sep 2018 11:24:55 +0200
Message-ID: <CAMuHMdWZ5BE4bjOCbVL5BoE4-pYRhD3x3zRs=gPGuCgNKb+=oA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: renesas: r7s9210: Convert some clocks to early
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 24, 2018 at 6:50 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> The OSTM timer driver for RZ/A2 uses TIMER_OF_DECLARE which requires the
> ostm module clocks to be registers early in boot.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * List early clocks first
>  * Remove unnecessary comments
>  * Removed new function r7s9210_update_clk_table (to be included in a
>    separate patch)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
