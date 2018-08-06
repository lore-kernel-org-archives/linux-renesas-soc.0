Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:34138 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbeHFNUB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 09:20:01 -0400
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 12/14] arm64: dts: renesas: r8a77965: add CAN support
To: Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-13-erosca@de.adit-jv.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <90544b63-f91b-24e7-d1e1-fccc2cb1405d@ideasonboard.com>
Date: Mon, 6 Aug 2018 12:11:22 +0100
MIME-Version: 1.0
In-Reply-To: <20180804231114.21420-13-erosca@de.adit-jv.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Eugeniu,

On 05/08/18 00:11, Eugeniu Rosca wrote:
> According to R-Car Gen3 HW manual rev0.55E, R-Car M3-N has two CAN

rev 0.55E sounds like rather an old version of this document. Do you
have access to the later rev1.00 release?

(Not an issue for this patch itself, I can confirm that revision 1.00
still confirms M3-N CAN support)

> interfaces, similar to H3, M3-W and other SoCs from the same family.
> 
> Add CAN nodes to avoid below r8a77965-ulcb-kf.dtb build failure:
> Error: arch/arm64/boot/dts/renesas/ulcb-kf.dtsi:19.1-6 Label or path can0 not found
> Error: arch/arm64/boot/dts/renesas/ulcb-kf.dtsi:25.1-6 Label or path can1 not found

Again, this is somewhat referencing the future, as (in patch sequence)
the file "r8a77965-ulcb-kf.dts" does not yet exist, so does not really
need to be mentioned here.


> CAN support is inspired from below commits:
>  - v4.7 commit 308b7e4ba62e ("arm64: dts: r8a7795: Add CAN support")
>  - v4.11 commit 909c16252415 ("arm64: dts: r8a7796: Add CAN support")
>  - v4.12 commit bec0948e810f ("arm64: dts: r8a7796: Add reset control properties")
> 
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> index 486aecacb22a..cb8f8573d9ef 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -656,6 +656,38 @@
>  			status = "disabled";
>  		};
>  
> +		can0: can@e6c30000 {
> +			compatible = "renesas,can-r8a77965",
> +				     "renesas,rcar-gen3-can";
> +			reg = <0 0xe6c30000 0 0x1000>;
> +			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 916>,
> +			       <&cpg CPG_CORE R8A77965_CLK_CANFD>,
> +			       <&can_clk>;
> +			clock-names = "clkp1", "clkp2", "can_clk";
> +			assigned-clocks = <&cpg CPG_CORE R8A77965_CLK_CANFD>;
> +			assigned-clock-rates = <40000000>;

This doesn't look right. Sections 52A.2 has a note stating:

CANFD? must be set as follows.
R-Car H3, R-Car M3-W, R-Car M3-N, R-Car V3M, R-Car V3H, R-Car E3: 80 (MHz)

R-Car D3: 40 (MHz)


Could you verify / check in case this value should be 80MHz?

> +			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +			resets = <&cpg 916>;
> +			status = "disabled";
> +		};
> +
> +		can1: can@e6c38000 {
> +			compatible = "renesas,can-r8a77965",
> +				     "renesas,rcar-gen3-can";
> +			reg = <0 0xe6c38000 0 0x1000>;
> +			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 915>,
> +			       <&cpg CPG_CORE R8A77965_CLK_CANFD>,
> +			       <&can_clk>;
> +			clock-names = "clkp1", "clkp2", "can_clk";
> +			assigned-clocks = <&cpg CPG_CORE R8A77965_CLK_CANFD>;
> +			assigned-clock-rates = <40000000>;

Same here of course.


> +			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +			resets = <&cpg 915>;
> +			status = "disabled";
> +		};
> +
>  		pwm0: pwm@e6e30000 {
>  			compatible = "renesas,pwm-r8a77965", "renesas,pwm-rcar";
>  			reg = <0 0xe6e30000 0 8>;
> 
