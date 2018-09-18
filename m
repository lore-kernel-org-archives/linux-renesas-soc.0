Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:32792 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728575AbeIRSZd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Sep 2018 14:25:33 -0400
Received: by mail-vs1-f66.google.com with SMTP id y12-v6so574967vsm.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Sep 2018 05:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20180918122340.5478-1-marek.vasut+renesas@gmail.com>
In-Reply-To: <20180918122340.5478-1-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Sep 2018 14:52:53 +0200
Message-ID: <CAMuHMdVOMZ+o4osu7zGJm3YBQ-Mxest1kkJGgiH53joW1i__jg@mail.gmail.com>
Subject: Re: [PATCH V6] ARM: shmobile: Rework the PMIC IRQ line quirk
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 18, 2018 at 2:23 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> Rather than hard-coding the quirk topology, which stopped scaling,
> parse the information from DT. The code looks for all compatible
> PMICs -- da9063 and da9210 -- and checks if their IRQ line is tied
> to the same pin. If so, the code sends a matching sequence to the
> PMIC to deassert the IRQ.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be> (on Koelsch)
> ---
> V2: - Replace the DT shared IRQ check loop with memcmp()
>     - Send the I2C message to deassert the IRQ line to all PMICs
>       in the list with shared IRQ line instead of just one
>     - Add comment that this works only in case all the PMICs are
>       on the same I2C bus
> V3: - Drop the addr = 0x00 init
>     - Drop reinit of argsa in rcar_gen2_regulator_quirk
> V4: - Squash regulator_quirk on single line
>     - Drop !np check in for_each_matching_node_and_match()
>     - Use argsa in of_irq_parse_one
> V5: - Check kzalloc failure
>     - Rename da...._msgs to da...._msg
>     - Don't reinit quirk->shared
> V6: - Skip invalid entries instead of aborting on them

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
