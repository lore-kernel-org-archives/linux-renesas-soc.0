Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:34169 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751452AbdEVIri (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2017 04:47:38 -0400
Received: by mail-it0-f46.google.com with SMTP id a10so3045403itg.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2017 01:47:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1495199278-16432-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1495199278-16432-1-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 May 2017 10:47:36 +0200
Message-ID: <CAMuHMdVjxv7M+_99LnuQus2e6-PwHbzYBSHjrVO_jAzNx7=XMg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7792: Add SCIF1 pin groups
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Fri, May 19, 2017 at 3:07 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Add SCIF1 pin groups to the R8A7792 PFC driver.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Thanks for your patch!

> These are the pins the MAX9260 deserializers are connected to on Blanche.

Only RX and TX are connected, not SCK ;-)

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
> @@ -1137,6 +1137,21 @@ static const unsigned int scif0_ctrl_pins[] = {
>  static const unsigned int scif0_ctrl_mux[] = {
>         RTS0_N_MARK, CTS0_N_MARK,
>  };
> +/* - SCIF1 ------------------------------------------------------------------ */
> +static const unsigned int scif1_data_pins[] = {
> +       /* RX, TX */
> +       RCAR_GP_PIN(10, 19), RCAR_GP_PIN(10, 18),
> +};
> +static const unsigned int scif1_data_mux[] = {
> +       RX1_MARK, TX1_MARK,
> +};
> +static const unsigned int scif1_clk_pins[] = {
> +       /* SCK */
> +       RCAR_GP_PIN(10, 15),
> +};
> +static const unsigned int scif1_clk_mux[] = {
> +       SCK1_MARK,
> +};

Can you please add scif1_ctrl_pins, too?

BTW, do you mind adding SCIF2? Then we have all SCIF instances covered.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
