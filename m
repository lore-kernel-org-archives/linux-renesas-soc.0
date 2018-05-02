Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:39155 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750800AbeEBJQZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 05:16:25 -0400
MIME-Version: 1.0
In-Reply-To: <1525031296-16512-2-git-send-email-ykaneko0929@gmail.com>
References: <1525031296-16512-1-git-send-email-ykaneko0929@gmail.com> <1525031296-16512-2-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 May 2018 11:16:24 +0200
Message-ID: <CAMuHMdXx87yu-Q-9AghGr73ynSryXLBnrKATbTH7YiwD5v8WKA@mail.gmail.com>
Subject: Re: [PATCH/RFT 1/3] pinctrl: sh-pfc: r8a77965: Add SDHI pins, groups
 and functions
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: Linux MMC List <linux-mmc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kaneko-san,

On Sun, Apr 29, 2018 at 9:48 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds SDHI{0,1,2,3} pins, groups and functions to the R8A77965
> SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Thanks for your patch!

The pins, groups, and functions are correct, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>.
i.e. queuing in sh-pfc-for-v4.18, after fixing up the below.

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
> @@ -1923,6 +1923,264 @@ enum {
>         RCAR_GP_PIN(6, 24), RCAR_GP_PIN(6, 25),
>  };
>
> +/* - SDHI0 ------------------------------------------------------------------ */
> +static const unsigned int sdhi0_data1_pins[] = {

[...]

> +};

This doesn't belong in the middle of the usb0 section ;-)

> +
>  static const unsigned int usb0_mux[] = {
>         USB0_PWEN_MARK, USB0_OVC_MARK,
>  };
> @@ -1997,6 +2255,32 @@ enum {
>         SH_PFC_PIN_GROUP(usb0),
>         SH_PFC_PIN_GROUP(usb1),
>         SH_PFC_PIN_GROUP(usb30),
> +       SH_PFC_PIN_GROUP(sdhi0_data1),

Alphabetical order, please.

> @@ -2083,6 +2367,44 @@ enum {
>         "usb30",
>  };
>
> +static const char * const sdhi0_groups[] = {

Alphabetical order, please.

> @@ -2096,6 +2418,10 @@ enum {
>         SH_PFC_FUNCTION(usb0),
>         SH_PFC_FUNCTION(usb1),
>         SH_PFC_FUNCTION(usb30),
> +       SH_PFC_FUNCTION(sdhi0),
> +       SH_PFC_FUNCTION(sdhi1),
> +       SH_PFC_FUNCTION(sdhi2),
> +       SH_PFC_FUNCTION(sdhi3),
>  };

Alphabetical order, please.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
