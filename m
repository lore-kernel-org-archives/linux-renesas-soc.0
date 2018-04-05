Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:52542 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751097AbeDEHaK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Apr 2018 03:30:10 -0400
Received: by mail-it0-f54.google.com with SMTP id f6-v6so1697522ita.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Apr 2018 00:30:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180327111206.y7azdu355c6cevvi@verge.net.au>
References: <20180213123358.13212-1-horms+renesas@verge.net.au>
 <CAPDyKFryhg=5G9G3ss3hFSAuri1-_y0uu7ZK=PNGJ0TF=-__DA@mail.gmail.com>
 <20180227090757.wvm6j4sy5nmeecf3@katana> <CAPDyKFqMacY1THjO+cTb6Aws3mCnbLogui9T6PjiVcoR89FiLg@mail.gmail.com>
 <20180227130222.zsz73d3upi3s7vjv@ninjato> <20180327111206.y7azdu355c6cevvi@verge.net.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Apr 2018 09:30:09 +0200
Message-ID: <CAPDyKFohK90+5mQRx84HhkFCUPBuNDSMRZ+7FyGt5k0akjsOwA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] mmc: renesas_sdhi: add eMMC HS400 mode support
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 27 March 2018 at 13:12, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Feb 27, 2018 at 02:02:23PM +0100, Wolfram Sang wrote:
>>
>> > Perhaps someone need to explain in more detail what the HW controller
>> > needs to manage tuning for HS400? I don't like that we may end up
>> > getting it magically to work, then it's we better understand the
>> > details and if the current sequence provided by the mmc core can't
>> > fulfill the need for this case, we may instead consider adding an
>> > additional pre/post host ops.
>>
>> Thanks. Exactly this thinking prevented me from saying "It works, let's
>> ship it" ;)
>
> Thanks, I've dug a little deeper into the history of this code and
> the associated hardware documentation and it seems that the desired
> sequence is as follows:
>
> 1. Reset HS400 mode (currently executed near beginning of tmio_mmc_set_ios())
> 2. Set clock for HS200 mode (tmio_mmc_set_ios())
> 3. Tune in HS200 mode
> 4. Set clock for HS200 mode (tmio_mmc_set_ios())
> 5. Set to HS400 mode (currently renesas_sdhi_prepare_hs400_tuning() which
>                       is executed near the end of tmio_mmc_set_ios())

This seems to also refer to how the eMMC spec describes the sequence,
and thus also implemented by the mmc core.

>
> X. It is also necessary to disable the SCC after setting HS400 mode
>    has occurred before setting to High Speed mode.
>    This is currently executed near the beginning of tmio_mmc_set_ios().
>
> The current implementation differs a little from the above and its
> hard to tell if that is because of hardware requirements or as
> an artefact of the implementation of steps 1 and 5 being hooked into
> tmio_mmc_set_ios().
>
> It seems to me that step 1 could use the MMC core prepare_hs400_tuning
> hook. Its less clear to me where steps 5 and X should hook in but perhaps
> tmio_mmc_set_ios() is the right place.

In ->set_ios() you are relying on checking the value of ->ios.timing
(MMC_TIMING_MMC_HS200 and MMC_TIMING_MMC_HS400) to understand what
actions to take.

For tuning, we found this was not sufficient when trying to cope with
all different MMC controller constraints, which is why we added the
->prepare_hs400_tuning() ops. I am guessing it should work for your
case as well.

However, if that isn't the case and you find reasons to add another
->[xyz]_hs400_tuning() callback, then I am open to discuss that.

Kind regards
Uffe
