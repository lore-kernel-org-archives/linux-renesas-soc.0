Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46970 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729289AbeJAUOS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Oct 2018 16:14:18 -0400
Date: Mon, 1 Oct 2018 15:36:24 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Add INTC-EX device node
Message-ID: <20181001133623.t3t3xvcxcldjxqgm@verge.net.au>
References: <20180928113756.17572-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180928113756.17572-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 28, 2018 at 01:37:56PM +0200, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch adds a device node for the Interrupt Controller for External
> Devices (INTC-EX) on R-Car E3, which serves external IRQ pins IRQ[0-5].
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested on Ebisu using IRQ1 and IRQ2 on CP49 and EXIO E.
> ---
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index 5c1d6321a5d22a18..a175b5dd04ce3475 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -341,6 +341,22 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		intc_ex: interrupt-controller@e61c0000 {
> +			compatible = "renesas,intc-ex-r8a77990", "renesas,irqc";
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			reg = <0 0xe61c0000 0 0x200>;
> +			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 407>;

I am struggling to locate the documentation for this clock,
although I do see it is consistent with (at least) the dtsi for H3.

> +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> +			resets = <&cpg 407>;
> +		};
> +
>  		dmac0: dma-controller@e6700000 {
>  			compatible = "renesas,dmac-r8a77990",
>  				     "renesas,rcar-dmac";
> -- 
> 2.17.1
> 
