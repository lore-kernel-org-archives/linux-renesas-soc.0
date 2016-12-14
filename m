Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33051 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932243AbcLNNEe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Dec 2016 08:04:34 -0500
Received: by mail-io0-f195.google.com with SMTP id p13so4751372ioi.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Dec 2016 05:04:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1481633026-19333-1-git-send-email-jacopo@jmondi.org>
References: <1481042071-18659-1-git-send-email-jacopo@jmondi.org> <1481633026-19333-1-git-send-email-jacopo@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Dec 2016 14:04:32 +0100
Message-ID: <CAMuHMdWUy-cwCo5LxeC_cxwnVXtgEoxBau2kexeS0-v4R4yd8w@mail.gmail.com>
Subject: Re: [RFCv2] dts: arm: renesas: koelsh: Add MAX11100 device
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 13, 2016 at 1:43 PM, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
> index 5405d33..1756b86 100644
> --- a/arch/arm/boot/dts/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/r8a7791-koelsch.dts

> +       spi_gpio: spi-gpio@0 {
> +               compatible = "spi-gpio";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-sck = <&gpio5 27 GPIO_ACTIVE_HIGH>;
> +               gpio-miso = <&gpio5 25 GPIO_ACTIVE_HIGH>;
> +               num-chipselects = <1>;
> +               cs-gpios = <&gpio5 26 GPIO_ACTIVE_LOW>;
> +               status = "okay";
> +
> +               adc0: max11100@0 {

The node name should be a generic name, the label should be the specific name.
I.e. "max11100: adc@0"

> +                       compatible = "maxim,max11100";
> +                       reg = <0>;
> +                       spi-max-frequency = <2500000>;
> +                       vref-supply = <&vref_adc0>;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
