Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39432 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751644AbeEQHjD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 May 2018 03:39:03 -0400
Date: Thu, 17 May 2018 09:38:44 +0200
From: Simon Horman <horms@verge.net.au>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, wsa@the-dreams.de,
        geert@linux-m68k.org, linux-serial@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] arm64: dts: r8a77995: Add SCIF-{0,1,3,4,5} device nodes
Message-ID: <20180517073843.n4hi3mqf6l6dt5fu@verge.net.au>
References: <1526475891-13599-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1526475891-13599-2-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1526475891-13599-2-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 16, 2018 at 03:04:51PM +0200, Ulrich Hecht wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch adds the device nodes for SCIF-{0,1,3,4,5} serial ports,
> incl. clocks and power domain.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 70 +++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index 4b05dc2..73d6589 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -628,6 +628,34 @@
>  			status = "disabled";
>  		};
>  
> +		scif0: serial@e6e60000 {
> +			compatible = "renesas,scif-r8a77995",
> +				     "renesas,rcar-gen3-scif", "renesas,scif";
> +			reg = <0 0xe6e60000 0 64>;
> +			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 207>,
> +				 <&cpg CPG_CORE R8A77995_CLK_S3D1>,
> +				 <&scif_clk>;

Section 55.1 of the User's Manual v1.00 describes SCIF as using
S3D1Cφ (250MHz) rather than S3D1φ (266.66... MHz) on D3.

Also, do you plan to follow-up with a patch to hook-up DMA for SCIF devices?

Otherwise the patch looks fine to me.

> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +			resets = <&cpg 207>;
> +			status = "disabled";
> +		};
> +
> +		scif1: serial@e6e68000 {
> +			compatible = "renesas,scif-r8a77995",
> +				     "renesas,rcar-gen3-scif", "renesas,scif";
> +			reg = <0 0xe6e68000 0 64>;
> +			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 206>,
> +				 <&cpg CPG_CORE R8A77995_CLK_S3D1>,
> +				 <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +			resets = <&cpg 206>;
> +			status = "disabled";
> +		};
> +
>  		scif2: serial@e6e88000 {
>  			compatible = "renesas,scif-r8a77995",
>  				     "renesas,rcar-gen3-scif", "renesas,scif";
> @@ -645,6 +673,48 @@
>  			status = "disabled";
>  		};
>  
> +		scif3: serial@e6c50000 {
> +			compatible = "renesas,scif-r8a77995",
> +				     "renesas,rcar-gen3-scif", "renesas,scif";
> +			reg = <0 0xe6c50000 0 64>;
> +			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 204>,
> +				 <&cpg CPG_CORE R8A77995_CLK_S3D1>,
> +				 <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +			resets = <&cpg 204>;
> +			status = "disabled";
> +		};
> +
> +		scif4: serial@e6c40000 {
> +			compatible = "renesas,scif-r8a77995",
> +				     "renesas,rcar-gen3-scif", "renesas,scif";
> +			reg = <0 0xe6c40000 0 64>;
> +			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 203>,
> +				 <&cpg CPG_CORE R8A77995_CLK_S3D1>,
> +				 <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +			resets = <&cpg 203>;
> +			status = "disabled";
> +		};
> +
> +		scif5: serial@e6f30000 {
> +			compatible = "renesas,scif-r8a77995",
> +				     "renesas,rcar-gen3-scif", "renesas,scif";
> +			reg = <0 0xe6f30000 0 64>;
> +			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 202>,
> +				 <&cpg CPG_CORE R8A77995_CLK_S3D1>,
> +				 <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +			resets = <&cpg 202>;
> +			status = "disabled";
> +		};
> +
>  		vin4: video@e6ef4000 {
>  			compatible = "renesas,vin-r8a77995";
>  			reg = <0 0xe6ef4000 0 0x1000>;
> -- 
> 2.7.4
> 
