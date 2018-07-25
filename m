Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:38080 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730014AbeGYWV1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 18:21:27 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        iommu@lists.linux-foundation.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Clarify supported platforms
Date: Thu, 26 Jul 2018 00:08:33 +0300
Message-ID: <1761460.f6S6l84xoB@avalon>
In-Reply-To: <20180725131029.5643-1-geert+renesas@glider.be>
References: <20180725131029.5643-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Wednesday, 25 July 2018 16:10:29 EEST Geert Uytterhoeven wrote:
> The Renesas IPMMU-VMSA driver supports not just R-Car H2 and M2 SoCs,
> but also other R-Car Gen2 and R-Car Gen3 SoCs.
> 
> Drop a superfluous "Renesas" while at it.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/iommu/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 568ae81b0e99b67b..c69dc0b29b5df37f 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -306,8 +306,8 @@ config IPMMU_VMSA
>  	select IOMMU_IO_PGTABLE_LPAE
>  	select ARM_DMA_USE_IOMMU
>  	help
> -	  Support for the Renesas VMSA-compatible IPMMU Renesas found in the
> -	  R-Mobile APE6 and R-Car H2/M2 SoCs.
> +	  Support for the Renesas VMSA-compatible IPMMU found in the R-Mobile
> +	  APE6, R-Car Gen2, and R-Car Gen3 SoCs.
> 
>  	  If unsure, say N.


-- 
Regards,

Laurent Pinchart
