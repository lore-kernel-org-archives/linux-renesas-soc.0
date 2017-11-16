Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:32775 "EHLO
        mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933433AbdKPKmJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2017 05:42:09 -0500
Received: by mail-io0-f178.google.com with SMTP id 134so4791334ioo.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Nov 2017 02:42:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2b56ea8c-3040-2c47-41e5-ed52f97ff75e@rock-chips.com>
References: <20171114225520.6793-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFrgO0JRatud5JRDONS=VTNef8WS+qvRAUo1AXep9wMpZg@mail.gmail.com> <2b56ea8c-3040-2c47-41e5-ed52f97ff75e@rock-chips.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 16 Nov 2017 11:42:07 +0100
Message-ID: <CAPDyKFpvA2q5KwtcrXzv5ownKM54hcZTyfXKVBJhb95k2o6tyw@mail.gmail.com>
Subject: Re: [PATCH RFT] mmc: core: use usleep_range rather than HZ magic in mmc_delay()
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 16 November 2017 at 08:59, Shawn Lin <shawn.lin@rock-chips.com> wrote:
> Hi,
>
> On 2017/11/16 15:47, Ulf Hansson wrote:
>>
>> On 14 November 2017 at 23:55, Wolfram Sang
>> <wsa+renesas@sang-engineering.com> wrote:
>>>
>>> Documentation/timers/timers-howto.txt recommends to use usleep_range for
>>> delays 1-20ms. Let's adhere to it. No need for messing with HZ and still
>>> do busy looping these days.
>>>
>
> Sorry for chime in this topic but I think for some cases, for instance,
> mmc_host_set_uhs_voltage calls mmc_delay and it should guarantee the
> delay is accurate, especially for the comment"Keep clock gated for at
> least 10 ms, though spec only says 5 ms"
>
> But the usleep_range won't guarantee that, see
>
> https://patchwork.kernel.org/patch/9369963/
>
> It wasn't fixed at the end, so you should carefully modify
> this fundamentally.

git tag --contains 6c5e9059692567740a4ee51530dffe51a4b9584d

It should be fixed, however, thanks for pointing to an interesting patch. :-)

[...]

Kind regards
Uffe
