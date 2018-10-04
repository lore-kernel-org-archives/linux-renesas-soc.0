Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46440 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbeJDRLM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Oct 2018 13:11:12 -0400
Date: Thu, 4 Oct 2018 12:18:33 +0200
From: Simon Horman <horms@verge.net.au>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/3] ARM: dts: r9a06g032: Add pinctrl node
Message-ID: <20181004101833.jlopmzmyx6nkjnux@verge.net.au>
References: <20181001131026.14635-1-phil.edworthy@renesas.com>
 <20181001131026.14635-4-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181001131026.14635-4-phil.edworthy@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 01, 2018 at 02:10:26PM +0100, Phil Edworthy wrote:
> This provides a pinctrl driver for the Renesas R9A06G032 SoC
> 
> Based on a patch originally written by Michel Pollet at Renesas.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Hi Phil,

I have accepted (a slightly older posting of) this patch
for v4.21.

> ---
> v7:
>  - No changes.
> 
> v6:
>  - No changes.
> 
> v5:
>  - No changes.
> 
> v4:
>  - No changes.
> 
> v3:
>  - No changes.
> 
> v2:
>  - Add "renesas,rzn1-pinctrl" compatible fallback string
>  - Register size corrected.
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
> 2.17.1
> 
