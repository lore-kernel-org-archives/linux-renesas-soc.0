Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:34086 "EHLO
        mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752363AbdBPH5h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Feb 2017 02:57:37 -0500
Received: by mail-qk0-f171.google.com with SMTP id s186so8563848qkb.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Feb 2017 23:57:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170215150240.GA1430@katana>
References: <20170213180342.26172-1-wsa+renesas@sang-engineering.com>
 <20170213180342.26172-5-wsa+renesas@sang-engineering.com> <HK2PR06MB05484A4141A1A9AC8BE54E00D8580@HK2PR06MB0548.apcprd06.prod.outlook.com>
 <20170214105226.GB1453@katana> <CAPDyKFobQ07u_xUgpm7iQRJkCqVS9_6JvyoTDhqLM-R3qCFeGQ@mail.gmail.com>
 <20170215150240.GA1430@katana>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 16 Feb 2017 08:57:36 +0100
Message-ID: <CAPDyKFqkWYgDkrnG+VCtSHiXvhoGqRxYir3UGC9yx_4mDubhUQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] mmc: host: tmio: fill in response from auto cmd12
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 15 February 2017 at 16:02, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> > I see. Ulf, do you think it makes sense to extend the condition when to
>> > call mmc_blk_cmd_recovery() with checking if stop.resp[0] has one of the
>> > R1_* bits set which are marked with 'ex' (and probably 'erx', too)? I
>> > agree with Shimoda-san, that the core is a good place to do it, since it
>> > is about parsing the R1 and not the status bits of the host hardware.
>>
>> The method we use to indicate a stop command error to the mmc core, is
>> to set ->stop.error in the host driver before completing the request.
>> Perhaps set it to -EIO or -EILSEQ.
>>
>> In that way mmc_blk_err_check() sees the error and invokes the
>> mmc_blk_cmd_recovery() to deal with it (response parsing etc).
>>
>> Does that work for you?
>
> It would work, yes. Since R1 response format is hardware independent, I
> wondered if checking for ECC errors wouldn't be better suited in the
> core. We roughly need something like this:
>
>         if (stop.resp[0] & R1_CARD_ECC_FAILED)
>                 stop.error = -EIO;
>
> We can copy this into every driver, of course. Yet, I wondered if we
> couldn't have a helper function mapping the R1 error bits to an
> apropriate error value and call that just before the check in
> mmc_blk_err_check().
>
> Do you get what I mean?

I get it - and yes you have a point.

By looking at the code in mmc_blk_err_check() and
mmc_blk_cmd_recovery(), it deserves a clean-up. That said, I don't
want to treat R1_CARD_ECC_FAILED as a special case.

So if you decide to add this check in the core (which I am open to),
we should also add checks the other potential R1 errors, to be
consistent.

Kind regards
Uffe
