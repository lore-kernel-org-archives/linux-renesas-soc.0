Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:35864 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750947AbdAXOkT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2017 09:40:19 -0500
Received: by mail-it0-f41.google.com with SMTP id c7so86763640itd.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2017 06:40:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB1165A003EAAACA6C9771FA798A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <SG2PR06MB116554401FE404334E924EE38A720@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdVaF=DpacHTV_T6nVcJMF-GfcRd3ybj-yagAy2nj_TeCw@mail.gmail.com> <SG2PR06MB1165A003EAAACA6C9771FA798A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jan 2017 15:40:17 +0100
Message-ID: <CAMuHMdWn0C6W3Ueb9cYDUcXMnSZVRNn8pax+y7Zyy_P=1t2gGg@mail.gmail.com>
Subject: Re: [RFC] Runtime PM on the RZ/A series is never going to work right
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Tue, Jan 24, 2017 at 3:20 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Tuesday, January 24, 2017, Geert Uytterhoeven wrote:
>> > Therefore, before I start firing off patches to remove runtime PM for
>> RZ/A, does anyone have an opinion one way of the other????
>>
>> Please have a look at Section 55.3.5 ("Module Standby Function"), which I
>> had never read myself, apparently...
>>
>> Seem like there is some kind of status register, the STBCR register
>> itself:
>>
>>     Canceling Module Standby Function:
>>         1. Clear the MSTP bit to 0.
>>         2. After that, dummy-read the same register.
>>
>> Does it help if you add the dummy read when enabling the clock?
>
> Already tried that. And put a barrier() call just to make sure
> everything was done.
> It seems that might be enough for the RSPI, but the RIIC still has issues.

:-(

> From what I can tell, that makes the register space readable...but the IP block
> is not fully functional unless you delay a little.

If you know the minimum delay needed, and it's not too long, it can be
added to the enable path.

>> However, that section reveals another complicating factor for some
>> modules:
>> if the module has a bit in a STBREQn/STBACKn register, a module standy
>> request must be sent to the module before stopping the module clock.
>>
>> Looks like you're gonna need a whole new RZ/A1-specific clock driver to
>> handle all those details...
>
> There are only a couple IP blocks called out in the STBREQn/STBACKn registers,
> and I think they are not really crucial for runtime pm (Ethenret, LCD,
> Coresight, etc..).
> So in my opinion it's not worth a new driver just yet.

OK.

> But, I think I'd like to disable runtime pm for RZ/A1 in the drivers for now
> Because 'functional' is better than 'lower-power-but-broken'

I prefer not doing that in the individual drivers, as they're shared
with other SoCs.

I think you can handle that in drivers/clk/renesas/clk-mstp.c:
  - in cpg_mstp_attach_dev(), add a call to pm_clk_resume(dev) after the
    call to pm_clk_add_clk(),
  - in cpg_mstp_detach_dev(), add a call to pm_clk_suspend(dev) before the
    call to pm_clk_destroy().
Yes, that means the module clocks are enabled all the time.
Of course when running on RZ/A1H ;-)

Good luck!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
