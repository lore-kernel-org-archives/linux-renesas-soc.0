Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:36985 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751392AbdIMI7t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2017 04:59:49 -0400
MIME-Version: 1.0
In-Reply-To: <20170912210523.663877115@cogentembedded.com>
References: <20170912210523.663877115@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Sep 2017 10:59:48 +0200
Message-ID: <CAMuHMdUzO_oHscsLntd0VaKAOCXU00MyidvZ_A-rR2+UHtKc9w@mail.gmail.com>
Subject: Re: [PATCH 05/11] arm64: dts: renesas: initial R8A77970 SoC device tree
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Simon Horman <horms@verge.net.au>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Tue, Sep 12, 2017 at 10:37 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The initial R8A77970 SoC device tree including Cortex-A53 CPU, GIC, timer,
> CPG, RST, and SYSC.
>
> Based on the original (and large) patch by Daisuke Matsushita
> <daisuke.matsushita.ns@hitachi.com>.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi |  126 ++++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> ===================================================================
> --- /dev/null
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -0,0 +1,126 @@
> +/*
> + * Device Tree Source for the r8a77970 SoC
> + *
> + * Copyright (C) 2016-2017 Renesas Electronics Corp.
> + * Copyright (C) 2017 Cogent Embedded, Inc.
> + *
> + * This file is licensed under the terms of the GNU General Public License
> + * version 2.  This program is licensed "as is" without any warranty of any
> + * kind, whether express or implied.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>

arm-gic.h includes irq.h.

> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +#include <dt-bindings/power/r8a77970-sysc.h>

You can avoid the dependency on the above header, which will go upstream
through a different branch, by hardcoding the power area indices for the
initial submission, like you already did for the CPG core clocks.

> +
> +/ {
> +       compatible = "renesas,r8a77970";
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       psci {
> +               compatible = "arm,psci-1.0";

PSCI 1.0 is backwards compatible with PSI 0.2:

    compatible = "arm,psci-1.0", "arm,psci-0.2";

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
