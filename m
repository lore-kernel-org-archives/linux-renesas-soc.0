Return-Path: <linux-i2c-owner@vger.kernel.org>
MIME-Version: 1.0
References: <20180616125636.4210-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180616125636.4210-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Jun 2018 10:14:58 +0200
Message-ID: <CAMuHMdWzMB+VXVu1cHmh_Jtq+kpv2HZs7JJTuPqBWQbOCDA6ow@mail.gmail.com>
Subject: Re: [RFC PATCH] i2c: gpio: initialize SCL to HIGH again
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux I2C <linux-i2c@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Sat, Jun 16, 2018 at 2:57 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> It seems that during the conversion from gpio* to gpiod*, the initial
> state of SCL was wrongly switched to LOW. Fix it to be HIGH again.
>
> Fixes: 7bb75029ef34 ("i2c: gpio: Enforce open drain through gpiolib")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Seems to have no ill-effect on the boot log of armadillo800eva, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

It's not clear to me if this depends on "[PATCH 0/2] i2c: algos: bit:
revert to fix
regression (#200045)" or not? So far I haven't tried that one.
I'm still on v4.17+, but probably I have all i2c bugs/features due to
renesas-drivers ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
