Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33140 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729364AbeGZO2C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jul 2018 10:28:02 -0400
Date: Thu, 26 Jul 2018 15:11:10 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        iommu@lists.linux-foundation.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Clarify supported platforms
Message-ID: <20180726131109.4jftfgquid3d2hys@verge.net.au>
References: <20180725131029.5643-1-geert+renesas@glider.be>
 <1761460.f6S6l84xoB@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1761460.f6S6l84xoB@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 26, 2018 at 12:08:33AM +0300, Laurent Pinchart wrote:
> Hi Geert,
> 
> Thank you for the patch.
> 
> On Wednesday, 25 July 2018 16:10:29 EEST Geert Uytterhoeven wrote:
> > The Renesas IPMMU-VMSA driver supports not just R-Car H2 and M2 SoCs,
> > but also other R-Car Gen2 and R-Car Gen3 SoCs.
> > 
> > Drop a superfluous "Renesas" while at it.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> > ---
> >  drivers/iommu/Kconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index 568ae81b0e99b67b..c69dc0b29b5df37f 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -306,8 +306,8 @@ config IPMMU_VMSA
> >  	select IOMMU_IO_PGTABLE_LPAE
> >  	select ARM_DMA_USE_IOMMU
> >  	help
> > -	  Support for the Renesas VMSA-compatible IPMMU Renesas found in the
> > -	  R-Mobile APE6 and R-Car H2/M2 SoCs.
> > +	  Support for the Renesas VMSA-compatible IPMMU found in the R-Mobile
> > +	  APE6, R-Car Gen2, and R-Car Gen3 SoCs.

Perhaps:

	APE6, and R-Car Gen2 and Gen3 SoCs.

> >  	  If unsure, say N.
> 
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
> 
