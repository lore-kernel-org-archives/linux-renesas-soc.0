Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:36726 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751110AbcHZIJz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2016 04:09:55 -0400
Received: by mail-wm0-f43.google.com with SMTP id q128so268936051wma.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2016 01:09:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160825120424.GA3385@verge.net.au>
References: <1469592803-13842-1-git-send-email-horms+renesas@verge.net.au>
 <1469592803-13842-3-git-send-email-horms+renesas@verge.net.au>
 <CAPDyKFq_Fs_bNx7LP-J+nC3iaNgB7gvZAvhCp--qVOh1iAh0vg@mail.gmail.com>
 <20160823135251.GA25665@verge.net.au> <CAPDyKFpbMnOag7TZtQXxffXyq4XjTfz3vYM_atks15+d64QkfQ@mail.gmail.com>
 <20160825120424.GA3385@verge.net.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 26 Aug 2016 10:01:35 +0200
Message-ID: <CAPDyKFpu85h3w2JkCjyQ15P8eWfkAkYcpxR4A6bD0EpQLw9rew@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] mmc: tmio: Add tuning support
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 25 August 2016 at 14:04, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Aug 23, 2016 at 05:02:56PM +0200, Ulf Hansson wrote:
>> [...]
>>
>> >> > +static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
>> >> > +{
>> >> > +       struct tmio_mmc_host *host = mmc_priv(mmc);
>> >> > +       unsigned int num;
>> >> > +       int i, ret = 0;
>> >> > +       bool *tap;
>> >> > +
>> >> > +       if (!host->init_tuning || !host->select_tuning)
>> >>
>> >> When defining these callbacks, it would be nice to know which ones are
>> >> optional and which ones are required.
>> >
>> > Would some comments in struct tmio_mmc_host be an appropriate way
>> > to achieve that?
>>
>> Yes, that would be nice!
>>
>> [...]
>>
>> >> >  static int tmio_mmc_init_ocr(struct tmio_mmc_host *host)
>> >> > @@ -1202,6 +1276,9 @@ int tmio_mmc_host_runtime_suspend(struct device *dev)
>> >> >         struct mmc_host *mmc = dev_get_drvdata(dev);
>> >> >         struct tmio_mmc_host *host = mmc_priv(mmc);
>> >> >
>> >> > +       mmc_retune_timer_stop(host->mmc);
>> >> > +       mmc_retune_needed(host->mmc);
>> >>
>> >> I am wondering whether it would it be possible to keep a cache of the
>> >> currently used tuning values and then restore these values at
>> >> runtime_resume?
>> >>
>> >> In that way you wouldn't need to force new re-tuning cycle here.
>> >
>> > I will check with the hardware people to see if it is practical from
>> > that POV.
>>
>> Okay!
>
> The feedback I received is something like this:
>
> * The tap values calculated during retuning depend on the temperature of
>   the SoC and card.
> * So after resume the values may be invalid.

They values may also become invalid during long continues transfers,
which prevents the ->runtime_suspend() callback to be invoked -
because the temperature may increase.

> * It may be possible to re-use the TAP values and re-tune if a transfer
>   fails but the people I spoke with were unsure of the merit of that
>   approach

There's is a huge benefit!

You will get a significant decreased latency at ->runtime_resume() as
you don't need to run a complete re-tuning cycle.

I can't really give you fresh numbers as it's a long time I tried this
myself, although if you did some measurements on this it would be
nice! :-)

>
> Personally my feeling is that we should initiate a retune on resume for
> now as that seems to be the safest option.

I don't agree. :-) I think it's better to postpone re-tune until it's
actually needed.

Re-tune happens in the request error handling path, but also if you
configure a re-tuning period. That ought to be sufficient, don't you
think?

[...]

Kind regards
Uffe
