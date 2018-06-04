Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:44277 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750886AbeFDJUH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jun 2018 05:20:07 -0400
Received: by mail-io0-f194.google.com with SMTP id g7-v6so13355399ioh.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jun 2018 02:20:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180604073256.leexbgdqfvjz7eyo@katana>
References: <20180601110037.3400-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFpTG2kEEAe_hjRe-8vyuHW11i4NRmnNMeEcFxpBC=D48w@mail.gmail.com> <20180604073256.leexbgdqfvjz7eyo@katana>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 4 Jun 2018 11:20:06 +0200
Message-ID: <CAPDyKFot2pZn216VyWbap=V4RXeywg5TVNYd5Ry08RSL2RmMzw@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: really fix WP logic regressions
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 4 June 2018 at 09:32, Wolfram Sang <wsa@the-dreams.de> wrote:
> On Mon, Jun 04, 2018 at 08:44:42AM +0200, Ulf Hansson wrote:
>> On 1 June 2018 at 13:00, Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
>> > This reverts commit e060d376cc61 ("mmc: renesas_sdhi: fix WP detection")
>> > and adds some code to really fix the regressions.
>> >
>> > It was missed so far that Renesas R-Car instantiations of SDHI chose to
>> > disable internal WP and used the existence of "wp-gpios" to en/disable
>> > WP at all.
>> >
>> > With the first refactoring by Yamada-san with commit  ("mmc:
>> > renesas_sdhi: use MMC_CAP2_NO_WRITE_PROTECT instead of TMIO own flag"),
>> > WP was always disabled even when GPIOs were present. With Wolfram's
>> > first fix which gets now reverted, GPIOs were honored. But when not
>> > available, the fallback was to internal WP and not to disabled WP. This
>> > caused wrong WP status on uSD card slots.
>> >
>> > Restore the old behaviour now. By default, WP is disabled. When a GPIO
>> > is found, the GPIO re-enables WP. We will think about possible better
>> > ways to handle this in the future.
>> >
>> > Tested on a previously regressing Renesas Lager board (H2) and a still
>> > working Renesas Salvator-X board (M3-W).
>> >
>> > Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>
>> Unfortunate this didn't make it for 4.17, however I have applied it for 4.18.
>
> With stable attached?

Yes!

Kind regards
Uffe
