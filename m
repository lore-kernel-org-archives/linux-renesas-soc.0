Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34155 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934344AbdCJLTK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 06:19:10 -0500
Received: by mail-io0-f195.google.com with SMTP id n76so6633299ioe.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2017 03:19:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170310092159.GE21820@verge.net.au>
References: <1488819491-26097-1-git-send-email-geert+renesas@glider.be> <20170310092159.GE21820@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Mar 2017 12:19:07 +0100
Message-ID: <CAMuHMdVmd5+QW00XRL4qzO85RrCsu_7Bu15ah1rcFZ=eGgDSug@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] ARM: dts: renesas: Add INTC-SYS clock to device tree
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Mar 10, 2017 at 10:21 AM, Simon Horman <horms@verge.net.au> wrote:
> On Mon, Mar 06, 2017 at 05:58:05PM +0100, Geert Uytterhoeven wrote:
>> This patch series improves the topology description in DT of the ARM GIC
>> on Renesas SoCs using the legacy CPG/MSTP bindings (R-Mobile APE6 and
>> R-Car Gen2).  It describes the INTC-SYS clock, links the GIC to its
>> module clock, and adds the GIC to the SYSC "always on" PM Domain.
>>
>> Note that currently the GIC-400 driver doesn't support module clocks nor
>> Runtime PM, so this must be handled as a critical clock.  Hence this
>> series depends on commit e34084fb9a023d1d ("clk: renesas: mstp: Make
>> INTC-SYS a critical clock"), which is in v4.11-rc1.
>>
>> This series is the counterpart of "[PATCH 0/4] ARM/arm64: dts: renesas:
>> Link ARM GIC to clock and clock domain" for SoCs not yet migrated to the
>> new CPG/MSSR driver.  The latter is already part of v4.11-rc1 as it had
>> less dependencies.
>>
>> Changes compared to v1:
>>   - Add missing "power-domains" property,
>>   - Add clock-names property,
>>   - Rebased on top of CPG Clock Domain and R-Car SYSC PM Domain support,
>>   - Add r8a7792 patch,
>>   - Please refer to the individual patch changelogs for more details
>>     (v1 dates back to 2014).
>>
>> Thanks for applying!
>
> Thanks, done.

Thanks, but it seems you forgot "ARM: dts: r8a7793: Add INTC-SYS clock to
device tree"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
