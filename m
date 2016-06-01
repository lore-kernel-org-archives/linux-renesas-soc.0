Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH 10/13] ARM: dts: r8a7792: add IRQC support
To: Simon Horman <horms@verge.net.au>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <3573091.BUvyGW3hVt@wasted.cogentembedded.com>
 <20160601011813.GJ20527@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	devicetree@vger.kernel.org, magnus.damm@gmail.com,
	linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b0c021a2-f8e6-bab4-3556-b61895f49b78@cogentembedded.com>
Date: Wed, 1 Jun 2016 17:02:39 +0300
MIME-Version: 1.0
In-Reply-To: <20160601011813.GJ20527@verge.net.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/01/2016 04:18 AM, Simon Horman wrote:

>> Describe the IRQC interrupt controller in the R8A7792 device tree.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>>  arch/arm/boot/dts/r8a7792.dtsi |   13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
>> ===================================================================
>> --- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
>> +++ renesas/arch/arm/boot/dts/r8a7792.dtsi
>> @@ -62,6 +62,19 @@
>>  			      IRQ_TYPE_LEVEL_HIGH)>;
>>  	};
>>
>> +	irqc: interrupt-controller@e61c0000 {
>
> Could you consider using irqc0 as the node name for consistency with the
> DT of other R-Car Gen2 SoCs?

    Frankly speaking I didn't get that name indexing thing at all. Could you 
share the reasoning behind it?

> What follows looks correct to me.

    Thank you. :-)

MBR, Sergei

