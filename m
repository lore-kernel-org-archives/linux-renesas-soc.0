Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45140 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbeK1Xwe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Nov 2018 18:52:34 -0500
Date: Wed, 28 Nov 2018 13:50:57 +0100
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: Re: [PATCH 01/16] ARM: dts: r9a06g032: Add pinctrl node
Message-ID: <20181128125057.dwf7qae323yv64ma@verge.net.au>
References: <cover.1543236456.git.horms+renesas@verge.net.au>
 <2b421730228e2ac6e49c3202e4f7ef79a65da71c.1543236456.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b421730228e2ac6e49c3202e4f7ef79a65da71c.1543236456.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 26, 2018 at 01:54:03PM +0100, Simon Horman wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> This provides a pinctrl driver for the Renesas R9A06G032 SoC
> 
> Based on a patch originally written by Michel Pollet at Renesas.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Geert Uytterhoeven <geert+renesas@glider.be>

The tag above is garbled. I will fix this and repost this pull-request.

> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm/boot/dts/r9a06g032.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
> index eaf94976ed6d..2322268bc862 100644
> --- a/arch/arm/boot/dts/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> @@ -165,6 +165,14 @@
>  			status = "disabled";
>  		};
>  
> +		pinctrl: pin-controller@40067000 {
> +			compatible = "renesas,r9a06g032-pinctrl", "renesas,rzn1-pinctrl";
> +			reg = <0x40067000 0x1000>, <0x51000000 0x480>;
> +			clocks = <&sysctrl R9A06G032_HCLK_PINCONFIG>;
> +			clock-names = "bus";
> +			status = "okay";
> +		};
> +
>  		gic: gic@44101000 {
>  			compatible = "arm,cortex-a7-gic", "arm,gic-400";
>  			interrupt-controller;
> -- 
> 2.11.0
> 
