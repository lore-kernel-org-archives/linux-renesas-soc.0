Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:58248 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752785AbeD3LZU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Apr 2018 07:25:20 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: r8a7790: Fix sort order of VSP1/FDP1 nodes
Date: Mon, 30 Apr 2018 14:25:33 +0300
Message-ID: <6550082.BIGKvazxOf@avalon>
In-Reply-To: <20180430105325.27753-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180430065949.my4733iq3cx2ombj@verge.net.au> <20180430105325.27753-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Monday, 30 April 2018 13:53:25 EEST Kieran Bingham wrote:
> Commit 5d3b50d3c04d ("ARM: dts: renesas: r8a7790: Add FDP1 instances")
> introduced the FDP1 for the r8a7790, but broke the sort ordering of the
> device tree nodes.
> 
> Move the last VSP up to it's peers to correct the ordering.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm/boot/dts/r8a7790.dtsi | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
> index c244aae7a026..b66a18af28f1 100644
> --- a/arch/arm/boot/dts/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/r8a7790.dtsi
> @@ -1616,6 +1616,15 @@
>  			resets = <&cpg 128>;
>  		};
> 
> +		vsp@fe938000 {
> +			compatible = "renesas,vsp1";
> +			reg = <0 0xfe938000 0 0x8000>;
> +			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 127>;
> +			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +			resets = <&cpg 127>;
> +		};
> +
>  		fdp1@fe940000 {
>  			compatible = "renesas,fdp1";
>  			reg = <0 0xfe940000 0 0x2400>;
> @@ -1643,15 +1652,6 @@
>  			resets = <&cpg 117>;
>  		};
> 
> -		vsp@fe938000 {
> -			compatible = "renesas,vsp1";
> -			reg = <0 0xfe938000 0 0x8000>;
> -			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 127>;
> -			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> -			resets = <&cpg 127>;
> -		};
> -
>  		jpu: jpeg-codec@fe980000 {
>  			compatible = "renesas,jpu-r8a7790",
>  				     "renesas,rcar-gen2-jpu";


-- 
Regards,

Laurent Pinchart
