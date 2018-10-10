Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:36344 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbeJJP5a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Oct 2018 11:57:30 -0400
MIME-Version: 1.0
References: <20181008162349.42957-1-chris.brandt@renesas.com> <20181008162349.42957-2-chris.brandt@renesas.com>
In-Reply-To: <20181008162349.42957-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Oct 2018 10:36:12 +0200
Message-ID: <CAMuHMdUaG_cEc+EuzDJ2+s97O0CRKEGiD8zgN-zvBUREXYuBiw@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r7s9210: Add SDHI clocks
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 8, 2018 at 6:24 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add SDHI clocks for RZ/A2
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
