Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34882 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756241AbcIAVDq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 17:03:46 -0400
MIME-Version: 1.0
In-Reply-To: <20160901155430.23400-2-chris.brandt@renesas.com>
References: <20160901155430.23400-1-chris.brandt@renesas.com> <20160901155430.23400-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Sep 2016 22:50:12 +0200
Message-ID: <CAMuHMdWXB23w98Xaz+HnrKpgL_zYMj7YntauFUEvuDjTYLwm5Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: r7s72100: add ethernet to device tree
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 1, 2016 at 5:54 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

But...

> ---"
>  arch/arm/boot/dts/r7s72100.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index e8e2a5d7..fb9ef9c 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -108,6 +108,15 @@
>                         clock-output-names = "scif0", "scif1", "scif2", "scif3", "scif4", "scif5", "scif6", "scif7";
>                 };
>
> +               mstp7_clks: mstp7_clks@fcfe0430 {
> +                       #clock-cells = <1>;
> +                       compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
> +                       reg = <0xfcfe0430 4>;
> +                       clocks = <&p0_clk>;
> +                       clock-indices = <R7S72100_CLK_ETHER>;
> +                       clock-output-names = "ether";
> +               };
> +

... please move this chunk to "[PATCH 1/3] ARM: dts: r7s72100: add ethernet
clock to device tree.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
