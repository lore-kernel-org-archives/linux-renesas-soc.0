Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:35905 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752297AbcIBIfj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 04:35:39 -0400
MIME-Version: 1.0
In-Reply-To: <20160902023225.13898-1-chris.brandt@renesas.com>
References: <20160901131036.17241-1-chris.brandt@renesas.com> <20160902023225.13898-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Sep 2016 10:19:43 +0200
Message-ID: <CAMuHMdXvJEpECERZPOX_gyj++ZLpe=7ziE2d-X9rcKNJdBaHug@mail.gmail.com>
Subject: Re: [PATCH v4] clk: renesas: rz: Select EXTAL vs USB clock
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 2, 2016 at 4:32 AM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Check the MD_CLK pin to determine the current clock mode in order to set
> the pll clock parent correctly.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
> V4:
> * added static and __init to rz_cpg_read_mode_pins
> * set cpg_mode during declaration
> v3:
> * move reading GPIO port into separate function
> v2:
> * Switched to reading MD_CLK pin to determine mode

Thanks for the update, will queue in clk-renesas-for-v4.X...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
