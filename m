Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:36781 "EHLO
	smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750855AbcEHLC1 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 8 May 2016 07:02:27 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
To: linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux-foundation.org, dmaengine@vger.kernel.org
Cc: will.deacon@arm.com, robin.murphy@arm.com, joro@8bytes.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] dma-mapping: add __dma_sync_single_for_device()
Date: Sun,  8 May 2016 12:59:55 +0200
Message-Id: <1462705196-10857-2-git-send-email-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <1462705196-10857-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
References: <1462705196-10857-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Some users of the DMA mapping API calls dma_sync_single_for_device()
from the dma_map_single() call path. This will cause false warning
printouts if CONFIG_DMA_API_DEBUG are enabled.

The reason for the warning are that debug_dma_sync_single_for_device()
will be called before debug_dma_map_page() so the new mapping can't be
found and are believed to be invalid. Add __dma_sync_single_for_device()
that don't call into debug_dma_sync_single_for_device() and can be used
in these situations.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 include/linux/dma-mapping.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 9ea9aba..0e4d3a6 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -224,7 +224,7 @@ static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
 	debug_dma_sync_single_for_cpu(dev, addr, size, dir);
 }
 
-static inline void dma_sync_single_for_device(struct device *dev,
+static inline void __dma_sync_single_for_device(struct device *dev,
 					      dma_addr_t addr, size_t size,
 					      enum dma_data_direction dir)
 {
@@ -233,6 +233,13 @@ static inline void dma_sync_single_for_device(struct device *dev,
 	BUG_ON(!valid_dma_direction(dir));
 	if (ops->sync_single_for_device)
 		ops->sync_single_for_device(dev, addr, size, dir);
+}
+
+static inline void dma_sync_single_for_device(struct device *dev,
+					      dma_addr_t addr, size_t size,
+					      enum dma_data_direction dir)
+{
+	__dma_sync_single_for_device(dev, addr, size, dir);
 	debug_dma_sync_single_for_device(dev, addr, size, dir);
 }
 
-- 
2.8.2
