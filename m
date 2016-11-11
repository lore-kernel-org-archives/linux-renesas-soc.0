Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55336 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932614AbcKKBCX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2016 20:02:23 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: iommu@lists.linux-foundation.org,
        laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        joro@8bytes.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        robin.murphy@arm.com, m.szyprowski@samsung.com
Subject: Re: [PATCH v6 04/07] iommu/ipmmu-vmsa: Break out domain allocation code
Date: Fri, 11 Nov 2016 03:02:26 +0200
Message-ID: <4121631.0oUPCTEmnf@avalon>
In-Reply-To: <20161019233613.10506.60821.sendpatchset@little-apple>
References: <20161019233533.10506.16810.sendpatchset@little-apple> <20161019233613.10506.60821.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

Thank you for the patch.

On Thursday 20 Oct 2016 08:36:13 Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Break out the domain allocation code into a separate function.
> This is preparation for future code sharing.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Joerg Roedel <jroedel@suse.de>

This looks good to me,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

(assuming my review of the next patches in the series won't make me conclude 
that this patch isn't needed :-))

> ---
> 
>  Changes since V5:
>  - None
> 
>  Changes since V4:
>  - None
> 
>  Changes since V3:
>  - None
> 
>  Changes since V2:
>  - Included this new patch as-is from the following series:
>    [PATCH 00/04] iommu/ipmmu-vmsa: IPMMU CONFIG_IOMMU_DMA update
> 
>  drivers/iommu/ipmmu-vmsa.c |   13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> --- 0008/drivers/iommu/ipmmu-vmsa.c
> +++ work/drivers/iommu/ipmmu-vmsa.c	2016-09-20 21:56:59.220607110 +0900
> @@ -507,13 +507,10 @@ static irqreturn_t ipmmu_irq(int irq, vo
>   * IOMMU Operations
>   */
> 
> -static struct iommu_domain *ipmmu_domain_alloc(unsigned type)
> +static struct iommu_domain *__ipmmu_domain_alloc(unsigned type)
>  {
>  	struct ipmmu_vmsa_domain *domain;
> 
> -	if (type != IOMMU_DOMAIN_UNMANAGED)
> -		return NULL;
> -
>  	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
>  	if (!domain)
>  		return NULL;
> @@ -523,6 +520,14 @@ static struct iommu_domain *ipmmu_domain
>  	return &domain->io_domain;
>  }
> 
> +static struct iommu_domain *ipmmu_domain_alloc(unsigned type)
> +{
> +	if (type != IOMMU_DOMAIN_UNMANAGED)
> +		return NULL;
> +
> +	return __ipmmu_domain_alloc(type);
> +}
> +
>  static void ipmmu_domain_free(struct iommu_domain *io_domain)
>  {
>  	struct ipmmu_vmsa_domain *domain = to_vmsa_domain(io_domain);

-- 
Regards,

Laurent Pinchart
