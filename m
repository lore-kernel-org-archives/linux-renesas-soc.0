Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:37747 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754386AbeEHSrO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 May 2018 14:47:14 -0400
Received: by mail-lf0-f67.google.com with SMTP id r2-v6so11235416lff.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 May 2018 11:47:13 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: add SMP support
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
 <54dbd1d2-8279-5073-cffb-c647fba91e42@cogentembedded.com>
 <CAMuHMdUqVVWz0jLb2Vmrkk3BQBsYVsCOW1zsaPUi8o6jr_mojQ@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <db136ee6-4ce6-756e-743d-3342b2e65f2b@cogentembedded.com>
Date: Tue, 8 May 2018 21:47:10 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUqVVWz0jLb2Vmrkk3BQBsYVsCOW1zsaPUi8o6jr_mojQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/08/2018 09:40 PM, Geert Uytterhoeven wrote:

>> Add the device node for the second Cortex-A53 CPU core.
>>
>> Based on the original (and large) patch by Daisuke Matsushita
>> <daisuke.matsushita.ns@hitachi.com>.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Dupe of https://patchwork.kernel.org/patch/10032875/

   Sorry!
   Not an exact dupe, though -- mine has clock/power #define's used,
yours -- only bare #s. :-)

> From series "[PATCH 0/2] arm64: dts: renesas: r8a77970: Add SMP Support"
> (https://www.spinics.net/lists/linux-renesas-soc/msg19681.html)

   Hmm... what's the fate of this series?

>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>> @@ -41,6 +41,16 @@
>>                         enable-method = "psci";
>>                 };
>>
>> +               a53_1: cpu@1 {
>> +                       device_type = "cpu";
>> +                       compatible = "arm,cortex-a53","arm,armv8";
> 
> Missing space after the comma.

   Oops. :-)

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
