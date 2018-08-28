Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:34317 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbeH1MC4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 08:02:56 -0400
Received: by mail-vk0-f66.google.com with SMTP id l143-v6so353654vke.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Aug 2018 01:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <1534511921-19470-1-git-send-email-uli+renesas@fpond.eu> <1534511921-19470-2-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1534511921-19470-2-git-send-email-uli+renesas@fpond.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Aug 2018 10:12:15 +0200
Message-ID: <CAMuHMdXCjhRm=K0MKxwg=o0EEUbJTksJXeL-RQJ5X0vzT_eDyg@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: sh-pfc: r8a7795: Add I2C{0,3,5} pins, groups
 and functions
To: uli+renesas@fpond.eu
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Fri, Aug 17, 2018 at 3:19 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds I2C{0,3,5} pins, groups and functions to the R8A7795 SoC.
>
> These pins are physically muxed with other pins. Therefore, setup of
> MOD_SEL is needed for exclusive control with other pins.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for your patch!

All comments below apply to all three patches.

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c

> @@ -578,11 +581,18 @@ enum {
>         PINMUX_IPSR
>         PINMUX_MOD_SELS
>         PINMUX_STATIC
> +       PINMUX_PHYS
>         PINMUX_MARK_END,
>  #undef F_
>  #undef FM
>  };
>
> +#define PINMUX_IPSR_MSEL2(ipsr, fn, msel1, msel2) \
> +       PINMUX_DATA(fn##_MARK, FN_##msel1, FN_##msel2, FN_##fn, FN_##ipsr)
> +
> +#define PINMUX_IPSR_PHYS(ipsr, fn, msel) \
> +       PINMUX_DATA(fn##_MARK, FN_##msel)

Please move the two definitions above to drivers/pinctrl/sh-pfc/sh_pfc.h,
so they can be shared, and add comments.

> @@ -4261,9 +4302,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>         SH_PFC_PIN_GROUP(hscif4_clk),
>         SH_PFC_PIN_GROUP(hscif4_ctrl),
>         SH_PFC_PIN_GROUP(hscif4_data_b),
> +       SH_PFC_PIN_GROUP(i2c0),
>         SH_PFC_PIN_GROUP(i2c1_a),
>         SH_PFC_PIN_GROUP(i2c1_b),
>         SH_PFC_PIN_GROUP(i2c2_a),
> +       SH_PFC_PIN_GROUP(i2c3),
> +       SH_PFC_PIN_GROUP(i2c5),

Please move the above two lines down, to preserve sort order.

>         SH_PFC_PIN_GROUP(i2c2_b),
>         SH_PFC_PIN_GROUP(i2c6_a),
>         SH_PFC_PIN_GROUP(i2c6_b),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
