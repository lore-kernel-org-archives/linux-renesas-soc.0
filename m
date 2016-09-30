Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:33750 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752451AbcI3HZi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Sep 2016 03:25:38 -0400
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVWNCo9s9a8fm_-vRSsL9cPOnX3JaDAShb7xGPAuvPgDA@mail.gmail.com>
References: <1474618805-22731-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdVGVFD2BrAGMOu1m=Ec=S-1JO=RfAuBGCB74L-astjnLw@mail.gmail.com>
 <20160923090319.GA31361@verge.net.au> <CANqRtoSD6-Qq9WynDS9cA2=RA7LH+SDVBFqME3zbJcYU86qCMg@mail.gmail.com>
 <CAMuHMdVWNCo9s9a8fm_-vRSsL9cPOnX3JaDAShb7xGPAuvPgDA@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 30 Sep 2016 16:25:36 +0900
Message-ID: <CANqRtoR+Jm6VOtB-NKrkGZuL=+Ra2Ce5aJRAJ2OS7KR4je7LSg@mail.gmail.com>
Subject: Re: [PATCH] clocksource: sh_cmt: Document r8a779[34] SoC specific bindings
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Fri, Sep 30, 2016 at 4:20 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Magnus,
>
> On Fri, Sep 30, 2016 at 9:07 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
>> On Fri, Sep 23, 2016 at 6:03 PM, Simon Horman <horms@verge.net.au> wrote:
>>> On Fri, Sep 23, 2016 at 10:35:06AM +0200, Geert Uytterhoeven wrote:
>>>> And these are planned to be removed again with Magnus'
>>>> "devicetree: bindings: r8a73a4 and R-Car Gen2 CMT bindings"
>>>> (https://patchwork.kernel.org/patch/8579481/)?
>>>
>>> Sorry, that slipped my mind.
>>>
>>> Magnus, what is the status of that work?
>>
>> Banged my head against DT bindings too long, and I felt it never got
>> picked up so I gave up. =)
>>
>> It would make sense to update and resend, I do however wonder how to
>> improve our chances to get it merged?
>
> Looking in email history, the only comment you got on v4 was an accidental
> word duplicate. As you already had plenty of acks, resending with that
> fixed (and the code included again :-) should be enough.
>
> Note that I've been running that code since the first half of 2015 ;-)

Will fix up and resend. I recall that some more effort is needed to
clean up other parts of the bindings too, but that can be done
incrementally.

Cheers,

/ magnus
