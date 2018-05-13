Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56413 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750850AbeEMJCY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 May 2018 05:02:24 -0400
Date: Sun, 13 May 2018 11:02:05 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r8a77990: Add GPIO device nodes
Message-ID: <20180513090204.kihioyuasebsd3mq@verge.net.au>
References: <1526013081-28005-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526013081-28005-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526013081-28005-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 11, 2018 at 01:31:19PM +0900, Yoshihiro Shimoda wrote:
> This patch adds GPIO nodes for r8a77990 (R-Car E3).
> 
> Based on a patch from Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 112 ++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index efc3c0b..d94e047 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -60,6 +60,118 @@
>  		#size-cells = <2>;
>  		ranges;
>  
> +		gpio0: gpio@e6050000 {
> +			compatible = "renesas,gpio-r8a77990",
> +				     "renesas,rcar-gen3-gpio",
> +				     "renesas,gpio-rcar";

"renesas,gpio-rcar" is deprecated and thus should not be added to DT any
more. I will see about removing it from r8a77995.dtsi which seems to be the
only place that it used in mainline.

Otherwise this patch looks good to me.

> +			reg = <0 0xe6050000 0 0x50>;
> +			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +			gpio-ranges = <&pfc 0 0 18>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			clocks = <&cpg CPG_MOD 912>;
> +			power-domains = <&sysc 32>;
> +			resets = <&cpg 912>;
> +		};

...
