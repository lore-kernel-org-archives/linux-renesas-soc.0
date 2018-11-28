Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:38239 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725760AbeK2Fpi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 00:45:38 -0500
MIME-Version: 1.0
References: <20181128183702.231609-1-sboyd@kernel.org>
In-Reply-To: <20181128183702.231609-1-sboyd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Nov 2018 19:42:50 +0100
Message-ID: <CAMuHMdXk8Uoqw05uEqUvXfzQjdgLHLPEDqVvAMETE6BDDHyybw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Mark rza2_cpg_clk_register static
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 28, 2018 at 7:37 PM Stephen Boyd <sboyd@kernel.org> wrote:
> This is only used in this file, so mark it static to silence a sparse
> warning.
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
