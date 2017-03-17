Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:35496 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751023AbdCQN5w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2017 09:57:52 -0400
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB11653BB788CADBEE78FE4CF58A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
 <20170316175112.27913-3-chris.brandt@renesas.com> <CAMuHMdVu0dQjptyW0F5YS+V6sixXTM3P6VWq2=8BQ5njUOXf-Q@mail.gmail.com>
 <SG2PR06MB1165A9931C930DF9BCD5C0A98A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdW0nHiZkE_RxVLX3G0MuwQLPHVFyNq5C1tx0yAqDQefaA@mail.gmail.com> <SG2PR06MB11653BB788CADBEE78FE4CF58A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Mar 2017 14:55:48 +0100
Message-ID: <CAMuHMdWs3NtKLiBnKCmxGYNBW3zzWYydj=JGKr+mH7ao97L2_Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] rtc: Add rtc-sh
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        RTCLINUX <rtc-linux@googlegroups.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Fri, Mar 17, 2017 at 2:41 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Friday, March 17, 2017, Geert Uytterhoeven wrote:
>> > On Friday, March 17, 2017, Geert Uytterhoeven wrote:
>> >> On Thu, Mar 16, 2017 at 6:51 PM, Chris Brandt
>> >> <chris.brandt@renesas.com>
>> >> wrote:
>> >> > +- clocks: the clock source for the RTC controller.
>> >>
>> >> The datasheet mentions 3 possible clock sources?
>> >
>> > There is the clock source that does the counting (RTC_X1, RTC_X3, XTAL),
>> and then a clock source that runs the register interface (run off of the
>> p0 clock). So I just need to turn on the p0 clock so I can get at the
>> registers. Note that if you do a hard reset with a RESET button, and all
>> the registers in the chip go back to their POR state, the counter still
>> counts off of the 32KHz XTAL even though the "peripheral clock" is stopped
>> (which just means you can't get to the registers).
>> >
>> > In reality, you have to assume the RTC counting source has already been
>> set up by u-boot, or from a past reboot, so I don't do any of that select
>> configuration at all.
>>
>> it would still be good to have phandles to the external clock sources as
>> well, as that describes the hardware topology.
>
> I'm confused, you mean make new clocks node for RTC_X1 (fixed at 32.768kHZ) and
> RTC_X3 (fixed at 4MHz), but then not really do anything with then? (the driver

You still do something with them, as they'll be linked from the rtc device node.

> doesn't need them)

The driver may use them in the future.
E.g. to select among X1, X3, or EXTAL, depending on availability.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
