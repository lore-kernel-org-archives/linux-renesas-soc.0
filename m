Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:55163 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932557AbcI2KDj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2016 06:03:39 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: vinod.koul@intel.com, linux-renesas-soc@vger.kernel.org,
        dmaengine@vger.kernel.org, iommu@lists.linux-foundation.org
Cc: robin.murphy@arm.com, arnd@arndb.de,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] dma-mapping: fix ia64 build, use PHYS_PFN
Date: Thu, 29 Sep 2016 12:02:39 +0200
Message-Id: <20160929100240.7955-2-niklas.soderlund@ragnatech.se>
In-Reply-To: <20160929100240.7955-1-niklas.soderlund@ragnatech.se>
References: <20160929100240.7955-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

kbuild test robot reports:

   In file included from include/linux/skbuff.h:34:0,
                    from include/linux/tcp.h:21,
                    from drivers/net/ethernet/amd/xgbe/xgbe-drv.c:119:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
>> include/linux/dma-mapping.h:274:22: error: implicit declaration of function '__phys_to_pfn' [-Werror=implicit-function-declaration]
     unsigned long pfn = __phys_to_pfn(phys_addr);
                         ^~~~~~~~~~~~~

ia64 does not provide __phys_to_pfn(), use the PHYS_PFN() alias.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 include/linux/dma-mapping.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 6e00c7f..ff7c87f 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -271,7 +271,7 @@ static inline dma_addr_t dma_map_resource(struct device *dev,
 					  unsigned long attrs)
 {
 	struct dma_map_ops *ops = get_dma_ops(dev);
-	unsigned long pfn = __phys_to_pfn(phys_addr);
+	unsigned long pfn = PHYS_PFN(phys_addr);
 	dma_addr_t addr;
 
 	BUG_ON(!valid_dma_direction(dir));
-- 
2.9.3
