Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:36030 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937AbcEAIsp (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 1 May 2016 04:48:45 -0400
Received: by mail-ob0-f175.google.com with SMTP id j9so76127263obd.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 01 May 2016 01:48:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1461914677-24899-1-git-send-email-geert+renesas@glider.be>
References: <1461914677-24899-1-git-send-email-geert+renesas@glider.be>
Date: Sun, 1 May 2016 10:48:43 +0200
Message-ID: <CACRpkdayGoAsU2+dOg4Y9BcyOORVp4OmUUCbE_cW5gPzR=D7nw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Let gpio_chip.to_irq() return -ENXIO on error
From: Linus Walleij <linus.walleij@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 29, 2016 at 9:24 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Currrently the gpio_chip.to_irq() callback returns -ENOSYS on error,
> which causes bad interactions with the serial_mctrl_gpio helpers.
>
> mctrl_gpio_init() returns -ENOSYS if GPIOLIB is not enabled, which is
> intended to be ignored by its callers. However, ignoring -ENOSYS when it
> was caused by a gpiod_to_irq() failure will lead to a crash later:
>
>     Unable to handle kernel paging request at virtual address ffffffde
>     ...
>     PC is at mctrl_gpio_set+0x14/0x78
>
> Fix this by returning -ENXIO instead.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Is -ENXIO the right error code?

I would say that whatever the generic helpers in drivers/gpio/gpiolib.c
returns should be the norm. However the guy who wrote them (me)
isn't very smart either. It looks like so:

static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
{
        return irq_find_mapping(chip->irqdomain, offset);
}

That returns 0 (NO_IRQ) on failure.

And as you say:

>   - Drivers that call irq_find_mapping(), irq_create_mapping(), or
>     irq_create_fwspec_mapping() return zero!  This also applies to the
>     core helper gpiochip_to_irq().

Zero means NO_IRQ.

Reminder:
http://lwn.net/Articles/470820/

What we should do is patch all drivers to return 0 on failure, and
patch any consumers like mctrl_gpio_init() to handle that correctly.

Yours,
Linus Walleij
