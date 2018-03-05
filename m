Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:55661 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933685AbeCEJfU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Mar 2018 04:35:20 -0500
MIME-Version: 1.0
In-Reply-To: <20180305092259.bcpfbzvvoqxsfomf@katana>
References: <1516206496-16612-1-git-send-email-yamada.masahiro@socionext.com>
 <20180304224248.mzhsvl4ccmtzg5am@ninjato> <CAPDyKFq_1mR=b3iu6o4ZJQeAjRnWf_tzb=__7SxvZYqDNCo2bg@mail.gmail.com>
 <20180305092259.bcpfbzvvoqxsfomf@katana>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 5 Mar 2018 18:34:33 +0900
Message-ID: <CAK7LNATrq11iaa=uTuJx8Z9XMDg9CA8Nf0jdU3GkLKFH5fH9Gg@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] mmc: tmio: another batch of TMIO MMC fixes and cleanups
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rich Felker <dalias@libc.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulf, Wolfram,

2018-03-05 18:22 GMT+09:00 Wolfram Sang <wsa@the-dreams.de>:
>
>> I have added Wolframs tags to the already applied patches and applied
>> that last two, 15 and 16.
>
> Thanks. Please note that patch 14 misses my Rev tag. (I gave it
> yesterday but the patch was accidently applied before. One round too
> early, so to say).
>
>> They are all present in my next branch. The fix that Wolfram sent on
>> top, is added immediately after the commit it fixes.
>
> Could we also squash it, then?
>

If Wolfram is fine with squashing,
that would be cleaner.

In that case, can you add Tested-by
to patch 12?




-- 
Best Regards
Masahiro Yamada
