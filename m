Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:45027 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727636AbeGPLEN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 07:04:13 -0400
MIME-Version: 1.0
References: <20180712174919.14447-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180712174919.14447-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jul 2018 12:37:13 +0200
Message-ID: <CAMuHMdXKk=ON9kabroLUAexCJ2xRQEOCtty+sTP1vsqiusQBEg@mail.gmail.com>
Subject: Re: [PATCH] i2c: recovery: make pin init look like STOP
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 12, 2018 at 7:49 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> When we we initialize the pins, make sure it looks like STOP by dividing
> the delay into halves. It shouldn't matter because SDA is expected to be
> held low by a device, but for super-safety, let's do it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 51cbb0c158f2..e57231ccb32a 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -191,9 +191,10 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
>                 bri->prepare_recovery(adap);
>
>         bri->set_scl(adap, scl);
> +       ndelay(RECOVERY_NDELAY / 2);

Any change someone changes RECOVERY_NDELAY to 1, leading to a
zero delay here? Is that an issue?

>         if (bri->set_sda)
> -               bri->set_sda(adap, 1);
> -       ndelay(RECOVERY_NDELAY);
> +               bri->set_sda(adap, scl);
> +       ndelay(RECOVERY_NDELAY / 2);
>
>         /*
>          * By this time SCL is high, as we need to give 9 falling-rising edges

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
