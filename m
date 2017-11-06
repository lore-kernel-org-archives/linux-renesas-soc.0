Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:53884 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750947AbdKFUGg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Nov 2017 15:06:36 -0500
Date: Mon, 6 Nov 2017 13:06:34 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, laurent.pinchart+renesas@ideasonboard.com,
        arnd@arndb.de, geert+renesas@glider.be, magnus.damm@gmail.com,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] ipmmu-vmsa cleanup
Message-ID: <20171106130634.4a42e18a@t450s.home>
In-Reply-To: <cover.1507918320.git.robin.murphy@arm.com>
References: <cover.1507918320.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, 13 Oct 2017 19:23:38 +0100
Robin Murphy <robin.murphy@arm.com> wrote:

> Arnd reports a build warning[1] thanks to me missing ipmmu-vmsa's second
> set of ops when converting io-pgtable-arm users to the new iommu_iotlb_*
> callbacks. Rather than just treat the symptom with a point fix, this
> seemed like a good excuse to clean up the messy #ifdeffery and
> duplication in the driver that led to the oversight in the first place.
> 
> Build-tested successfully for arm64, ARM, and ARM + CONFIG_IOMMU_DMA.
> 
> Robin.
> 
> [1]:https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1510423.html
> 
> Robin Murphy (4):
>   iommu/ipmmu-vmsa: Unify domain alloc/free
>   iommu/ipmmu-vmsa: Simplify group allocation
>   iommu/ipmmu-vmsa: Clean up struct ipmmu_vmsa_iommu_priv
>   iommu/ipmmu-vmsa: Unify ipmmu_ops
> 
>  drivers/iommu/ipmmu-vmsa.c | 251 ++++++++++++++-------------------------------
>  1 file changed, 78 insertions(+), 173 deletions(-)
> 

Applied to iommu/ipmmu-vmsa for v4.15.  Thanks,

Alex
