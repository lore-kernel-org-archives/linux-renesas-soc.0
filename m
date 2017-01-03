Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:56436 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757759AbdACJYL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jan 2017 04:24:11 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, magnus.damm@gmail.com,
        linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: r8a7791: link DU to VSPDs
Date: Tue, 03 Jan 2017 11:24:12 +0200
Message-ID: <1632814.9a17uG6rp2@avalon>
In-Reply-To: <1922293.x1RvWWSErN@wasted.cogentembedded.com>
References: <1529351.Fac5N2tKoF@wasted.cogentembedded.com> <1922293.x1RvWWSErN@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Thursday 15 Dec 2016 01:07:52 Sergei Shtylyov wrote:
> Add the "vsps" property to the DU device node in order to link this node to
> the VSPD nodes.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

I'd like to first address the issues I've pointed out on the driver side of 
this change.

> ---
> This patch is against the 'renesas-devel-20161212-v4.9' of Simon Horman's
> 'renesas.git' repo.  It's  only meaningful if the DU driver patch I've just
> posted is applied.
> 
>  arch/arm/boot/dts/r8a7791.dtsi |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> Index: renesas/arch/arm/boot/dts/r8a7791.dtsi
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7791.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7791.dtsi
> @@ -989,7 +989,7 @@
>  		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
>  	};
> 
> -	vsp1@fe930000 {
> +	vspd0: vsp1@fe930000 {
>  		compatible = "renesas,vsp1";
>  		reg = <0 0xfe930000 0 0x8000>;
>  		interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
> @@ -997,7 +997,7 @@
>  		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
>  	};
> 
> -	vsp1@fe938000 {
> +	vspd1: vsp1@fe938000 {
>  		compatible = "renesas,vsp1";
>  		reg = <0 0xfe938000 0 0x8000>;
>  		interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1016,6 +1016,7 @@
>  			 <&mstp7_clks R8A7791_CLK_DU1>,
>  			 <&mstp7_clks R8A7791_CLK_LVDS0>;
>  		clock-names = "du.0", "du.1", "lvds.0";
> +		vsps = <&vspd0 &vspd1>;
>  		status = "disabled";
> 
>  		ports {

-- 
Regards,

Laurent Pinchart
