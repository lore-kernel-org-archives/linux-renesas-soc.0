Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:41746 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752373AbeESRiS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 May 2018 13:38:18 -0400
Received: by mail-lf0-f66.google.com with SMTP id m17-v6so18385498lfj.8
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 May 2018 10:38:17 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add SMP support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
 <ec4c6905-23d1-8600-a1cc-4297fbd1ddaa@cogentembedded.com>
 <CAMuHMdU9JXvN2GLFGLZGeNOpZ9AdJYokbpTqt-Wy97-Z0tXaCA@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <ec73ce6d-f062-6c4f-d6fa-b99ef6c6bc67@cogentembedded.com>
Date: Sat, 19 May 2018 20:38:13 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU9JXvN2GLFGLZGeNOpZ9AdJYokbpTqt-Wy97-Z0tXaCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/17/2018 11:23 PM, Geert Uytterhoeven wrote:

>> Add the device nodes for 3 more Cortex-A53 CPU cores; adjust the interrupt
>> delivery masks for the ARM GIC and Architectured Timer.
>>
>> Based on the original (and large) patch by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks for your patch!
> 
>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>> @@ -30,6 +30,36 @@
>>                         enable-method = "psci";
>>                 };
>>
>> +               a53_1: cpu@1 {
>> +                       device_type = "cpu";
>> +                       compatible = "arm,cortex-a53","arm,armv8";
> 
> Please stop copying spaceless lists ;-)

   Oops! Simon, do I need to re-post?

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
