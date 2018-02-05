Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:44364 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752607AbeBENcT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 08:32:19 -0500
MIME-Version: 1.0
In-Reply-To: <32142684-d5cf-035f-8401-86a36dcbafd6@cogentembedded.com>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com> <32142684-d5cf-035f-8401-86a36dcbafd6@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Feb 2018 14:32:18 +0100
Message-ID: <CAMuHMdWad2OJ33Hu0KbYS3nLWhgmj81_wRbtwApw-N81q3+nsA@mail.gmail.com>
Subject: Re: [PATCH 05/11] arm64: dts: renesas: initial R8A77980 SoC device tree
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Simon Horman <horms@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Feb 2, 2018 at 7:33 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The initial R8A77980 SoC device tree including Cortex-A53 CPU, GIC, timer,
> CPG, RST, and SYSC.
>
> Based on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

> --- /dev/null
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the r8a77980 SoC
> + *
> + * Copyright (C) 2018 Renesas Electronics Corp.
> + * Copyright (C) 2018 Cogent Embedded, Inc.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>

I think you want to leave out the above #include, as it will go upstream
through a different path (you're already using hardcoded clock numbers,
assuming the same).

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
