Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:37130 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbeJBQID (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Oct 2018 12:08:03 -0400
Received: by mail-vs1-f65.google.com with SMTP id w8-v6so671501vsl.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Oct 2018 02:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org> <1536161385-25562-6-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1536161385-25562-6-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Oct 2018 11:25:31 +0200
Message-ID: <CAMuHMdV1NKag-1KWFuWwgxgj+HDG-kB0F7L-WDVM+1E4-RncRw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] pinctrl: sh-pfc: r8a77990: Add VIN pins, groups
 and functions
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <damm+renesas@opensource.se>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Wed, Sep 5, 2018 at 5:30 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> This patch adds VIN{4,5} pins, groups and functions to the R8A77990 SoC.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for your patch!

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c

> +/* - VIN5 ------------------------------------------------------------------- */
> +static const union vin_data vin5_data_a_pins = {
> +       .data16 = {

Please note that union vin_data has space for 24 entries, so the last 8
are unused.  We have several other drivers doing this, though, also
for .data12, and it is still a win, compared to duplicating the arrays.
We might want to introduce vin_data16 and vin_data12 unions in the
future, to avoid the unused entries. But for now, this is fine.

> +               RCAR_GP_PIN(1, 1),  RCAR_GP_PIN(1, 2),
> +               RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 12),
> +               RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
> +               RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
> +               RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
> +               RCAR_GP_PIN(0, 9),  RCAR_GP_PIN(0, 11),
> +               RCAR_GP_PIN(0, 8),  RCAR_GP_PIN(0, 10),
> +               RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 3),
> +       },
> +};

> +static const union vin_data vin5_data_b_pins = {
> +       .data8 = {

This one...

> +               RCAR_GP_PIN(2, 23), RCAR_GP_PIN(0, 4),
> +               RCAR_GP_PIN(0, 7),  RCAR_GP_PIN(0, 12),
> +               RCAR_GP_PIN(0, 13), RCAR_GP_PIN(0, 14),
> +               RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 17),
> +       },
> +};
> +
> +static const union vin_data vin5_data_b_mux = {
> +       .data8 = {

... and this one are definitely a loss, as there are 16 unused entries, and
you don't use or need the union feature...

> +               VI5_DATA0_B_MARK,  VI5_DATA1_B_MARK,
> +               VI5_DATA2_B_MARK,  VI5_DATA3_B_MARK,
> +               VI5_DATA4_B_MARK,  VI5_DATA5_B_MARK,
> +               VI5_DATA6_B_MARK,  VI5_DATA7_B_MARK,
> +       },
> +};

> @@ -1889,6 +2077,32 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>         SH_PFC_PIN_GROUP(usb0_id),
>         SH_PFC_PIN_GROUP(usb30),
>         SH_PFC_PIN_GROUP(usb30_id),
> +       VIN_DATA_PIN_GROUP(vin4_data_a, 8),
> +       VIN_DATA_PIN_GROUP(vin4_data_a, 10),
> +       VIN_DATA_PIN_GROUP(vin4_data_a, 12),
> +       VIN_DATA_PIN_GROUP(vin4_data_a, 16),
> +       VIN_DATA_PIN_GROUP(vin4_data_a, 20),
> +       VIN_DATA_PIN_GROUP(vin4_data_a, 24),
> +       VIN_DATA_PIN_GROUP(vin4_data_b, 8),
> +       VIN_DATA_PIN_GROUP(vin4_data_b, 10),
> +       VIN_DATA_PIN_GROUP(vin4_data_b, 12),
> +       VIN_DATA_PIN_GROUP(vin4_data_b, 16),
> +       VIN_DATA_PIN_GROUP(vin4_data_b, 20),
> +       VIN_DATA_PIN_GROUP(vin4_data_b, 24),
> +       SH_PFC_PIN_GROUP(vin4_sync),
> +       SH_PFC_PIN_GROUP(vin4_field),
> +       SH_PFC_PIN_GROUP(vin4_clkenb),
> +       SH_PFC_PIN_GROUP(vin4_clk),
> +       VIN_DATA_PIN_GROUP(vin5_data_a, 8),
> +       VIN_DATA_PIN_GROUP(vin5_data_a, 10),
> +       VIN_DATA_PIN_GROUP(vin5_data_a, 12),
> +       VIN_DATA_PIN_GROUP(vin5_data_a, 16),
> +       VIN_DATA_PIN_GROUP(vin5_data_b, 8),

... here. So please revert the union change for this group.

> +       SH_PFC_PIN_GROUP(vin5_sync_a),
> +       SH_PFC_PIN_GROUP(vin5_field_a),
> +       SH_PFC_PIN_GROUP(vin5_clkenb_a),
> +       SH_PFC_PIN_GROUP(vin5_clk_a),
> +       SH_PFC_PIN_GROUP(vin5_clk_b),
>  };
>
>  static const char * const avb_groups[] = {
> @@ -1996,6 +2210,40 @@ static const char * const usb30_groups[] = {
>         "usb30_id",
>  };
>
> +static const char * const vin4_groups[] = {
> +       "vin4_data8_a",
> +       "vin4_data10_a",
> +       "vin4_data12_a",
> +       "vin4_data16_a",
> +       "vin4_data20_a",
> +       "vin4_data24_a",
> +       "vin4_data8_b",
> +       "vin4_data10_b",
> +       "vin4_data12_b",
> +       "vin4_data16_b",
> +       "vin4_data20_b",
> +       "vin4_data24_b",
> +       "vin4_data8_sft8",

You dropped the sft8 pins, but forgot to remove the sft8 group name.

> +       "vin4_sync",
> +       "vin4_field",
> +       "vin4_clkenb",
> +       "vin4_clk",
> +};
> +
> +static const char * const vin5_groups[] = {
> +       "vin5_data8_a",
> +       "vin5_data8_sft8_a",

Likewise.

> +       "vin5_data10_a",
> +       "vin5_data12_a",
> +       "vin5_data16_a",
> +       "vin5_data8_b",
> +       "vin5_sync_a",
> +       "vin5_field_a",
> +       "vin5_clkenb_a",
> +       "vin5_clk_a",
> +       "vin5_clk_b",
> +};

The rest looks OK to me, and matches the datasheet clarification.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
