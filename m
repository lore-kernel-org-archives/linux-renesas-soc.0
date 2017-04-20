Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33771 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S939146AbdDTR0S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 13:26:18 -0400
Received: by mail-io0-f195.google.com with SMTP id k87so18521594ioi.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Apr 2017 10:26:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170420154413.357-1-marek.vasut+renesas@gmail.com>
References: <20170420154413.357-1-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Apr 2017 19:26:16 +0200
Message-ID: <CAMuHMdV952Gfap_52exZJZQ-BHjC5ZsRXT8MCAfvY7duYG9MoQ@mail.gmail.com>
Subject: Re: [PATCH V2] ARM: dts: r8a7791: Add GyroADC clock and device node
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Thu, Apr 20, 2017 at 5:44 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> Add node for the GyroADC block and it's associated clock.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> To: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Drop the _clk suffix for ADC clock

You mean, drop the whole ADC clock? ;-)

>     - Drop if "if" clk
> ---
>  arch/arm/boot/dts/r8a7791.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
> index 4d0c2ce59900..c5f3efc63861 100644
> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
> @@ -776,6 +776,15 @@
>                 status = "disabled";
>         };
>
> +       adc: adc@e6e54000 {
> +               compatible = "renesas,r8a7791-gyroadc", "renesas,rcar-gyroadc";
> +               reg = <0 0xe6e54000 0 64>;
> +               clocks = <&mstp9_clks R8A7791_CLK_GYROADC>;
> +               clock-names = "fck";
> +               power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
> +               status = "disabled";
> +       };
> +
>         scif2: serial@e6e58000 {
>                 compatible = "renesas,scif-r8a7791", "renesas,rcar-gen2-scif",
>                              "renesas,scif";
> @@ -1432,6 +1441,7 @@
>                                  <&hp_clk>, <&hp_clk>;

Missing addition of the parent clock for the newly added module clock,
which is presumably <&p_clk> (sorry, wrote cp_clk before).

What freaky frequency does your GyroADC use? :-)

>                         #clock-cells = <1>;
>                         clock-indices = <
> +                               R8A7791_CLK_GYROADC
>                                 R8A7791_CLK_GPIO7 R8A7791_CLK_GPIO6 R8A7791_CLK_GPIO5 R8A7791_CLK_GPIO4
>                                 R8A7791_CLK_GPIO3 R8A7791_CLK_GPIO2 R8A7791_CLK_GPIO1 R8A7791_CLK_GPIO0
>                                 R8A7791_CLK_RCAN1 R8A7791_CLK_RCAN0 R8A7791_CLK_QSPI_MOD R8A7791_CLK_I2C5
> @@ -1439,6 +1449,7 @@
>                                 R8A7791_CLK_I2C1 R8A7791_CLK_I2C0
>                         >;
>                         clock-output-names =
> +                               "gyroadc",
>                                 "gpio7", "gpio6", "gpio5", "gpio4", "gpio3", "gpio2", "gpio1", "gpio0",
>                                 "rcan1", "rcan0", "qspi_mod", "i2c5", "i2c6", "i2c4", "i2c3", "i2c2",
>                                 "i2c1", "i2c0";

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
