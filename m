Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34833 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751423AbeCUIvm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Mar 2018 04:51:42 -0400
Date: Wed, 21 Mar 2018 09:51:33 +0100
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: Update IPMMU DS1 bit
 number
Message-ID: <20180321085133.gwc2khtzgny5wnyp@verge.net.au>
References: <152153226789.8528.13236911976628814785.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <152153226789.8528.13236911976628814785.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 20, 2018 at 04:51:07PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Judging by "R-Car-Gen3-rev0.80" IPMMU IMSSTR register documentation
> for [R-Car V3M] the DS1 bit field should be bit 0.
> 
> Update the ipmmu-main property to make it match the data sheet.

Thanks, I have confirmed this. Apologies for this error.

AFIK this IP block is currently unused, I wonder if it,
ipmmu_mm and ipmmu_rt should have status = "disabled" added.

For now I have applied this change to v4.18 with the following tag:

Fixes: ce3b52a1595b ("arm64: dts: renesas: r8a77970: Add IPMMU device
nodes")

> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
>  Based on top of renesas-drivers-2018-03-13-v4.16-rc5
> 
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- 0001/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ work/arch/arm64/boot/dts/renesas/r8a77970.dtsi	2018-03-20 15:26:18.250607110 +0900
> @@ -160,7 +160,7 @@
>  		ipmmu_ds1: mmu@e7740000 {
>  			compatible = "renesas,ipmmu-r8a77970";
>  			reg = <0 0xe7740000 0 0x1000>;
> -			renesas,ipmmu-main = <&ipmmu_mm 1>;
> +			renesas,ipmmu-main = <&ipmmu_mm 0>;
>  			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
>  			#iommu-cells = <1>;
>  		};
> 
