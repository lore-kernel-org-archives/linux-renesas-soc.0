Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39157 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933853AbdEKO2k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 May 2017 10:28:40 -0400
Date: Thu, 11 May 2017 16:28:35 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 04/10] arm64: renesas: r8a7796: add AUDIO_DMAC support
Message-ID: <20170511142832.GA21895@verge.net.au>
References: <87fugbwz72.wl%kuninori.morimoto.gx@renesas.com>
 <87a86jwz3y.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a86jwz3y.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Thu, May 11, 2017 at 09:01:15AM +0000, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 84 ++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 78549f8..f4b5e0b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -1055,6 +1055,90 @@
>  			dma-channels = <16>;
>  		};
>  
> +		audma0: dma-controller@ec700000 {
> +			compatible = "renesas,dmac-r8a7796",
> +				     "renesas,rcar-dmac";
> +			reg = <0 0xec700000 0 0x10000>;
> +			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "error",
> +					"ch0", "ch1", "ch2", "ch3",
> +					"ch4", "ch5", "ch6", "ch7",
> +					"ch8", "ch9", "ch10", "ch11",
> +					"ch12", "ch13", "ch14", "ch15";
> +			clocks = <&cpg CPG_MOD 502>;
> +			clock-names = "fck";
> +			iommus = <&ipmmu_mp0 0>, <&ipmmu_mp0 1>,
> +			       <&ipmmu_mp0 2>, <&ipmmu_mp0 3>,
> +			       <&ipmmu_mp0 4>, <&ipmmu_mp0 5>,
> +			       <&ipmmu_mp0 6>, <&ipmmu_mp0 7>,
> +			       <&ipmmu_mp0 8>, <&ipmmu_mp0 9>,
> +			       <&ipmmu_mp0 10>, <&ipmmu_mp0 11>,
> +			       <&ipmmu_mp0 12>, <&ipmmu_mp0 13>,
> +			       <&ipmmu_mp0 14>, <&ipmmu_mp0 15>;

I don't see ipmmu_mp0 in renesas-devel-20170503-v4.11.
Perhaps that portion should be dropped? Likewise below.

> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			resets = <&cpg 502>;
> +			#dma-cells = <1>;
> +			dma-channels = <16>;
> +		};
> +
> +		audma1: dma-controller@ec720000 {
> +			compatible = "renesas,dmac-r8a7796",
> +				     "renesas,rcar-dmac";
> +			reg = <0 0xec720000 0 0x10000>;
> +			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "error",
> +					"ch0", "ch1", "ch2", "ch3",
> +					"ch4", "ch5", "ch6", "ch7",
> +					"ch8", "ch9", "ch10", "ch11",
> +					"ch12", "ch13", "ch14", "ch15";
> +			clocks = <&cpg CPG_MOD 501>;
> +			clock-names = "fck";
> +			iommus = <&ipmmu_mp0 16>, <&ipmmu_mp0 17>,
> +			       <&ipmmu_mp0 18>, <&ipmmu_mp0 19>,
> +			       <&ipmmu_mp0 20>, <&ipmmu_mp0 21>,
> +			       <&ipmmu_mp0 22>, <&ipmmu_mp0 23>,
> +			       <&ipmmu_mp0 24>, <&ipmmu_mp0 25>,
> +			       <&ipmmu_mp0 26>, <&ipmmu_mp0 27>,
> +			       <&ipmmu_mp0 28>, <&ipmmu_mp0 29>,
> +			       <&ipmmu_mp0 30>, <&ipmmu_mp0 31>;
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			resets = <&cpg 501>;
> +			#dma-cells = <1>;
> +			dma-channels = <16>;
> +		};
> +
>  		hsusb: usb@e6590000 {
>  			/* placeholder */
>  		};
> -- 
> 1.9.1
> 
