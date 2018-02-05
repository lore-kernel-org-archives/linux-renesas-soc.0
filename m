Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:39509 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753102AbeBENsR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 08:48:17 -0500
Received: by mail-lf0-f67.google.com with SMTP id w27so41814231lfd.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Feb 2018 05:48:16 -0800 (PST)
Subject: Re: [PATCH 05/11] arm64: dts: renesas: initial R8A77980 SoC device
 tree
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Simon Horman <horms@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
 <32142684-d5cf-035f-8401-86a36dcbafd6@cogentembedded.com>
 <CAMuHMdWad2OJ33Hu0KbYS3nLWhgmj81_wRbtwApw-N81q3+nsA@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <ad83625d-c166-cacb-eae2-a6d64f7d2b26@cogentembedded.com>
Date: Mon, 5 Feb 2018 16:48:17 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWad2OJ33Hu0KbYS3nLWhgmj81_wRbtwApw-N81q3+nsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2/5/2018 4:32 PM, Geert Uytterhoeven wrote:

>> The initial R8A77980 SoC device tree including Cortex-A53 CPU, GIC, timer,
>> CPG, RST, and SYSC.
>>
>> Based on the original (and large) patch by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks for your patch!
> 
>> --- /dev/null
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>> @@ -0,0 +1,122 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Device Tree Source for the r8a77980 SoC
>> + *
>> + * Copyright (C) 2018 Renesas Electronics Corp.
>> + * Copyright (C) 2018 Cogent Embedded, Inc.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> 
> I think you want to leave out the above #include, as it will go upstream
> through a different path (you're already using hardcoded clock numbers,
> assuming the same).

    I still need CPG_{CORE|MOD}.

> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

    Sorry, I don't see anything worth fixing...

> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei
