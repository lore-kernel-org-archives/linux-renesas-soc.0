Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:40520 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751628AbeBSIaP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 03:30:15 -0500
MIME-Version: 1.0
In-Reply-To: <5cf82cb1-0278-010c-165d-07dbcbe0878d@cogentembedded.com>
References: <ae31804b-969b-9b20-16d0-50f5dea42f08@cogentembedded.com> <5cf82cb1-0278-010c-165d-07dbcbe0878d@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Feb 2018 09:30:14 +0100
Message-ID: <CAMuHMdWwjXw0SwVK704_AtkDg3C-or5bUbXPwMEvTwU5eLGrpQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: initial Condor board device tree
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

On Fri, Feb 16, 2018 at 7:35 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the initial device  tree for  the R8A77980 SoC based Condor board.
> The board has 1 debug serial port (SCIF0); include support for it, so
> that the serial console can work.
>
> Based on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> ---
> Changes in version 2:
> - removed the useless "status" property from the SCIF_CLK node;
> - fixed the memory size;
> - added Geert's tag.

> --- /dev/null
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the Condor board
> + *
> + * Copyright (C) 2018 Renesas Electronics Corp.
> + * Copyright (C) 2018 Cogent Embedded, Inc.
> + */
> +
> +/dts-v1/;
> +#include "r8a77980.dtsi"
> +
> +/ {
> +       model = "Renesas Condor board based on r8a77980";
> +       compatible = "renesas,condor", "renesas,r8a77980";
> +
> +       aliases {
> +               serial0 = &scif0;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       memory@48000000 {
> +               device_type = "memory";
> +               /* first 128MB is reserved for secure area. */
> +               reg = <0 0x48000000 0 0xb8000000>;

Shouldn't the size be 0x78000000, or is there really 3 GiB of RAM?

oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
