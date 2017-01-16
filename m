Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36789 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750849AbdAPKaV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2017 05:30:21 -0500
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB1165BA49D82D9C0835DC0FB38A7B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170112185952.2780-1-chris.brandt@renesas.com>
 <20170112185952.2780-2-chris.brandt@renesas.com> <CAMuHMdX_hx2M8Q4y7gptJvad4cbb+M54DZVCmbhunKuk4esbGA@mail.gmail.com>
 <SG2PR06MB1165BA49D82D9C0835DC0FB38A7B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jan 2017 11:30:19 +0100
Message-ID: <CAMuHMdVC2BV6=jT1CZ+X92=_th-cEc0=hsiyRYxU5qMLoMVPMw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: document renesas-ostm timer
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Sat, Jan 14, 2017 at 4:30 AM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Friday, January 13, 2017, Geert Uytterhoeven wrote:
>> > +The OSTM comes with 2 independent channels.
>> > +We will use the first channel (OSTM0) as a free running clocksource
>> > +and the second channel (OSTM1) as a interrupt driven clock event.
>> > +
>> > +Additionally we will use the clocksource channel (OTSM0) for the
>> > +system schedule timer sched_clock().
>>
>> The above two sentences are software policy, not hardware description.
>> Hence they do not belong in the DT bindings document.
>> You can move them to the commit description, though.
>
> OK.
>
>> > +Required Properties:
>> > +
>> > +  - compatible: must be one or more of the following:
>> > +    - "renesas,ostm-r7s72100" for the r7s72100 OSTM
>>
>> Please use "renesas,r7s72100-ostm" instead, to match current practices.
>
> If I look at the current r7s72100.dtsi:
>
> compatible = "renesas,r7s72100-cpg-clocks", "renesas,rz-cpg-clocks";
> compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
> compatible = "renesas,scif-r7s72100", "renesas,scif";
> compatible = "renesas,rspi-r7s72100", "renesas,rspi-rz";
> compatible = "renesas,riic-r7s72100", "renesas,riic-rz";
> compatible = "renesas,mtu2-r7s72100", "renesas,mtu2";
> compatible = "renesas,mmcif-r7s72100", "renesas,sh-mmcif";
> compatible = "renesas,sdhi-r7s72100";
>
> Is "renesas,xxx-r7s7210" the old way, and "renesas,r7s72100-xxx" is the new way??

Yes, we settled on "<vendor>,<family|soc>-<device>", per request of the
DT maintainers.

>> > +  - reg: base address and length of the registers block for each timer
>> channel.
>> > +    There should be 2 sets of addresses, one for each channel.
>> > +
>> > +  - interrupts: interrupt specifiers for the timers. There should be 2
>> > +    interupts, one for each channel.
>> > +
>> > +  - clocks: a list of phandle + clock-specifier pairs, one for each
>> entry
>> > +    channel. There should be 2 sets, one for each channel.
>>
>> Are the channels truly independent? If yes, I think it's better to have
>> two separate device nodes, one for each channel.
>> Each channel has its own module clock, so using separate devices means
>> Runtime PM can manage both channels through their module clocks as soon as
>> you add a "power-domains" property pointing to the clock domain controller.
>
> Yes, technically they are independent channels.
> The way the driver is currently written, 1 instance of the driver uses 2 channels
> for different things. Ch0 will be set up as a 'clocksource', and ch1 will be set up
> as a 'clock event'.
>
> As in:
>
> static int __init ostm_timer_init(struct ostm_device *ostm)
> {
>         int ret = 0;
>
>         /* ostm0 will be clock source */
>         ret = ostm_init_clksrc(ostm);
>         if (ret)
>                 goto err;
>
>         /* use ostm0 as system scheduling clock */
>         ret = ostm_init_sched_clock(&ostm->clksrc);
>         if (ret)
>                 goto err;
>
>         /* ostm1 will be clock event */
>         ret = ostm_init_clkevt(ostm);
> err:
>         return ret;
> }
>
>
>
> Do you think it would be better if a driver instance only does 1 thing: Either
> 'clocksource' or 'clock event'??
> Then, I would make 2 ostm nodes and pass in the mode I would like it operate in?
>
> For example:
>
> &ostm0 {
>         mode = "clocksource";
>         status = "okay";
> };
>
> &ostm1 {
>         mode = "clock-event";
>         status = "okay";
> };

Again, that's software policy, not hardware description.

As they're independent channels, it doesn't matter which one is used for
which function, right?

You could use the first probed channel for the most important function
(clocksource?), and the second one for the other function (clockevent).
So there's no need for specifying this in DT.

Does that make sense?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
