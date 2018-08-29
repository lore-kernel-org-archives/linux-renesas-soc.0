Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36850 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727204AbeH2TZ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 15:25:28 -0400
Received: by mail-lf1-f66.google.com with SMTP id c21-v6so4647620lfh.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Aug 2018 08:28:00 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Wed, 29 Aug 2018 17:27:58 +0200
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77965: Move timer node
Message-ID: <20180829152758.GJ15572@bigcity.dyn.berto.se>
References: <20180828141444.7072-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180828141444.7072-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thanks for your patch.

On 2018-08-28 16:14:44 +0200, Geert Uytterhoeven wrote:
> To preserve alphabetical sort order.
> 
> Fixes: 4c529600eef0a6b7 ("arm64: dts: renesas: r8a77965: Add R-Car Gen3 thermal support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> index 776928518c9b0011..b14a1bad461648ab 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -1932,14 +1932,6 @@
>  		};
>  	};
>  
> -	timer {
> -		compatible = "arm,armv8-timer";
> -		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> -				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> -				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> -				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
> -	};
> -
>  	thermal-zones {
>  		sensor_thermal1: sensor-thermal1 {
>  			polling-delay-passive = <250>;
> @@ -1984,6 +1976,14 @@
>  		};
>  	};
>  
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +
>  	/* External USB clocks - can be overridden by the board */
>  	usb3s0_clk: usb3s0 {
>  		compatible = "fixed-clock";
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas S�derlund
