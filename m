Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:35237 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753578AbcLBTXe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2016 14:23:34 -0500
Received: by mail-io0-f196.google.com with SMTP id h133so1660954ioe.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Dec 2016 11:23:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1480693434-9415-3-git-send-email-jacopo@jmondi.org>
References: <1480693434-9415-1-git-send-email-jacopo@jmondi.org> <1480693434-9415-3-git-send-email-jacopo@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Dec 2016 20:23:33 +0100
Message-ID: <CAMuHMdU8mvXkhaUJJKu7KPxHsjt4k4Z3MreFiwRggGV0NkamyA@mail.gmail.com>
Subject: Re: [RFC 2/3] dts: arm: genmai: Add MAXDESREF4x spidev
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Fri, Dec 2, 2016 at 4:43 PM, Jacopo Mondi <jacopo@jmondi.org> wrote:
> Add device node for the MAX11100 evaluation board connected to Genmai's
> CN2.
> The evaluation kit is connected to 4 GPIO lines configured ad bitbanged

3 GPIO lines?

configured as

> SPI master interface
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  arch/arm/boot/dts/r7s72100-genmai.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
> index 233908b..89a1977 100644
> --- a/arch/arm/boot/dts/r7s72100-genmai.dts
> +++ b/arch/arm/boot/dts/r7s72100-genmai.dts
> @@ -46,6 +46,24 @@
>                 };
>         };
>
> +       spi-gpio {
> +               compatible = "spi-gpio";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               pinctrl-names = "default";

Why do you need pinctrl-names?
You have no pinctrl configuration.

> +
> +               gpio-miso = <&port11 10 GPIO_ACTIVE_HIGH>;
> +               gpio-sck = <&port11  9 GPIO_ACTIVE_HIGH>;
> +               num-chipselects = <1>;
> +               cs-gpios = <&port11 11 GPIO_ACTIVE_HIGH>;
> +               status = "ok";
> +
> +               maxrefdes4x {

Missing unit address "@0"

> +                       compatible = "linux,spidev";

These days you should use "maxim,max11100", and at that compatible
value to drivers/spi/spidev.c

> +                       reg = <0>;
> +                       spi-max-frequency = <240000>;
> +               };
> +       };
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
