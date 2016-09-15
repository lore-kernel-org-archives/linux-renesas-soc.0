Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36139 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752633AbcIOSzp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Sep 2016 14:55:45 -0400
Received: by mail-io0-f195.google.com with SMTP id z135so65785ioe.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Sep 2016 11:55:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160914164716.31512-3-ulrich.hecht+renesas@gmail.com>
References: <20160914164716.31512-1-ulrich.hecht+renesas@gmail.com> <20160914164716.31512-3-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Sep 2016 20:55:44 +0200
Message-ID: <CAMuHMdXZR3Af5mtrjuGzVwAxDHtOGsv3UizFt3GeEHmM_obtwg@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: sh-pfc: r8a7796: Add HSCIF pins, groups, and functions
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Wed, Sep 14, 2016 at 6:47 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 255 +++++++++++++++++++++++++++++++++++
>  1 file changed, 255 insertions(+)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> index 42db745..607adf7 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> @@ -1490,6 +1490,191 @@ static const struct sh_pfc_pin pinmux_pins[] = {

> +/* - HSCIF2 ----------------------------------------------------------------- */
> +static const unsigned int hscif2_data_a_pins[] = {
> +       /* RX, TX */
> +       RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9),
> +};
> +static const unsigned int hscif2_data_a_mux[] = {
> +       HRX2_A_MARK, HTX2_A_MARK,
> +};
> +static const unsigned int hscif2_clk_a_pins[] = {
> +       /* SCK */
> +       RCAR_GP_PIN(6, 10),
> +};
> +static const unsigned int hscif2_clk_a_mux[] = {
> +       HSCK2_A_MARK,
> +};
> +static const unsigned int hscif2_ctrl_a_pins[] = {
> +       /* RTS, CTS */
> +       RCAR_GP_PIN(6, 7), RCAR_GP_PIN(6, 6),
> +};
> +static const unsigned int hscif2_ctrl_a_mux[] = {
> +       HRTS2_N_A_MARK, HCTS2_N_A_MARK,
> +};
> +
> +static const unsigned int hscif2_data_b_pins[] = {
> +       /* RX, TX */
> +       RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 18),
> +};
> +static const unsigned int hscif2_data_b_mux[] = {
> +       HRX2_B_MARK, HTX2_B_MARK,
> +};
> +static const unsigned int hscif2_clk_b_pins[] = {
> +       /* SCK */
> +       RCAR_GP_PIN(6, 21),
> +};
> +static const unsigned int hscif2_clk_b_mux[] = {
> +       HSCK1_B_MARK,
> +};
> +static const unsigned int hscif2_ctrl_b_pins[] = {
> +       /* RTS, CTS */
> +       RCAR_GP_PIN(6, 20), RCAR_GP_PIN(6, 19),
> +};
> +static const unsigned int hscif2_ctrl_b_mux[] = {
> +       HRTS2_N_B_MARK, HCTS2_N_B_MARK,
> +};

You forgot to add group C for HSCIF2, which does not exist on H3.

The rest looks OK to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
