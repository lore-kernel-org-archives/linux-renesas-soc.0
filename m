Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:38183 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750916AbdBWOH1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Feb 2017 09:07:27 -0500
Received: by mail-it0-f54.google.com with SMTP id y135so219671itc.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Feb 2017 06:07:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170217180734.GA25876@leverpostej>
References: <1487343849-32616-1-git-send-email-geert+renesas@glider.be> <20170217180734.GA25876@leverpostej>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Feb 2017 15:07:25 +0100
Message-ID: <CAMuHMdVt=RBETpLfB5jfLnZJOg9PFFtEpNfQctg5kCHguEsz+Q@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: r8a7795: Add Cortex-A53 CPU cores
To: Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Dirk Behme <dirk.behme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Mark,

On Fri, Feb 17, 2017 at 7:07 PM, Mark Rutland <mark.rutland@arm.com> wrote:
> On Fri, Feb 17, 2017 at 04:04:09PM +0100, Geert Uytterhoeven wrote:
>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>
>> This patch adds Cortex-A53 CPU cores to r8a7795 SoC for a total of 8
>> cores (4 x Cortex-A57 + 4 x Cortex-A53).
>
>>                       interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
>>                                    <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
>>                                    <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
>> -                                  <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
>> +                                  <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
>> +                                  <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
>> +                                  <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
>> +                                  <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
>> +                                  <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
>>                       interrupt-affinity = <&a57_0>,
>>                                            <&a57_1>,
>>                                            <&a57_2>,
>> -                                          <&a57_3>;
>> +                                          <&a57_3>,
>> +                                          <&a53_0>,
>> +                                          <&a53_1>,
>> +                                          <&a53_2>,
>> +                                          <&a53_3>;
>>               };
>
> This isn't quite right; the A53 cores should have a separate PMU node.
>
> The PMU hardware is different across microarchitectures, and they must
> be handled separately.

Oops, the original patch predated the evolution of "arm,armv8-pmuv3" into
separate "arm,cortex-a57-pmu" and "arm,cortex-a53-pmu".

Will fix...

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
