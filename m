Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:37719 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753549AbeBSTSs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 14:18:48 -0500
Received: by mail-lf0-f65.google.com with SMTP id y19so935459lfd.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2018 11:18:47 -0800 (PST)
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: initial Condor board device
 tree
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
        linux-arm-kernel@lists.infradead.org
References: <ae31804b-969b-9b20-16d0-50f5dea42f08@cogentembedded.com>
 <5cf82cb1-0278-010c-165d-07dbcbe0878d@cogentembedded.com>
 <CAMuHMdWwjXw0SwVK704_AtkDg3C-or5bUbXPwMEvTwU5eLGrpQ@mail.gmail.com>
 <da5c612d-d23d-be36-7dfe-e3e78cc2b086@cogentembedded.com>
 <20180219091223.rvumtwr6t47szrwo@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <52bd5a2c-900e-7603-4cce-efa0fb315494@cogentembedded.com>
Date: Mon, 19 Feb 2018 22:18:44 +0300
MIME-Version: 1.0
In-Reply-To: <20180219091223.rvumtwr6t47szrwo@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/19/2018 12:12 PM, Simon Horman wrote:

>>>> Add the initial device  tree for  the R8A77980 SoC based Condor board.
>>>> The board has 1 debug serial port (SCIF0); include support for it, so
>>>> that the serial console can work.
>>>>
>>>> Based on the original (and large) patch by Vladimir Barinov.
>>>>
>>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>
>>>> ---
>>>> Changes in version 2:
>>>> - removed the useless "status" property from the SCIF_CLK node;
>>>> - fixed the memory size;
>>>> - added Geert's tag.
>>>
>>>> --- /dev/null
>>>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
>>>> @@ -0,0 +1,45 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Device Tree Source for the Condor board
>>>> + *
>>>> + * Copyright (C) 2018 Renesas Electronics Corp.
>>>> + * Copyright (C) 2018 Cogent Embedded, Inc.
>>>> + */
>>>> +
>>>> +/dts-v1/;
>>>> +#include "r8a77980.dtsi"
>>>> +
>>>> +/ {
>>>> +       model = "Renesas Condor board based on r8a77980";
>>>> +       compatible = "renesas,condor", "renesas,r8a77980";
>>>> +
>>>> +       aliases {
>>>> +               serial0 = &scif0;
>>>> +       };
>>>> +
>>>> +       chosen {
>>>> +               stdout-path = "serial0:115200n8";
>>>> +       };
>>>> +
>>>> +       memory@48000000 {
>>>> +               device_type = "memory";
>>>> +               /* first 128MB is reserved for secure area. */
>>>> +               reg = <0 0x48000000 0 0xb8000000>;
>>>
>>> Shouldn't the size be 0x78000000, or is there really 3 GiB of RAM?
>>
>>    Ugh, so I finally mixed up limit and size... :-/
> 
> Thanks, I will apply the following, with the memory corrected to 2 GiB.

   Thank you! Just made sure that whatever is in this node in .dts, the RAM size
ends up being 0x78000000. Probably U-Boot is too smart. :-)

MBR, Sergei
