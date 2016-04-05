Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 5 Apr 2016 16:02:35 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: iommu@lists.linux-foundation.org,
	laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	horms+renesas@verge.net.au, robin.murphy@arm.com,
	m.szyprowski@samsung.com
Subject: Re: [PATCH 00/04] iommu/ipmmu-vmsa: IPMMU CONFIG_IOMMU_DMA update
Message-ID: <20160405140235.GA11519@8bytes.org>
References: <20160315170431.20615.30333.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160315170431.20615.30333.sendpatchset@little-apple>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 16, 2016 at 02:04:31AM +0900, Magnus Damm wrote:
> iommu/ipmmu-vmsa: IPMMU CONFIG_IOMMU_DMA update
> 
> [PATCH 01/04] iommu/ipmmu-vmsa: 32-bit ARM may have CONFIG_IOMMU_DMA=y
> [PATCH 02/04] iommu/ipmmu-vmsa: Break out utlb parsing code
> [PATCH 03/04] iommu/ipmmu-vmsa: Break out domain allocation code
> [PATCH 04/04] iommu/ipmmu-vmsa: Add new IOMMU_DOMAIN_DMA ops

These patches do not apply to v4.6-rc2. Can you please rebase them,
address the comments and add the Reviewed-by's?


	Joerg
