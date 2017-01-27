Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:35724 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751020AbdA0Tcw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 14:32:52 -0500
Subject: Re: [PATCH/RFC] iommu/dma: Per-domain flag to control size-alignment
To: Magnus Damm <magnus.damm@gmail.com>,
        iommu@lists.linux-foundation.org
References: <148549826507.23190.1460689571069015835.sendpatchset@little-apple>
Cc: linux-renesas-soc@vger.kernel.org, joro@8bytes.org
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <464656f9-970e-1271-0d9e-b62a0673e1dd@arm.com>
Date: Fri, 27 Jan 2017 17:38:05 +0000
MIME-Version: 1.0
In-Reply-To: <148549826507.23190.1460689571069015835.sendpatchset@little-apple>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On 27/01/17 06:24, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Introduce the flag "no_size_align" to allow disabling size-alignment
> on a per-domain basis. This follows the suggestion by the comment
> in the code, however a per-device control may be preferred?
> 
> Needed to make virtual space contiguous for certain devices.

That sounds very suspicious - a single allocation is contiguous with
itself by definition, and anyone relying on multiple allocations being
contiguous with one another is doing it wrong, because there's no way we
could ever guarantee that (with this allocator, at any rate). I'd be
very reticent to touch this without a specific example of what problem
it solves.

Since I understand all this stuff a lot more deeply now that back when I
first wrote that comment, I'd say that if there really is some real need
to implement this feature, it should be a dma_attr flag, i.e. not even
per-device, but per-allocation. We'd be breaking a behaviour currently
guaranteed by the DMA API, so we need to be really sure the caller is OK
with that - having it be their responsibility to explicitly ask is
definitely safest.

Robin.

> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  drivers/iommu/dma-iommu.c |    6 +++++-
>  include/linux/iommu.h     |    1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> --- 0001/drivers/iommu/dma-iommu.c
> +++ work/drivers/iommu/dma-iommu.c	2017-01-27 15:17:50.280607110 +0900
> @@ -209,14 +209,18 @@ static struct iova *__alloc_iova(struct
>  	struct iova_domain *iovad = cookie_iovad(domain);
>  	unsigned long shift = iova_shift(iovad);
>  	unsigned long length = iova_align(iovad, size) >> shift;
> +	bool size_aligned = true;
>  
>  	if (domain->geometry.force_aperture)
>  		dma_limit = min(dma_limit, domain->geometry.aperture_end);
> +
> +	if (domain->no_size_align)
> +		size_aligned = false;
>  	/*
>  	 * Enforce size-alignment to be safe - there could perhaps be an
>  	 * attribute to control this per-device, or at least per-domain...
>  	 */
> -	return alloc_iova(iovad, length, dma_limit >> shift, true);
> +	return alloc_iova(iovad, length, dma_limit >> shift, size_aligned);
>  }
>  
>  /* The IOVA allocator knows what we mapped, so just unmap whatever that was */
> --- 0001/include/linux/iommu.h
> +++ work/include/linux/iommu.h	2017-01-27 15:16:37.630607110 +0900
> @@ -83,6 +83,7 @@ struct iommu_domain {
>  	iommu_fault_handler_t handler;
>  	void *handler_token;
>  	struct iommu_domain_geometry geometry;
> +	bool no_size_align;
>  	void *iova_cookie;
>  };
>  
> 
