Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60590 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750812AbdGJJIJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2017 05:08:09 -0400
Date: Mon, 10 Jul 2017 11:07:50 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2.1 4/7] arm64: dts: renesas: r8a7796: Add HDMI encoder
 instance
Message-ID: <20170710090749.GM13680@verge.net.au>
References: <20170621093133.5677-5-laurent.pinchart+renesas@ideasonboard.com>
 <20170621121730.22025-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170621121730.22025-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 21, 2017 at 03:17:30PM +0300, Laurent Pinchart wrote:
> Add the HDMI encoder to the R8A7796 DT in disabled state.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> Changes since v2:
> 
> - Rename node to hdmi@fead0000
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index ad9cd1c3199f..8c1a770c41cd 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -1532,6 +1532,31 @@
>  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
>  		};
>  
> +		hdmi0: hdmi@fead0000 {
> +			compatible = "renesas,r8a7796-hdmi", "renesas,rcar-gen3-hdmi";
> +			reg = <0 0xfead0000 0 0x10000>;
> +			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 729>, <&cpg CPG_CORE R8A7796_CLK_HDMI>;
> +			clock-names = "iahb", "isfr";
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			resets = <&cpg 729>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {
> +					reg = <0>;
> +					dw_hdmi0_in: endpoint {
> +						remote-endpoint = <&du_out_hdmi0>;

du_out_hdmi0 is used here but does not exist until the following patch is
applied. What to do?

> +					};
> +				};
> +				port@1 {
> +					reg = <1>;
> +				};
> +			};
> +		};
> +
>  		du: display@feb00000 {
>  			/* placeholder */
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 
