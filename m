Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 8bytes.org ([81.169.241.247]:58866 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754684AbcKJLmc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2016 06:42:32 -0500
Date: Thu, 10 Nov 2016 12:42:29 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: iommu@lists.linux-foundation.org,
        laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        horms+renesas@verge.net.au, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v6 00/07] iommu/ipmmu-vmsa: IPMMU multi-arch update V6
Message-ID: <20161110114229.GD9996@8bytes.org>
References: <20161019233533.10506.16810.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161019233533.10506.16810.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 20, 2016 at 08:35:33AM +0900, Magnus Damm wrote:
> iommu/ipmmu-vmsa: IPMMU multi-arch update V6
> 
> [PATCH v6 01/07] iommu/ipmmu-vmsa: Remove platform data handling
> [PATCH v6 02/07] iommu/ipmmu-vmsa: Rework interrupt code and use bitmap for context
> [PATCH v6 03/07] iommu/ipmmu-vmsa: Break out utlb parsing code
> [PATCH v6 04/07] iommu/ipmmu-vmsa: Break out domain allocation code
> [PATCH v6 05/07] iommu/ipmmu-vmsa: Add new IOMMU_DOMAIN_DMA ops
> [PATCH v6 06/07] iommu/ipmmu-vmsa: ARM and ARM64 archdata access
> [PATCH v6 07/07] iommu/ipmmu-vmsa: Drop LPAE Kconfig dependency

Applied to arm/renesas, thanks.
