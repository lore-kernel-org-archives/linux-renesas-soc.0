Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:45800 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752159AbeADKfR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jan 2018 05:35:17 -0500
MIME-Version: 1.0
In-Reply-To: <1514906296-8099-1-git-send-email-geert+renesas@glider.be>
References: <1514906296-8099-1-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jan 2018 11:35:16 +0100
Message-ID: <CAMuHMdUXRp_TEREXb1QGL88U907AJ4_DeTsWeO=ESZkBoB5qaA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Stop enabling legacy DT clock support by default
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 2, 2018 at 4:18 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Since v4.15-rc1, the DTS files for all R-Car Gen2 SoCs have been
> converted to the new CPG/MSSR bindings.  Hence it is now safe to no
> longer enable legacy DT clock support by default.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in clk-renesas-for-v4.16.

Applied and queued in clk-renesas-for-v4.16.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
