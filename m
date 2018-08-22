Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34894 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728584AbeHVNMK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 09:12:10 -0400
Received: by mail-it0-f67.google.com with SMTP id 139-v6so2165597itf.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Aug 2018 02:48:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNARxJro1wL5RJ92XFykSfcC0jdgr+xvvqgLTtE=VBARekg@mail.gmail.com>
References: <1534403799-10594-1-git-send-email-yamada.masahiro@socionext.com>
 <20180820190709.qilhem7bjqnvgtt2@ninjato> <CAK7LNARxJro1wL5RJ92XFykSfcC0jdgr+xvvqgLTtE=VBARekg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Aug 2018 11:48:01 +0200
Message-ID: <CAPDyKFr+0dkuP1Dy-vir8tzqxGstRv5K6rFQeWr8epy+ED1ogQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] mmc: tmio: refactor TMIO core a bit and add
 UniPhier SD/eMMC controller support
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 21 August 2018 at 04:57, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Hi Wolfram,
>
>
> 2018-08-21 4:07 GMT+09:00 Wolfram Sang <wsa@the-dreams.de>:
>>
>> So, today I did test these patches successfully on a Gen3 board (M3-N)
>> and reviewed half of the patches. I will continue tomorrow with
>> reviewing and testing more boards.
>>
>> In a nutshell, things look good so far.
>>
>
>
> Thanks for the review!
>
> But, this version is not applicable to Linus' tree
> due to commit db924bba47c80.
>
> Resolving the conflict is not trivial.
>
>
> I will rebase and send v3,
> but I do not understand the quirks
> Renesas is adding to the TMIO core code.

Thanks for the heads up, I am waiting for your v3 then.

Kind regards
Uffe
