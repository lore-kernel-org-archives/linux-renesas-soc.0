Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f196.google.com ([209.85.221.196]:43257 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbeLEOkN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 09:40:13 -0500
MIME-Version: 1.0
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com> <20181202193553.29704-14-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181202193553.29704-14-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Dec 2018 15:39:59 +0100
Message-ID: <CAMuHMdXQTXAPL_Ri_+Jg_8huxz2TDpDFB83-=inkn3wCEbFPpw@mail.gmail.com>
Subject: Re: [PATCH 14/14] gpio: pca953x: Restore registers after
 suspend/resume cycle
To: Marek Vasut <marek.vasut@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Sun, Dec 2, 2018 at 8:36 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> It is possible that the PCA953x is powered down during suspend.
> Use regmap cache to assure the registers in the PCA953x are in
> line with the driver state after resume.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

> +static int pca953x_suspend(struct device *dev)
> +{
> +       struct pca953x_chip *chip = dev_get_drvdata(dev);
> +
> +       regcache_mark_dirty(chip->regmap);
> +       pca953x_regcache_sync(dev);
> +       regcache_cache_only(chip->regmap, true);

Based on the discussion about adding suspend/resume support to the VC5
clock driver, I guess the two sync calls above are not needed here?

> +
> +       regulator_disable(chip->regulator);
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
