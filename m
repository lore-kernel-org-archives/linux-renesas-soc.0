Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:19997 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932430AbcI3Rmq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Sep 2016 13:42:46 -0400
Date: Fri, 30 Sep 2016 23:21:21 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org,
        iommu@lists.linux-foundation.org, robin.murphy@arm.com,
        arnd@arndb.de
Subject: Re: [PATCH] dma-debug: fix ia64 build, use PHYS_PFN
Message-ID: <20160930175121.GX2467@localhost>
References: <20160929195915.22963-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160929195915.22963-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 29, 2016 at 09:59:15PM +0200, Niklas S�derlund wrote:
> kbuild test robot reports:
> 
>    lib/dma-debug.c: In function 'debug_dma_map_resource':
> >> lib/dma-debug.c:1541:16: error: implicit declaration of function '__phys_to_pfn' [-Werror=implicit-function-declaration]
>      entry->pfn  = __phys_to_pfn(addr);
>                    ^~~~~~~~~~~~~
> 
> ia64 does not provide __phys_to_pfn(), use the PHYS_PFN() alias.

Applied, thanks

-- 
~Vinod
