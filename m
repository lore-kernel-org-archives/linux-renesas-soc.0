Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50850 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752795AbcKGNBA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 08:01:00 -0500
Date: Mon, 7 Nov 2016 14:00:54 +0100
From: Simon Horman <horms@verge.net.au>
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 6/9] arm64: dts: m3ulcb: enable SDHI0
Message-ID: <20161107130054.GG12319@verge.net.au>
References: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1478196471-1381-1-git-send-email-vladimir.barinov@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1478196471-1381-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 03, 2016 at 09:07:51PM +0300, Vladimir Barinov wrote:
> This supports SDHI0 on M3ULCB board SD card slot

Is SDHI3 also exposed on the M3ULCB?
If so could you consider sending patches to enable it?

> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 48 ++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
> index 3329f78..5be0cf6 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
> @@ -44,6 +44,30 @@
>  			gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
>  		};
>  	};
> +
> +	vcc_sdhi0: regulator-vcc-sdhi0 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "SDHI0 Vcc";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vccq_sdhi0: regulator-vccq-sdhi0 {
> +		compatible = "regulator-gpio";
> +
> +		regulator-name = "SDHI0 VccQ";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
> +		gpios-states = <1>;
> +		states = <3300000 1
> +			  1800000 0>;
> +	};
>  };
>  
>  &extal_clk {
> @@ -68,8 +92,33 @@
>  		groups = "scif_clk_a";
>  		function = "scif_clk";
>  	};
> +
> +	sdhi0_pins_3v3: sd0_3v3 {
> +		groups = "sdhi0_data4", "sdhi0_ctrl";
> +		function = "sdhi0";
> +		power-source = <3300>;
> +	};
> +
> +	sdhi0_pins_1v8: sd0_1v8 {
> +		groups = "sdhi0_data4", "sdhi0_ctrl";
> +		function = "sdhi0";
> +		power-source = <1800>;
> +	};

I would prefer the pin nodes to be named as follows:

 sdhi0_pins_3v3 ->  sdhi0_pins_3v3
 sdhi0_pins_1v8 -> sdhi0_pins_uhs

Likewise for SDHI2.

>  };
>  
> +&sdhi0 {
> +	pinctrl-0 = <&sdhi0_pins_3v3>;
> +	pinctrl-1 = <&sdhi0_pins_1v8>;
> +	pinctrl-names = "default", "state_uhs";
> +
> +	vmmc-supply = <&vcc_sdhi0>;
> +	vqmmc-supply = <&vccq_sdhi0>;
> +	cd-gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
> +	bus-width = <4>;
> +	sd-uhs-sdr50;
> +	status = "okay";
> +};
> +
>  &scif2 {
>  	pinctrl-0 = <&scif2_pins>;
>  	pinctrl-names = "default";
> -- 
> 1.9.1
> 
