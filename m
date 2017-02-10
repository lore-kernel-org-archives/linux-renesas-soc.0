Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33962 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752090AbdBJPla (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2017 10:41:30 -0500
Received: by mail-io0-f195.google.com with SMTP id c80so6110379iod.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2017 07:40:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB11657431F033ABBDE1D750F38A440@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170209191259.29774-1-chris.brandt@renesas.com>
 <CAMuHMdVhbpfsLEn3Ke5f93AhaOnS4TSJC+QpY8xdtT1MNejVJA@mail.gmail.com> <SG2PR06MB11657431F033ABBDE1D750F38A440@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Feb 2017 16:32:20 +0100
Message-ID: <CAMuHMdXp-V393uR_-vhDSZyiXTD-+WxeNuchAK89YNKz+yPWdg@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: r7s72100: add restart handler
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Fri, Feb 10, 2017 at 3:59 PM, Chris Brandt <Chris.Brandt@renesas.com> wr=
ote:
> On Friday, February 10, 2017, Geert Uytterhoeven wrote:
>> >  static const char *const r7s72100_boards_compat_dt[] __initconst =3D =
{
>> >         "renesas,r7s72100",
>> >         NULL,
>> > @@ -29,4 +58,5 @@ DT_MACHINE_START(R7S72100_DT, "Generic R7S72100
>> (Flattened Device Tree)")
>> >         .init_early     =3D shmobile_init_delay,
>> >         .init_late      =3D shmobile_init_late,
>> >         .dt_compat      =3D r7s72100_boards_compat_dt,
>> > +       .restart        =3D r7s72100_restart,
>> >  MACHINE_END
>>
>> Perhaps unsurprisingly, I'd recommend writing a watchdog driver instead.
>> drivers/watchdog/renesas_wdt.c (currently supporting R-Car Gen3 only) ma=
y
>> serve as an example.
>
> Why do you guys always make things more difficult for me... ;)
>
> To be clear, you are recommending I make a WDT timer driver (and not
> use .restart) and that will reset the system?
>
> Or, make a WDT driver just so I can steal the base address?

I meant a WDT timer driver. If the watchdog driver provides a .restart
callback, it will be used for system reset (hmm, renesas_wdt.c no longer ha=
s
the .restart callback, as per arm64 "system reset must be implemented using
PSCI"-policy).

> Note that the WDT timeout for the RZ/A1 is too short in my opinion, so
> it's really only good for resetting the system.

Hmm... max. 125 ms is indeed not much.

Alternatively, you can write a restart driver (cfr.
drivers/power/reset/rmobile-reset.c) that binds against a
"renesas,r7s72100-wdt" device node, but doesn't implement watchdog
functionality.
You're gonna need DT bindings anyway.

>> From an earlier discussion during development of that driver:
>>
>> | The RWDT exists on various Renesas SoCs.
>> | From digging into the datasheets, I had discovered two variants a whil=
e
>> go:
>> |   1. 32-bit registers
>> |        a. R-Car Gen2: using RST for restarting
>> |        b. R-Mobile APE6: using SYSC for restarting
>> |   2. 8-bit registers (SH-Mobile AP4/AG5, R-Mobile A1)
>> |
>> | The differences are small: the variant with 8-bit registers has a
>> | smaller maximum timeout, and no magic value to be stored in the upper
>> bits.
>> |
>> | Wolfram discovered the third variant in RZ/A1H, which differs in
>> | register layout.
>>
>> IIRC, apart from the different register layout, actual operation on RZ/A=
1H
>> is similar to other Renesas SoCs.  Depending on the differences, you may
>> decide to write a new driver instead, though.
>
> More or less they all do the same thing (all only have 3 registers).
> I guess the decision comes down to since the file name is already
> "renesas_wdt.c", do we just make the 1 file work for all Renesas SoC
> and not add yet another file.
> It is only 3 registers we're talking about...it's not like it's going
> to turn into another sh_pfc.c file.
>
> Question: R-Car Gen 3 has 3 watchdog timers:
>  1. RCLK watchdog timer (RWDT)
>  2. Window Watchdog Timer (WWDT)

The WWDT does not exist on R-Car H3 and M3-W ;-)

>  3. System Watchdog
>
> #1 and #3 look like they are the same thing (except #3 is enabled on powe=
r
> on reset). The renesas_wdt.c uses the register names from #1.
> Is the idea that you only use #3 to make sure your systems boots and get =
into
> Linux, then from there you use #1 and stop #3 (hence no driver is needed)=
?

Isn't the SRWDT restricted to secure mode?

> I don=E2=80=99t see the point of having an "overflow interrupt" enabled i=
f the system
> is going to reset regardless.

?

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
