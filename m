Return-Path: <linux-i2c-owner@vger.kernel.org>
MIME-Version: 1.0
References: <20180616125636.4210-1-wsa+renesas@sang-engineering.com> <20180625142956.egsm4nzc5ithrlsf@ninjato>
In-Reply-To: <20180625142956.egsm4nzc5ithrlsf@ninjato>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Jun 2018 09:42:25 +0200
Message-ID: <CACRpkdYMSEs=kq6evRbKGAKvX8Vj6BhcBne=J+yML=HRgxHTgA@mail.gmail.com>
Subject: Re: [RFC PATCH] i2c: gpio: initialize SCL to HIGH again
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 25, 2018 at 4:30 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> On Sat, Jun 16, 2018 at 09:56:36PM +0900, Wolfram Sang wrote:
> > It seems that during the conversion from gpio* to gpiod*, the initial
> > state of SCL was wrongly switched to LOW. Fix it to be HIGH again.
> >
> > Fixes: 7bb75029ef34 ("i2c: gpio: Enforce open drain through gpiolib")
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Linus: Or was it intentional? But then I am missing something... I found this
> > by trying to fix a regression. I can't scope my use case now because I am on
> > the road. I recall SCL being unexpectedly LOW when using the GPIO fault
> > injector the last time, though. This made me do a fix in the underlying
> > i2c-algo-bit algorithm, but that sadly caused a regression :( So, this may be
> > the proper fix. RFC for now, until I have my scope back. But discussion is
> > welcome.
>
> Linus: any comment?

Looks like a mistake on my part. Mea culpa :(

Luckily it is functionally mostly harmless, but to
conserve power, it is better to initialize this as high (lest
we dissipate power throught the pull-up resistor), so please queue
this as a fix and also tag for stable.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
