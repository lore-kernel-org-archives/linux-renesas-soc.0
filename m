Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54258 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752498AbdHII40 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 04:56:26 -0400
Date: Wed, 9 Aug 2017 10:56:22 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] ARM: dts: r8a7743: Add IIC cores to dtsi
Message-ID: <20170809085622.GL2705@verge.net.au>
References: <1502196418-31341-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502196418-31341-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 08, 2017 at 01:46:58PM +0100, Biju Das wrote:
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch has been tested against Linux-next tag 20170727 and renesas-dev branch.
> This patch depends on https://www.spinics.net/lists/arm-kernel/msg599220.html

Process comments as per those for
"[PATCH  2/2] ARM: dts: r8a7743: Add I2C DT support".

Patch itself looks good to me.

> 
>  arch/arm/boot/dts/r8a7743.dtsi | 55 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
> index 14222c72..5c2b140 100644
> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
> @@ -25,6 +25,9 @@
>  		i2c3 = &i2c3;
>  		i2c4 = &i2c4;
>  		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		i2c7 = &i2c7;
> +		i2c8 = &i2c8;
>  	};
>  
>  	cpus {
> @@ -436,6 +439,58 @@
>  			status = "disabled";
>  		};
>  
> +		i2c6: i2c@e60b0000 {
> +			/* doesn't need pinmux */
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "renesas,iic-r8a7743",
> +				     "renesas,rcar-gen2-iic",
> +				     "renesas,rmobile-iic";
> +			reg = <0 0xe60b0000 0 0x425>;
> +			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 926>;
> +			dmas = <&dmac0 0x77>, <&dmac0 0x78>,
> +			       <&dmac1 0x77>, <&dmac1 0x78>;
> +			dma-names = "tx", "rx", "tx", "rx";
> +			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
> +			resets = <&cpg CPG_MOD 926>;
> +			status = "disabled";
> +		};
> +
> +		i2c7: i2c@e6500000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "renesas,iic-r8a7743",
> +				     "renesas,rcar-gen2-iic",
> +				     "renesas,rmobile-iic";
> +			reg = <0 0xe6500000 0 0x425>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 318>;
> +			dmas = <&dmac0 0x61>, <&dmac0 0x62>,
> +			       <&dmac1 0x61>, <&dmac1 0x62>;
> +			dma-names = "tx", "rx", "tx", "rx";
> +			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
> +			resets = <&cpg 318>;
> +			status = "disabled";
> +		};
> +
> +		i2c8: i2c@e6510000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "renesas,iic-r8a7743",
> +				     "renesas,rcar-gen2-iic",
> +				     "renesas,rmobile-iic";
> +			reg = <0 0xe6510000 0 0x425>;
> +			interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 323>;
> +			dmas = <&dmac0 0x65>, <&dmac0 0x66>,
> +			       <&dmac1 0x65>, <&dmac1 0x66>;
> +			dma-names = "tx", "rx", "tx", "rx";
> +			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
> +			resets = <&cpg 323>;
> +			status = "disabled";
> +		};
> +
>  		scifa0: serial@e6c40000 {
>  			compatible = "renesas,scifa-r8a7743",
>  				     "renesas,rcar-gen2-scifa", "renesas,scifa";
> -- 
> 1.9.1
> 
