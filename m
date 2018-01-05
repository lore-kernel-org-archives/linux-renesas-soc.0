Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:44776 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751539AbeAEUSE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jan 2018 15:18:04 -0500
MIME-Version: 1.0
In-Reply-To: <20180105184609.24106-2-chris.brandt@renesas.com>
References: <20180105184609.24106-1-chris.brandt@renesas.com> <20180105184609.24106-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jan 2018 21:18:03 +0100
Message-ID: <CAMuHMdV5KcRAJDw2eTMET2rpJoGD47YTfSXq-CEH_j+44Z+Byw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: renesas_usbhs: Add support for RZ/A1
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Fri, Jan 5, 2018 at 7:46 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> This patch adds the capability to support RZ/A1 SoCs.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> index c5289b3ecf8d..2abefd3d6050 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c

> @@ -480,6 +481,10 @@ static const struct of_device_id usbhs_of_match[] = {
>                 .compatible = "renesas,usbhs-r8a77995",
>                 .data = (void *)USBHS_TYPE_RCAR_GEN3_WITH_PLL,
>         },
> +       {
> +               .compatible = "renesas,usbhs-r7s72100",
> +               .data = (void *)USBHS_TYPE_RZA1,
> +       },

I think it suffices to drop the part above...

>         {
>                 .compatible = "renesas,rcar-gen2-usbhs",
>                 .data = (void *)USBHS_TYPE_RCAR_GEN2,
> @@ -488,6 +493,10 @@ static const struct of_device_id usbhs_of_match[] = {
>                 .compatible = "renesas,rcar-gen3-usbhs",
>                 .data = (void *)USBHS_TYPE_RCAR_GEN3,
>         },
> +       {
> +               .compatible = "renesas,rza1-usbhs",
> +               .data = (void *)USBHS_TYPE_RZA1,
> +       },

... and just let the driver match against the generic compatible value.
But then you have to add "renesas,rza1-usbhs" to the DTS, too.

> --- /dev/null
> +++ b/drivers/usb/renesas_usbhs/rza.c
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: GPL-1.0+

Not GPL-2.0?

> +++ b/drivers/usb/renesas_usbhs/rza.h
> @@ -0,0 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0

like here?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
