Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36360 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbeIQMwS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 08:52:18 -0400
Date: Mon, 17 Sep 2018 09:26:06 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alex Williamson <alex.williamson@redhat.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        David Howells <dhowells@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Stephen Rothwell <sfr@canb.auug.org.au>, kvm@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] drivers/vfio: Allow type-1 IOMMU instantiation with
 all ARM/ARM64 IOMMUs
Message-ID: <20180917072605.s37qlooesbx3es6m@verge.net.au>
References: <20180913131529.11837-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180913131529.11837-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 13, 2018 at 03:15:29PM +0200, Geert Uytterhoeven wrote:
> Currently the type-1 IOMMU instantiation depends on "ARM_SMMU ||
> ARM_SMMU_V3", while it applies to other ARM/ARM64 platforms with an
> IOMMU (e.g. Renesas VMSA-compatible IPMMUs).
> 
> Instead of extending the list of IOMMU types on ARM platforms, replace
> the list by "ARM || ARM64", like other architectures do.  The feature is
> still restricted to ARM/ARM64 platforms with an IOMMU by the dependency
> on IOMMU_API.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
