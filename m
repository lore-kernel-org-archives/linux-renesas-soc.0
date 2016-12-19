Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34467 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752455AbcLSHvR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 02:51:17 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        joro@8bytes.org, geert+renesas@glider.be
Subject: Re: [PATCH v2 02/02] arm64: dts: r8a7795: Hook up SYS-DMAC to IPMMU
Date: Mon, 19 Dec 2016 09:51:44 +0200
Message-ID: <4878065.dMXMQ9htQo@avalon>
In-Reply-To: <148211399048.8020.7153630286323992170.sendpatchset@little-apple>
References: <148211397261.8020.4659661835061990009.sendpatchset@little-apple> <148211399048.8020.7153630286323992170.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

Thank you for the patch.

On Monday 19 Dec 2016 11:19:50 Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Hook up r8a7795 DMAC nodes to IPMMU-MP1, IPMMU-DS0 and IPMMU-DS1.

I assume you have verified that hooking up a disabled IOMMU doesn't adversely 
affect system operation.

> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Changes from V1:
>  - None
> 
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi |   40 +++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> --- 0002/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2016-12-19
> 11:03:23.310607110 +0900 @@ -368,6 +368,14 @@
>  			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>  			#dma-cells = <1>;
>  			dma-channels = <16>;
> +			iommus = <&ipmmu_mp1 0>, <&ipmmu_mp1 1>,
> +			       <&ipmmu_mp1 2>, <&ipmmu_mp1 3>,
> +			       <&ipmmu_mp1 4>, <&ipmmu_mp1 5>,
> +			       <&ipmmu_mp1 6>, <&ipmmu_mp1 7>,
> +			       <&ipmmu_mp1 8>, <&ipmmu_mp1 9>,
> +			       <&ipmmu_mp1 10>, <&ipmmu_mp1 11>,
> +			       <&ipmmu_mp1 12>, <&ipmmu_mp1 13>,
> +			       <&ipmmu_mp1 14>, <&ipmmu_mp1 15>;

This is the audio DMAC, you should update the commit subject.

With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		};
> 
>  		audma1: dma-controller@ec720000 {
> @@ -401,6 +409,14 @@
>  			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>  			#dma-cells = <1>;
>  			dma-channels = <16>;
> +			iommus = <&ipmmu_mp1 16>, <&ipmmu_mp1 17>,
> +			       <&ipmmu_mp1 18>, <&ipmmu_mp1 19>,
> +			       <&ipmmu_mp1 20>, <&ipmmu_mp1 21>,
> +			       <&ipmmu_mp1 22>, <&ipmmu_mp1 23>,
> +			       <&ipmmu_mp1 24>, <&ipmmu_mp1 25>,
> +			       <&ipmmu_mp1 26>, <&ipmmu_mp1 27>,
> +			       <&ipmmu_mp1 28>, <&ipmmu_mp1 29>,
> +			       <&ipmmu_mp1 30>, <&ipmmu_mp1 31>;
>  		};
> 
>  		pfc: pfc@e6060000 {
> @@ -567,6 +583,14 @@
>  			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>  			#dma-cells = <1>;
>  			dma-channels = <16>;
> +			iommus = <&ipmmu_ds0 0>, <&ipmmu_ds0 1>,
> +			       <&ipmmu_ds0 2>, <&ipmmu_ds0 3>,
> +			       <&ipmmu_ds0 4>, <&ipmmu_ds0 5>,
> +			       <&ipmmu_ds0 6>, <&ipmmu_ds0 7>,
> +			       <&ipmmu_ds0 8>, <&ipmmu_ds0 9>,
> +			       <&ipmmu_ds0 10>, <&ipmmu_ds0 11>,
> +			       <&ipmmu_ds0 12>, <&ipmmu_ds0 13>,
> +			       <&ipmmu_ds0 14>, <&ipmmu_ds0 15>;
>  		};
> 
>  		dmac1: dma-controller@e7300000 {
> @@ -600,6 +624,14 @@
>  			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>  			#dma-cells = <1>;
>  			dma-channels = <16>;
> +			iommus = <&ipmmu_ds1 0>, <&ipmmu_ds1 1>,
> +			       <&ipmmu_ds1 2>, <&ipmmu_ds1 3>,
> +			       <&ipmmu_ds1 4>, <&ipmmu_ds1 5>,
> +			       <&ipmmu_ds1 6>, <&ipmmu_ds1 7>,
> +			       <&ipmmu_ds1 8>, <&ipmmu_ds1 9>,
> +			       <&ipmmu_ds1 10>, <&ipmmu_ds1 11>,
> +			       <&ipmmu_ds1 12>, <&ipmmu_ds1 13>,
> +			       <&ipmmu_ds1 14>, <&ipmmu_ds1 15>;
>  		};
> 
>  		dmac2: dma-controller@e7310000 {
> @@ -633,6 +665,14 @@
>  			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>  			#dma-cells = <1>;
>  			dma-channels = <16>;
> +			iommus = <&ipmmu_ds1 16>, <&ipmmu_ds1 17>,
> +			       <&ipmmu_ds1 18>, <&ipmmu_ds1 19>,
> +			       <&ipmmu_ds1 20>, <&ipmmu_ds1 21>,
> +			       <&ipmmu_ds1 22>, <&ipmmu_ds1 23>,
> +			       <&ipmmu_ds1 24>, <&ipmmu_ds1 25>,
> +			       <&ipmmu_ds1 26>, <&ipmmu_ds1 27>,
> +			       <&ipmmu_ds1 28>, <&ipmmu_ds1 29>,
> +			       <&ipmmu_ds1 30>, <&ipmmu_ds1 31>;
>  		};
> 
>  		avb: ethernet@e6800000 {

-- 
Regards,

Laurent Pinchart
