Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36419 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751304AbdAYIx0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 03:53:26 -0500
Received: by mail-io0-f194.google.com with SMTP id q20so1201754ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2017 00:53:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB11654DEF72DE224D798D19D68A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <SG2PR06MB116554401FE404334E924EE38A720@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdVaF=DpacHTV_T6nVcJMF-GfcRd3ybj-yagAy2nj_TeCw@mail.gmail.com>
 <SG2PR06MB1165A003EAAACA6C9771FA798A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdWn0C6W3Ueb9cYDUcXMnSZVRNn8pax+y7Zyy_P=1t2gGg@mail.gmail.com> <SG2PR06MB11654DEF72DE224D798D19D68A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Jan 2017 09:53:24 +0100
Message-ID: <CAMuHMdWeL21_OJkH4XVATxfYZwutWTTh7mfDLy=17d95RLC5Hg@mail.gmail.com>
Subject: Re: [RFC] Runtime PM on the RZ/A series is never going to work right
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Tue, Jan 24, 2017 at 5:22 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Tuesday, January 24, 2017, Geert Uytterhoeven wrote:
>> > From what I can tell, that makes the register space readable...but the
>> > IP block is not fully functional unless you delay a little.
>>
>> If you know the minimum delay needed, and it's not too long, it can be
>> added to the enable path.
>
> I can play around and see. I know udealy(100) works OK, but then I have
> to have a delay that's as long as the slowest peripheral.
> If it was just to turn a clock on once, or once in a while, that's OK. But
> it seems like runtime pm wants to turn the clocks on/off as much as
> possible.

That's not really true: depending on tuning and/or QoS parameters,
pm_runtime_put() may anticipate future use, and may decide not turn off the
clock immediately.
It may be worth looking into that, and to see how to relax that behavior
on RZ/A1.

>> > But, I think I'd like to disable runtime pm for RZ/A1 in the drivers
>> > for now Because 'functional' is better than 'lower-power-but-broken'
>>
>> I prefer not doing that in the individual drivers, as they're shared with
>> other SoCs.
>
> What I meant was looking at the compatible string and only doing
> it for RZ/A1.
>
> For example, in rspi_probe():
>
> if (of_device_is_compatible(np, " renesas,rspi-r7s72100"))
>         master->auto_runtime_pm = false;
> else
>         master->auto_runtime_pm = true;
>
>
> I would do the same kind of thing for riic.

That needs to be done in individual drivers, ugh...

>> I think you can handle that in drivers/clk/renesas/clk-mstp.c:
>>   - in cpg_mstp_attach_dev(), add a call to pm_clk_resume(dev) after the
>>     call to pm_clk_add_clk(),
>>   - in cpg_mstp_detach_dev(), add a call to pm_clk_suspend(dev) before the
>>     call to pm_clk_destroy().
>> Yes, that means the module clocks are enabled all the time.
>> Of course when running on RZ/A1H ;-)
>
> That might be OK.

Forgot to mention: you should also no longer set GENPD_FLAG_PM_CLK in
cpg_mstp_add_clk_domain(). The flag won't hurt, it will just cause extra
code to be executed.

> But won't the individual drivers still want to keep turning clocks on and off manually?
> (unless I'm not understanding that the underlying clock routines will basically just
> ignore everything). But even if that' the case...that just wasted CPU cycles (remember,
> I'm only working with a 400MHz single core here running XIP_KERNEL)

If a clock is already enabled, preparing and/or enabling it again will just
increase the prepare resp. enable counters. Disabling/unpreparing afterwards
will also just decrease the counters. Should be quite cheap.

> I think I should at least put the dummy read in cpg_mstp_clock_endisable() first,
> then maybe I can see what drivers work. Something like this:
>
>
>         spin_lock_irqsave(&group->lock, flags);
>
>         value = cpg_mstp_read(group, group->smstpcr);
>         if (enable)
>                 value &= ~bitmask;
>         else
>                 value |= bitmask;
>         cpg_mstp_write(group, value, group->smstpcr);
>
> +       if (!group->mstpsr) {
> +               /* dummy read to ensure write has completed */
> +               clk_readl(group->smstpcr);
> +               barrier_data(group->smstpcr);
> +       }
>
>         spin_unlock_irqrestore(&group->lock, flags);

Yes, that's a good first step.

The only other supported SoCs without[*] status registers are R-Car M1A
and H1. I believe they should handle the additional reads fine.

[*] On R-Car Gen1, some MSTP blocks have status registers, some don't.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
