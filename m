Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34415 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752794AbcLSHjH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 02:39:07 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        joro@8bytes.org, geert+renesas@glider.be
Subject: Re: [PATCH v2 01/02] arm64: dts: r8a7795: Add IPMMU device nodes
Date: Mon, 19 Dec 2016 09:39:33 +0200
Message-ID: <2119958.eHjD4ns0mW@avalon>
In-Reply-To: <148211398170.8020.4003819752298091344.sendpatchset@little-apple>
References: <148211397261.8020.4659661835061990009.sendpatchset@little-apple> <148211398170.8020.4003819752298091344.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

Thank you for the patch.

On Monday 19 Dec 2016 11:19:41 Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Add r8a7795 IPMMU nodes and keep all disabled by default.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Changes from V1:
>  - None
> 
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi |  113 +++++++++++++++++++++++++++
>  1 file changed, 113 insertions(+)
> 
> --- 0001/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2016-12-19
> 11:02:33.260607110 +0900 @@ -423,6 +423,119 @@
>  			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>  		};
> 
> +		ipmmu_vi: mmu@febd0000 {
> +			compatible = "renesas,ipmmu-r8a7795";
> +			reg = <0 0xfebd0000 0 0x1000>; /* IPMMU-VI */
> +			renesas,ipmmu-main = <&ipmmu_mm 11>;
> +			#iommu-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		ipmmu_vp: mmu@fe990000 {
> +			compatible = "renesas,ipmmu-r8a7795";
> +			reg = <0 0xfe990000 0 0x1000>; /* IPMMU-VP */
> +			renesas,ipmmu-main = <&ipmmu_mm 12>;
> +			#iommu-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		ipmmu_vc0: mmu@fe6b0000 {
> +			compatible = "renesas,ipmmu-r8a7795";
> +			reg = <0 0xfe6b0000 0 0x1000>; /* IPMMU-VC0 */
> +			renesas,ipmmu-main = <&ipmmu_mm 9>;
> +			#iommu-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		ipmmu_vc1: mmu@fe6f0000 {
> +			compatible = "renesas,ipmmu-r8a7795";
> +			reg = <0 0xfe6f0000 0 0x1000>; /* IPMMU-VC1 */
> +			renesas,ipmmu-main = <&ipmmu_mm 10>;
> +			#iommu-cells = <1>;
> +			status = "disabled";
> +		};

According to the datasheet the VC0 and VC1 instances are in the A3VC power 
domain. The VP instance is documented to be in the A3VP power domain, but on 
ES1.x only. I'm not sure whether the lack of power domain for ES2 is an 
oversight in the documentation or a real hardware change. The other ones 
should probably be added to the always-on power domain.

> +		ipmmu_pv0: mmu@fd800000 {
> +			compatible = "renesas,ipmmu-r8a7795";
> +			reg = <0 0xfd800000 0 0x1000>; /* IPMMU-PV0 */
> +			renesas,ipmmu-main = <&ipmmu_mm 6>;
> +			#iommu-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		ipmmu_ir: mmu@ff8b0000 {
> +			compatible = "renesas,ipmmu-r8a7795";
> +			reg = <0 0xff8b0000 0 0x1000>; /* IPMMU-IR */
> +			renesas,ipmmu-main = <&ipmmu_mm 3>;
> +			#iommu-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		ipmmu_hc: mmu@e6570000 {
> +			compatible = "renesas,ipmmu-r8a7795";
> +			reg = <0 0xe6570000 0 0x1000>; /* IPMMU-HC */
> +			renesas,ipmmu-main = <&ipmmu_mm 2>;
> +			#iommu-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		ipmmu_rt: mmu@ffc80000 {
> +			compatible = "renesas,ipmmu-r8a7795";
> +			reg = <0 0xffc80000 0 0x1000>; /* IPMMU-RT */
> +			renesas,ipmmu-main = <&ipmmu_mm 7>;
> +			#iommu-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		ipmmu_mp0: mmu@ec670000 {
> +			compatible = "renesas,ipmmu-r8a7795";
> +			reg = <0 0xec670000 0 0x1000>; /* IPMMU-MP0 */
> +			renesas,ipmmu-main = <&ipmmu_mm 4>;
> +			#iommu-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		ipmmu_mp1: mmu@ec680000 {
> +			compatible = "renesas,ipmmu-r8a7795";
> +			reg = <0 0xec680000 0 0x1000>; /* IPMMU-MP1 */
> +			renesas,ipmmu-main = <&ipmmu_mm 5>;
> +			#iommu-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		ipmmu_sy: mmu@e7730000 {
> +			compatible = "renesas,ipmmu-r8a7795";
> +			reg = <0 0xe7730000 0 0x1000>; /* IPMMU-SY */
> +			renesas,ipmmu-main = <&ipmmu_mm 8>;
> +			#iommu-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		ipmmu_ds0: mmu@e6740000 {
> +			compatible = "renesas,ipmmu-r8a7795";
> +			reg = <0 0xe6740000 0 0x1000>; /* IPMMU-DS0 */
> +			renesas,ipmmu-main = <&ipmmu_mm 0>;
> +			#iommu-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		ipmmu_ds1: mmu@e7740000 {
> +			compatible = "renesas,ipmmu-r8a7795";
> +			reg = <0 0xe7740000 0 0x1000>; /* IPMMU-DS1 */
> +			renesas,ipmmu-main = <&ipmmu_mm 1>;
> +			#iommu-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		ipmmu_mm: mmu@e67b0000 {
> +			compatible = "renesas,ipmmu-r8a7795";

Wouldn't it make sense to use a different compatible string for the master 
IOMMU, as it's quite different from the slaves ?

> +			reg = <0 0xe67b0000 0 0x1000>; /* IPMMU-MM */
> +			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
> +			#iommu-cells = <1>;
> +			status = "disabled";

I wonder where the clocks are. They're not documented, but I'd be surprised if 
they did not exist. This can always be addressed later anyway, it's not a 
blocker.

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

(with all register addresses, interrupts and slave indices verified)

> +		};
> +
>  		dmac0: dma-controller@e6700000 {
>  			compatible = "renesas,dmac-r8a7795",
>  				     "renesas,rcar-dmac";

-- 
Regards,

Laurent Pinchart
