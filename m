Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:57109 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728976AbeK0Shf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Nov 2018 13:37:35 -0500
Date: Tue, 27 Nov 2018 08:40:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dma-mapping: fix return type of dma_set_max_seg_size()
Message-ID: <20181127074035.GA30146@lst.de>
References: <20180829212921.10665-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180829212921.10665-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 29, 2018 at 11:29:21PM +0200, Niklas S�derlund wrote:
> The function dma_set_max_seg_size() can return either 0 on success or
> -EIO on error. Change its return type from unsigned int to int to
> capture this.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

Thanks, applied to the dma-mapping tree for 4.21.
