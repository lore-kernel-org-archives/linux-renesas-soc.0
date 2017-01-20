Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34820 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751377AbdATHrQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 02:47:16 -0500
Received: by mail-it0-f67.google.com with SMTP id 203so2080304ith.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jan 2017 23:47:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB1165363B59CF40FBE591F74A8A710@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170112185952.2780-1-chris.brandt@renesas.com>
 <20170112185952.2780-2-chris.brandt@renesas.com> <CAMuHMdX_hx2M8Q4y7gptJvad4cbb+M54DZVCmbhunKuk4esbGA@mail.gmail.com>
 <SG2PR06MB1165BA49D82D9C0835DC0FB38A7B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdVC2BV6=jT1CZ+X92=_th-cEc0=hsiyRYxU5qMLoMVPMw@mail.gmail.com> <SG2PR06MB1165363B59CF40FBE591F74A8A710@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Jan 2017 08:47:14 +0100
Message-ID: <CAMuHMdVJehAvxFMcKCp896gonc-TtAomDSFDfmuyEL8-i31hBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: document renesas-ostm timer
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Fri, Jan 20, 2017 at 4:56 AM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Monday, January 16, 2017, Geert Uytterhoeven wrote:
>> As they're independent channels, it doesn't matter which one is used for
>> which function, right?
>>
>> You could use the first probed channel for the most important function
>> (clocksource?), and the second one for the other function (clockevent).
>> So there's no need for specifying this in DT.
>>
>> Does that make sense?
>
> So I changed the driver, and it works good. I now have 2 independent nodes
> in the DT. The first one becomes a clocksource, and anything after that is
> a clockevent.
>
>
>
> If you don't mind, I have a couple clock questions before I submit V2 of
> my patch series.
>
>
> You can see that the resolution of time keeping is better with OSTM as
> opposed to the default MTU2:
>
> MTU2:
> [    0.000000] sh_mtu2 fcff0000.timer: ch0: used for clock events
> [    0.000000] sh_mtu2 fcff0000.timer: ch0: used for periodic clock events
> [    0.260000] NET: Registered protocol family 2
> [    0.270000] TCP established hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.270000] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.280000] TCP: Hash tables configured (established 1024 bind 1024)
> [    0.290000] UDP hash table entries: 256 (order: 0, 4096 bytes)
> [    0.300000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
> [    0.300000] NET: Registered protocol family 1
> [    0.320000] RPC: Registered named UNIX socket transport module.
> [    0.320000] RPC: Registered udp transport module.
> [    0.330000] RPC: Registered tcp transport module.
> [    0.330000] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    0.350000] futex hash table entries: 256 (order: -1, 3072 bytes)
> [    0.370000] workingset: timestamp_bits=30 max_order=13 bucket_order=0
> [    0.380000] squashfs: version 4.0 (2009/01/31) Phillip Lougher
>
>
> OSTM:
> [    0.000000] sh_mtu2 fcff0000.timer: ch0: used for clock events
> [    0.000000] sh_mtu2 fcff0000.timer: ch0: used for periodic clock events
> [    0.000000] clocksource: ostm: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 57352151442 ns
> [    0.010071] sched_clock: 32 bits at 33MHz, resolution 30ns, wraps every 64440619504ns
> [    0.018536] ostm fcfec000.ostm: used for clocksource
> [    0.025272] ostm fcfec400.ostm: used for clock events
> [    0.052944] sh_mtu2 fcff0000.timer: PM domain cpg_clocks will not be powered off
> [    0.079591] clocksource: Switched to clocksource ostm
> [    0.333650] NET: Registered protocol family 2
> [    0.342142] TCP established hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.349994] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.356885] TCP: Hash tables configured (established 1024 bind 1024)
> [    0.364618] UDP hash table entries: 256 (order: 0, 4096 bytes)
> [    0.371175] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
> [    0.378885] NET: Registered protocol family 1
> [    0.389405] RPC: Registered named UNIX socket transport module.
> [    0.396103] RPC: Registered udp transport module.
> [    0.401092] RPC: Registered tcp transport module.
> [    0.406201] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    0.421042] futex hash table entries: 256 (order: -1, 3072 bytes)
> [    0.441390] workingset: timestamp_bits=30 max_order=13 bucket_order=0
> [    0.451111] squashfs: version 4.0 (2009/01/31) Phillip Lougher

Good!

It takes longer to boot, though. I guess due to more kernel output?

> My questions:
>
> #1.
> Early in boot, I see this:
>
> [    0.000000] clocksource_probe: no matching clocksources found
> [    0.000000] sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every 21474836475000000ns
>
> So how am I supposed to enable earlytimer? (MTU2 or OSTM)?
>
> I see from this commit that you've been changing things around:
>   https://patchwork.kernel.org/patch/6943101/
>
>
>
> #2.
> Now I have mtu2 and ostm for clocksource and clockevents, but OSTM has a much
> better resolution, so in a real system, would I just remove the mtu2 node in
> the board's DT file? (r7s72100-rskrza1.dts)
>
> Basically, it just sits there because I assume the kernel will always go for
> the higher rated clock.

Sorry, I'm no timer expert.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
