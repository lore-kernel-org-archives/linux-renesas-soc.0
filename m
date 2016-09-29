Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:12052 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753364AbcI2MBb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2016 08:01:31 -0400
Date: Thu, 29 Sep 2016 17:40:04 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org,
        iommu@lists.linux-foundation.org, robin.murphy@arm.com,
        arnd@arndb.de,
        Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 0/2] dma-mapping: fix ia64 and m32r build error and
 warnings
Message-ID: <20160929121004.GT2467@localhost>
References: <20160929100240.7955-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160929100240.7955-1-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 29, 2016 at 12:02:38PM +0200, Niklas S�derlund wrote:
> From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Hi Vindo,

:(

> 
> This small series fixes the build error and warnings for ia64 and m32r 
> which kbuild test robot found and where introduced in the series 
> '[PATCHv9 0/6] dmaengine: rcar-dmac: add iommu support for slave 
> transfers'.

Applied both

Thanks
-- 
~Vinod
