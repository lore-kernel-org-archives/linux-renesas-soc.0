Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44859 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932739AbcJTJSV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Oct 2016 05:18:21 -0400
Date: Thu, 20 Oct 2016 10:42:30 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: r8a7779: Fix DU reg property
Message-ID: <20161020084229.GE4612@verge.net.au>
References: <1476829382-14785-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476829382-14785-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Wed, Oct 19, 2016 at 01:23:02AM +0300, Laurent Pinchart wrote:
> The system uses one address cell and one size cell, not two. Fix the DU
> DT node.

Do you want to handle this as a fix for v4.9? If so shall we add the
following?

Fixes: 1f08bbe8ac73 ("ARM: shmobile: r8a7779: Add DU node to device tree")

Else I'll just queue it up for v4.10.

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  arch/arm/boot/dts/r8a7779.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
> index b9bbcce69dfb..9d5b8fa3da8b 100644
> --- a/arch/arm/boot/dts/r8a7779.dtsi
> +++ b/arch/arm/boot/dts/r8a7779.dtsi
> @@ -420,7 +420,7 @@
>  
>  	du: display@fff80000 {
>  		compatible = "renesas,du-r8a7779";
> -		reg = <0 0xfff80000 0 0x40000>;
> +		reg = <0xfff80000 0x40000>;
>  		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&mstp1_clks R8A7779_CLK_DU>;
>  		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
> -- 
> Regards,
> 
> Laurent Pinchart
> 
