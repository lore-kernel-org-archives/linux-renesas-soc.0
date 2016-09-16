Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:33386 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751905AbcIPHI1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 03:08:27 -0400
MIME-Version: 1.0
In-Reply-To: <20160915193405.26943-3-chris.brandt@renesas.com>
References: <20160915193405.26943-1-chris.brandt@renesas.com> <20160915193405.26943-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Sep 2016 09:08:25 +0200
Message-ID: <CAMuHMdU6DKuxYUKNV_-FyczV-pPFpTLso=5HruWgNiXNOenVRQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: r7s72100: add mmcif to device tree
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Thu, Sep 15, 2016 at 9:34 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  arch/arm/boot/dts/r7s72100.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index e18d4e6..4054db3 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -450,4 +450,15 @@
>                 #size-cells = <0>;
>                 status = "disabled";
>         };
> +
> +       mmcif: mmc@e804c800 {
> +               compatible = "renesas,mmcif-r7s72100", "renesas,sh-mmcif";
> +               reg = <0xe804c800 0x80>;
> +               interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH
> +                             GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;

The bindings do not say anything about interrupts (hence that should be
added).
The driver handles either 1 combined or 2 separate interrupts.
The datasheet says MMC has 3 interrupt requests, though?

> +               clocks = <&mstp8_clks R7S72100_CLK_MMCIF>;
> +               reg-io-width = <4>;
> +               bus-width = <8>;
> +               status = "disabled";
> +       };
>  };

The rest looks OK to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
