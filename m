Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        iommu@lists.linux-foundation.org,
        laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        joro@8bytes.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v6 05/07] iommu/ipmmu-vmsa: Add new IOMMU_DOMAIN_DMA ops
Date: Sat, 12 Nov 2016 03:57:46 +0200
Message-ID: <30201191.g28hZNr0Fc@avalon>
In-Reply-To: <dbb87293-4760-607f-841c-368a5692ecc9@arm.com>
References: <20161019233533.10506.16810.sendpatchset@little-apple> <16618395.kRQakkIJXR@avalon> <dbb87293-4760-607f-841c-368a5692ecc9@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Robin,

On Friday 11 Nov 2016 14:44:29 Robin Murphy wrote:
> On 11/11/16 01:50, Laurent Pinchart wrote:
> > On Friday 21 Oct 2016 18:52:53 Robin Murphy wrote:
> >> On 20/10/16 00:36, Magnus Damm wrote:
> >>> From: Magnus Damm <damm+renesas@opensource.se>
> >>> 
> >>> Introduce an alternative set of iommu_ops suitable for 64-bit ARM
> >>> as well as 32-bit ARM when CONFIG_IOMMU_DMA=y. Also adjust the
> >>> Kconfig to depend on ARM or IOMMU_DMA.
> >>> 
> >>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> >>> ---
> >>> 
> >>>  Changes since V5:
> >>>  - Made domain allocation/free code more consistent - thanks Joerg!
> >>>  
> >>>  Changes since V4:
> >>>  - Added Kconfig hunk to depend on ARM or IOMMU_DMA
> >>>  
> >>>  Changes since V3:
> >>>  - Removed group parameter from ipmmu_init_platform_device()
> >>>  
> >>>  Changes since V2:
> >>>  
> >>>  - Included this new patch from the following series:
> >>>    [PATCH 00/04] iommu/ipmmu-vmsa: IPMMU CONFIG_IOMMU_DMA update
> >>>  
> >>>  - Use only a single iommu_ops structure with #ifdef CONFIG_IOMMU_DMA
> >>>  - Folded in #ifdefs to handle CONFIG_ARM and CONFIG_IOMMU_DMA
> >>>  - of_xlate() is now used without #ifdefs
> >>>  - Made sure code compiles on both 32-bit and 64-bit ARM.
> >>>  
> >>>  drivers/iommu/Kconfig      |    1
> >>>  drivers/iommu/ipmmu-vmsa.c |  122 +++++++++++++++++++++++++++++++++---
> >>>  2 files changed, 115 insertions(+), 8 deletions(-)
> > 
> > [snip]
> > 
> >>> --- 0006/drivers/iommu/ipmmu-vmsa.c
> >>> +++ work/drivers/iommu/ipmmu-vmsa.c
> >>> 2016-10-20 08:16:48.440607110 +0900
> > 
> > [snip]
> > 
> >>> -static struct iommu_domain *ipmmu_domain_alloc(unsigned type)
> >>> -{
> >>> -	if (type != IOMMU_DOMAIN_UNMANAGED)
> >>> -		return NULL;
> >> 
> >> I *think* that if we did the initial check thus:
> >> 	if (type != IOMMU_DOMAIN_UNMANAGED ||
> >> 	    (IS_ENABLED(CONFIG_IOMMU_DMA) && type != IOMMU_DOMAIN_DMA))
> >> 		return NULL;
> > 
> > I assume you meant
> > 
> >  	if (type != IOMMU_DOMAIN_UNMANAGED &&
> >  	    (!IS_ENABLED(CONFIG_IOMMU_DMA) || type != IOMMU_DOMAIN_DMA))
> >  		return NULL;
> > 
> > But how about just
> > 
> >  	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA))
> >  		return NULL;
> > 
> > as type will never be set to IOMMU_DOMAIN_DMA on ARM32 ?
> 
> Actually it can be, but *only* at this point, because
> iommu_group_get_for_dev() will always attempt to allocate a default
> domain.

If I'm not mistaken iommu_group_get_for_dev() is the only function that tries 
to create an IOMMU_DOMAIN_DMA domain, and is only called in core code by 
iommu_request_dm_for_dev(). That function isn't called by the IPMMU driver, 
and with Magnus' patches the IPMMU driver calls iommu_group_get_for_dev() on 
ARM64 platforms only (in ipmmu_add_device_dma(), only compiled in when 
CONFIG_IOMMU_DMA is set, which only happens on ARM64).

> Having the additional check up-front just saves going through
> the whole IOVA domain allocation only to tear it all down again when
> get_cookie() returns -ENODEV. You're right that it's not strictly
> necessary (and that I got my DeMorganning wrong), though.
> 
> Robin.
> 
> >> it shouldn't be necessary to split the function at all - we then just
> >> wrap the {get,put}_cookie() bits in "if (type ==  IOMMU_DOMAIN_DMA)" and
> >> in the 32-bit ARM case they just don't run as that can never be true.
> >> 
> >>> -
> >>> -	return __ipmmu_domain_alloc(type);
> >>> -}
> >>> -

-- 
Regards,

Laurent Pinchart
