Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:43533 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725967AbeLGI1Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 03:27:25 -0500
MIME-Version: 1.0
References: <20181206215858.3880-1-sboyd@kernel.org> <20181206215858.3880-2-sboyd@kernel.org>
In-Reply-To: <20181206215858.3880-2-sboyd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Dec 2018 09:27:11 +0100
Message-ID: <CAMuHMdVWbcoVr9E9nmKvhrUAAf4817wEQnQ6QrF1sWeHpgL_2g@mail.gmail.com>
Subject: Re: [PATCH 1/8] clk: renesas: Remove usage of CLK_IS_BASIC
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Stephen,

On Thu, Dec 6, 2018 at 10:59 PM Stephen Boyd <sboyd@kernel.org> wrote:
> This flag doesn't look to be used by any code, just set in various clk
> init structures and then never tested again. Remove it from these
> drivers as it doesn't provide any benefit.
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: <linux-renesas-soc@vger.kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>

Thanks!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I assume you want to apply this yourself, with the rest of the series?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
