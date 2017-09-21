Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:48723 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750790AbdIUQD2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2017 12:03:28 -0400
Received: by mail-lf0-f54.google.com with SMTP id q132so6239239lfe.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2017 09:03:27 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] arm64: dts: renesas: eagle: add EtherAVB support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
References: <20170915194449.538504992@cogentembedded.com>
 <CAMuHMdXQXFuVzwW7G-U7XWZUEj8qFRjtfDQF1+TgyzO0Xb+eYg@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c0390fc1-7da4-ac60-afee-97126d1fd372@cogentembedded.com>
Date: Thu, 21 Sep 2017 19:03:26 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXQXFuVzwW7G-U7XWZUEj8qFRjtfDQF1+TgyzO0Xb+eYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 9/21/2017 4:08 PM, Geert Uytterhoeven wrote:

>> Define the Eagle board  dependent part of the EtherAVB device node.
>> Enable DHCP  and NFS root for the kernel booting.
>>
>> Based  on the original (and large) patch by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
[...]
>> @@ -43,3 +44,14 @@
>>   &scif0 {
>>          status = "okay";
>>   };
>> +
>> +&avb {
>> +       renesas,no-ether-link;
>> +       phy-handle = <&phy0>;
>> +       status = "okay";
>> +
>> +       phy0: ethernet-phy@0 {
>> +               rxc-skew-ps = <1500>;
>> +               reg = <0>;
> 
> Any specific reason why you don't want to wire up the interrupt?
> 
>                  interrupt-parent = <&gpio2>;

    I thought it's quite obvious -- we don't have GPIOs yet, and GPIOs seem to 
require PFC.

>                  interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> 
>> +       };
>> +};
> 
> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei
