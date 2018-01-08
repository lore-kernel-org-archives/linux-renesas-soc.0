Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53504 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755794AbeAHHw4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jan 2018 02:52:56 -0500
Date: Mon, 8 Jan 2018 08:52:26 +0100
From: Simon Horman <horms@verge.net.au>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: r7s72100: add USB device to device tree
Message-ID: <20180108075225.jnlx52y7bm3427q5@verge.net.au>
References: <20180105224647.42262-1-chris.brandt@renesas.com>
 <20180105224647.42262-4-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180105224647.42262-4-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 05, 2018 at 05:46:47PM -0500, Chris Brandt wrote:
> Add USB device support.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>  * Changed from "renesas,usbhs-r7s72100" to "renesas,rza1-usbhs"

I think you want both. The SoC-specific compat string followed by a fallback
compat string for something broader:

Like this:

	compatible = "renesas,usbhs-r7s72100", "renesas,rza1-usbhs";

> v2:
>  * Node name is now generic 'usb@'
>  * GIC_SPI (73-32) is now just GIC_SPI 41
>  * All hex number are lower case
>  * Added Reviewed-by
> ---
>  arch/arm/boot/dts/r7s72100.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index ab9645a42eca..d94431767913 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -667,4 +667,24 @@
>  		power-domains = <&cpg_clocks>;
>  		status = "disabled";
>  	};
> +
> +	usbhs0: usb@e8010000 {
> +		compatible = "renesas,rza1-usbhs";
> +		reg = <0xe8010000 0x1a0>;
> +		interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&mstp7_clks R7S72100_CLK_USB0>;
> +		renesas,buswait = <4>;
> +		power-domains = <&cpg_clocks>;
> +		status = "disabled";
> +	};
> +
> +	usbhs1: usb@e8207000 {
> +		compatible = "renesas,rza1-usbhs";
> +		reg = <0xe8207000 0x1a0>;
> +		interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&mstp7_clks R7S72100_CLK_USB1>;
> +		renesas,buswait = <4>;
> +		power-domains = <&cpg_clocks>;
> +		status = "disabled";
> +	};
>  };
> -- 
> 2.15.1
> 
> 
