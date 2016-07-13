Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:34877 "EHLO
	mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750760AbcGMBh2 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 12 Jul 2016 21:37:28 -0400
MIME-Version: 1.0
In-Reply-To: <8030361.FnpbGzHVP8@wasted.cogentembedded.com>
References: <2441635.ESeLhIjWEX@wasted.cogentembedded.com> <8030361.FnpbGzHVP8@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Jul 2016 03:37:00 +0200
Message-ID: <CAMuHMdWxsjodScdgWxLBe4yq1k140FGk1gcG4aNS783XoyYyDA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7792: add SDHI support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Russell King <linux@arm.linux.org.uk>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 12, 2016 at 11:11 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Define the generic R8A7792 part of the SDHI0 device node.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>  arch/arm/boot/dts/r8a7792.dtsi |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7792.dtsi
> @@ -435,6 +435,18 @@
>                         status = "disabled";
>                 };
>
> +               sdhi0: sd@ee100000 {
> +                       compatible = "renesas,sdhi-r8a7792";
> +                       reg = <0 0xee100000 0 0x200>;
> +                       interrupts = <0 165 IRQ_TYPE_LEVEL_HIGH>;
> +                       dmas = <&dmac0 0xcd>, <&dmac0 0xce>,
> +                              <&dmac1 0xcd>, <&dmac1 0xce>;
> +                       dma-names = "tx", "rx", "tx", "rx";
> +                       clocks = <&mstp3_clks R8A7792_CLK_SDHI0>;
> +                       power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;

Do we want a "max-frequency" property here?
Note that this instance doesn't support SDR104/SDR50.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
