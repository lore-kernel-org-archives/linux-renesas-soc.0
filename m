Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f182.google.com ([209.85.217.182]:36847 "EHLO
        mail-ua0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752299AbcHWPC6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Aug 2016 11:02:58 -0400
Received: by mail-ua0-f182.google.com with SMTP id 97so248980869uav.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Aug 2016 08:02:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160823135251.GA25665@verge.net.au>
References: <1469592803-13842-1-git-send-email-horms+renesas@verge.net.au>
 <1469592803-13842-3-git-send-email-horms+renesas@verge.net.au>
 <CAPDyKFq_Fs_bNx7LP-J+nC3iaNgB7gvZAvhCp--qVOh1iAh0vg@mail.gmail.com> <20160823135251.GA25665@verge.net.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 23 Aug 2016 17:02:56 +0200
Message-ID: <CAPDyKFpbMnOag7TZtQXxffXyq4XjTfz3vYM_atks15+d64QkfQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] mmc: tmio: Add tuning support
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

[...]

>> > +static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
>> > +{
>> > +       struct tmio_mmc_host *host = mmc_priv(mmc);
>> > +       unsigned int num;
>> > +       int i, ret = 0;
>> > +       bool *tap;
>> > +
>> > +       if (!host->init_tuning || !host->select_tuning)
>>
>> When defining these callbacks, it would be nice to know which ones are
>> optional and which ones are required.
>
> Would some comments in struct tmio_mmc_host be an appropriate way
> to achieve that?

Yes, that would be nice!

[...]

>> >  static int tmio_mmc_init_ocr(struct tmio_mmc_host *host)
>> > @@ -1202,6 +1276,9 @@ int tmio_mmc_host_runtime_suspend(struct device *dev)
>> >         struct mmc_host *mmc = dev_get_drvdata(dev);
>> >         struct tmio_mmc_host *host = mmc_priv(mmc);
>> >
>> > +       mmc_retune_timer_stop(host->mmc);
>> > +       mmc_retune_needed(host->mmc);
>>
>> I am wondering whether it would it be possible to keep a cache of the
>> currently used tuning values and then restore these values at
>> runtime_resume?
>>
>> In that way you wouldn't need to force new re-tuning cycle here.
>
> I will check with the hardware people to see if it is practical from
> that POV.

Okay!

>
> From a software POV that ought to be simple enough: a small bitmap ought
> to be sufficient to save the values for the hardware covered by this
> series.

Yes, indeed!

Kind regards
Uffe
