Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34245 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751004AbdFSTcN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 15:32:13 -0400
Received: by mail-lf0-f49.google.com with SMTP id l13so2055331lfl.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jun 2017 12:32:13 -0700 (PDT)
Date: Mon, 19 Jun 2017 21:32:09 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v1 02/12] arm64: boot: dts: Salvator-X: Add VIN parallel
 input
Message-ID: <20170619193209.GE11365@bigcity.dyn.berto.se>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
 <1497891889-8038-3-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1497891889-8038-3-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thanks for your patch.

On 2017-06-19 19:04:39 +0200, Jacopo Mondi wrote:
> Add parallel video input port to VIN channel #4 and link it to camera
> module remote endpoint.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> index 41c94c3..b69fe4a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> @@ -379,6 +379,29 @@
>  
>  &vin4 {
>  	status = "okay";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	ports{
> +		port@2 {

The Gen3 code is not yet upstream so I don't blame you for not reading 
rcar_vin.txt [1] :-) I did try to prepare the DT bindings for the 
digital input and that it should be as similar as possible to the Gen2 
case. There for please use port@0 for the digital input, at least until 
someone finds a flaw in the proposed DT bindings for Gen3.

1. Documentation/devicetree/bindings/media/rcar_vin.txt from the patch 
   series '[PATCH v4 00/27] rcar-vin: Add Gen3 with media controller 
   support'.

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			reg = <2>;
> +
> +			vin4_in: endpoint@0 {
> +				reg = <0>;
> +
> +				bus_width = <8>;
> +				hsync-active = <1>;
> +				vsync-active = <1>;
> +				data-shift = <8>;
> +
> +				remote-endpoint = <&mt9m111_out>;
> +			};
> +		};
> +	};
>  };
>  
>  &vin5 {
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
