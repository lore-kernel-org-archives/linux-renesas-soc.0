Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:32903 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752243AbcLGIke (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Dec 2016 03:40:34 -0500
Received: by mail-io0-f194.google.com with SMTP id j92so12306449ioi.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Dec 2016 00:40:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1481042071-18659-1-git-send-email-jacopo@jmondi.org>
References: <1481042071-18659-1-git-send-email-jacopo@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Dec 2016 09:40:33 +0100
Message-ID: <CAMuHMdUBHtaLE9WobEobiVgtYk-_wx-DLff5=nqfur34q2nd9A@mail.gmail.com>
Subject: Re: [RFC] dts: arm: renesas: koelsh: Add MAX11100 device
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Tue, Dec 6, 2016 at 5:34 PM, Jacopo Mondi <jacopo@jmondi.org> wrote:
> Add node to test MAX11100 ADC with LED28 connected to the chip input
> line.

What does the name "LED28" refer to?

> The ADC sits on a gpio-spi master.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>
> Sending as RFC only, not for inclusion.
> Used to test MAX11100 ADC driver currently connected to Koelsch GPIO
> expander.
> Adding LED28 as ADC input line.
>
> ---
>  arch/arm/boot/dts/r8a7791-koelsch.dts | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
> index 5405d33..ac8f10d 100644
> --- a/arch/arm/boot/dts/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
> @@ -170,6 +170,27 @@
>                         gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
>                         label = "LED8";
>                 };
> +               led28 {
> +                       gpios = <&gpio5 28 GPIO_ACTIVE_HIGH>;
> +                       label = "LED28";
> +               };
> +       };
> +
> +       spi_gpio: spi-gpio {
> +               compatible = "spi-gpio";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-sck = <&gpio5 27 GPIO_ACTIVE_HIGH>;
> +               gpio-miso = <&gpio5 25 GPIO_ACTIVE_HIGH>;
> +               num-chipselects = <1>;
> +               cs-gpios = <&gpio5 26 GPIO_ACTIVE_LOW>;

I would keep all gpios together.

> +               status = "okay";
> +
> +               spi@0 {

adc@0

> +                       compatible = "maxim,max11100";
> +                       reg = <0>;
> +                       spi-max-frequency = <2500000>;
> +               };
>         };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
