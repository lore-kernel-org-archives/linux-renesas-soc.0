Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:35564 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751721AbcEKNqJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 09:46:09 -0400
MIME-Version: 1.0
In-Reply-To: <1462972438-20797-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
References: <1462972438-20797-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Date: Wed, 11 May 2016 15:46:07 +0200
Message-ID: <CAMuHMdWdfJMn+GzEQxpaMW3xYKZQYGK4v_tS_4ZiYjeRNQqGXA@mail.gmail.com>
Subject: Re: [PATCHv3 0/4] ARM: dts: r8a779[0-4]: Reference both DMA controllers
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-renesas-soc@vger.kernel.org,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Wed, May 11, 2016 at 3:13 PM, Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> R-Car Gen2 have two DMA controllers, which are equivalent. However DMA
> slaves were tied only to a single DMA controller in .dtsi. This series
> add references to to both DMA controllers for all nodes that previously
> only referenced one of them. It also adds dma references to the SDHI
> nodes for r8a7794 which according to the datasheet should work but I
> have not access to HW to verify.

Thanks for your series!

> Niklas Söderlund (4):
>   ARM: dts: r8a7790: Reference both DMA controllers
>   ARM: dts: r8a7791: Reference both DMA controllers
>   ARM: dts: r8a7793: Reference both DMA controllers
>   ARM: dts: r8a7794: Reference both DMA controllers

For patches 2-4:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
