Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40648 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727716AbeIOBYB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 21:24:01 -0400
Received: by mail-lf1-f66.google.com with SMTP id x26-v6so8878179lfi.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Sep 2018 13:08:00 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: timer: renesas: tmu: document R8A779{7|8}0
 bindings
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <72db4d8d-7b3d-7368-02a4-f652a7bc810d@cogentembedded.com>
 <CAMuHMdW3nfPNOPQR9mWN+tdtLRz8LwR797gzORG7RRiiiHYeHQ@mail.gmail.com>
 <eed804ea-35ae-5c8f-7575-070cdefe02ba@cogentembedded.com>
 <20180912093728.bhu7cz2warhcvej7@verge.net.au>
 <CAMuHMdW89Y7XzCGW4Ke+Fj=vdRaqOO6LUbf_fmT3Sd9DFv7huA@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <3e923348-7654-7851-e9c1-e114aabe25fe@cogentembedded.com>
Date: Fri, 14 Sep 2018 23:07:57 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW89Y7XzCGW4Ke+Fj=vdRaqOO6LUbf_fmT3Sd9DFv7huA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/12/2018 03:23 PM, Geert Uytterhoeven wrote:

>>>>> Document the R-Car V3{M|H} (R8A779{7|8}0) SoC in the Renesas TMU bindings;
>>>>> the TMU hardware in those is the Renesas standard 3-channel timer unit.
>>>>>
>>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>>
>>>> Thanks for your patch!
>>>>
>>>> Not all channels seem to be identical, but the driver just matches against
>>>> the "renesas,tmu" fallback?
>>>
>>>    The only difference between TMUs is the input capture capability on the 3rd
>>> channel in each TMU -- that includes TCPR register and extra interrupt output
>>> TICPI<n> (perhaps has to do with 4th TMU IRQ?). The driver is blissfully unaware
>>> of this extra capability. :-)
>>>
>>>> In addition, the V3H TMU seems to differ from the TMU in other R-Car Gen3
>>>> variants?
>>>
>>>    Yes, but they only differ in the number of channels capable of input capture.
>>>
>>>> How is this handled?
>>>
>>>    Nohow. And I'm not sure we should care about this difference...
>>
>> It seems to me that the driver has the option of caring about the
>> difference, by matching on the soc-specific compat string, in future,
>> should it be so desired.
>>
>> So this patch seems find to me.
>>
>> Geert, am I missing something? Do you still have concerns?
> 
> Matching on the SoC-specific compat strings is not sufficient, as the actual
> TMU instances in the same SoC are not identical.

   ACK.
   But the TMUs having the external clock signel seem upwardly compatible with
those TMUs that don't have it.

> Please check Section 80.1.1 "Features".
> 
> The differences are in the number of clock inputs. As these are not the plain
> clocks, but core clocks + a postdivider,

   Post-divider is controlled by TCR (per channel) and it doesn't get used for the
external clock.

> perhaps this can be handled by using
> clock-names like "div4", "div16", "div64" etc.?

   No, you're misunderstanding things.

> I haven't checked the relation to register bits yet.

   And now? :-)

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
