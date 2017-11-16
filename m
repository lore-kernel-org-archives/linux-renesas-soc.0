Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:52960 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933981AbdKPIyp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2017 03:54:45 -0500
MIME-Version: 1.0
In-Reply-To: <1510759526-30346-3-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1510759526-30346-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1510759526-30346-3-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Nov 2017 09:54:44 +0100
Message-ID: <CAMuHMdWbMXRAaq9e08wGNz-bVv2tZvvq9fCfC4h1fVaeHKvfYw@mail.gmail.com>
Subject: Re: [PATCH 2/6] i2c: rcar: enable for R-Car D3 (r8a77995)
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Wed, Nov 15, 2017 at 4:25 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Same as other Gen3 SoCs.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -809,6 +809,7 @@ static const struct of_device_id rcar_i2c_dt_ids[] = {
>         { .compatible = "renesas,i2c-r8a7794", .data = (void *)I2C_RCAR_GEN2 },
>         { .compatible = "renesas,i2c-r8a7795", .data = (void *)I2C_RCAR_GEN3 },
>         { .compatible = "renesas,i2c-r8a7796", .data = (void *)I2C_RCAR_GEN3 },
> +       { .compatible = "renesas,i2c-r8a77995", .data = (void *)I2C_RCAR_GEN3 },

This is not needed, as the driver already matches on the generic
compatible value...

>         { .compatible = "renesas,i2c-rcar", .data = (void *)I2C_RCAR_GEN1 },    /* Deprecated */
>         { .compatible = "renesas,rcar-gen1-i2c", .data = (void *)I2C_RCAR_GEN1 },
>         { .compatible = "renesas,rcar-gen2-i2c", .data = (void *)I2C_RCAR_GEN2 },

...here:

        { .compatible = "renesas,rcar-gen3-i2c", .data = (void *)I2C_RCAR_GEN3 }
,
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
