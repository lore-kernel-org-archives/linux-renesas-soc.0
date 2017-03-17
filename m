Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB1165A9931C930DF9BCD5C0A98A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
 <20170316175112.27913-3-chris.brandt@renesas.com> <CAMuHMdVu0dQjptyW0F5YS+V6sixXTM3P6VWq2=8BQ5njUOXf-Q@mail.gmail.com>
 <SG2PR06MB1165A9931C930DF9BCD5C0A98A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Mar 2017 14:21:50 +0100
Message-ID: <CAMuHMdW0nHiZkE_RxVLX3G0MuwQLPHVFyNq5C1tx0yAqDQefaA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Fri, Mar 17, 2017 at 2:16 PM, Chris Brandt <Chris.Brandt@renesas.com> wr=
ote:
> Happy St Patrick's Day!
>
>     (I know you are not Irish....but you are closer to Ireland than I am =
;)

;-)

> On Friday, March 17, 2017, Geert Uytterhoeven wrote:
>> On Thu, Mar 16, 2017 at 6:51 PM, Chris Brandt <chris.brandt@renesas.com>
>> wrote:
>> > +- clocks: the clock source for the RTC controller.
>>
>> The datasheet mentions 3 possible clock sources?
>
> There is the clock source that does the counting (RTC_X1, RTC_X3, XTAL), =
and then a clock source that runs the register interface (run off of the p0=
 clock). So I just need to turn on the p0 clock so I can get at the registe=
rs. Note that if you do a hard reset with a RESET button, and all the regis=
ters in the chip go back to their POR state, the counter still counts off o=
f the 32KHz XTAL even though the "peripheral clock" is stopped (which just =
means you can't get to the registers).
>
> In reality, you have to assume the RTC counting source has already been s=
et up by u-boot, or from a past reboot, so I don't do any of that select co=
nfiguration at all.

it would still be good to have phandles to the external clock sources as we=
ll,
as that describes the hardware topology.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
