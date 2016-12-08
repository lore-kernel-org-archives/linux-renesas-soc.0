Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:38087 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751243AbcLHJGE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Dec 2016 04:06:04 -0500
Received: by mail-wm0-f48.google.com with SMTP id f82so14979173wmf.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Dec 2016 01:06:03 -0800 (PST)
Subject: Re: [PATCH v2 2/3] arm64: renesas: r8a7796: Add all SCIF nodes
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org
References: <1481129067-21949-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1481129067-21949-3-git-send-email-ulrich.hecht+renesas@gmail.com>
Cc: magnus.damm@gmail.com
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <cecfecc0-af7c-e18d-4017-c4998e64779c@cogentembedded.com>
Date: Thu, 8 Dec 2016 12:06:00 +0300
MIME-Version: 1.0
In-Reply-To: <1481129067-21949-3-git-send-email-ulrich.hecht+renesas@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/7/2016 7:44 PM, Ulrich Hecht wrote:

> Add the device nodes for all R-Car H3 SCIF serial ports, incl. clocks
> and clock domain.

    Not power domain?

> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 65 ++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 7bf0f2f..c5f0df5 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -421,6 +421,32 @@
>  			};
>  		};
>
> +		scif0: serial@e6e60000 {
> +			compatible = "renesas,scif-r8a7796",
> +				     "renesas,rcar-gen3-scif", "renesas,scif";
> +			reg = <0 0xe6e60000 0 64>;

     0x40, perhaps?

> +			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 207>,
> +				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
> +				 <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
> +		scif1: serial@e6e68000 {
> +			compatible = "renesas,scif-r8a7796",
> +				     "renesas,rcar-gen3-scif", "renesas,scif";
> +			reg = <0 0xe6e68000 0 64>;

    Same here...

> +			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 206>,
> +				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
> +				 <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
>  		scif2: serial@e6e88000 {
>  			compatible = "renesas,scif-r8a7796",
>  				     "renesas,rcar-gen3-scif", "renesas,scif";
> @@ -434,6 +460,45 @@
>  			status = "disabled";
>  		};
>
> +		scif3: serial@e6c50000 {
> +			compatible = "renesas,scif-r8a7796",
> +				     "renesas,rcar-gen3-scif", "renesas,scif";
> +			reg = <0 0xe6c50000 0 64>;

    And here...

> +			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 204>,
> +				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
> +				 <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
> +		scif4: serial@e6c40000 {
> +			compatible = "renesas,scif-r8a7796",
> +				     "renesas,rcar-gen3-scif", "renesas,scif";
> +			reg = <0 0xe6c40000 0 64>;

    And here...

> +			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 203>,
> +				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
> +				 <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
> +		scif5: serial@e6f30000 {
> +			compatible = "renesas,scif-r8a7796",
> +				     "renesas,rcar-gen3-scif", "renesas,scif";
> +			reg = <0 0xe6f30000 0 64>;

    And here...

> +			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 202>,
> +				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
> +				 <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
>  		msiof0: spi@e6e90000 {
>  			compatible = "renesas,msiof-r8a7796";
>  			reg = <0 0xe6e90000 0 0x0064>;

MBR, Sergei
