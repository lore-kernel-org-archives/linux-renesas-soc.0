Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35085 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752451AbcI3HUJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Sep 2016 03:20:09 -0400
MIME-Version: 1.0
In-Reply-To: <CANqRtoSD6-Qq9WynDS9cA2=RA7LH+SDVBFqME3zbJcYU86qCMg@mail.gmail.com>
References: <1474618805-22731-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdVGVFD2BrAGMOu1m=Ec=S-1JO=RfAuBGCB74L-astjnLw@mail.gmail.com>
 <20160923090319.GA31361@verge.net.au> <CANqRtoSD6-Qq9WynDS9cA2=RA7LH+SDVBFqME3zbJcYU86qCMg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Sep 2016 09:20:07 +0200
Message-ID: <CAMuHMdVWNCo9s9a8fm_-vRSsL9cPOnX3JaDAShb7xGPAuvPgDA@mail.gmail.com>
Subject: Re: [PATCH] clocksource: sh_cmt: Document r8a779[34] SoC specific bindings
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Fri, Sep 30, 2016 at 9:07 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> On Fri, Sep 23, 2016 at 6:03 PM, Simon Horman <horms@verge.net.au> wrote:
>> On Fri, Sep 23, 2016 at 10:35:06AM +0200, Geert Uytterhoeven wrote:
>>> And these are planned to be removed again with Magnus'
>>> "devicetree: bindings: r8a73a4 and R-Car Gen2 CMT bindings"
>>> (https://patchwork.kernel.org/patch/8579481/)?
>>
>> Sorry, that slipped my mind.
>>
>> Magnus, what is the status of that work?
>
> Banged my head against DT bindings too long, and I felt it never got
> picked up so I gave up. =)
>
> It would make sense to update and resend, I do however wonder how to
> improve our chances to get it merged?

Looking in email history, the only comment you got on v4 was an accidental
word duplicate. As you already had plenty of acks, resending with that
fixed (and the code included again :-) should be enough.

Note that I've been running that code since the first half of 2015 ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
