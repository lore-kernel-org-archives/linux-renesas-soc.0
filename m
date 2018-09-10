Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:54136 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728110AbeIJTGj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 15:06:39 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert@linux-m68k.org, horms@verge.net.au,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: r8a77990: Add VIN and CSI-2 device nodes
Date: Mon, 10 Sep 2018 17:12:30 +0300
Message-ID: <1710077.PM4SUf1Toz@avalon>
In-Reply-To: <1536161385-25562-7-git-send-email-jacopo+renesas@jmondi.org>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org> <1536161385-25562-7-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thank you for the patch.

On Wednesday, 5 September 2018 18:29:43 EEST Jacopo Mondi wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> Add device nodes for VIN4, VIN5 and CSI40 to R-Car E3 R8A77990 device tree.
> 
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 79 ++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> b/arch/arm64/boot/dts/renesas/r8a77990.dtsi index ae89260..0ae7bbe 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -337,6 +337,85 @@
>  			status = "disabled";
>  		};
> 
> +		csi40: csi2@feaa0000 {

I believe Simon would like to keep the nodes sorted by address

> +			compatible = "renesas,r8a77990-csi2", "renesas,rcar-gen3-csi2";
> +			reg = <0 0xfeaa0000 0 0x10000>;

0x10000 seems pretty large to me.

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 716>;
> +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> +			resets = <&cpg 716>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					reg = <1>;
> +
> +					csi40vin4: endpoint@0 {
> +						reg = <0>;
> +						remote-endpoint = <&vin4csi40>;
> +					};
> +					csi40vin5: endpoint@1 {
> +						reg = <1>;
> +						remote-endpoint = <&vin5csi40>;
> +					};
> +				};
> +			};
> +		};
> +
> +		vin4: video@e6ef4000 {
> +			compatible = "renesas,vin-r8a77990";
> +			reg = <0 0xe6ef4000 0 0x1000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 807>;
> +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> +			resets = <&cpg 807>;
> +			renesas,id = <4>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					vin4csi40: endpoint {
> +						remote-endpoint= <&csi40vin4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		vin5: video@e6ef5000 {
> +			compatible = "renesas,vin-r8a77990";
> +			reg = <0 0xe6ef5000 0 0x1000>;
> +			interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 806>;
> +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> +			resets = <&cpg 806>;
> +			renesas,id = <5>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					vin5csi40: endpoint {
> +						remote-endpoint= <&csi40vin5>;
> +					};
> +				};
> +			};
> +		};
> +
>  		scif2: serial@e6e88000 {
>  			compatible = "renesas,scif-r8a77990",
>  				     "renesas,rcar-gen3-scif", "renesas,scif";


-- 
Regards,

Laurent Pinchart
