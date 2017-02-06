Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 8bytes.org ([81.169.241.247]:40153 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751901AbdBFMK2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Feb 2017 07:10:28 -0500
Date: Mon, 6 Feb 2017 13:10:52 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] iommu/ipmmu-vmsa: Restrict IOMMU Domain Geometry to
 32-bit address space
Message-ID: <20170206121052.GA25981@8bytes.org>
References: <1485861427-23487-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1485861427-23487-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 31, 2017 at 12:17:07PM +0100, Geert Uytterhoeven wrote:
> Currently, the IPMMU/VMSA driver supports 32-bit I/O Virtual Addresses
> only, and thus sets io_pgtable_cfg.ias = 32.  However, it doesn't force
> a 32-bit IOVA space through the IOMMU Domain Geometry.
> 
> Hence if a device (e.g. SYS-DMAC) rightfully configures a 40-bit DMA
> mask, it will still be handed out a 40-bit IOVA, outside the 32-bit IOVA
> space, leading to out-of-bounds accesses of the PGD when mapping the
> IOVA.
> 
> Force a 32-bit IOMMU Domain Geometry to fix this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Applied, thanks.
