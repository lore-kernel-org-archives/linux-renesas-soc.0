Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38929 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754287AbeDTKDR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 06:03:17 -0400
Date: Fri, 20 Apr 2018 12:03:13 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: condor: add eMMC support
Message-ID: <20180420100313.4cmngxeibpc2r3h2@verge.net.au>
References: <611daf1f-42a2-d463-0814-ebf762871018@cogentembedded.com>
 <309b5211-bab6-53de-b8a8-6e1049e1705e@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <309b5211-bab6-53de-b8a8-6e1049e1705e@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Apr 14, 2018 at 10:28:29PM +0300, Sergei Shtylyov wrote:
> Define the Condor board dependent part of the MMC0 (connected to eMMC chip)
> device node along with the necessary voltage regulators...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  arch/arm64/boot/dts/renesas/r8a77980-condor.dts |   43 ++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> @@ -27,6 +27,24 @@
>  		/* first 128MB is reserved for secure area. */
>  		reg = <0 0x48000000 0 0x78000000>;
>  	};
> +
> +	d3_3v: regulator-0 {

Please use reg_3p3v: regulator1 for consistency with salvator-common.dtsi

> +		compatible = "regulator-fixed";
> +		regulator-name = "D3.3V";

And "fixed-3.3V"

> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vddq_vin01: regulator-1 {

And reg_1p8v: regulator0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDQ_VIN01";

And "fixed-1.8V"

> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
>  };
>  
>  &avb {
> @@ -52,6 +70,19 @@
>  	clock-frequency = <32768>;
>  };
>  
> +&mmc0 {
> +	pinctrl-0 = <&mmc_3_3v_pins>;
> +	pinctrl-1 = <&mmc_1_8v_pins>;
> +	pinctrl-names = "default", "state_uhs";
> +
> +	vmmc-supply = <&d3_3v>;
> +	vqmmc-supply = <&vddq_vin01>;
> +	mmc-hs200-1_8v;
> +	bus-width = <8>;
> +	non-removable;
> +	status = "okay";
> +};
> +
>  &pciec {
>  	status = "okay";
>  };
> @@ -70,6 +101,18 @@
>  		function = "avb";
>  	};
>  
> +	mmc_1_8v_pins: mmc_1_8v {
> +		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
> +		function = "mmc";
> +		power-source = <1800>;
> +	};
> +
> +	mmc_3_3v_pins: mmc_3_3v {
> +		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
> +		function = "mmc";
> +		power-source = <3300>;
> +	};

Again please make this more consistent with salvator-common.dtsi.

> +
>  	scif0_pins: scif0 {
>  		groups = "scif0_data";
>  		function = "scif0";
> 
