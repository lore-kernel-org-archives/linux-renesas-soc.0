Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20161215175326.tbblqe7kto2qgxwz@sirena.org.uk>
References: <1473713446-30366-1-git-send-email-geert+renesas@glider.be>
 <1473713446-30366-4-git-send-email-geert+renesas@glider.be> <20161215175326.tbblqe7kto2qgxwz@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Dec 2016 11:02:07 +0100
Message-ID: <CAMuHMdXJu0-iTFu3KMWXbbgidB63Mxy0oAWmTKKt0UUKuPbprA@mail.gmail.com>
Subject: Re: [PATCH/RFC v2 3/7] spi: core: Add support for registering SPI
 slave controllers
To: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Mark,

On Thu, Dec 15, 2016 at 6:53 PM, Mark Brown <broonie@kernel.org> wrote:
> On Mon, Sep 12, 2016 at 10:50:42PM +0200, Geert Uytterhoeven wrote:
>> TBD:
>>   - s/spi_master/spi_controller/ where appropriate,
>>   - Provide wrappers (e.g. "#define spi_master spi_controller" until all
>>     SPI drivers have been converted),
>>   - Do we want a separate spi_register_slave() instead?
>
> This basically looks fine to me - there's these TBDs so I might be
> missing things and we probably need some GPIO chip select handling but

Given the hard real-time requirements of SPI slave, supporting GPIO chip
select may not be feasible.

> that's a separate thing.  Sorry it took me so long to review this.

Thanks for the review!

As I managed to fix the issue with spi_slave_abort() on MSIOF, I think
the remaining
obstacle is the DT binding.  Do you have any feedback or other
suggestions in that area?

IMHO having the ability to bind to an SPI slave handler either from DT or
by using the sysfs virtual file is useful to have.

Thanks again!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
