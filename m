Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:51984 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727516AbeH3MJt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 08:09:49 -0400
Received: by mail-wm0-f68.google.com with SMTP id y2-v6so993628wma.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Aug 2018 01:08:52 -0700 (PDT)
Subject: Re: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <Chris.Brandt@renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
References: <20180829132954.64862-1-chris.brandt@renesas.com>
 <20180829132954.64862-2-chris.brandt@renesas.com>
 <1ff04fa1-ee3b-6095-bcd8-f16dbb99b57a@linaro.org>
 <TY1PR01MB156202DC354E70F1C8C5B18A8A090@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <c16b82c0-e675-8f86-19e6-75cb5995813b@linaro.org>
 <CAMuHMdX9nXYan-m14k6h7OU1UCGW_irDLvMMi==dnM0cdUR_nA@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c4bd550f-5319-9d92-a30a-1d12fc9bbcab@linaro.org>
Date: Thu, 30 Aug 2018 10:08:49 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX9nXYan-m14k6h7OU1UCGW_irDLvMMi==dnM0cdUR_nA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 30/08/2018 09:54, Geert Uytterhoeven wrote:
> Hi Daniel,
> 
> On Wed, Aug 29, 2018 at 6:26 PM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>> On 29/08/2018 17:44, Chris Brandt wrote:
>>> On Wednesday, August 29, 2018 1, Daniel Lezcano wrote:
>>>> Can the boot constraints [1] solve this issue instead of the changes you
>>>> are proposing ?
>>>>
>>>> [1] https://lwn.net/Articles/747250/
>>>
>>> Thanks for the suggestion, but...
>>>
>>> I grepped for "boot_constraint" and it shows up nowhere in the current
>>> kernel.
>>>
>>> Also, this article was written Feb 16, 2018, and I can see that the
>>> patch series was still being submitted (V7) as of Feb 23, 2018.
>>
>> Ah ok, fair enough, I thought it was merged. In any case, after thinking
>> about it, it wouldn't have helped.
>>
>> My concern is if we can avoid changing the TIMER_OF_DECLARE because of
>> the boot order, it would be better.
>>
>> Can returning EPROBE_DEFER fix this issue? Or use the 'complex
>> dependencies' [1]?
> 
> *_OF_DECLARE() is not compatible with EPROBE_DEFER, which causes
> issues with complex dependencies.

What causes issues ? Add support for EPROBE_DEFER with OF_DECLARE or not
having support of it ?

> That's exactly why many subsystems are moving away from it.
> E.g. IOMMU_OF_DECLARE was removed in v4.19-rc1.

Ok, thanks for information.


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
