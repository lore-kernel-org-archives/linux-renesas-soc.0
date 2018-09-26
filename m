Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:39667 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbeIZUBL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Sep 2018 16:01:11 -0400
MIME-Version: 1.0
References: <20180926133956.79788-1-chris.brandt@renesas.com>
In-Reply-To: <20180926133956.79788-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Sep 2018 15:47:56 +0200
Message-ID: <CAMuHMdUiwwroXOS=b0uUEQ8dAPvMYc=xq+V7wu3TL2A7EcQKUA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r7s9210: Add SPI clocks
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 26, 2018 at 3:40 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add RSPI clocks for RZ/A2.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
