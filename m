Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 8bytes.org ([81.169.241.247]:53643 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755495AbcIVOpI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Sep 2016 10:45:08 -0400
Date: Thu, 22 Sep 2016 16:45:06 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: iommu@lists.linux-foundation.org,
        laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        horms+renesas@verge.net.au, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v5 05/07] iommu/ipmmu-vmsa: Add new IOMMU_DOMAIN_DMA ops
Message-ID: <20160922144506.GK3541@8bytes.org>
References: <20160920134355.25470.93701.sendpatchset@little-apple>
 <20160920134446.25470.22322.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160920134446.25470.22322.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 20, 2016 at 10:44:46PM +0900, Magnus Damm wrote:
> +#ifdef CONFIG_IOMMU_DMA
> +
> +static struct iommu_domain *ipmmu_domain_alloc_dma(unsigned type)
> +{
> +	struct iommu_domain *io_domain;
> +
> +	if (type != IOMMU_DOMAIN_DMA)
> +		return NULL;
> +
> +	io_domain = __ipmmu_domain_alloc(type);
> +	if (io_domain)
> +		iommu_get_dma_cookie(io_domain);
> +
> +	return io_domain;
> +}
> +
> +static void ipmmu_domain_free_dma(struct iommu_domain *io_domain)
> +{
> +	iommu_put_dma_cookie(io_domain);
> +	ipmmu_domain_free(io_domain);
> +}

> [...]

> +static const struct iommu_ops ipmmu_ops = {
> +	.domain_alloc = ipmmu_domain_alloc_dma,
> +	.domain_free = ipmmu_domain_free_dma,

Okay, so when CONFIG_IOMMU_DMA is enabled, you only support allocation
of DMA domains, not UNMANAGED domains anymore. Is there a reason for
that?

You can reduce the #ifdef'ed coded by supporting both types of domains
and call into allocation-subfunctions for DMA and UNMANAGED domains. The
#ifdef could then only let the dma-allocation function return NULL.

This would be much more compatible to what other IOMMU drivers do and
will allow VFIO usage in the future.



	Joerg
