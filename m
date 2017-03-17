Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36307 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751031AbdCQN5w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2017 09:57:52 -0400
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB116586A6CF6082C2CF0341AD8A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
 <20170316175112.27913-4-chris.brandt@renesas.com> <CAMuHMdXAvMoLu5azcBfX5pH_KYApcYSipBktpbfLybvnCG+bwg@mail.gmail.com>
 <SG2PR06MB1165ECF439A79E31978ACF228A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdWm=4My_H-i-fNpXY9knSLpN+-zNarC5Xdq08kgvauM_w@mail.gmail.com> <SG2PR06MB116586A6CF6082C2CF0341AD8A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Mar 2017 14:57:21 +0100
Message-ID: <CAMuHMdX776kW12d4Sr7s_f4om5rwLTpF=gCTWZdN49ANLi-Q=Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: r7s72100: add rtc clock to device tree
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

On Fri, Mar 17, 2017 at 2:48 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Friday, March 17, 2017, Geert Uytterhoeven wrote:
>> So in the absence of an "rtc0" clock in the device node (you don't have
>> "clock-names" properties in the rtc devvice node yet), it will fall back
>> to clk_get_sys(), and will find the global "rtc0" clock. Unless you call
>> it "rtc"...
>>
>> Most drivers using a single clock just pass NULL instead of a name, so it
>> will match the first clock found.
>>
>> I think the simplest solution is to check if your device is instantiated
>> from DT (pdev->dev.of_node != NULL), and pass NULL (or "fck", when you add
>> multiple clocks to the DT bindings) to devm_clk_get() if that's the case.
>
> OK, so leave current SuperH code the way it is, but add the case for
> (pdev->dev.of_node != NULL) and do things the 'new way' so I can have
> an RTC clock name of "rtc".

Indeed.

> Question: Is your idea to add all the clocks (X1, X3, EXTAL), but put the
> first one as the peripheral clock (the one that runs the register interface 'p0')?

Which one is the peripheral clock doesn't matter if you use clock-names.
The convention is to use "fck" for the functional clock of the device.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
