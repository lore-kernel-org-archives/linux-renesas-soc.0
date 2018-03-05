Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:51998 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933407AbeCEMGp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Mar 2018 07:06:45 -0500
Received: by mail-it0-f46.google.com with SMTP id u66so9162494ith.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Mar 2018 04:06:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK7LNATrq11iaa=uTuJx8Z9XMDg9CA8Nf0jdU3GkLKFH5fH9Gg@mail.gmail.com>
References: <1516206496-16612-1-git-send-email-yamada.masahiro@socionext.com>
 <20180304224248.mzhsvl4ccmtzg5am@ninjato> <CAPDyKFq_1mR=b3iu6o4ZJQeAjRnWf_tzb=__7SxvZYqDNCo2bg@mail.gmail.com>
 <20180305092259.bcpfbzvvoqxsfomf@katana> <CAK7LNATrq11iaa=uTuJx8Z9XMDg9CA8Nf0jdU3GkLKFH5fH9Gg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 5 Mar 2018 13:06:44 +0100
Message-ID: <CAPDyKFr0=oR2s-SiejG580iy71dUh-K64Ya=trEjZE4zmc5Xfg@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] mmc: tmio: another batch of TMIO MMC fixes and cleanups
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
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

On 5 March 2018 at 10:34, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> Hi Ulf, Wolfram,
>
> 2018-03-05 18:22 GMT+09:00 Wolfram Sang <wsa@the-dreams.de>:
>>
>>> I have added Wolframs tags to the already applied patches and applied
>>> that last two, 15 and 16.
>>
>> Thanks. Please note that patch 14 misses my Rev tag. (I gave it
>> yesterday but the patch was accidently applied before. One round too
>> early, so to say).

Added rev. tag.

>>
>>> They are all present in my next branch. The fix that Wolfram sent on
>>> top, is added immediately after the commit it fixes.
>>
>> Could we also squash it, then?
>>
>
> If Wolfram is fine with squashing,
> that would be cleaner.
>

Done.

> In that case, can you add Tested-by
> to patch 12?

Done.

Kind regards
Uffe
