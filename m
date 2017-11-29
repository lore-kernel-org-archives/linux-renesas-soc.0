Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:39026 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932263AbdK2KO0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 05:14:26 -0500
Received: by mail-lf0-f66.google.com with SMTP id l81so3213137lfl.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Nov 2017 02:14:25 -0800 (PST)
Subject: Re: [PATCH 1/2] arm64: dts: renesas: initial V3MSK board device tree
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
References: <20171124210313.219761525@cogentembedded.com>
 <20171129095109.d2uan35eui4kzav6@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <06d59459-86dc-89b1-a0ed-adbd1481abc6@cogentembedded.com>
Date: Wed, 29 Nov 2017 13:14:21 +0300
MIME-Version: 1.0
In-Reply-To: <20171129095109.d2uan35eui4kzav6@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 11/29/2017 12:51 PM, Simon Horman wrote:

>> Add the initial device  tree for the V3M Starter Kit board.
>> The board has 1 debug serial port (SCIF0); include support for it,
>> so that the serial console can work.
>>
>> Based on the original (and large) patch by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>>   arch/arm64/boot/dts/renesas/Makefile           |    2 -
[...]
>> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
>> ===================================================================
>> --- /dev/null
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
>> @@ -0,0 +1,44 @@
>> +/*
>> + * Device Tree Source for the V3M Starter Kit board
>> + *
>> + * Copyright (C) 2017 Renesas Electronics Corp.
>> + * Copyright (C) 2017 Cogent Embedded, Inc.
>> + *
>> + * This file is licensed under the terms of the GNU General Public License
>> + * version 2.  This program is licensed "as is" without any warranty of any
>> + * kind, whether express or implied.
>> + */
>> +
>> +/dts-v1/;
>> +#include "r8a77970.dtsi"
>> +
>> +/ {
>> +	model = "Renesas V3M Starter Kit board";
>> +	compatible = "renesas,v3msk", "renesas,r8a77970";
>> +
>> +	aliases {
>> +		serial0 = &scif0;
>> +	};
>> +
>> +	chosen {
> 
> For consistency with other Renesas boards I would like to request the
> following be added here:
> 
> 		bootargs = "ignore_loglevel rw";

    There's currently no consistency as ulcb.dtsi doesn't seem to specify 
"bootargs" prop at all. Moreover, this prop seems to be ignored by ARM64 
kernel -- I can only specify "bootargs" in U-Boot....

MBR, Sergei
