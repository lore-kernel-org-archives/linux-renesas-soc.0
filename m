Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:44714 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754066AbeAQQdd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 11:33:33 -0500
MIME-Version: 1.0
In-Reply-To: <20180113205938.dlfwxvmfnukvfl3f@ninjato>
References: <1511540697-27387-1-git-send-email-yamada.masahiro@socionext.com>
 <1511540697-27387-17-git-send-email-yamada.masahiro@socionext.com>
 <20180102131555.z6amjfqtadkh2w77@ninjato> <20180102171321.mxhcenirdx6ohbyo@ninjato>
 <CAK7LNAThnAY43OMPDMaw4DSdtJCVTUTm4-NrTgWD-6SE-yCp=g@mail.gmail.com> <20180113205938.dlfwxvmfnukvfl3f@ninjato>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 18 Jan 2018 01:32:28 +0900
Message-ID: <CAK7LNAQ-7U-5=Z26tuiZAcBYwRZaggY0POzYwsFUBZHPkC4z6Q@mail.gmail.com>
Subject: Re: [PATCH v2 16/22] mmc: tmio: fix never-detected card insertion bug
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-mmc <linux-mmc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <simon.horman@netronome.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

2018-01-14 5:59 GMT+09:00 Wolfram Sang <wsa@the-dreams.de>:
>
>> I am talking about the card detection
>> by the IP-builtin circuit.
>
> Yes, I know. As I wrote in one of the previous patches when reviewing
> it, I disabled GPIO CD and used the internal mechanism (for tests where
> it is relevant). Like here, too.
>
>>  - GPIO is not set up                     -> mmc_gpio_get_cd() returns -ENOSYS
>
> Thanks! That pointed me to the right direction. I missed that patch
> 10/22 was still under discussion and not applied to mmc/next, so I had
> to pick it manually.
>
> I can confirm now that there is an issue and your patch fixes it for the
> non-GPIO case. For the GPIO case, however, the TMIO_STAT_CARD_REMOVE |
> TMIO_STAT_CARD_INSERT interrupts are enabled now, too. It didn't harm
> when doing my tests, but we shouldn't do it, to be safe IMO.
>


Could you explain why?


    _host->native_hotplug = !(mmc_can_gpio_cd(mmc) ||
                              mmc->caps & MMC_CAP_NEEDS_POLL ||
                             !mmc_card_is_removable(mmc));

For the GPIO case, mmc_can_gpio_cd(mmc) is 1,
so _host_>native_hogplug is 0.


Then, my code does nothing, doesn't it?

+       if (_host->native_hotplug)
+               tmio_mmc_enable_mmc_irqs(_host,
+                               TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT);




-- 
Best Regards
Masahiro Yamada
