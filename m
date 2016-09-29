Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:43638 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755753AbcI2UAD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2016 16:00:03 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: vinod.koul@intel.com, linux-renesas-soc@vger.kernel.org,
        dmaengine@vger.kernel.org, iommu@lists.linux-foundation.org
Cc: robin.murphy@arm.com, arnd@arndb.de,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] dma-debug: fix ia64 build, use PHYS_PFN
Date: Thu, 29 Sep 2016 21:59:15 +0200
Message-Id: <20160929195915.22963-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

kbuild test robot reports:

   lib/dma-debug.c: In function 'debug_dma_map_resource':
>> lib/dma-debug.c:1541:16: error: implicit declaration of function '__phys_to_pfn' [-Werror=implicit-function-declaration]
     entry->pfn  = __phys_to_pfn(addr);
                   ^~~~~~~~~~~~~

ia64 does not provide __phys_to_pfn(), use the PHYS_PFN() alias.

Fixes: 0e74b34dfc3318bf ("dma-debug: add support for resource mappings")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 lib/dma-debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dma-debug.c b/lib/dma-debug.c
index 2ba086b..59e7586 100644
--- a/lib/dma-debug.c
+++ b/lib/dma-debug.c
@@ -1514,7 +1514,7 @@ void debug_dma_map_resource(struct device *dev, phys_addr_t addr, size_t size,
 
 	entry->type		= dma_debug_resource;
 	entry->dev		= dev;
-	entry->pfn		= __phys_to_pfn(addr);
+	entry->pfn		= PHYS_PFN(addr);
 	entry->offset		= offset_in_page(addr);
 	entry->size		= size;
 	entry->dev_addr		= dma_addr;
-- 
2.9.3
