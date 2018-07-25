Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:39976 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728741AbeGYSrI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 14:47:08 -0400
MIME-Version: 1.0
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com> <d8e355fd-46f5-3798-fe43-811471a75ab6@cogentembedded.com>
In-Reply-To: <d8e355fd-46f5-3798-fe43-811471a75ab6@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Jul 2018 19:34:16 +0200
Message-ID: <CAMuHMdXPYwC5pmY+HmT0TYTXpmy152pVtdanSPCZMX1xp0r76g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add Cortex-A53 PMU support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 25, 2018 at 6:44 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe the performance monitor unit (PMU) for the Cortex-A53 cores in
> the R8A77970 SoC's device tree.

8?

Can you hack up a check in checkpatch.pl to catch such mistakes? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
