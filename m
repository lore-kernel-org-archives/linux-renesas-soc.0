Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:33788 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932309AbeFFHwZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 03:52:25 -0400
MIME-Version: 1.0
In-Reply-To: <50de037c-7560-c261-f96a-f86065674c9b@cogentembedded.com>
References: <3923fc5f-103c-94c9-57ba-cb29e8c55d05@cogentembedded.com> <50de037c-7560-c261-f96a-f86065674c9b@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jun 2018 09:52:24 +0200
Message-ID: <CAMuHMdXQMkzunWf=z3NpQvKTuKL_j7q_HStfb_2NU2G-npDPNw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: initial V3HSK board device tree
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Will Deacon <will.deacon@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 10, 2018 at 8:12 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the initial device  tree for  the V3H Starter Kit board.
> The board has 1 debug serial port (SCIF0); include support for it,
> so that the serial console can work.
>
> Based on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

FTR:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts

> +&pfc {
> +       scif0_pins: scif0 {
> +               groups = "scif0_data";
> +               function = "scif0";
> +       };

JFYI, hscif0 can be routed to the same pins, if higher performance is needed.


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
