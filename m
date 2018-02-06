Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:42678 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752171AbeBFQlL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 11:41:11 -0500
Received: by mail-lf0-f68.google.com with SMTP id q17so3629901lfa.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Feb 2018 08:41:11 -0800 (PST)
Subject: Re: [PATCH 07/11] arm64: dts: renesas: r8a77980: add [H]SCIF support
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
 <169ed4ac-1b8b-cf8c-45c4-957ebbdf3f5e@cogentembedded.com>
 <CAMuHMdWXc=1s5rMU5Tc_=tH4jrH+5P6z52J3ihiyYfseTpQ-kw@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f440c853-d955-bba9-dc58-d7670f521a73@cogentembedded.com>
Date: Tue, 6 Feb 2018 19:41:07 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWXc=1s5rMU5Tc_=tH4jrH+5P6z52J3ihiyYfseTpQ-kw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/06/2018 02:58 PM, Geert Uytterhoeven wrote:

>> Describe [H]SCIF ports in the R8A77980 device tree.
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
> 
>> @@ -85,6 +92,150 @@
>>                         #power-domain-cells = <1>;
>>                 };
>>
>> +               hscif0: serial@e6540000 {
>> +                       compatible = "renesas,hscif-r8a77980",
>> +                                    "renesas,rcar-gen3-hscif",
>> +                                    "renesas,hscif";
>> +                       reg = <0 0xe6540000 0 0x60>;
>> +                       interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks = <&cpg CPG_MOD 520>,
>> +                                <&cpg CPG_CORE 16>,
> 
> Shouldn't this be 19 (S3D1) instead of 16 (S2D1)?

   Seems like that... at least after out chat. :-)

> With that fixed (for all (H)SCIF ports);

   The manual tells me SCKi for the SCIF ports should be the same S3D1.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 

MBR, Sergei
