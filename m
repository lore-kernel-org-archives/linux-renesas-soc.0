Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47847 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbeHBNGw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Aug 2018 09:06:52 -0400
Date: Thu, 2 Aug 2018 13:16:07 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] arm64: dts: renesas: salvator-xs: enable SATA
Message-ID: <20180802111607.oinxgve5yutvfner@verge.net.au>
References: <20180730073456.3687-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180730073456.3687-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 30, 2018 at 09:34:56AM +0200, Wolfram Sang wrote:
> Add the nodes to enable SATA. Note that MD12 (SW12-7) must be switched
> off for that to work.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> 
> Changes since v1:
> 	* fixed indentation (Thanks, Geert!)
> 	* merged two patches into one (Thanks, Simon!)
> 	* Added Geert's tag
> 
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts  | 14 ++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts | 14 ++++++++++++++
>  2 files changed, 28 insertions(+)

This looks good to me:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

But (note to self) depends on:

[PATCH v2] arm64: dts: r8a77965: Add SATA controller node

> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
> index 8ded64d0a4d5..368be55eda4e 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
> @@ -152,6 +152,15 @@
>  	};
>  };
>  
> +&pca9654 {
> +	pcie_sata_switch {
> +		gpio-hog;
> +		gpios = <7 GPIO_ACTIVE_HIGH>;
> +		output-low; /* enable SATA by default */
> +		line-name = "PCIE/SATA switch";
> +	};
> +};
> +
>  &pfc {
>  	usb2_pins: usb2 {
>  		groups = "usb2";
> @@ -176,6 +185,11 @@
>  	};
>  };
>  
> +/* MD12 (SW12-7) must be set 'Off' which is not the default! */
> +&sata {
> +	status = "okay";
> +};
> +
>  &usb2_phy2 {
>  	pinctrl-0 = <&usb2_pins>;
>  	pinctrl-names = "default";
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
> index 9de4e3db1621..45016a06fab1 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
> @@ -47,3 +47,17 @@
>  &hdmi0_con {
>  	remote-endpoint = <&rcar_dw_hdmi0_out>;
>  };
> +
> +&pca9654 {
> +	pcie_sata_switch {
> +		gpio-hog;
> +		gpios = <7 GPIO_ACTIVE_HIGH>;
> +		output-low; /* enable SATA by default */
> +		line-name = "PCIE/SATA switch";
> +	};
> +};
> +
> +/* MD12 (SW12-7) must be set 'Off' which is not the default! */
> +&sata {
> +	status = "okay";
> +};
> -- 
> 2.11.0
> 
