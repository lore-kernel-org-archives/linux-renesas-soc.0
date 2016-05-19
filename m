Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33233 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753433AbcESRaS (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 19 May 2016 13:30:18 -0400
Received: by mail-lf0-f46.google.com with SMTP id y84so40255022lfc.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 May 2016 10:30:16 -0700 (PDT)
Subject: Re: [PATCH v3 2/6] ARM: dts: r8a7794: add MSTP5 clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <2378837.cigT3tNQPe@wasted.cogentembedded.com>
 <1576909.nm8MtQ2Ln5@wasted.cogentembedded.com>
 <CAMuHMdXaUNwOTQ7827+iTTfuRne_Z1F=-qgxu2cs07==AeqzCA@mail.gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Russell King <linux@arm.linux.org.uk>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <23a35d91-7ba3-be23-c8ee-5a056e6a627b@cogentembedded.com>
Date: Thu, 19 May 2016 20:30:12 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXaUNwOTQ7827+iTTfuRne_Z1F=-qgxu2cs07==AeqzCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/19/2016 07:25 PM, Geert Uytterhoeven wrote:

>> Add some MSTP5 clocks to the R8A7794 device tree.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> Changes in version 3:
>> - refreshed the patch.
>>
>> Changes in version 2:
>> - added "the" article to the change log.
>>
>>  arch/arm/boot/dts/r8a7794.dtsi            |    9 +++++++++
>>  include/dt-bindings/clock/r8a7794-clock.h |    1 +
>>  2 files changed, 10 insertions(+)
>>
>> Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
>> ===================================================================
>> --- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
>> +++ renesas/arch/arm/boot/dts/r8a7794.dtsi
>> @@ -1172,6 +1172,15 @@
>>                         clock-indices = <R8A7794_CLK_IRQC>;
>>                         clock-output-names = "irqc";
>>                 };
>> +               mstp5_clks: mstp5_clks@e6150144 {
>> +                       compatible = "renesas,r8a7794-mstp-clocks", "renesas,cpg-mstp-clocks";
>> +                       reg = <0 0xe6150144 0 4>, <0 0xe615003c 0 4>;
>> +                       clocks = <&hp_clk>, <&extal_clk>, <&p_clk>;
>> +                       #clock-cells = <1>;
>> +                       clock-indices = <R8A7794_CLK_AUDIO_DMAC0
>> +                                        R8A7794_CLK_THERMAL R8A7794_CLK_PWM>;
>> +                       clock-output-names = "audmac0", "thermal", "pwm";
>
> R-Car E2 does not have the thermal module.

    My "R-Car Series, 2nd Generation User’s Manual: Hardware, Rev.1.02 Oct 
2014" says it does. What's your source?

>> +               };
>>                 mstp7_clks: mstp7_clks@e615014c {
>>                         compatible = "renesas,r8a7794-mstp-clocks", "renesas,cpg-mstp-clocks";
>>                         reg = <0 0xe615014c 0 4>, <0 0xe61501c4 0 4>;
>> Index: renesas/include/dt-bindings/clock/r8a7794-clock.h
>> ===================================================================
>> --- renesas.orig/include/dt-bindings/clock/r8a7794-clock.h
>> +++ renesas/include/dt-bindings/clock/r8a7794-clock.h
>> @@ -67,6 +67,7 @@
>>  #define R8A7794_CLK_IRQC               7
>>
>>  /* MSTP5 */
>> +#define R8A7794_CLK_AUDIO_DMAC0                2
>>  #define R8A7794_CLK_THERMAL            22
>
> Hence R8A7794_CLK_THERMAL should be removed.

    Well, remove it then. ;-)

>>  #define R8A7794_CLK_PWM                        23
>
> Gr{oetje,eeting}s,

MBR, Sergei
