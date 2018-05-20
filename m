Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33146 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750800AbeETIwa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 May 2018 04:52:30 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a77995-draak: add HDMI output
Date: Sun, 20 May 2018 11:52:53 +0300
Message-ID: <25450258.4A7Byvya0P@avalon>
In-Reply-To: <1526386840-15368-5-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1526386840-15368-5-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

Thank you for the patch.

On Tuesday, 15 May 2018 15:20:39 EEST Ulrich Hecht wrote:
> Adds LVDS decoder, HDMI encoder and connector for Draak boards.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 80 +++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts index 9d73de8..b059e32
> 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -27,6 +27,41 @@
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
> @@ -154,6 +189,39 @@
>  		reg = <0x50>;
>  		pagesize = <8>;
>  	};
> +
> +	hdmi@39 {
> +		compatible = "adi,adv7511w";
> +		reg = <0x39>, <0x3f>, <0x38>, <0x3c>;
> +		reg-names = "main", "edid", "packet", "cec";
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
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
>  };
> 
>  &i2c1 {
> @@ -176,6 +244,18 @@
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
