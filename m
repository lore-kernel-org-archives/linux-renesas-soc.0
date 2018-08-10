Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40267 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727542AbeHJSYI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Aug 2018 14:24:08 -0400
Received: by mail-lf1-f67.google.com with SMTP id y200-v6so6918004lfd.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Aug 2018 08:53:42 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add CSI2/VIN support
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
 <758a8c87-272c-e861-4aab-01309cff2f84@cogentembedded.com>
 <20180809130854.65nvmnuuz6gffjjr@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <6032159b-ad2b-9a19-77f1-fc7a0ce3c5b0@cogentembedded.com>
Date: Fri, 10 Aug 2018 18:53:38 +0300
MIME-Version: 1.0
In-Reply-To: <20180809130854.65nvmnuuz6gffjjr@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/09/2018 04:08 PM, Simon Horman wrote:

>> Describe the CSI2 and VIN (and their interconnections) in the R8A77980
>> device tree.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> This patch is against the 'renesas-devel-20180802v2-v4.18-rc7' branch of
>> Simon Horman's 'renesas.git' repo.
>>
>> The R8A77980 CSI2/VIN DT binding updates have been posted earlier today...
>>
>>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |  374 ++++++++++++++++++++++++++++++
>>  1 file changed, 374 insertions(+)
>>
>> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>> ===================================================================
>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
[...]
>> @@ -769,6 +1065,84 @@
>>  			resets = <&cpg 603>;
>>  		};
>>  
>> +		csi40: csi2@feaa0000 {
>> +			compatible = "renesas,r8a77980-csi2";
>> +			reg = <0 0xfeaa0000 0 0x10000>;
>> +			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&cpg CPG_MOD 716>;
>> +			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>> +			resets = <&cpg 716>;
>> +			status = "disabled";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@1 {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					reg = <1>;
>> +
>> +					csi40vin0: endpoint@0 {
>> +						reg = <0>;
>> +						remote-endpoint = <&vin0csi40>;
>> +					};
>> +					csi40vin1: endpoint@1 {
>> +						reg = <1>;
>> +						remote-endpoint = <&vin1csi40>;
>> +					};
>> +					csi40vin2: endpoint@2 {
>> +						reg = <2>;
>> +						remote-endpoint = <&vin2csi40>;
>> +					};
>> +					csi40vin3: endpoint@3 {
>> +						reg = <3>;
>> +						remote-endpoint = <&vin3csi40>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		csi41: csi2@feab0000 {
>> +			compatible = "renesas,r8a77980-csi2";
>> +			reg = <0 0xfeab0000 0 0x10000>;
>> +			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
> 
> The use of GIC_SPI 246 for both csi40 and csi41 seems suspicious.
> Is this intentional?

    No, must be copy/paste artefact... Sorry about that, it should be 241 instead.

>> +			clocks = <&cpg CPG_MOD 716>;
> 
> Should this clock be 715 rather than 716?

   Yes, sure.

   I'm seeing this patch merged despite your remarks. Please either fix it up or
pull it out!

[...]

MBR, Sergei
