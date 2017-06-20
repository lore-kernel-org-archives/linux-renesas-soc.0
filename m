Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49328 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750990AbdFTHos (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jun 2017 03:44:48 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: niklas.soderlund@ragnatech.se, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v1 01/12] arm64: boot: dts: salvator-x: Add camera module
Date: Tue, 20 Jun 2017 10:45:23 +0300
Message-ID: <2434403.6L5sxSsJ9D@avalon>
In-Reply-To: <1497891889-8038-2-git-send-email-jacopo+renesas@jmondi.org>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org> <1497891889-8038-2-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thank you for the patch.

On Monday 19 Jun 2017 19:04:38 Jacopo Mondi wrote:
> Add camera module to Salvator-X M3W device tree.
> The camera module sits on a i2c-gpio interface and it connected to VIN
> channel #4 parallel video input port.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts index ca4eb98..41c94c3
> 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> @@ -103,6 +103,41 @@
>  		states = <3300000 1
>  			  1800000 0>;
>  	};
> +
> +	camera_module {

This node describes an I2C master controller, it should be called accordingly.

> +		compatible = "i2c-gpio";
> +		gpios = <&gpio1 9 GPIO_ACTIVE_HIGH
> +			 &gpio1 11 GPIO_ACTIVE_HIGH
> +			>;
> +
> +		i2c-gpio,delay-us = <4>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		mclk: xclk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <1>;
> +			clock-frequency  = <27000000>;
> +			clock-output-names = "mclk";
> +		};

This node describes a fixed oscillator not connected to the I2C bus, so it 
should be moved to the top-level of the device tree instead of being a child 
of the I2C controller.

> +		camera: mt9m111@48 {

No need for a label, and you should call the node according to its function, 
not the device model. Maybe something like camera-sensor@48 ? Or just 
camera@48 ?

> +			compatible = "micron,mt9m111";
> +			reg = <0x48>;
> +
> +			clocks = <&mclk 0>;
> +			clock-names = "mclk";
> +
> +			port {
> +				mt9m111_out: endpoint {
> +					bus_width = <8>;
> +					remote-endpoint = <&vin4_in>;
> +				};
> +			};
> +		};
> +	};
> +
>  };
> 
>  &pfc {

-- 
Regards,

Laurent Pinchart
