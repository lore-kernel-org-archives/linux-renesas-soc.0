Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38355 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbeKHV5d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 16:57:33 -0500
MIME-Version: 1.0
References: <1541500533-21843-1-git-send-email-jacopo+renesas@jmondi.org> <1541500533-21843-4-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1541500533-21843-4-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Nov 2018 13:22:06 +0100
Message-ID: <CAMuHMdWYV3avN==bSn9K-JS3fHjssijf9nhJQK4spgf2HvMRPA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pinctrl: sh-pfc: r8a77965: Add VIN[4|5] groups/functions
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Tue, Nov 6, 2018 at 11:35 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> The VIN4 and VIN5 interfaces supports parallel video input.
> Add pin, mux and functions definitions for VIN4 and VIN5 for R-Car M3-N.
>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for your patch!

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c

> @@ -4000,6 +4210,24 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>         SH_PFC_PIN_GROUP(usb0),
>         SH_PFC_PIN_GROUP(usb1),
>         SH_PFC_PIN_GROUP(usb30),
> +       VIN_DATA_PIN_GROUP(vin4_data, 8, _a),
> +       VIN_DATA_PIN_GROUP(vin4_data, 16, _a),
> +       SH_PFC_PIN_GROUP(vin4_data18_a),
> +       VIN_DATA_PIN_GROUP(vin4_data, 24, _a),
> +       VIN_DATA_PIN_GROUP(vin4_data, 8, _b),
> +       VIN_DATA_PIN_GROUP(vin4_data, 16, _b),
> +       SH_PFC_PIN_GROUP(vin4_data18_b),
> +       VIN_DATA_PIN_GROUP(vin4_data, 24, _b),

Missing support for 10/12/20?

> +       SH_PFC_PIN_GROUP(vin4_sync),
> +       SH_PFC_PIN_GROUP(vin4_field),
> +       SH_PFC_PIN_GROUP(vin4_clkenb),
> +       SH_PFC_PIN_GROUP(vin4_clk),
> +       VIN_DATA_PIN_GROUP(vin5_data, 8),
> +       VIN_DATA_PIN_GROUP(vin5_data, 16),

Missing support for 10/12?

> +       SH_PFC_PIN_GROUP(vin5_sync),
> +       SH_PFC_PIN_GROUP(vin5_field),
> +       SH_PFC_PIN_GROUP(vin5_clkenb),
> +       SH_PFC_PIN_GROUP(vin5_clk),
>  };
>
>  static const char * const audio_clk_groups[] = {
> @@ -4392,6 +4620,30 @@ static const char * const usb30_groups[] = {
>         "usb30",
>  };
>
> +static const char * const vin4_groups[] = {
> +       "vin4_data8_a",
> +       "vin4_data16_a",
> +       "vin4_data18_a",
> +       "vin4_data24_a",
> +       "vin4_data8_b",
> +       "vin4_data16_b",
> +       "vin4_data18_b",
> +       "vin4_data24_b",

Missing support for 10/12/20?

> +       "vin4_sync",
> +       "vin4_field",
> +       "vin4_clkenb",
> +       "vin4_clk",
> +};
> +
> +static const char * const vin5_groups[] = {
> +       "vin5_data8",
> +       "vin5_data16",

Missing support for 10/12?

> +       "vin5_sync",
> +       "vin5_field",
> +       "vin5_clkenb",
> +       "vin5_clk",
> +};

With the above fixed:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
