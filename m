Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:44546 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751173AbdIMNC1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2017 09:02:27 -0400
Received: by mail-lf0-f43.google.com with SMTP id l196so435694lfl.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Sep 2017 06:02:26 -0700 (PDT)
Subject: Re: [PATCH 05/11] arm64: dts: renesas: initial R8A77970 SoC device
 tree
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Simon Horman <horms@verge.net.au>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
References: <20170912210523.663877115@cogentembedded.com>
 <CAMuHMdUzO_oHscsLntd0VaKAOCXU00MyidvZ_A-rR2+UHtKc9w@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c6b61146-615c-239a-49b5-a7814e51fb8e@cogentembedded.com>
Date: Wed, 13 Sep 2017 16:02:23 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUzO_oHscsLntd0VaKAOCXU00MyidvZ_A-rR2+UHtKc9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/13/2017 11:59 AM, Geert Uytterhoeven wrote:

>> The initial R8A77970 SoC device tree including Cortex-A53 CPU, GIC, timer,
>> CPG, RST, and SYSC.
>>
>> Based on the original (and large) patch by Daisuke Matsushita
>> <daisuke.matsushita.ns@hitachi.com>.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>>   arch/arm64/boot/dts/renesas/r8a77970.dtsi |  126 ++++++++++++++++++++++++++++++
>>   1 file changed, 126 insertions(+)
>>
>> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>> ===================================================================
>> --- /dev/null
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>> @@ -0,0 +1,126 @@
>> +/*
>> + * Device Tree Source for the r8a77970 SoC
>> + *
>> + * Copyright (C) 2016-2017 Renesas Electronics Corp.
>> + * Copyright (C) 2017 Cogent Embedded, Inc.
>> + *
>> + * This file is licensed under the terms of the GNU General Public License
>> + * version 2.  This program is licensed "as is" without any warranty of any
>> + * kind, whether express or implied.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> 
> arm-gic.h includes irq.h.

    I prefer to explicitly #include what's needed, so I'd leave this alone if 
you don't mind...

>> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
>> +#include <dt-bindings/power/r8a77970-sysc.h>
> 
> You can avoid the dependency on the above header, which will go upstream
> through a different branch, by hardcoding the power area indices for the
> initial submission, like you already did for the CPG core clocks.

    OK.

>> +
>> +/ {
>> +       compatible = "renesas,r8a77970";
>> +       #address-cells = <2>;
>> +       #size-cells = <2>;
>> +
>> +       psci {
>> +               compatible = "arm,psci-1.0";
> 
> PSCI 1.0 is backwards compatible with PSI 0.2:
> 
>      compatible = "arm,psci-1.0", "arm,psci-0.2";

    OK.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei
