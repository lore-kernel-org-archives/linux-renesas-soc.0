Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:40464 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbeHTOQK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 10:16:10 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulrich Hecht <uli+renesas@fpond.eu>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PROTO][PATCH 10/10] arm64: dts: renesas: r8a77995-draak: add HDMI output
Date: Mon, 20 Aug 2018 14:01:54 +0300
Message-ID: <80779849.cAp1Gtn18s@avalon>
In-Reply-To: <1534254604-24204-11-git-send-email-uli+renesas@fpond.eu>
References: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu> <1534254604-24204-11-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

Thank you for the patch.

On Tuesday, 14 August 2018 16:50:04 EEST Ulrich Hecht wrote:
> Adds LVDS decoder, HDMI encoder and connector for Draak boards.
> 
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'm afraid I'll have to revoke that, as it applied to the patch before the 
addition of the max-clock and min-vrefresh properties. Let's discuss them in 
replies to patch 05/10 in this series.

> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 84 +++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts index bd5c6fa..157adf9
> 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -24,6 +24,41 @@
>  		stdout-path = "serial0:115200n8";
>  	};
> 
> +	lvds-decoder {
> +		compatible = "thine,thc63lvd1024";
> +		vcc-supply = <&reg_3p3v>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				thc63lvd1024_in: endpoint {
> +					remote-endpoint = <&lvds0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				thc63lvd1024_out: endpoint {
> +					remote-endpoint = <&adv7511_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con_out: endpoint {
> +				remote-endpoint = <&adv7511_out>;
> +			};
> +		};
> +	};
> +
>  	vga {
>  		compatible = "vga-connector";
> 
> @@ -218,6 +253,43 @@
> 
>  	};
> 
> +	hdmi@39 {
> +		compatible = "adi,adv7511w";
> +		reg = <0x39>, <0x3f>, <0x38>, <0x3c>;
> +		reg-names = "main", "edid", "packet", "cec";
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
> +
> +		/* Depends on LVDS */
> +		max-clock = <135000000>;
> +		min-vrefresh = <50>;
> +
> +		adi,input-depth = <8>;
> +		adi,input-colorspace = "rgb";
> +		adi,input-clock = "1x";
> +		adi,input-style = <1>;
> +		adi,input-justification = "evenly";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				adv7511_in: endpoint {
> +					remote-endpoint = <&thc63lvd1024_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				adv7511_out: endpoint {
> +					remote-endpoint = <&hdmi_con_out>;
> +				};
> +			};
> +		};
> +	};
> +
>  	hdmi-decoder@4c {
>  		compatible = "adi,adv7612";
>  		reg = <0x4c>;
> @@ -283,6 +355,18 @@
>  	};
>  };
> 
> +&lvds0 {
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			lvds0_out: endpoint {
> +				remote-endpoint = <&thc63lvd1024_in>;
> +			};
> +		};
> +	};
> +};
> +
>  &ehci0 {
>  	status = "okay";
>  };


-- 
Regards,

Laurent Pinchart
