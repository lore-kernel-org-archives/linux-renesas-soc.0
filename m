Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f196.google.com ([209.85.221.196]:37865 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbeKHWGw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 17:06:52 -0500
MIME-Version: 1.0
References: <1541500533-21843-1-git-send-email-jacopo+renesas@jmondi.org> <1541500533-21843-4-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1541500533-21843-4-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Nov 2018 13:31:23 +0100
Message-ID: <CAMuHMdWPqT7QyQsKx7bOYBv02ZYY19F7J6XTVmGBALVkLpJkuw@mail.gmail.com>
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

On Tue, Nov 6, 2018 at 11:35 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> The VIN4 and VIN5 interfaces supports parallel video input.
> Add pin, mux and functions definitions for VIN4 and VIN5 for R-Car M3-N.
>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c

Oops, found two more...

> +/* - VIN5 ------------------------------------------------------------------- */
> +static const union vin_data vin5_data_pins = {

union vin_data16

> +       .data16 = {
> +               RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
> +               RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
> +               RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
> +               RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
> +               RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
> +               RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
> +               RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> +               RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> +       },
> +};
> +
> +static const union vin_data vin5_data_mux = {

union vin_data16

> +       .data16 = {
> +               VI5_DATA0_MARK, VI5_DATA1_MARK,
> +               VI5_DATA2_MARK, VI5_DATA3_MARK,
> +               VI5_DATA4_MARK, VI5_DATA5_MARK,
> +               VI5_DATA6_MARK, VI5_DATA7_MARK,
> +               VI5_DATA8_MARK,  VI5_DATA9_MARK,
> +               VI5_DATA10_MARK, VI5_DATA11_MARK,
> +               VI5_DATA12_MARK, VI5_DATA13_MARK,
> +               VI5_DATA14_MARK, VI5_DATA15_MARK,
> +       },
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
