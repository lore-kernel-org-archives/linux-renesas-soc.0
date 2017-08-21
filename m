Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:46429 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751814AbdHUJYw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2017 05:24:52 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a7796: Add FDP1 instance
Date: Mon, 21 Aug 2017 12:25:21 +0300
Message-ID: <1709301.HiysQ4booP@avalon>
In-Reply-To: <20170713112110.9627-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170713112110.9627-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thursday, 13 July 2017 14:21:10 EEST Laurent Pinchart wrote:
> The r8a7796 has a single FDP1 instance.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Could you pick this up ?

> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> Changes since v1:
> 
> - Added resets property
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> b/arch/arm64/boot/dts/renesas/r8a7796.dtsi index ef1120f4e561..898a8dbb31de
> 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -1562,6 +1562,16 @@
>  			/* placeholder */
>  		};
> 
> +		fdp1@fe940000 {
> +			compatible = "renesas,fdp1";
> +			reg = <0 0xfe940000 0 0x2400>;
> +			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 119>;
> +			power-domains = <&sysc R8A7796_PD_A3VC>;
> +			resets = <&cpg 119>;
> +			renesas,fcp = <&fcpf0>;
> +		};
> +
>  		fcpf0: fcp@fe950000 {
>  			compatible = "renesas,fcpf";
>  			reg = <0 0xfe950000 0 0x200>;


-- 
Regards,

Laurent Pinchart
