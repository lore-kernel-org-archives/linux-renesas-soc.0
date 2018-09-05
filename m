Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:32871 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbeIEP5J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Sep 2018 11:57:09 -0400
MIME-Version: 1.0
References: <20180121121243.2038-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180121121243.2038-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Sep 2018 13:27:08 +0200
Message-ID: <CAMuHMdWfV7aqJz++OGcrJQw=yV0eK=4VEFkasvdS0PJe+qrGvw@mail.gmail.com>
Subject: Re: [PATCH V2 RESEND] gpio: of: make example syntactically correct
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

CC LinusW

On Sun, Jan 21, 2018 at 1:12 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The ';' was missing. And cosmetic: there was a space too much.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>
> No changes since V2, only Niklas' tag added.
>
> Changes since V1:
> * removed extra spaces (Thanks Sergei!)
>
>  Documentation/devicetree/bindings/gpio/gpio.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index b5de08e3b1a2f1..91d33f75dd0e4d 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -33,12 +33,12 @@ The following example could be used to describe GPIO pins used as device enable
>  and bit-banged data signals:
>
>         gpio1: gpio1 {
> -               gpio-controller
> -                #gpio-cells = <2>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
>         };
>         gpio2: gpio2 {
> -               gpio-controller
> -                #gpio-cells = <1>;
> +               gpio-controller;
> +               #gpio-cells = <1>;
>         };
>         [...]
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
