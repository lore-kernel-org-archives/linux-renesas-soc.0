Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:32802 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S944402AbdDTMYR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 08:24:17 -0400
Received: by mail-lf0-f48.google.com with SMTP id 88so27892912lfr.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Apr 2017 05:24:17 -0700 (PDT)
Subject: Re: [PATCH 1/3] ARM: dts: r8a7743: add PFC support
To: Simon Horman <horms@verge.net.au>
References: <20170414211505.733692280@cogentembedded.com>
 <20170420085112.GF3760@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <58926448-b1d7-668a-a0a3-40b245b59d27@cogentembedded.com>
Date: Thu, 20 Apr 2017 15:24:13 +0300
MIME-Version: 1.0
In-Reply-To: <20170420085112.GF3760@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 04/20/2017 11:51 AM, Simon Horman wrote:

>> Define the generic R8A7743 part of the PFC device node.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>>  arch/arm/boot/dts/r8a7743.dtsi |    7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> Index: renesas/arch/arm/boot/dts/r8a7743.dtsi
>> ===================================================================
>> --- renesas.orig/arch/arm/boot/dts/r8a7743.dtsi
>> +++ renesas/arch/arm/boot/dts/r8a7743.dtsi
>> @@ -1,7 +1,7 @@
>>  /*
>>   * Device Tree Source for the r8a7743 SoC
>>   *
>> - * Copyright (C) 2016 Cogent Embedded Inc.
>> + * Copyright (C) 2016-2017 Cogent Embedded Inc.
>>   *
>>   * This file is licensed under the terms of the GNU General Public License
>>   * version 2. This program is licensed "as is" without any warranty of any
>> @@ -123,6 +123,11 @@
>>  			#power-domain-cells = <1>;
>>  		};
>>
>> +		pfc: pin-controller@e6060000 {
>> +			compatible = "renesas,pfc-r8a7743";
>> +			reg = <0 0xe6060000 0 0x250>;
>> +		};
>> +
>
> I am curious to know why pin-controller was chosen rather than pfc which
> is dominant in the DT for Renesas SoCs.

    The reason is simple: I was trying to follow the DT specs which require 
generic node names. The "pin-controller" looked more generic than "pfc".

> And as a follow-up question, do
> you think it would be worth creating patches to make this uniform
> across the DT for Renesas SoCs.

    Yes, probably.

[...]

MBR, Sergei
