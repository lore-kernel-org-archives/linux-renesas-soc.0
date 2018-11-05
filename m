Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:43249 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728966AbeKEWkL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 17:40:11 -0500
MIME-Version: 1.0
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com> <5a5c65f1-d446-9445-4e2a-579f57f00abf@cogentembedded.com>
In-Reply-To: <5a5c65f1-d446-9445-4e2a-579f57f00abf@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Nov 2018 14:20:14 +0100
Message-ID: <CAMuHMdWbbLrAqTb2OyzA3hgFRaRCPqs76OokwY9uRw3U-OYnjw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a77970: add RPC clock
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 2, 2018 at 8:25 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On R-Car V3M (R8A77970), the RPC/RPCD2 clocks are output by the common
> divider. Describe them, as well as the RPC-IF module clock.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.21, with s/add/Add/ and s/clock/clocks/.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
