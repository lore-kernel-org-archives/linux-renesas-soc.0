Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:46449 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752412AbeBTPbA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 10:31:00 -0500
Received: by mail-lf0-f66.google.com with SMTP id r80so4739606lfe.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2018 07:30:59 -0800 (PST)
Subject: Re: [PATCH v2 19/19] ARM64: dts: r8a77965: Add EtherAVB device node
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, geert@linux-m68k.org,
        horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1519139541-18783-1-git-send-email-jacopo+renesas@jmondi.org>
 <1519139541-18783-20-git-send-email-jacopo+renesas@jmondi.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <cf157266-5ea7-6795-1e31-0d1ccf85e7e8@cogentembedded.com>
Date: Tue, 20 Feb 2018 18:30:56 +0300
MIME-Version: 1.0
In-Reply-To: <1519139541-18783-20-git-send-email-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/20/2018 06:12 PM, Jacopo Mondi wrote:

> Populate the ethernet@e6800000 device node to enable Ethernet interface
> for R-Car M3-N (r8a77965) SoC.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> ---
> v1 -> v2:
> - Replace ALWAYS_ON power area identifier with numeric constant
> ---
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 43 ++++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> index 55f05f7..c249895 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -520,7 +520,48 @@
>  		};
>  
>  		avb: ethernet@e6800000 {
> -			/* placeholder */
> +			compatible = "renesas,etheravb-r8a77965",
> +				     "renesas,etheravb-rcar-gen3";
> +			reg = <0 0xe6800000 0 0x800>, <0 0xe6a00000 0 0x10000>;
> +			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "ch0", "ch1", "ch2", "ch3",
> +					  "ch4", "ch5", "ch6", "ch7",
> +					  "ch8", "ch9", "ch10", "ch11",
> +					  "ch12", "ch13", "ch14", "ch15",
> +					  "ch16", "ch17", "ch18", "ch19",
> +					  "ch20", "ch21", "ch22", "ch23",
> +					  "ch24";
> +			clocks = <&cpg CPG_MOD 812>;
> +			power-domains = <&sysc 32>;
> +			resets = <&cpg 812>;
> +			phy-mode = "rgmii-txid";

   Why not just "rgmii"? TX delay is a board specific detail, no?

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
>  		};
>  
>  		csi20: csi2@fea80000 {
> 

MBR, Sergei
