Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f181.google.com ([209.85.217.181]:41704 "EHLO
        mail-ua0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934809AbeEIOjU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 May 2018 10:39:20 -0400
MIME-Version: 1.0
In-Reply-To: <1525701427-12914-1-git-send-email-geert+renesas@glider.be>
References: <1525701427-12914-1-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 May 2018 16:39:19 +0200
Message-ID: <CAMuHMdWLoQ+SnD29NLbmVWt3z3YJf-4BGsUx9Yog8VQg3r4J=Q@mail.gmail.com>
Subject: Re: [PATCH 0/8] ARM: dts: renesas: Add PMU device nodes
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 7, 2018 at 3:56 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series enables support for the ARM Performance Monitor Units
> in Cortex-A7, Cortex-A9, and Cortex-A15 CPU cores on Renesas RZ/A1,
> R-Car Gen2, and RZ/G1 SoCs.  This allows for better performance analysis
> using the "perf" tool.

[...]

> This has been tested on r8a7791/koelsch, and boot-tested on
> r7s72100/genmai, r8a7790/lager, r8a7792/blanche, and r8a7794/silk.

... and r8a7793/gose and r8a7794/alt.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
