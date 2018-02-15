Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53475 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161053AbeBOTRN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 14:17:13 -0500
Date: Thu, 15 Feb 2018 20:17:09 +0100
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: renesass: r8a77970: add FCPVD support
Message-ID: <20180215191708.6hbgw3senigbzkzy@verge.net.au>
References: <20180208154720.5766-1-niklas.soderlund+renesas@ragnatech.se>
 <20180208154720.5766-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180208154720.5766-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 08, 2018 at 04:47:16PM +0100, Niklas Söderlund wrote:
> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Describe FCPVD0 in the R8A77970 device tree; it will be used by VSPD0 in
> the next patch...
> 
> Based on the original (and large) patch by Daisuke Matsushita
> <daisuke.matsushita.ns@hitachi.com>.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> index 13c88414cb432b1a..2567e68fe0c6cf7b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -612,6 +612,14 @@
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  		};
> +
> +		fcpvd0: fcp@fea27000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfea27000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 603>;
> +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +			resets = <&cpg 603>;

Any reason the following is omitted?

			iommus = <&ipmmu_vi0 8>;

> +		};
>  	};
>  
>  	timer {
> -- 
> 2.16.1
> 
