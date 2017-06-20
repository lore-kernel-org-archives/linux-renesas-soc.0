Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33046 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751083AbdFTHUE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jun 2017 03:20:04 -0400
Received: by mail-io0-f194.google.com with SMTP id j200so13811254ioe.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jun 2017 00:20:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1497891889-8038-2-git-send-email-jacopo+renesas@jmondi.org>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org> <1497891889-8038-2-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jun 2017 09:20:02 +0200
Message-ID: <CAMuHMdWk6iYR-dP3Kva8-__XQmQ7Bdg0YF3F_U8ciCMnNQma4g@mail.gmail.com>
Subject: Re: [PATCH v1 01/12] arm64: boot: dts: salvator-x: Add camera module
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Mon, Jun 19, 2017 at 7:04 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add camera module to Salvator-X M3W device tree.
> The camera module sits on a i2c-gpio interface and it connected to VIN

is connected

> channel #4 parallel video input port.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> index ca4eb98..41c94c3 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> @@ -103,6 +103,41 @@
>                 states = <3300000 1
>                           1800000 0>;
>         };
> +
> +       camera_module {
> +               compatible = "i2c-gpio";
> +               gpios = <&gpio1 9 GPIO_ACTIVE_HIGH
> +                        &gpio1 11 GPIO_ACTIVE_HIGH
> +                       >;
> +
> +               i2c-gpio,delay-us = <4>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               mclk: xclk {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <1>;
> +                       clock-frequency  = <27000000>;
> +                       clock-output-names = "mclk";

Please the drop clock-output-names for clock with a single output, as it is
deprecated.  The clock name will then be taken from the node name, so you
may want to adjust that.

> +               };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
