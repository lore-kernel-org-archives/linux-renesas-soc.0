Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38845 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754287AbeDTJ7B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 05:59:01 -0400
Date: Fri, 20 Apr 2018 11:58:57 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77980: add MMC support
Message-ID: <20180420095857.latofivdh3dnvu2z@verge.net.au>
References: <611daf1f-42a2-d463-0814-ebf762871018@cogentembedded.com>
 <aaa58189-2c27-e51f-1f97-3671c50a1479@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaa58189-2c27-e51f-1f97-3671c50a1479@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Apr 14, 2018 at 10:27:04PM +0300, Sergei Shtylyov wrote:
> Define the generic R8A77980 part of the MMC0 (SDHI2) device node.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -371,6 +371,18 @@
>  			dma-channels = <16>;
>  		};
>  
> +		mmc0: mmc@ee140000 {

Please use sdhi2: sd@ee140000 for consistency with other SoCs
(I refereed to the r8a7795).

> +			compatible = "renesas,sdhi-r8a77980",
> +				     "renesas,rcar-gen3-sdhi";
> +			reg = <0 0xee140000 0 0x2000>;
> +			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 314>;
> +			power-domains = <&sysc 32>;
> +			resets = <&cpg 314>;
> +			max-frequency = <200000000>;
> +			status = "disabled";
> +		};
> +
>  		gic: interrupt-controller@f1010000 {
>  			compatible = "arm,gic-400";
>  			#interrupt-cells = <3>;
> 
