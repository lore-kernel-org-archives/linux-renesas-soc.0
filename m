Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:34790 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751906AbdLMIeR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 03:34:17 -0500
Received: by mail-lf0-f52.google.com with SMTP id x20so1691838lff.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2017 00:34:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171213082531.ubbp2za2zupqfqk3@verge.net.au>
References: <20171212082436.12210-1-horms+renesas@verge.net.au>
 <20171212082436.12210-3-horms+renesas@verge.net.au> <CAMuHMdVx-cEHwV+mBcZfM903DrkxjyNqOiT6KQvm5fNUpcW2Ww@mail.gmail.com>
 <20171213082531.ubbp2za2zupqfqk3@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2017 09:34:15 +0100
Message-ID: <CAMuHMdUx=MyFZypFpJPwXH-mz1Oz9W-UkEZP4QO3TSGnKEw0Fg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a7796: move nodes which have
 no reg property out of bus
To: Simon Horman <horms@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Dec 13, 2017 at 9:25 AM, Simon Horman <horms@verge.net.au> wrote:
> For now I've applied the following:
>
> From: Simon Horman <horms+renesas@verge.net.au>
> Date: Tue, 12 Dec 2017 09:24:35 +0100
> Subject: [PATCH] arm64: dts: renesas: r8a7796: move nodes which have no reg
>  property out of bus
>
> Move pmu_a5[73], timer and thermal-zones nodes from soc node to root node.
> The nodes that have been moved do not have any register properties and thus
> shouldn't be placed on the bus.

> index c1b0d0344329..e82b4db1ad1a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -154,6 +154,23 @@
>                 clock-frequency = <0>;
>         };
>
> +       pmu_a57 {
> +               compatible = "arm,cortex-a57-pmu";
> +               interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
> +                                     <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupt-affinity = <&a57_0>,
> +                                    <&a57_1>;

Merge?

> +       };
> +
> +       pmu_a53 {
> +               compatible = "arm,cortex-a53-pmu";
> +               interrupts-extended = <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
> +                                     <&gic GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
> +                                     <&gic GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
> +                                     <&gic GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupt-affinity = <&a53_0>, <&a53_1>, <&a53_2>, <&a53_3>;

Thanks!

> +       };

> @@ -2027,4 +1968,56 @@
>                         resets = <&cpg 822>;
>                 };
>         };
> +
> +       timer {
> +               compatible = "arm,armv8-timer";
> +               interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> +                                     <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> +                                     <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> +                                     <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;

Much better!

Or even

> +               interrupts-extended =
> +                       <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> +                       <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> +                       <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> +                       <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;

I don't care that much, it extends beyond 80 characters anyway.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
