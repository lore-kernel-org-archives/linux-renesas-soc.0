Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:43729 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727623AbeKFAuv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 19:50:51 -0500
Received: by mail-vs1-f67.google.com with SMTP id k14so5313515vsm.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Nov 2018 07:30:37 -0800 (PST)
MIME-Version: 1.0
References: <1540071055-27181-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1540071055-27181-1-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Nov 2018 16:30:24 +0100
Message-ID: <CAMuHMdXLS8k8z1EUUujnnvBi+Yp8X0aPmOK3hdQdVQFhPnS3OQ@mail.gmail.com>
Subject: Re: [PATCH/RFT] pinctrl: sh-pfc: r8a77990: Add HSCIF pins, groups,
 and functions
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kaneko-san,

On Sat, Oct 20, 2018 at 11:31 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds HSCIF{0,1,2,3,4} pins, groups and functions to
> the R8A77990 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Thanks for your patch!

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c

> +static const unsigned int hscif3_data_d_pins[] = {
> +       /* RX, TX */
> +       RCAR_GP_PIN(1, 3), RCAR_GP_PIN(1, 0),

These two pins are exchanged.
According to the datasheet, it should be:

        RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 3),

> +};
> +
> +static const unsigned int hscif3_data_d_mux[] = {
> +       HRX3_D_MARK, HTX3_D_MARK,
> +};

> @@ -2454,6 +2738,37 @@ enum {
>                 SH_PFC_PIN_GROUP(du_disp_cde),
>                 SH_PFC_PIN_GROUP(du_cde),
>                 SH_PFC_PIN_GROUP(du_disp),
> +               SH_PFC_PIN_GROUP(hscif0_data_a),
> +               SH_PFC_PIN_GROUP(hscif0_clk_a),
> +               SH_PFC_PIN_GROUP(hscif0_ctrl_a),
> +               SH_PFC_PIN_GROUP(hscif0_data_b),
> +               SH_PFC_PIN_GROUP(hscif0_clk_b),
> +               SH_PFC_PIN_GROUP(hscif1_data_a),
> +               SH_PFC_PIN_GROUP(hscif1_clk_a),
> +               SH_PFC_PIN_GROUP(hscif1_data_b),
> +               SH_PFC_PIN_GROUP(hscif1_clk_b),
> +               SH_PFC_PIN_GROUP(hscif1_ctrl_b),
> +               SH_PFC_PIN_GROUP(hscif2_data_a),
> +               SH_PFC_PIN_GROUP(hscif2_clk_a),
> +               SH_PFC_PIN_GROUP(hscif2_ctrl_a),
> +               SH_PFC_PIN_GROUP(hscif2_data_b),
> +               SH_PFC_PIN_GROUP(hscif3_data_a),
> +               SH_PFC_PIN_GROUP(hscif3_data_b),
> +               SH_PFC_PIN_GROUP(hscif3_clk_b),
> +               SH_PFC_PIN_GROUP(hscif3_data_c),
> +               SH_PFC_PIN_GROUP(hscif3_clk_c),
> +               SH_PFC_PIN_GROUP(hscif3_ctrl_c),
> +               SH_PFC_PIN_GROUP(hscif3_data_d),
> +               SH_PFC_PIN_GROUP(hscif3_data_e),
> +               SH_PFC_PIN_GROUP(hscif3_ctrl_e),
> +               SH_PFC_PIN_GROUP(hscif4_data_a),
> +               SH_PFC_PIN_GROUP(hscif4_clk_a),
> +               SH_PFC_PIN_GROUP(hscif4_ctrl_a),
> +               SH_PFC_PIN_GROUP(hscif4_data_b),
> +               SH_PFC_PIN_GROUP(hscif4_clk_b),
> +               SH_PFC_PIN_GROUP(hscif4_data_c),
> +               SH_PFC_PIN_GROUP(hscif4_data_d),
> +               SH_PFC_PIN_GROUP(hscif4_data_e),
>                 SH_PFC_PIN_GROUP(i2c1_a),
>                 SH_PFC_PIN_GROUP(i2c1_b),
>                 SH_PFC_PIN_GROUP(i2c1_c),

The above doesn't compile, as you forgot to update the size of the
pinmux_groups.common[] array.

> @@ -2781,6 +3142,11 @@ enum {
>         .common = {
>                 SH_PFC_FUNCTION(avb),
>                 SH_PFC_FUNCTION(du),
> +               SH_PFC_FUNCTION(hscif0),
> +               SH_PFC_FUNCTION(hscif1),
> +               SH_PFC_FUNCTION(hscif2),
> +               SH_PFC_FUNCTION(hscif3),
> +               SH_PFC_FUNCTION(hscif4),
>                 SH_PFC_FUNCTION(i2c1),
>                 SH_PFC_FUNCTION(i2c2),
>                 SH_PFC_FUNCTION(i2c4),

The above doesn't compile, as you forgot to update the size of the
pinmux_functions.common[] array.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
