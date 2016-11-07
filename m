Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f169.google.com ([209.85.192.169]:35506 "EHLO
        mail-pf0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932308AbcKGNFf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 08:05:35 -0500
Received: by mail-pf0-f169.google.com with SMTP id i88so90777450pfk.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Nov 2016 05:05:35 -0800 (PST)
Subject: Re: [PATCH 6/9] arm64: dts: m3ulcb: enable SDHI0
To: Simon Horman <horms@verge.net.au>
References: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1478196471-1381-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <20161107130054.GG12319@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Message-ID: <817acf53-b979-b79f-bdea-4d1d1919ec09@cogentembedded.com>
Date: Mon, 7 Nov 2016 16:05:33 +0300
MIME-Version: 1.0
In-Reply-To: <20161107130054.GG12319@verge.net.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On 07.11.2016 16:00, Simon Horman wrote:
> On Thu, Nov 03, 2016 at 09:07:51PM +0300, Vladimir Barinov wrote:
>> This supports SDHI0 on M3ULCB board SD card slot
> Is SDHI3 also exposed on the M3ULCB?
No, SDHI3 is not exposed on M3ULCB.

Only SDHI0 exposed to SD slot and SDHI2 as eMMC.

> If so could you consider sending patches to enable it?
>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> ---
>>   arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 48 ++++++++++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
>> index 3329f78..5be0cf6 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
>> +++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
>> @@ -44,6 +44,30 @@
>>   			gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
>>   		};
>>   	};
>> +
>> +	vcc_sdhi0: regulator-vcc-sdhi0 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "SDHI0 Vcc";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +	};
>> +
>> +	vccq_sdhi0: regulator-vccq-sdhi0 {
>> +		compatible = "regulator-gpio";
>> +
>> +		regulator-name = "SDHI0 VccQ";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
>> +		gpios-states = <1>;
>> +		states = <3300000 1
>> +			  1800000 0>;
>> +	};
>>   };
>>   
>>   &extal_clk {
>> @@ -68,8 +92,33 @@
>>   		groups = "scif_clk_a";
>>   		function = "scif_clk";
>>   	};
>> +
>> +	sdhi0_pins_3v3: sd0_3v3 {
>> +		groups = "sdhi0_data4", "sdhi0_ctrl";
>> +		function = "sdhi0";
>> +		power-source = <3300>;
>> +	};
>> +
>> +	sdhi0_pins_1v8: sd0_1v8 {
>> +		groups = "sdhi0_data4", "sdhi0_ctrl";
>> +		function = "sdhi0";
>> +		power-source = <1800>;
>> +	};
> I would prefer the pin nodes to be named as follows:
>
>   sdhi0_pins_3v3 ->  sdhi0_pins_3v3
>   sdhi0_pins_1v8 -> sdhi0_pins_uhs
>
> Likewise for SDHI2.
Okay, I will resend these changes in the next try.

Regards,
Vladimir

>
>>   };
>>   
>> +&sdhi0 {
>> +	pinctrl-0 = <&sdhi0_pins_3v3>;
>> +	pinctrl-1 = <&sdhi0_pins_1v8>;
>> +	pinctrl-names = "default", "state_uhs";
>> +
>> +	vmmc-supply = <&vcc_sdhi0>;
>> +	vqmmc-supply = <&vccq_sdhi0>;
>> +	cd-gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
>> +	bus-width = <4>;
>> +	sd-uhs-sdr50;
>> +	status = "okay";
>> +};
>> +
>>   &scif2 {
>>   	pinctrl-0 = <&scif2_pins>;
>>   	pinctrl-names = "default";
>> -- 
>> 1.9.1
>>
