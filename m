Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:46681 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932485AbeEWLz6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 07:55:58 -0400
MIME-Version: 1.0
In-Reply-To: <20180523114230.10109-2-marek.vasut+renesas@gmail.com>
References: <20180523114230.10109-1-marek.vasut+renesas@gmail.com> <20180523114230.10109-2-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 May 2018 13:55:57 +0200
Message-ID: <CAMuHMdWxzDKcHWBD12nAJf_wLtupyAxtL38_faitSOZy+6xGjA@mail.gmail.com>
Subject: Re: [PATCH 2/6] mfd: da9063: Replace model with type
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 23, 2018 at 1:42 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> The model number stored in the struct da9063 is the same for all
> variants of the da9063 since it is the chip ID, which is always
> the same. Replace that with a separate identifier instead, which
> allows us to discern the DA9063 variants by setting the type
> based on either DT match or otherwise.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/mfd/da9063-i2c.c
> +++ b/drivers/mfd/da9063-i2c.c
> @@ -248,6 +248,7 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
>         i2c_set_clientdata(i2c, da9063);
>         da9063->dev = &i2c->dev;
>         da9063->chip_irq = i2c->irq;
> +       da9063->type = (enum da9063_type)id->driver_data;

Nit: I think this cast (from unsigned long) is not needed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
