Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34010 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755492AbeEAPaF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 May 2018 11:30:05 -0400
Date: Tue, 1 May 2018 17:30:01 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT 3/3] arm64: dts: r8a77965: Add SDHI device nodes
Message-ID: <20180501153000.eruobrrxh43mzurs@verge.net.au>
References: <1525031296-16512-1-git-send-email-ykaneko0929@gmail.com>
 <1525031296-16512-4-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1525031296-16512-4-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 30, 2018 at 04:48:16AM +0900, Yoshihiro Kaneko wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> Add SDHI nodes to the DT of the r8a77965 SoC.
> 
> Based on several similar patches of the R8A7796 device tree
> by Simon Horman <horms+renesas@verge.net.au>.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

This patch needs to be rebased on top of the devel branch of the renesas
tree. Otherwise it looks good to me.

> ---
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 68 ++++++++++++++++++++++---------
>  1 file changed, 48 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> index f0871fc..6860704 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -834,26 +834,6 @@
>  			};
>  		};
>  
> -		sdhi0: sd@ee100000 {
> -			reg = <0 0xee100000 0 0x2000>;
> -			/* placeholder */
> -		};
> -
> -		sdhi1: sd@ee120000 {
> -			reg = <0 0xee120000 0 0x2000>;
> -			/* placeholder */
> -		};
> -
> -		sdhi2: sd@ee140000 {
> -			reg = <0 0xee140000 0 0x2000>;
> -			/* placeholder */
> -		};
> -
> -		sdhi3: sd@ee160000 {
> -			reg = <0 0xee160000 0 0x2000>;
> -			/* placeholder */
> -		};
> -
>  		usb3_phy0: usb-phy@e65ee000 {
>  			reg = <0 0xe65ee000 0 0x90>;
>  			#phy-cells = <0>;
> @@ -874,5 +854,53 @@
>  			reg = <0 0xe6020000 0 0x0c>;
>  			/* placeholder */
>  		};
> +
> +		sdhi0: sd@ee100000 {
> +			compatible = "renesas,sdhi-r8a77965",
> +				     "renesas,rcar-gen3-sdhi";
> +			reg = <0 0xee100000 0 0x2000>;
> +			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 314>;
> +			max-frequency = <200000000>;
> +			power-domains = <&sysc 32>;
> +			resets = <&cpg 314>;
> +			status = "disabled";
> +		};
> +
> +		sdhi1: sd@ee120000 {
> +			compatible = "renesas,sdhi-r8a77965",
> +				     "renesas,rcar-gen3-sdhi";
> +			reg = <0 0xee120000 0 0x2000>;
> +			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 313>;
> +			max-frequency = <200000000>;
> +			power-domains = <&sysc 32>;
> +			resets = <&cpg 313>;
> +			status = "disabled";
> +		};
> +
> +		sdhi2: sd@ee140000 {
> +			compatible = "renesas,sdhi-r8a77965",
> +				     "renesas,rcar-gen3-sdhi";
> +			reg = <0 0xee140000 0 0x2000>;
> +			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 312>;
> +			max-frequency = <200000000>;
> +			power-domains = <&sysc 32>;
> +			resets = <&cpg 312>;
> +			status = "disabled";
> +		};
> +
> +		sdhi3: sd@ee160000 {
> +			compatible = "renesas,sdhi-r8a77965",
> +				     "renesas,rcar-gen3-sdhi";
> +			reg = <0 0xee160000 0 0x2000>;
> +			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 311>;
> +			max-frequency = <200000000>;
> +			power-domains = <&sysc 32>;
> +			resets = <&cpg 311>;
> +			status = "disabled";
> +		};
>  	};
>  };
> -- 
> 1.9.1
> 
