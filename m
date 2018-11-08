Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38417 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbeKHUeC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 15:34:02 -0500
MIME-Version: 1.0
References: <1541500533-21843-1-git-send-email-jacopo+renesas@jmondi.org> <1541500533-21843-2-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1541500533-21843-2-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Nov 2018 11:58:54 +0100
Message-ID: <CAMuHMdUhdegwmWBbxqmtxM0d4bxRoa=FFpZsWOpSc_bky7SHDA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] pinctrl: sh-pfc: Add optional arg to VIN_DATA_PIN_GROUP
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

Thanks for your patch!

On Tue, Nov 6, 2018 at 11:35 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> VIN data groups may appear on different sets of pins, usually named
> "vinX_data_[a|b]". The existing VIN_DATA_PIN_GROUP() does not support
> appending the '_a' or '_b' suffix, leading to the definition of groups

group

> names not consistent with the ones defined using SH_PFC_PIN_GROUP() macro.

the SH_PFC_PIN_GROUP() macro.

>
> Fix this by adding making the VIN_DATA_PIN_GROUP macro a variadic one,

Please drop "adding".
VIN_DATA_PIN_GROUP()

> which accepts an optional 'version' argument.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -54,15 +54,16 @@ struct sh_pfc_pin_group {
>
>  /*
>   * Using union vin_data saves memory occupied by the VIN data pins.
> - * VIN_DATA_PIN_GROUP() is  a macro  used  to describe the VIN pin groups
> - * in this case.
> + * VIN_DATA_PIN_GROUP() is a macro used to describe the VIN pin groups
> + * in this case. It accepts an optional 'version' argument used when the
> + * same group can appear on a different set of pins.

Please rebase against sh-pfc-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
