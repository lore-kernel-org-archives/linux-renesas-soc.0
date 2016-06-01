Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36118 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750697AbcFAHE3 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 03:04:29 -0400
MIME-Version: 1.0
In-Reply-To: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
Date: Wed, 1 Jun 2016 09:04:28 +0200
Message-ID: <CAMuHMdV4BqUC2QMX-=-R6K6gdrvkX=rUcWn_uFF-jdQuYruhbw@mail.gmail.com>
Subject: Re: [PATCH 00/13] Add R8A7794/SILK board eMMC DT support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
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
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Wed, Jun 1, 2016 at 12:06 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>    Here's the set of 13 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20160530-v4.7-rc1' tag. We add the device tree support for
> the R8A7792-based Blanche board. The R-Car 'clk' driver patch was posted last
> week separately...
>
> [01/13] ARM: shmobile: r8a7792: add clock index macros
> [02/13] ARM: shmobile: r8a7792: add power domain index macros
> [03/13] soc: renesas: rcar-sysc: add R8A7792 support
> [04/13] ARM: shmobile: r8a7792: basic SoC support
> [05/13] DT: clock: rcar-gen2-cpg-clocks: document R8A7792 support
> [06/13] DT: clock: cpg-mstp-clocks: document-R8A7792-support
> [07/13] ARM: dts: r8a7792: initial SoC device tree
> [08/13] ARM: dts: r8a7792: add SYS-DMAC support
> [09/13] ARM: dts: r8a7792: add [H]SCIF support
> [10/13] ARM dts: r8a7792: add IRQC support
> [11/13] DT: arm: shmobile: document Blanche board
> [12/13] ARM: dts: blanche: initial device tree
> [13/13] ARM: dts: blanche: add Ethernet support

Thanks for your series!

The subject doesn't seem to cover the contents, though:
> [PATCH 00/13] Add R8A7794/SILK board eMMC DT support

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
