Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:42512 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752093AbeDHQkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Apr 2018 12:40:37 -0400
Received: by mail-wr0-f194.google.com with SMTP id s18so6175536wrg.9
        for <linux-renesas-soc@vger.kernel.org>; Sun, 08 Apr 2018 09:40:37 -0700 (PDT)
Date: Sun, 8 Apr 2018 18:40:35 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v5 2/3] ARM: dts: r8a7791: Convert to new LVDS DT bindings
Message-ID: <20180408164035.GD12256@bigcity.dyn.berto.se>
References: <20180406191438.3630-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180406191438.3630-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180406191438.3630-3-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thanks for your patch.

On 2018-04-06 22:14:37 +0300, Laurent Pinchart wrote:
> The internal LVDS encoder now has DT bindings separate from the DU. Port
> the device tree over to the new model.
> 
> Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> Fixes: bb21803ea440 ("ARM: dts: r8a7791: add soc node")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v3:
> 
> - Added power-domains and resets properties to LVDS nodes
> 
> Changes since v2:
> 
> - Fixed LVDS compatible string
> 
> Changes since v1:
> 
> - Remove the DU reg-names property
> ---
>  arch/arm/boot/dts/r8a7791-koelsch.dts | 10 ++++++++--
>  arch/arm/boot/dts/r8a7791-porter.dts  | 16 +++++++++++++---
>  arch/arm/boot/dts/r8a7791.dtsi        | 36 +++++++++++++++++++++++++++++------
>  3 files changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
> index f40321a1c917..69d66bad9a6a 100644
> --- a/arch/arm/boot/dts/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
> @@ -470,8 +470,7 @@
>  
>  	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>, <&cpg CPG_MOD 726>,
>  		 <&x13_clk>, <&x2_clk>;

I think you forgot to delete <&cpg CPG_MOD 726> from the clocks, with 
that fixed:

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> -	clock-names = "du.0", "du.1", "lvds.0",
> -		      "dclkin.0", "dclkin.1";
> +	clock-names = "du.0", "du.1", "dclkin.0", "dclkin.1";
>  
>  	ports {
>  		port@0 {
> @@ -479,6 +478,13 @@
>  				remote-endpoint = <&adv7511_in>;
>  			};
>  		};
> +	};
> +};
> +
> +&lvds0 {
> +	status = "okay";
> +
> +	ports {
>  		port@1 {
>  			lvds_connector: endpoint {
>  			};
> diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
> index c14e6fe9e4f6..ae9ed9ff53ef 100644
> --- a/arch/arm/boot/dts/r8a7791-porter.dts
> +++ b/arch/arm/boot/dts/r8a7791-porter.dts
> @@ -441,10 +441,9 @@
>  	pinctrl-names = "default";
>  	status = "okay";
>  
> -	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>, <&cpg CPG_MOD 726>,
> +	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
>  		 <&x3_clk>, <&x16_clk>;
> -	clock-names = "du.0", "du.1", "lvds.0",
> -		      "dclkin.0", "dclkin.1";
> +	clock-names = "du.0", "du.1", "dclkin.0", "dclkin.1";
>  
>  	ports {
>  		port@0 {
> @@ -455,6 +454,17 @@
>  	};
>  };
>  
> +&lvds0 {
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			lvds_connector: endpoint {
> +			};
> +		};
> +	};
> +};
> +
>  &rcar_sound {
>  	pinctrl-0 = <&ssi_pins &audio_clk_pins>;
>  	pinctrl-names = "default";
> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
> index f11dab71b03a..506b20885413 100644
> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
> @@ -1633,15 +1633,12 @@
>  
>  		du: display@feb00000 {
>  			compatible = "renesas,du-r8a7791";
> -			reg = <0 0xfeb00000 0 0x40000>,
> -			      <0 0xfeb90000 0 0x1c>;
> -			reg-names = "du", "lvds.0";
> +			reg = <0 0xfeb00000 0 0x40000>;
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 724>,
> -				 <&cpg CPG_MOD 723>,
> -				 <&cpg CPG_MOD 726>;
> -			clock-names = "du.0", "du.1", "lvds.0";
> +				 <&cpg CPG_MOD 723>;
> +			clock-names = "du.0", "du.1";
>  			status = "disabled";
>  
>  			ports {
> @@ -1656,6 +1653,33 @@
>  				port@1 {
>  					reg = <1>;
>  					du_out_lvds0: endpoint {
> +						remote-endpoint = <&lvds0_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		lvds0: lvds@feb90000 {
> +			compatible = "renesas,r8a7791-lvds";
> +			reg = <0 0xfeb90000 0 0x1c>;
> +			clocks = <&cpg CPG_MOD 726>;
> +			power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
> +			resets = <&cpg 726>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					lvds0_in: endpoint {
> +						remote-endpoint = <&du_out_lvds0>;
> +					};
> +				};
> +				port@1 {
> +					reg = <1>;
> +					lvds0_out: endpoint {
>  					};
>  				};
>  			};
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas S�derlund
