Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33860 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752066AbcF3OGU (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 10:06:20 -0400
Received: by mail-io0-f195.google.com with SMTP id 100so8339313ioh.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jun 2016 07:06:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1467292540-14198-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1467292540-14198-1-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jun 2016 16:06:18 +0200
Message-ID: <CAMuHMdV_9Tm_UqQsJB8sORvR7fbu5s2JfRp=b+VQFNOKXBrnDw@mail.gmail.com>
Subject: Re: [TEST] Lager SD-via-MSIOF test setup
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Thu, Jun 30, 2016 at 3:15 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> This is a setup I have cooked up to check if talking to SD cards via MSIOF1
> and SPI works.  It works by taking the SD2 lines off the bus by defining
> them as GPIO inputs and jumpering the MSIOF pins to SD card slot 2 via EXIO
> connectors like so:
>
> EXIO_A pin         EXIO_B pin
> 19 (MSIOF1_SCK_3)   3 (SD2_CLK_3)
> 31 (MSIOF1_TXD_3)   5 (SD2_CMD_3)
> 33 (MSIOF1_RXD_3)  13 (SD2_DAT0_3)
>
> (Credits for the idea go to Mr. Damm.)
>
> It works when defining an spi-gpio device, but it does not work with the
> MSIOF IP; any attempt to read from the SD card returns all zeros.
>
> Does anybody see any obvious issue there? Did I forget anything in the
> msiof1 node?

At first sight, I don't see anything that is wrong.

My first guess was that the r2a11302 pmic is still responding to commands,
corrupting your data, but you do force its CS line high through a GPIO hog.

Have you hooked up a logic analyzer?
Is the GPIO hog for MSIOF1_SYNC_3 working? You can monitor it on EXIO A pin 23.
Is cs-gpios working correctly in the spi-sh-msiof driver? You can monitor it on
EXIO B pin 7.
Is the PMIC driving MSIOF1_RXD_3 anyway? You can check if you unjumper EXIO A
pin 33.
Perhaps the PMIC just does't like seeing a 25 MHz signal on the CLK line? It has
spi-max-frequency = <6000000> in DT.

Running out of ideas for now...

Good luck!

> --- a/arch/arm/boot/dts/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/r8a7790-lager.dts

> @@ -535,12 +558,24 @@
>         status = "okay";
>  };
>
> +#if 1
>  &msiof1 {
>         pinctrl-0 = <&msiof1_pins>;
>         pinctrl-names = "default";
>
>         status = "okay";
>
> +       num-chipselects = <1>;

The spi-sh-msiof driver uses "num-cs" instead.
Shouldn't make a difference here, as the default value in the absence of the
property is 1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
