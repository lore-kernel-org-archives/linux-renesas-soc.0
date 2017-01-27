Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:32978 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754117AbdA0Hwx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 02:52:53 -0500
Received: by mail-io0-f172.google.com with SMTP id v96so55360431ioi.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2017 23:51:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB116597EAF28F1C5F2475DF158A760@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <SG2PR06MB116554401FE404334E924EE38A720@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdVaF=DpacHTV_T6nVcJMF-GfcRd3ybj-yagAy2nj_TeCw@mail.gmail.com>
 <SG2PR06MB1165A003EAAACA6C9771FA798A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdWn0C6W3Ueb9cYDUcXMnSZVRNn8pax+y7Zyy_P=1t2gGg@mail.gmail.com>
 <SG2PR06MB11654DEF72DE224D798D19D68A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdWeL21_OJkH4XVATxfYZwutWTTh7mfDLy=17d95RLC5Hg@mail.gmail.com> <SG2PR06MB116597EAF28F1C5F2475DF158A760@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Jan 2017 08:51:08 +0100
Message-ID: <CAMuHMdUoCNF034bs+wxNA-07LqaLziGg-QpLZjcUPGQbCGF3hw@mail.gmail.com>
Subject: Re: [RFC] Runtime PM on the RZ/A series is never going to work right
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Fri, Jan 27, 2017 at 4:05 AM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wednesday, January 25, 2017, Geert Uytterhoeven wrote:
>> >> I think you can handle that in drivers/clk/renesas/clk-mstp.c:
>> >>   - in cpg_mstp_attach_dev(), add a call to pm_clk_resume(dev) after
>> the
>> >>     call to pm_clk_add_clk(),
>> >>   - in cpg_mstp_detach_dev(), add a call to pm_clk_suspend(dev) before
>> the
>> >>     call to pm_clk_destroy().
>> >> Yes, that means the module clocks are enabled all the time.
>> >> Of course when running on RZ/A1H ;-)
>> >
>> > That might be OK.
>>
>> Forgot to mention: you should also no longer set GENPD_FLAG_PM_CLK in
>> cpg_mstp_add_clk_domain(). The flag won't hurt, it will just cause extra
>> code to be executed.
>
> So to be clear before I start hacking away, your suggestion here is
> to do this ONLY for RZ/A1 so I don't screw up any other SoCs, right?

Correct.

> For example:
>
> int cpg_mstp_attach_dev()
> {
>         ...
>
>         error = pm_clk_add_clk(dev, clk);
>         if (error) {
>                 dev_err(dev, "pm_clk_add_clk %pC failed %d\n", clk, error);
>                 goto fail_destroy;
>         }
>
> +       if (of_device_is_compatible(np, "renesas,r7s72100-mstp-clocks"))
> +               pm_clk_suspend(dev);

That should be pm_clk_resume(dev), as is this the attach function ;-)

And please drop GENPD_FLAG_PM_CLK on RZ/A1, too.

>         ...
> }
>
> Then, this would be OK to submit until I find some other way to do stable
> runtime pm for RZ/A1? (which might not be possible...unless I put in the
> silly delay)
>
> A that point, any peripheral I use (status="okay") will stay on, but the
> ones I don't use will stay off, correct?

Correct.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
