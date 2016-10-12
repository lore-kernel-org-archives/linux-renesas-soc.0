Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35938 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751847AbcJLLcX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2016 07:32:23 -0400
MIME-Version: 1.0
In-Reply-To: <2357731.SxJodxn1PJ@wasted.cogentembedded.com>
References: <9246696.7P1aOyyQt4@wasted.cogentembedded.com> <2357731.SxJodxn1PJ@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Oct 2016 13:31:33 +0200
Message-ID: <CAMuHMdXNawoU5U+G296fxe_AKPGW=71Fcz9Kj932QYESDX+smw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: cpg-mssr: add R8A7743 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Oct 7, 2016 at 10:47 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add RZ/G1M (R8A7743) Clock  Pulse Generator / Module Standby and Software
> Reset support, using the CPG/MSSR driver core and the common R-Car Gen2
> (and RZ/G) code.
>
> Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
> <geert+renesas@glider.be>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

> --- /dev/null
> +++ renesas/drivers/clk/renesas/r8a7743-cpg-mssr.c

> +static const unsigned int r8a7743_crit_mod_clks[] __initconst = {
> +       MOD_CLK_ID(408),        /* INTC-AP (GIC) */

This clock is actually called "INTC-SYS" on the RZ/G series, like on most other
Renesas SoCs.

> +};

The rest looks good at first sight. I'll have a closer look after ELC-E.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
