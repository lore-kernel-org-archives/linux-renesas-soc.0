Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:49790 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751942AbdH2JPR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2017 05:15:17 -0400
Subject: Re: clk: renesas: rcar-gen3: Status of Z* clocks?
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <705d6de1-a037-f1e1-8c61-7b5aa5e0f30a@de.bosch.com>
 <CAMuHMdVuBqSLjMg+r1y7_TRSDL5r1tLhTewfgr5xU9hZup=PLA@mail.gmail.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <1664e732-4e38-06fb-cfef-d42b49a45d62@de.bosch.com>
Date: Tue, 29 Aug 2017 11:15:11 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVuBqSLjMg+r1y7_TRSDL5r1tLhTewfgr5xU9hZup=PLA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 29.08.2017 10:01, Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> On Tue, Aug 29, 2017 at 9:51 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> as mentioned previously since ages I'm back looking at the RCar3 status in
>> recent mainline (4.13-rc7). While doing so, it looks to me that some Z*
>> clock patches from recent BSP
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/log/?h=v4.9/rcar-3.5.8
>>
>> are not in mainline clock configuration, yet. E.g.:
>>
>> Takeshi Kihara | clk: renesas: r8a7795: Add ZG clock
>> Takeshi Kihara | clk: renesas: r8a7795: Add ZG clock
>> Takeshi Kihara | clk: renesas: r8a7795: Add Z2 clock
>> Takeshi Kihara | clk: renesas: r8a7795: Add Z clock
>> Takeshi Kihara | clk: renesas: rcar-gen3: Adjust output of PLL4 as 3DGE
>> clock divider input
>> Takeshi Kihara | clk: renesas: rcar-gen3: Add ZG clock divider support
>> Dien Pham | clk: renesas: rcar-gen3: Add PLL0 clock errata workaround in
>> PLL0 clk driver
>> Dien Pham | clk: renesas: rcar-gen3: Add PLL0 clk driver support
>> Dien Pham | clk: renesas: rcar-gen3: Adjust output of PLL0, PLL2 as
>> SYSC-CPUs input
>> Takeshi Kihara | clk: renesas: rcar-gen3: Add Z2 clock divider support
>> Takeshi Kihara | clk: renesas: rcar-gen3: Add Z clock divider support
>>
>> Are there any plans to pick these, already? Or, if not, would it be fine to
>> pick them from the BSP and just submit them here? Or is some major rework
>> needed?
> 
> Yes, this is WIP, cfr. "[PATCH v2 0/6] clk: renesas: r8a779[56]: Add Z and Z2
> clock support" (https://www.spinics.net/lists/arm-kernel/msg602197.html).


Ok, many thanks! :)

But ZG and with this module clock #112 is still missing, no?

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=v4.9/rcar-3.5.8&id=aa7b99b06d280e4151e

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=v4.9/rcar-3.5.8&id=a03bfd8abc9572800fb5043

Best regards

Dirk
