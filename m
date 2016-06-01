Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:34737 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757872AbcFAKag (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 06:30:36 -0400
Received: by mail-lf0-f51.google.com with SMTP id k98so9750663lfi.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jun 2016 03:30:35 -0700 (PDT)
Subject: Re: [PATCH 00/13] Add R8A7794/SILK board eMMC DT support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <CAMuHMdV4BqUC2QMX-=-R6K6gdrvkX=rUcWn_uFF-jdQuYruhbw@mail.gmail.com>
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
Message-ID: <ec4904b9-cf61-b396-ef6c-ded717e68ea5@cogentembedded.com>
Date: Wed, 1 Jun 2016 13:30:29 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV4BqUC2QMX-=-R6K6gdrvkX=rUcWn_uFF-jdQuYruhbw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 6/1/2016 10:04 AM, Geert Uytterhoeven wrote:

>>    Here's the set of 13 patches against Simon Horman's 'renesas.git' repo,
>> 'renesas-devel-20160530-v4.7-rc1' tag. We add the device tree support for
>> the R8A7792-based Blanche board. The R-Car 'clk' driver patch was posted last
>> week separately...
>>
>> [01/13] ARM: shmobile: r8a7792: add clock index macros
>> [02/13] ARM: shmobile: r8a7792: add power domain index macros
>> [03/13] soc: renesas: rcar-sysc: add R8A7792 support
>> [04/13] ARM: shmobile: r8a7792: basic SoC support
>> [05/13] DT: clock: rcar-gen2-cpg-clocks: document R8A7792 support
>> [06/13] DT: clock: cpg-mstp-clocks: document-R8A7792-support
>> [07/13] ARM: dts: r8a7792: initial SoC device tree
>> [08/13] ARM: dts: r8a7792: add SYS-DMAC support
>> [09/13] ARM: dts: r8a7792: add [H]SCIF support
>> [10/13] ARM dts: r8a7792: add IRQC support
>> [11/13] DT: arm: shmobile: document Blanche board
>> [12/13] ARM: dts: blanche: initial device tree
>> [13/13] ARM: dts: blanche: add Ethernet support
>
> Thanks for your series!
>
> The subject doesn't seem to cover the contents, though:
>> [PATCH 00/13] Add R8A7794/SILK board eMMC DT support

    Oops. :-(
    Sorry about that...

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei
