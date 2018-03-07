Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:35286 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754219AbeCGJtt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Mar 2018 04:49:49 -0500
Received: by mail-qk0-f195.google.com with SMTP id s188so1895853qkb.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Mar 2018 01:49:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180307094046.4907-3-horms+renesas@verge.net.au>
References: <20180307094046.4907-1-horms+renesas@verge.net.au> <20180307094046.4907-3-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Mar 2018 10:49:47 +0100
Message-ID: <CAMuHMdUnpvF0TXW9FaoYTe-dTQ9prDNmHa6OkbZbww-m7wav_A@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a7795: sort subnodes of the
 cpu node
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Mar 7, 2018 at 10:40 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Sort subnodes of the cpu node alphanumerically.
>
> This is part of an ongoing effort to provide consistent node
> order in the DT of Renesas SoCs to improve maintainability.
>
> This should not have any run-time effect.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -34,6 +34,50 @@
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> +               a53_0: cpu@100 {
> +                       compatible = "arm,cortex-a53", "arm,armv8";
> +                       reg = <0x100>;
> +                       device_type = "cpu";
> +                       power-domains = <&sysc R8A7795_PD_CA53_CPU0>;
> +                       next-level-cache = <&L2_CA53>;
> +                       enable-method = "psci";
> +                       clocks =<&cpg CPG_CORE R8A7795_CLK_Z2>;
> +                       operating-points-v2 = <&cluster1_opp>;
> +               };

[...]

>                 a57_0: cpu@0 {
>                         compatible = "arm,cortex-a57", "arm,armv8";
>                         reg = <0x0>;

Given the CPU nodes do have reg properties and unit addresses, shouldn't
they be sorted by these values, instead of alphabetically?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
