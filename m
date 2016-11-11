Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55320 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932614AbcKKBAc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2016 20:00:32 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: iommu@lists.linux-foundation.org,
        laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        joro@8bytes.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        robin.murphy@arm.com, m.szyprowski@samsung.com
Subject: Re: [PATCH v6 03/07] iommu/ipmmu-vmsa: Break out utlb parsing code
Date: Fri, 11 Nov 2016 03:00:33 +0200
Message-ID: <3032720.BPnZvxWODA@avalon>
In-Reply-To: <20161019233603.10506.93030.sendpatchset@little-apple>
References: <20161019233533.10506.16810.sendpatchset@little-apple> <20161019233603.10506.93030.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

Thank you for the patch.

On Thursday 20 Oct 2016 08:36:03 Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Break out the utlb parsing code and dev_data allocation into a
> separate function. This is preparation for future code sharing.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Joerg Roedel <jroedel@suse.de>
> ---
> 
>  Changes since V5:
>  - None
> 
>  Changes since V4:
>  - Dropped hunk with fix to apply on top of:
>    b1e2afc iommu/ipmmu-vmsa: Fix wrong error handle of ipmmu_add_device
> 
>  Changes since V3:
>  - Initialize "mmu" to NULL, check before accessing
>  - Removed group parameter from ipmmu_init_platform_device()
> 
>  Changes since V2:
>  - Included this new patch from the following series:
>    [PATCH 00/04] iommu/ipmmu-vmsa: IPMMU CONFIG_IOMMU_DMA update
>  - Reworked code to fit on top on previous two patches in current series.
> 
>  drivers/iommu/ipmmu-vmsa.c |   58 ++++++++++++++++++++++++++---------------
>  1 file changed, 37 insertions(+), 21 deletions(-)
> 
> --- 0006/drivers/iommu/ipmmu-vmsa.c
> +++ work/drivers/iommu/ipmmu-vmsa.c	2016-09-20 21:49:34.580607110 +0900
> @@ -647,22 +647,15 @@ static int ipmmu_find_utlbs(struct ipmmu
>  	return 0;
>  }
> 
> -static int ipmmu_add_device(struct device *dev)
> +static int ipmmu_init_platform_device(struct device *dev)

The device doesn't have to be a platform device, how about calling this 
ipmmu_init_device_archdata() ?

>  {
>  	struct ipmmu_vmsa_archdata *archdata;
>  	struct ipmmu_vmsa_device *mmu;
> -	struct iommu_group *group = NULL;
>  	unsigned int *utlbs;
>  	unsigned int i;
>  	int num_utlbs;
>  	int ret = -ENODEV;
> 
> -	if (dev->archdata.iommu) {
> -		dev_warn(dev, "IOMMU driver already assigned to device %s\n",
> -			 dev_name(dev));
> -		return -EINVAL;
> -	}
> -
>  	/* Find the master corresponding to the device. */
> 
>  	num_utlbs = of_count_phandle_with_args(dev->of_node, "iommus",
> @@ -699,6 +692,36 @@ static int ipmmu_add_device(struct devic
>  		}
>  	}
> 
> +	archdata = kzalloc(sizeof(*archdata), GFP_KERNEL);
> +	if (!archdata) {
> +		ret = -ENOMEM;
> +		goto error;
> +	}
> +
> +	archdata->mmu = mmu;
> +	archdata->utlbs = utlbs;
> +	archdata->num_utlbs = num_utlbs;
> +	dev->archdata.iommu = archdata;
> +	return 0;
> +
> +error:
> +	kfree(utlbs);
> +	return ret;
> +}
> +
> +static int ipmmu_add_device(struct device *dev)
> +{
> +	struct ipmmu_vmsa_archdata *archdata;
> +	struct ipmmu_vmsa_device *mmu = NULL;
> +	struct iommu_group *group;
> +	int ret;
> +
> +	if (dev->archdata.iommu) {
> +		dev_warn(dev, "IOMMU driver already assigned to device %s\n",
> +			 dev_name(dev));
> +		return -EINVAL;
> +	}
> +
>  	/* Create a device group and add the device to it. */
>  	group = iommu_group_alloc();
>  	if (IS_ERR(group)) {
> @@ -716,16 +739,9 @@ static int ipmmu_add_device(struct devic
>  		goto error;
>  	}
> 
> -	archdata = kzalloc(sizeof(*archdata), GFP_KERNEL);
> -	if (!archdata) {
> -		ret = -ENOMEM;
> +	ret = ipmmu_init_platform_device(dev);
> +	if (ret < 0)
>  		goto error;
> -	}
> -
> -	archdata->mmu = mmu;
> -	archdata->utlbs = utlbs;
> -	archdata->num_utlbs = num_utlbs;
> -	dev->archdata.iommu = archdata;
> 
>  	/*
>  	 * Create the ARM mapping, used by the ARM DMA mapping core to 
allocate
> @@ -736,6 +752,8 @@ static int ipmmu_add_device(struct devic
>  	 * - Make the mapping size configurable ? We currently use a 2GB 
mapping
>  	 *   at a 1GB offset to ensure that NULL VAs will fault.
>  	 */
> +	archdata = dev->archdata.iommu;
> +	mmu = archdata->mmu;
>  	if (!mmu->mapping) {
>  		struct dma_iommu_mapping *mapping;
> 
> @@ -760,10 +778,8 @@ static int ipmmu_add_device(struct devic
>  	return 0;
> 
>  error:
> -	arm_iommu_release_mapping(mmu->mapping);
> -
> -	kfree(dev->archdata.iommu);
> -	kfree(utlbs);
> +	if (mmu)
> +		arm_iommu_release_mapping(mmu->mapping);

Looking at the surrounding code, shouldn't the mapping only be destroyed here 
if it has been created by the same call to the function ? If there's an 
existing mapping for the IPMMU instance and the arm_iommu_attach_device() call 
fails, releasing the mapping seems to be a bug. As the bug isn't introduced by 
this patch, we can fix it separately, but if you end up resubmitting due to 
the first comment you could also add a fix.

> 
>  	dev->archdata.iommu = NULL;

-- 
Regards,

Laurent Pinchart
