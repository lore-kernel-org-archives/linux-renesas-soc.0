Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:35417 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbeIZWJg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Sep 2018 18:09:36 -0400
Date: Wed, 26 Sep 2018 17:55:56 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <398577853.327367.1537977356555@webmail.strato.com>
In-Reply-To: <20180914091046.483-16-laurent.pinchart+renesas@ideasonboard.com>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180914091046.483-16-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 15/16] arm64: dts: renesas: r8a77990: ebisu: Enable
 VGA and HDMI outputs
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


> On September 14, 2018 at 11:10 AM Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:
> 
> 
> Add the LVDS decoder, HDMI encoder, VGA encoder and HDMI and VGA
> connectors, and wire up the display-related nodes with clocks, pinmux
> and regulators.
> 
> The LVDS0 and LVDS1 encoders can use the DU_DOTCLKIN0, DU_DOTCLKIN1 and
> EXTAL externals clocks. Two of them are provided to the SoC on the Ebisu
> board, hook them up in DT.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 166 +++++++++++++++++++++++++
>  1 file changed, 166 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> index 2bc3a4884b00..772ea8843d84 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -28,6 +28,88 @@
>  		/* first 128MB is reserved for secure area. */
>  		reg = <0x0 0x48000000 0x0 0x38000000>;
>  	};
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
> +	vga {
> +		compatible = "vga-connector";
> +
> +		port {
> +			vga_in: endpoint {
> +				remote-endpoint = <&adv7123_out>;
> +			};
> +		};
> +	};
> +
> +	vga-encoder {
> +		compatible = "adi,adv7123";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				adv7123_in: endpoint {
> +					remote-endpoint = <&du_out_rgb>;
> +				};
> +			};
> +			port@1 {
> +				reg = <1>;
> +				adv7123_out: endpoint {
> +					remote-endpoint = <&vga_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	reg_3p3v: regulator1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-3.3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	x13_clk: x13 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <74250000>;
> +	};
>  };
>  
>  &avb {
> @@ -47,6 +129,25 @@
>  	};
>  };
>  
> +&du {
> +	pinctrl-0 = <&du_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	clocks = <&cpg CPG_MOD 724>,
> +		 <&cpg CPG_MOD 723>,
> +		 <&x13_clk>;
> +	clock-names = "du.0", "du.1", "dclkin.0";
> +
> +	ports {
> +		port@0 {
> +			endpoint {
> +				remote-endpoint = <&adv7123_in>;
> +			};
> +		};
> +	};
> +};
> +
>  &ehci0 {
>  	status = "okay";
>  };
> @@ -55,6 +156,66 @@
>  	clock-frequency = <48000000>;
>  };
>  
> +&i2c0 {
> +	status = "okay";
> +
> +	hdmi-encoder@39 {
> +		compatible = "adi,adv7511w";
> +		reg = <0x39>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
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
> +};
> +
> +&lvds0 {
> +	status = "okay";
> +
> +	clocks = <&cpg CPG_MOD 727>,
> +		 <&x13_clk>,
> +		 <&extal_clk>;
> +	clock-names = "fck", "dclkin.0", "extal";
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
> +&lvds1 {
> +	clocks = <&cpg CPG_MOD 727>,
> +		 <&x13_clk>,
> +		 <&extal_clk>;
> +	clock-names = "fck", "dclkin.0", "extal";
> +};
> +
>  &ohci0 {
>  	status = "okay";
>  };
> @@ -67,6 +228,11 @@
>  		};
>  	};
>  
> +	du_pins: du {
> +		groups = "du_rgb888", "du_sync", "du_disp", "du_clk_out_0";
> +		function = "du";
> +	};
> +
>  	usb0_pins: usb {
>  		groups = "usb0_b";
>  		function = "usb0";
> -- 

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
