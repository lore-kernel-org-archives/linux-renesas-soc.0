Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-doc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] Documentation: DMA API: fix a typo in a function name
Date: Sat, 27 May 2017 20:52:43 +0200
Message-Id: <20170527185243.13340-1-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Correct the typo, the wrongly typed function does not exist.

Fixes: 6c9c6d6301287e ("dma-debug: New interfaces to debug dma mapping errors")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/DMA-API.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/DMA-API.txt b/Documentation/DMA-API.txt
index 6b20128fab8a2b..71200dfa09228b 100644
--- a/Documentation/DMA-API.txt
+++ b/Documentation/DMA-API.txt
@@ -692,7 +692,7 @@ of preallocated entries is defined per architecture. If it is too low for you
 boot with 'dma_debug_entries=<your_desired_number>' to overwrite the
 architectural default.
 
-void debug_dmap_mapping_error(struct device *dev, dma_addr_t dma_addr);
+void debug_dma_mapping_error(struct device *dev, dma_addr_t dma_addr);
 
 dma-debug interface debug_dma_mapping_error() to debug drivers that fail
 to check DMA mapping errors on addresses returned by dma_map_single() and
-- 
2.11.0
