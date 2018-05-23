Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:33669 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754513AbeEWJFo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 05:05:44 -0400
Received: by mail-wr0-f196.google.com with SMTP id a15-v6so17765110wrm.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 May 2018 02:05:43 -0700 (PDT)
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77980: add GEther support
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <a4230699-e46f-0782-e3b1-22d58b9033c8@cogentembedded.com>
 <8910c197-cf1b-9ee9-9ddb-5d2f705a4b26@cogentembedded.com>
 <CAMuHMdW9UzOGV_zh3NxugYrj0j0qszX+NFoZtFvZRD9CNMHt+w@mail.gmail.com>
 <bdbfd13e-cf0c-e19a-b76f-5e8e024dca26@cogentembedded.com>
 <20180523084100.ynv3zoqrikcxem5f@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9f2c6e9b-a6a9-97f1-7899-3635230acd6f@cogentembedded.com>
Date: Wed, 23 May 2018 12:05:30 +0300
MIME-Version: 1.0
In-Reply-To: <20180523084100.ynv3zoqrikcxem5f@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 5/23/2018 11:41 AM, Simon Horman wrote:

>>>> Define the generic R8A77980 part of the GEther device node.
>>>>
>>>> Based on the original (and large) patch by Vladimir Barinov.
>>>>
>>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> Thanks for your patch!
>>>
>>> With the below addressed:
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>>     Thanks!
>>
>>>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>>>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>>>> @@ -417,6 +417,17 @@
>>>>                          dma-channels = <16>;
>>>>                  };
>>>>
>>>> +               gether: ethernet@e7400000 {
>>>> +                       compatible = "renesas,gether-r8a77980";
>>>> +                       reg = <0 0xe7400000 0 0x1000>;
>>>> +                       interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
>>>> +                       clocks = <&cpg CPG_MOD 813>;
>>>> +                       power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>>>
>>> resets = <&cpg 813>;
>>
>>     As usual...
>>
>>>
>>>> +                       #address-cells = <1>;
>>>> +                       #size-cells = <0>;
>>>> +                       status = "disabled";
>>>
>>> Any default phy-mode needed?
>>
>>     A default "phy-mode" IMO make sense when the MAC supports a single
>> PHY interface mode. In this case, both RMII and RGMII are supported, so
>> I coulsn't choose a default...
> 
> I would think making an arbitrary choice is better than no choice.
> How does the driver behave in the absence of a default?

    The board DT *must* assign some "phy-mode" -- it's a required prop.
    In this particular case, iff the mode is still unspecified, the driver 
will select the MII mode for the RMII_MII reg (which is a reserved value for 
this GEther)...

[...]

MBR, Sergei
