Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: iommu@lists.linux-foundation.org,
	laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	joro@8bytes.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
	robin.murphy@arm.com, m.szyprowski@samsung.com
Subject: Re: [PATCH 00/04] iommu/ipmmu-vmsa: IPMMU CONFIG_IOMMU_DMA update
Date: Thu, 17 Mar 2016 10:22:50 +0200
Message-ID: <1563504.M3TNYUzKHf@avalon>
In-Reply-To: <20160315170431.20615.30333.sendpatchset@little-apple>
References: <20160315170431.20615.30333.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

Thank you for the patches.

On Wednesday 16 March 2016 02:04:31 Magnus Damm wrote:
> iommu/ipmmu-vmsa: IPMMU CONFIG_IOMMU_DMA update
> 
> [PATCH 01/04] iommu/ipmmu-vmsa: 32-bit ARM may have CONFIG_IOMMU_DMA=y
> [PATCH 02/04] iommu/ipmmu-vmsa: Break out utlb parsing code
> [PATCH 03/04] iommu/ipmmu-vmsa: Break out domain allocation code
> [PATCH 04/04] iommu/ipmmu-vmsa: Add new IOMMU_DOMAIN_DMA ops
> 
> This series updates the IPMMU driver with CONFIG_IOMMU_DMA=y support
> which is present in mainline for 64-bit ARM while experimental support
> has been posted for 32-bit ARM thanks to Marek Szyprowski:
> 
> [RFC 0/3] Unify IOMMU-based DMA-mapping code for ARM and ARM64
> 
> Most of the patches in this series based on code earlier included in
> the series below but has been reworked to also fit on 32-bit ARM:
> 
> [PATCH/RFC 00/10] iommu/ipmmu-vmsa: Experimental r8a7795 support
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Great ! Thanks a lot for the work, I'm really happy to see this being 
addressed.

For patches 1/4 to 3/4,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

For patch 4/4, please see my comments in the reply to the patch.

> ---
> 
>  Built on top of next-20160315
>  Depends on [PATCH v2 00/04] iommu/ipmmu-vmsa: IPMMU multi-arch update V2
> 
>  drivers/iommu/ipmmu-vmsa.c |  238 ++++++++++++++++++++++++++++++----------
>  1 file changed, 174 insertions(+), 64 deletions(-)

-- 
Regards,

Laurent Pinchart
