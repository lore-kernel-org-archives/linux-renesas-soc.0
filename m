Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:50942 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726635AbeKGWxR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Nov 2018 17:53:17 -0500
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Fix crash on early domain free
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20181107131850.11584-1-geert+renesas@glider.be>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e4dcd8b2-768e-b11d-b6de-337b7e942050@arm.com>
Date: Wed, 7 Nov 2018 13:22:52 +0000
MIME-Version: 1.0
In-Reply-To: <20181107131850.11584-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-11-07 1:18 pm, Geert Uytterhoeven wrote:
> If iommu_ops.add_device() fails, iommu_ops.domain_free() is still
> called, leading to a crash, as the domain was only partially
> initialized:
> 
>      ipmmu-vmsa e67b0000.mmu: Cannot accommodate DMA translation for IOMMU page tables
>      sata_rcar ee300000.sata: Unable to initialize IPMMU context
>      iommu: Failed to add device ee300000.sata to group 0: -22
>      Unable to handle kernel NULL pointer dereference at virtual address 0000000000000038
>      ...
>      Call trace:
>       ipmmu_domain_free+0x1c/0xa0
>       iommu_group_release+0x48/0x68
>       kobject_put+0x74/0xe8
>       kobject_del.part.0+0x3c/0x50
>       kobject_put+0x60/0xe8
>       iommu_group_get_for_dev+0xa8/0x1f0
>       ipmmu_add_device+0x1c/0x40
>       of_iommu_configure+0x118/0x190
> 
> Fix this by checking if the domain's context already exists, before
> trying to destroy it.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/iommu/ipmmu-vmsa.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index c4114b92652eb0c9..a8b2c649c1d1f1b9 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -498,6 +498,9 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
>   
>   static void ipmmu_domain_destroy_context(struct ipmmu_vmsa_domain *domain)
>   {
> +	if (!domain->mmu)
> +		return;
> +
>   	/*
>   	 * Disable the context. Flush the TLB as required when modifying the
>   	 * context registers.
> 
