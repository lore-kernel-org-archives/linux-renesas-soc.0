Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:53880 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751886AbeDHQoC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Apr 2018 12:44:02 -0400
Received: by mail-wm0-f65.google.com with SMTP id 66so6821380wmd.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 08 Apr 2018 09:44:01 -0700 (PDT)
Date: Sun, 8 Apr 2018 18:43:59 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v5 3/3] ARM: dts: r8a7793: Convert to new LVDS DT bindings
Message-ID: <20180408164359.GE12256@bigcity.dyn.berto.se>
References: <20180406191438.3630-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180406191438.3630-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180406191438.3630-4-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thanks for your work.

On 2018-04-06 22:14:38 +0300, Laurent Pinchart wrote:
> The internal LVDS encoder now has DT bindings separate from the DU. Port
> the device tree over to the new model.
> 
> Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> Fixes: bff8f8c2feb7 ("ARM: dts: r8a7793: add soc node")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

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
>  arch/arm/boot/dts/r8a7793-gose.dts | 10 +++++++---
>  arch/arm/boot/dts/r8a7793.dtsi     | 37 +++++++++++++++++++++++++++++++------
>  2 files changed, 38 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
> index 9ed6961f2d9a..96e117d8b2cc 100644
> --- a/arch/arm/boot/dts/r8a7793-gose.dts
> +++ b/arch/arm/boot/dts/r8a7793-gose.dts
> @@ -447,10 +447,9 @@
>  	pinctrl-names = "default";
>  	status = "okay";
>  
> -	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>, <&cpg CPG_MOD 726>,
> +	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
>  		 <&x13_clk>, <&x2_clk>;
> -	clock-names = "du.0", "du.1", "lvds.0",
> -		      "dclkin.0", "dclkin.1";
> +	clock-names = "du.0", "du.1", "dclkin.0", "dclkin.1";
>  
>  	ports {
>  		port@0 {
> @@ -458,6 +457,11 @@
>  				remote-endpoint = <&adv7511_in>;
>  			};
>  		};
> +	};
> +};
> +
> +&lvds0 {
> +	ports {
>  		port@1 {
>  			lvds_connector: endpoint {
>  			};
> diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
> index f9c5a557107d..4f526030dc7c 100644
> --- a/arch/arm/boot/dts/r8a7793.dtsi
> +++ b/arch/arm/boot/dts/r8a7793.dtsi
> @@ -1292,15 +1292,12 @@
>  
>  		du: display@feb00000 {
>  			compatible = "renesas,du-r8a7793";
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
> @@ -1315,6 +1312,34 @@
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
> +			compatible = "renesas,r8a7793-lvds";
> +			reg = <0 0xfeb90000 0 0x1c>;
> +			clocks = <&cpg CPG_MOD 726>;
> +			power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
> +			resets = <&cpg 726>;
> +
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
