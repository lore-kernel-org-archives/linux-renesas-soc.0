Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f174.google.com ([209.85.220.174]:35553 "EHLO
        mail-qk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755189AbdESIaJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2017 04:30:09 -0400
Received: by mail-qk0-f174.google.com with SMTP id a72so55386374qkj.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 May 2017 01:30:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170518201436.umh3d22rf25cqh2b@ninjato>
References: <1494408330-28161-1-git-send-email-horms+renesas@verge.net.au> <20170518201436.umh3d22rf25cqh2b@ninjato>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 19 May 2017 10:30:07 +0200
Message-ID: <CAPDyKFpTfT=ftio2t957SjpL6wd3S1tztPfBB+SOnW4TsGuB3A@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] mmc: renesas-sdhi: refactor DMA support
To: Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 18 May 2017 at 22:14, Wolfram Sang <wsa@the-dreams.de> wrote:
> On Wed, May 10, 2017 at 11:25:24AM +0200, Simon Horman wrote:
>> Hi Wolfram, Hi Ulf, Hi Arnd, Hi all,
>>
>> the intention of this patch-set is to refactor the DMA support in
>> the Renesas SDHI driver in order to make it easier to add support
>> for using the SDHI hardware with different DMA implementations.
>>
>> This is based on earlier work, posted as "[PATCH/RFC v3 0/6] mmc:
>> renesas_sdhi: add R-Car Gen-3 DMA support". It attempts to implement
>> the reworking of the driver proposed by Arnd[1] in his review of that
>> patch-set.
>>
>> [1] http://www.spinics.net/lists/linux-mmc/msg38004.html
>>
>> Unlike that patch-set this patch-set does not add support for
>> R-Car Gen-3 DMA. Rather it focuses on refactoring the code.
>>
>> Changes between RFC and v2:
>>
>> * Drop filenames from comment at top of source
>> * Consistently check for if (host->dma_ops) before using dma_ops.
>>
>>
>> Simon Horman (6):
>>   mmc: tmio: drop filenames from comment at top of source
>>   mmc: renesas-sdhi, tmio: make dma more modular
>>   mmc: tmio: rename tmio_mmc_{pio => core}.c
>>   mmc: renesas-sdhi: rename tmio_mmc_dma.c => renesas_sdhi_sys_dmac.c
>>   mmc: renesas-sdhi: rename sh_mobile_sdhi.c => renesas_sdhi_core.c
>>   mmc: renesas-sdhi: make renesas_sdhi_sys_dmac main module file
>
> Thanks Simon for this series! The file layout looks in deed much better
> now. And some light testing on my Lager didn't show any regressions. I
> have only minor comments which do not have anything to do with the code,
> so already here:
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> The comments:
>
> * MAINTAINERS file needs updating because of the new filenames
> * I'd prefer the _GPL variant of EXPORT_SYMBOL unless we have a reason
>   to not use it?
> * maybe this is also a good time to update the Renesas copyrights in
>   file headers?
> * checkpatch reports some whitespace errors on patch 6. I assume they
>   were already there in the code you moved around. Still, it might be
>   a nice occasion to fix those?
>
> Thanks again, nice work!
>
>    Wolfram
>

I have applied this for next, assuming Simon addresses Wolfram's
comments on top.

Thanks and kind regards
Uffe
