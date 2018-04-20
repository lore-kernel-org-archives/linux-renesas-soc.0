Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: condor: add eMMC support
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <611daf1f-42a2-d463-0814-ebf762871018@cogentembedded.com>
 <309b5211-bab6-53de-b8a8-6e1049e1705e@cogentembedded.com>
 <20180420100313.4cmngxeibpc2r3h2@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d3cc9e96-2351-348e-9577-f0fadfd0d6c9@cogentembedded.com>
Date: Fri, 20 Apr 2018 21:51:06 +0300
MIME-Version: 1.0
In-Reply-To: <20180420100313.4cmngxeibpc2r3h2@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/20/2018 01:03 PM, Simon Horman wrote:

>> Define the Condor board dependent part of the MMC0 (connected to eMMC chip)
>> device node along with the necessary voltage regulators...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>>  arch/arm64/boot/dts/renesas/r8a77980-condor.dts |   43 ++++++++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>
>> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
>> ===================================================================
>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
>> @@ -27,6 +27,24 @@
>>  		/* first 128MB is reserved for secure area. */
>>  		reg = <0 0x48000000 0 0x78000000>;
>>  	};
>> +
>> +	d3_3v: regulator-0 {
> 
> Please use reg_3p3v: regulator1 for consistency with salvator-common.dtsi

   Hm, not sure why I have to copy what I consider a bad example... the SoCs are
not pin compatible anyway. 

>> +		compatible = "regulator-fixed";
>> +		regulator-name = "D3.3V";
> 
> And "fixed-3.3V"

   Ugh. That's pretty poor name I think. My names do correspond to the schematics
and these only muddle things up, I think...

[...]
>> @@ -70,6 +101,18 @@
>>  		function = "avb";
>>  	};
>>  
>> +	mmc_1_8v_pins: mmc_1_8v {
>> +		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
>> +		function = "mmc";
>> +		power-source = <1800>;
>> +	};
>> +
>> +	mmc_3_3v_pins: mmc_3_3v {
>> +		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
>> +		function = "mmc";
>> +		power-source = <3300>;
>> +	};
> 
> Again please make this more consistent with salvator-common.dtsi.

   Ah, you mean the _uhs label name postfix? OK...

[...]

MBR, Sergei
