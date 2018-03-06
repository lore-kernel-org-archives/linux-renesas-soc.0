Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:19213 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932251AbeCFDtO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Mar 2018 22:49:14 -0500
MIME-Version: 1.0
In-Reply-To: <20180305204842.25391-1-wsa+renesas@sang-engineering.com>
References: <20180305204842.25391-1-wsa+renesas@sang-engineering.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 6 Mar 2018 12:48:19 +0900
Message-ID: <CAK7LNATZ8vnKUeCW1aN5yGMLu0kGXwv3tYmxeGFTiYR9YSqU6A@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: fix WP detection
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

2018-03-06 5:48 GMT+09:00 Wolfram Sang <wsa+renesas@sang-engineering.com>:
> Commit "mmc: renesas_sdhi: use MMC_CAP2_NO_WRITE_PROTECT instead of
> TMIO own flag" activated MMC_CAP2_NO_WRITE_PROTECT for Renesas SDHI
> which incorrectly disabled WP altogether instead of only disabling the
> internal mechanism.


I am not opposed to this patch,
but I have a question.

Is this is a real problem in the upstream kernel?
(If so, how do renesas boards set-up WP GPIOs?)


When I wrote the addressed patch,
I checked all renesas drivers and device trees,
and confirmed no one set WP-GPIOs.


Then, I described the following in my commit log:

    Only the difference is the TMIO_... makes tmio_mmc_get_ro() return 0
    (i.e. it does not affect mmc_gpio_get_ro() at all), while MMC_CAP2_...
    returns 0 before calling ->get_ro() hook (i.e. it affects both IP own
    logic and GPIO detection).

    The TMIO MMC drivers do not set-up gpio_ro by themselves.  Only the
    possibility, if any, would be DT specifies "wp-gpios" property, and
    gpio_ro is set by mmc_gpiod_request_ro() called from mmc_of_parse().
    However, it does not make sense to specify "wp-gpios" property and
    TMIO_MMC_WRPROTECT_DISABLE at the same time.

    I checked under arch/arm/boot/dts/ and arch/arm64/boot/dts/renesas/,
    and I did not see any Renesas boards with "wp-gpios".  So, this
    conversion should be safe.

> Since the whole WP handling has been reworked, we
> can simply disable this capability to re-enable WP GPIOs.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> More testing revealed this. This time, I don't think squashing makes sense but
> I am open to discussion here.






-- 
Best Regards
Masahiro Yamada
