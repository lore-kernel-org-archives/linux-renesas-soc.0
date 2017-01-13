Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36111 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751841AbdAMPK4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jan 2017 10:10:56 -0500
MIME-Version: 1.0
In-Reply-To: <PS1PR06MB116243F531726538252C2BAE8A780@PS1PR06MB1162.apcprd06.prod.outlook.com>
References: <20170112181149.29035-1-chris.brandt@renesas.com>
 <CAMuHMdUz6nb-STMQK39hDqwHRt4R5t+Lndj150Lkg7prN=HQZQ@mail.gmail.com> <PS1PR06MB116243F531726538252C2BAE8A780@PS1PR06MB1162.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2017 16:10:54 +0100
Message-ID: <CAMuHMdVkTS21UnZA9OyEZ=mR5+GtAEbiLwpe=uKB_O6deXBPyw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r7s72100: fix sdhi clock define
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Fri, Jan 13, 2017 at 3:44 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Thursday, January 12, 2017, Geert Uytterhoeven wrote:
>> This is strange. There are two SDHI channels, but the STBCR12
>> documentation (all versions up to rev. 3.00) says the register has MSTP
>> bits for four SD host interfaces?
>>
>> Can you please enlighten me? Thanks!
>
> If you look in the rev 3.00 manual for RZ/A1H, in section
> "50.3.2 Card Detect/Write Protect", it says:
>
> * Power-Down mode at Card removal
>   SD Host Interface module is halted by the MSTP123 bit to MSTP120 bit in Standby Control Register 12
>   (STBCR12). If these bits of each channel in STBCR12 are set to 10, low power consumption is achieved at Card
>   removal. See section 55, Power-Down Modes
>
>
> So, there are 2 clock sources for each SDHI channel, and the setting
> Options are:
>   SD Host Interface 0 Module Stop
>   00: SD Host Interface 0 Module runs.
>   01: Setting prohibited.
>   10: Only card detect block in SD Host Interface 0 Module runs.
>   11: Clock supply to SD Host Interface 0 Module is halted

So typically you want to use 10 when idle, and 00 when active.

> Previously I've been running with '00' because I was turning EVERYTHING on
> in u-boot.
> Yesterday, I tested with just '10' and things seem to work OK
> for me.
>
> Since the sh_mobile_sdhi/tmio driver only allows for 1 clock per channel,
> '10' is my only choice for the DT.
>
> However, looking at a previous BSP for RZ/A1, the driver
> arch/arm/mach-shmobile/clock-r7s72100.c had this:
>
>
> static struct clk mstp_clks[MSTP_NR] = {
>         [MSTP123] = SH_CLK_MSTP8(&peripheral1_clk, STBCR12, 3, 0), /* SDHI00 */
>         [MSTP122] = SH_CLK_MSTP8(&peripheral1_clk, STBCR12, 2,
>                         CLK_ENABLE_ON_INIT),                       /* SDHI01 */
>         [MSTP121] = SH_CLK_MSTP8(&peripheral1_clk, STBCR12, 1, 0), /* SDHI10 */
>         [MSTP120] = SH_CLK_MSTP8(&peripheral1_clk, STBCR12, 0,
>                 CLK_ENABLE_ON_INIT),                               /* SDHI11 */
>
>
> But...that would make me think on boot it would be set to '01' (setting prohibited).

Yeah, running with enabled SDHI core and disabled card detect sounds silly.

> I'm going to try and find if "setting prohibited" really just means:
> "you can set it this way...but nothing is really going to work unless you
> enable the other clock".
>
> If that is the case, is there a DT equivalent to "CLK_ENABLE_ON_INIT" that
> I can do for MSTP120(SDHI11) and MSTP120(SDHI01) so they are both cleared
> on boot???

No there isn't. That's another reason why a full-fledged clock driver with
tables in C is a better idea than trying to describe all clocks in DT.
The new CPG/MSSR based driver (renesas-cpg-mssr.c) supports "critical
module clocks" through CLK_ENABLE_HAND_OFF. Unfortunately that flag hasn't
made it upstream, so I really should convert the driver to use the new
CLK_IS_CRITICAL instead...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
