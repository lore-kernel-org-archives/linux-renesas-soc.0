Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170502121816.10572-2-marek.vasut+renesas@gmail.com>
References: <20170502121816.10572-1-marek.vasut+renesas@gmail.com> <20170502121816.10572-2-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jul 2017 17:33:20 +0200
Message-ID: <CAMuHMdXmPPRA00yCOiwh1mvaGAy=g_QP=9qrupnzW+f=22Wosw@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] mfd: Add ROHM BD9571MWV-M MFD PMIC driver
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Tue, May 2, 2017 at 2:18 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> Add the MFD part of the ROHM BD9571MWV-M PMIC driver and MAINTAINERS
> entry. The MFD part only specifies the regmap bits for the PMIC and
> binds the subdevs together.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Lee Jones <lee.jones@linaro.org>

> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -133,6 +133,19 @@ config MFD_BCM590XX
>         help
>           Support for the BCM590xx PMUs from Broadcom
>
> +config MFD_BD9571MWV
> +       tristate "ROHM BD9571MWV PMIC"
> +       select MFD_CORE
> +       select REGMAP_I2C

Missing "select REGMAP_IRQ".

Else it fails with:

drivers/built-in.o: In function `bd9571mwv_remove':
:(.text+0x103190): undefined reference to `regmap_del_irq_chip'
drivers/built-in.o: In function `bd9571mwv_probe':
:(.text+0x10332c): undefined reference to `regmap_add_irq_chip'
:(.text+0x103358): undefined reference to `regmap_irq_get_domain'
:(.text+0x103394): undefined reference to `regmap_del_irq_chip'

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
