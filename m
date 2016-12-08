Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:35358 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751064AbcLHJJG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Dec 2016 04:09:06 -0500
Received: by mail-wm0-f47.google.com with SMTP id a197so207070802wmd.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Dec 2016 01:09:05 -0800 (PST)
Subject: Re: [PATCH v2 3/4] arm64: renesas: r8a7796 dtsi: Add all HSCIF nodes
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org
References: <1481129088-22026-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1481129088-22026-4-git-send-email-ulrich.hecht+renesas@gmail.com>
Cc: magnus.damm@gmail.com
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1b13b1aa-5acb-263b-5720-21f99744da0e@cogentembedded.com>
Date: Thu, 8 Dec 2016 12:09:02 +0300
MIME-Version: 1.0
In-Reply-To: <1481129088-22026-4-git-send-email-ulrich.hecht+renesas@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/7/2016 7:44 PM, Ulrich Hecht wrote:

> Add the device nodes for all HSCIF serial ports, incl. clocks, and
> clock domain.

    Not power domain?

> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 70 ++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 7bf0f2f..c508e0f 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -421,6 +421,76 @@
>  			};
>  		};
>
> +		hscif0: serial@e6540000 {
> +			compatible = "renesas,hscif-r8a7796",
> +				     "renesas,rcar-gen3-hscif",
> +				     "renesas,hscif";
> +			reg = <0 0xe6540000 0 96>;

    0xc0?

> +			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 520>,
> +				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
> +				 <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
> +		hscif1: serial@e6550000 {
> +			compatible = "renesas,hscif-r8a7796",
> +				     "renesas,rcar-gen3-hscif",
> +				     "renesas,hscif";
> +			reg = <0 0xe6550000 0 96>;

    Here as well?

> +			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 519>,
> +				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
> +				 <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
> +		hscif2: serial@e6560000 {
> +			compatible = "renesas,hscif-r8a7796",
> +				     "renesas,rcar-gen3-hscif",
> +				     "renesas,hscif";
> +			reg = <0 0xe6560000 0 96>;

    And here...

> +			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 518>,
> +				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
> +				 <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
> +		hscif3: serial@e66a0000 {
> +			compatible = "renesas,hscif-r8a7796",
> +				     "renesas,rcar-gen3-hscif",
> +				     "renesas,hscif";
> +			reg = <0 0xe66a0000 0 96>;

    And here...

> +			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 517>,
> +				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
> +				 <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
> +		hscif4: serial@e66b0000 {
> +			compatible = "renesas,hscif-r8a7796",
> +				     "renesas,rcar-gen3-hscif",
> +				     "renesas,hscif";
> +			reg = <0 0xe66b0000 0 96>;

    And here...

> +			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 516>,
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

MBR, Sergei
