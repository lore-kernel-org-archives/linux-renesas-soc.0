Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ig0-f193.google.com ([209.85.213.193]:36719 "EHLO
	mail-ig0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752806AbcEBIDd (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 2 May 2016 04:03:33 -0400
MIME-Version: 1.0
In-Reply-To: <CACRpkdayGoAsU2+dOg4Y9BcyOORVp4OmUUCbE_cW5gPzR=D7nw@mail.gmail.com>
References: <1461914677-24899-1-git-send-email-geert+renesas@glider.be>
	<CACRpkdayGoAsU2+dOg4Y9BcyOORVp4OmUUCbE_cW5gPzR=D7nw@mail.gmail.com>
Date: Mon, 2 May 2016 10:03:31 +0200
Message-ID: <CAMuHMdW+O-qtrfbfpORX_dWCATZ9goTqQQa_sD9h1Jq=7H9DMA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Let gpio_chip.to_irq() return -ENXIO on error
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Linus,

On Sun, May 1, 2016 at 10:48 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> Currrently the gpio_chip.to_irq() callback returns -ENOSYS on error,
>> which causes bad interactions with the serial_mctrl_gpio helpers.
>>
>> mctrl_gpio_init() returns -ENOSYS if GPIOLIB is not enabled, which is
>> intended to be ignored by its callers. However, ignoring -ENOSYS when it
>> was caused by a gpiod_to_irq() failure will lead to a crash later:
>>
>>     Unable to handle kernel paging request at virtual address ffffffde
>>     ...
>>     PC is at mctrl_gpio_set+0x14/0x78
>>
>> Fix this by returning -ENXIO instead.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> Is -ENXIO the right error code?
>
> I would say that whatever the generic helpers in drivers/gpio/gpiolib.c
> returns should be the norm. However the guy who wrote them (me)
> isn't very smart either. It looks like so:
>
> static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
> {
>         return irq_find_mapping(chip->irqdomain, offset);
> }
>
> That returns 0 (NO_IRQ) on failure.
>
> And as you say:
>
>>   - Drivers that call irq_find_mapping(), irq_create_mapping(), or
>>     irq_create_fwspec_mapping() return zero!  This also applies to the
>>     core helper gpiochip_to_irq().
>
> Zero means NO_IRQ.
>
> Reminder:
> http://lwn.net/Articles/470820/
>
> What we should do is patch all drivers to return 0 on failure, and
> patch any consumers like mctrl_gpio_init() to handle that correctly.

That's the Long Term Plan. There are still too many non-zero NO_IRQ
definitions in use...

Is -ENXIO acceptable for the short term?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
