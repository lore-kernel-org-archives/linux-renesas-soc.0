Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:18891 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750838AbeCFJKZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Mar 2018 04:10:25 -0500
MIME-Version: 1.0
In-Reply-To: <20180306085324.5ytcycgerd4ol4o6@katana>
References: <20180305204842.25391-1-wsa+renesas@sang-engineering.com>
 <CAK7LNATZ8vnKUeCW1aN5yGMLu0kGXwv3tYmxeGFTiYR9YSqU6A@mail.gmail.com> <20180306085324.5ytcycgerd4ol4o6@katana>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 6 Mar 2018 18:09:14 +0900
Message-ID: <CAK7LNARYkcAEVOgAA1c4e_9U=gknK7v2rF0MSexCCBMfoXeezQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: fix WP detection
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

2018-03-06 17:53 GMT+09:00 Wolfram Sang <wsa@the-dreams.de>:
> On Tue, Mar 06, 2018 at 12:48:19PM +0900, Masahiro Yamada wrote:
>> 2018-03-06 5:48 GMT+09:00 Wolfram Sang <wsa+renesas@sang-engineering.com>:
>> > Commit "mmc: renesas_sdhi: use MMC_CAP2_NO_WRITE_PROTECT instead of
>> > TMIO own flag" activated MMC_CAP2_NO_WRITE_PROTECT for Renesas SDHI
>> > which incorrectly disabled WP altogether instead of only disabling the
>> > internal mechanism.
>>
>>
>> I am not opposed to this patch,
>> but I have a question.
>>
>> Is this is a real problem in the upstream kernel?
>
> Not upstream, but mmc/next. The patch I mentioned in the above commit
> message is in mmc/next only. Yes, it is a real problem. As I said below,
> "more testing revealed this" on Gen3, at least.

Seems already upstream.


>> (If so, how do renesas boards set-up WP GPIOs?)
>
> Quite the standard way, I'd think:
>
> $ grep 'wp-gpios' arch/arm64/boot/dts/renesas/*
> arch/arm64/boot/dts/renesas/salvator-common.dtsi:       wp-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
> arch/arm64/boot/dts/renesas/salvator-common.dtsi:       wp-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
>
> $ grep 'wp-gpios' arch/arm/boot/dts/r8a*
> arch/arm/boot/dts/r8a7778-bockw.dts:    wp-gpios = <&gpio3 18 GPIO_ACTIVE_HIGH>;
> arch/arm/boot/dts/r8a7791-koelsch.dts:  wp-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
> arch/arm/boot/dts/r8a7791-koelsch.dts:  wp-gpios = <&gpio6 15 GPIO_ACTIVE_HIGH>;
> arch/arm/boot/dts/r8a7791-porter.dts:   wp-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
> arch/arm/boot/dts/r8a7793-gose.dts:     wp-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
> arch/arm/boot/dts/r8a7793-gose.dts:     wp-gpios = <&gpio6 15 GPIO_ACTIVE_HIGH>;
> arch/arm/boot/dts/r8a7794-alt.dts:      wp-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
> arch/arm/boot/dts/r8a7794-alt.dts:      wp-gpios = <&gpio6 15 GPIO_ACTIVE_HIGH>;

Ugh.


>> When I wrote the addressed patch,
>> I checked all renesas drivers and device trees,
>> and confirmed no one set WP-GPIOs.
>
> Yes, I saw this in the commit message and was confused, too. I seem to also
> have overlooked it in my review. I can't really tell what changed or otherwise
> went wrong, but fact is that Gen3 can't check RO currently im mmc/next and
> after my patch it can. Well, this is why we do apply through testing, I
> guess...
>

You are right.

Sorry, this is my mistake, I do not know why it happened.

I would tedious to coping with git-history.
So, I think this can go in as a separate fix-up patch.


Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>





-- 
Best Regards
Masahiro Yamada
