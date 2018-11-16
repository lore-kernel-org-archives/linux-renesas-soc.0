Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:35245 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbeKPSyc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 13:54:32 -0500
Received: by mail-ua1-f67.google.com with SMTP id d2so3953016ual.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Nov 2018 00:43:10 -0800 (PST)
MIME-Version: 1.0
References: <1542352851-25393-1-git-send-email-uli+renesas@fpond.eu> <1542352851-25393-2-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1542352851-25393-2-git-send-email-uli+renesas@fpond.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Nov 2018 09:42:58 +0100
Message-ID: <CAMuHMdWK436=5cjzu7FneKYc7=Szo6z0gLtu0hbSZ5EGeXMNEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] pinctrl: sh-pfc: Add physical pin multiplexing
 helper macros
To: uli+renesas@fpond.eu
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Fri, Nov 16, 2018 at 8:21 AM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Used by I2C controllers 0, 3 and 5 in R8A7795 and R8A7796 SoCs.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Some bikeshedding below, which I believe would increase readability.

> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -386,6 +386,28 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
>         PINMUX_DATA(fn##_MARK, FN_##msel, FN_##fn, FN_##ipsr)
>
>  /*
> + * Describe a pinmux configuration similar to PINMUX_IPSR_MSEL, but with
> + * an additional select register that controls physical multiplexing
> + * with another pin.
> + *   - ipsr: IPSR field
> + *   - fn: Function name, also referring to the IPSR field
> + *   - msel1: Physical multiplexing selector

psel?

> + *   - msel2: Module selector

msel?

> + */
> +#define PINMUX_IPSR_MSEL2(ipsr, fn, msel1, msel2) \

PINMUX_IPSR_PHYS_MSEL?

> +       PINMUX_DATA(fn##_MARK, FN_##msel1, FN_##msel2, FN_##fn, FN_##ipsr)
> +
> +/*
> + * Describe a pinmux configuration in which a pin is physically multiplexed
> + * with other pins.
> + *   - ipsr: IPSR field
> + *   - fn: Function name, also referring to the IPSR field
> + *   - msel: Phyiscal multiplexing selector

psel?
Physical

> + */
> +#define PINMUX_IPSR_PHYS(ipsr, fn, msel) \
> +       PINMUX_DATA(fn##_MARK, FN_##msel)
> +
> +/*
>   * Describe a pinmux configuration for a single-function pin with GPIO
>   * capability.
>   *   - fn: Function name

If you agree, I can fix up all of the above while applying.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
