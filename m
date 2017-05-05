Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1493919951-32122-3-git-send-email-geert+renesas@glider.be>
References: <1493919951-32122-1-git-send-email-geert+renesas@glider.be> <1493919951-32122-3-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 May 2017 11:07:31 +0200
Message-ID: <CAMuHMdUf5Oea8seHLBdEEhFKLUB+W7ib8FWTMFJNPJAr2xZ77w@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] spi: core: Add support for registering SPI slave controllers
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Matt Porter <mporter@konsulko.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Wu Fengguang <fengguang.wu@intel.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 4, 2017 at 7:45 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h

> @@ -447,6 +448,8 @@ struct spi_master {
>  #define SPI_MASTER_MUST_TX      BIT(4)         /* requires tx */
>  #define SPI_MASTER_GPIO_SS      BIT(5)         /* GPIO CS must select slave */
>
> +       bool                    slave;          /* SPI slave controller */

0day reported I forgot to document this new field in kerneldoc, thanks!
Will fix in v4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
