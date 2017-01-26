Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH/RFC] iommu/ipmmu-vmsa: Restrict IOMMU Domain Geometry to
 32-bit address space
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <magnus.damm@gmail.com>
References: <1485424391-29914-1-git-send-email-geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <78112a99-dee0-c163-1d16-68a17f64f701@arm.com>
Date: Thu, 26 Jan 2017 11:23:31 +0000
MIME-Version: 1.0
In-Reply-To: <1485424391-29914-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 26/01/17 09:53, Geert Uytterhoeven wrote:
> Currently, the IPMMU/VMSA driver supports 32-bit I/O Virtual Addresses
> only, and thus sets io_pgtable_cfg.ias = 32.  However, it doesn't force
> a 32-bit IOVA space through the IOMMU Domain Geometry.
> 
> Hence if a device (e.g. SYS-DMAC) rightfully configures a 40-bit DMA
> mask, it will still be handed out a 40-bit IOVA, outside the 32-bit IOVA
> space, leading to out-of-bounds accesses of the PGD when mapping the
> IOVA.
> 
> Force a 32-bit IOMMU Domain Geometry to fix this.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Should the generic code restrict the geometry based on IAS instead?

Which generic code? IAS is specific to the io-pgtable library (well,
really it's an ARM-SMMU-ism, but "input address size" is a fairly
portable concept), but io-pgtable is just factored-out driver helper
code and doesn't know anything about iommu_domains and the IOMMU API.
Conversely, the IOMMU API core and kernel code beyond also know nothing
about io-pgtable internals - in fact the domain geometry *is* how the
IOMMU driver communicates its configured address space size to the
outside world.

Robin.

> ---
>  drivers/iommu/ipmmu-vmsa.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index 798578f1676480c6..eb8b3df8733b15fb 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -424,6 +424,8 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
>  	domain->cfg.ias = 32;
>  	domain->cfg.oas = 40;
>  	domain->cfg.tlb = &ipmmu_gather_ops;
> +	domain->io_domain.geometry.aperture_end = DMA_BIT_MASK(32);
> +	domain->io_domain.geometry.force_aperture = true;
>  	/*
>  	 * TODO: Add support for coherent walk through CCI with DVM and remove
>  	 * cache handling. For now, delegate it to the io-pgtable code.
> 
