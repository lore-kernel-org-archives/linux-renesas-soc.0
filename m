Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 8bytes.org ([81.169.241.247]:39379 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751142AbdCVO0D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Mar 2017 10:26:03 -0400
Date: Wed, 22 Mar 2017 15:25:55 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        robin.murphy@arm.com, m.szyprowski@samsung.com
Subject: Re: [PATCH v7 05/07] iommu/ipmmu-vmsa: Add new IOMMU_DOMAIN_DMA ops
Message-ID: <20170322142555.GN29659@8bytes.org>
References: <148885660307.28553.995847796823338863.sendpatchset@little-apple>
 <148885665352.28553.13907030016954382230.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <148885665352.28553.13907030016954382230.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 07, 2017 at 12:17:33PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Introduce an alternative set of iommu_ops suitable for 64-bit ARM
> as well as 32-bit ARM when CONFIG_IOMMU_DMA=y. Also adjust the
> Kconfig to depend on ARM or IOMMU_DMA. Initialize the device
> from ->xlate() when CONFIG_IOMMU_DMA=y.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Changes since V6:
>  - Rolled in the following patches from "r8a7795 support V2":
>    [PATCH v2 04/11] iommu/ipmmu-vmsa: Reuse iommu groups
>    [PATCH v2 06/11] iommu/ipmmu-vmsa: Teach xlate() to skip disabled iommus
>  - Moved find_group() implementation to prevent warning on 32-bit ARM
>  - Rolled in the following patch from "IPMMU slave device whitelist V2":
>    [PATCH/RFC v2 3/4] iommu/ipmmu-vmsa: Check devices in xlate()
> 
>  drivers/iommu/Kconfig      |    1 
>  drivers/iommu/ipmmu-vmsa.c |  164 +++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 157 insertions(+), 8 deletions(-)

Reviewed-by: Joerg Roedel <jroedel@suse.de>
