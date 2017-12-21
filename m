Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:36434 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752700AbdLUMZp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 07:25:45 -0500
Received: by mail-qk0-f193.google.com with SMTP id 8so30621307qkj.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Dec 2017 04:25:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171221115423.13591-1-wsa+renesas@sang-engineering.com>
References: <20171221115423.13591-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Dec 2017 13:25:44 +0100
Message-ID: <CAMuHMdVau_wMd8aNVD9+fEsbMoozQxvOvjhoXKziMgh8Q3EcOQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: add GPIO extender
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Thu, Dec 21, 2017 at 12:54 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We need to configure its GPIOs later.

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -338,6 +338,11 @@
>  &i2c4 {
>         status = "okay";
>
> +       pca9654: gpio@20 {
> +               compatible = "onsemi,pca9654";
> +               reg = <0x20>;

Missing gpio-controller, #gpio-cells, and interrupts properties?

Seems like Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
can use some updates...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
