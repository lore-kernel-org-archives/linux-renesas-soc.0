Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:36321 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932094AbcILIJh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2016 04:09:37 -0400
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB1165272B3CB9B0A00F1E06CE8AFC0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20160909155238.17852-1-chris.brandt@renesas.com>
 <20160909155238.17852-3-chris.brandt@renesas.com> <CAMuHMdXihVRcmn2Ep0cRdg2U0=boJohxzzL1=32Ek+17ivTwWg@mail.gmail.com>
 <SG2PR06MB1165272B3CB9B0A00F1E06CE8AFC0@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Sep 2016 10:09:35 +0200
Message-ID: <CAMuHMdUAZpNoPGJZO3CHHt6_BAe+7Fdh2Bqn0qGfjO2UnuFiMA@mail.gmail.com>
Subject: Re: [PATCH 2/3] mmc: tmio-mmc: add support for 32bit data port
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Sun, Sep 11, 2016 at 9:50 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On 9/11/2016, Geert Uytterhoeven wrote:
>> > --- a/drivers/mmc/host/tmio_mmc.h
>> > +++ b/drivers/mmc/host/tmio_mmc.h
>>
>> > @@ -259,4 +265,10 @@ static inline void
>> sd_ctrl_write32_as_16_and_16(struct tmio_mmc_host *host, int
>> >         writew(val >> 16, host->ctl + ((addr + 2) <<
>> > host->bus_shift));  }
>> >
>> > +static inline void sd_ctrl_write32_rep(struct tmio_mmc_host *host, int
>> addr,
>> > +               u32 *buf, int count)
>>
>> const u32 *buf
>
> So would you say sd_ctrl_write16_rep should also be changed to be 'const u16 *buf'?
>
> Currently it is:
> static inline void sd_ctrl_write16_rep(struct tmio_mmc_host *host, int addr,
>                 u16 *buf, int count)
> {
>         writesw(host->ctl + (addr << host->bus_shift), buf, count);

Ideally it should become const, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
