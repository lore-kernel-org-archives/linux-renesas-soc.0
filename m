Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:64305 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935251AbdLRQBy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 11:01:54 -0500
MIME-Version: 1.0
In-Reply-To: <CAPDyKFr5A7Qma_Ef5JMjvG1f_Er+f9K-tnj39_q0Wg2aQ7nY5w@mail.gmail.com>
References: <20171218000021.16655-1-wsa+renesas@sang-engineering.com> <CAPDyKFr5A7Qma_Ef5JMjvG1f_Er+f9K-tnj39_q0Wg2aQ7nY5w@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 19 Dec 2017 01:01:06 +0900
Message-ID: <CAK7LNAS_rRp0RDbmEhahKPkcYJ=Yopj7WGRcuhQLz5WP+FFE1w@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: tmio: use ioread* for repeated access to a register
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

2017-12-18 22:01 GMT+09:00 Ulf Hansson <ulf.hansson@linaro.org>:
> On 18 December 2017 at 01:00, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
>> Not all archs define reads* and writes*. Switch to ioread*_rep and
>> friends which is defined everywhere, so we can enable COMPILE_TEST after
>> that.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Thanks, applied for next!
>
> I put the patch in front of Yamada-san's patch that made it possible
> to use COMPILE_TEST. Thus avoiding breaking bisecting.
>
>> ---
>>
>> So, I pushed this to buildbot on top of Yamada-san's patch series and there
>> were no complaints, even with COMPILE_TEST enabled. I also did some tests on
>> HW and checksuming huge files on SD cards still works.
>>
>> However, I am not sure about this mixture of read* and ioread* functions. Shall
>> we convert maybe all of those?
>
> Yes, seems like a good idea.
>
> [...]
>

BTW, is ioread* preferred to read*?

We need to eliminate the root cause.
Other drivers using reads* cannot enable COMPILE_TEST for the same reason.

Wolfram,
Can you send a patch for sparc64?




-- 
Best Regards
Masahiro Yamada
