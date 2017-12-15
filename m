Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:39642 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756747AbdLOPQ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 10:16:28 -0500
Received: by mail-wm0-f67.google.com with SMTP id i11so18170648wmf.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 07:16:28 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 5/7] drm/img-rogue: dma_ops->sync_single_for_*() -> dma_sync_single_for_*()
Date: Fri, 15 Dec 2017 16:15:43 +0100
Message-Id: <1513350945-2642-6-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1513350945-2642-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1513350945-2642-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 services/server/env/linux/osfunc_arm64.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/services/server/env/linux/osfunc_arm64.c b/services/server/env/linux/osfunc_arm64.c
index 8b7f06d..70f747b 100644
--- a/services/server/env/linux/osfunc_arm64.c
+++ b/services/server/env/linux/osfunc_arm64.c
@@ -121,18 +121,12 @@ void OSFlushCPUCacheRangeKM(PVRSRV_DEVICE_NODE *psDevNode,
 							IMG_CPU_PHYADDR sCPUPhysEnd)
 {
 	struct device *dev = psDevNode->psDevConfig->pvOSDevice;
-	struct dma_map_ops *dma_ops = get_dma_ops(dev);
 
 	PVR_UNREFERENCED_PARAMETER(pvVirtStart);
 	PVR_UNREFERENCED_PARAMETER(pvVirtEnd);
 
-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0))
-	dma_ops->sync_single_for_device(dev, sCPUPhysStart.uiAddr, sCPUPhysEnd.uiAddr - sCPUPhysStart.uiAddr, DMA_TO_DEVICE);
-	dma_ops->sync_single_for_cpu(dev, sCPUPhysStart.uiAddr, sCPUPhysEnd.uiAddr - sCPUPhysStart.uiAddr, DMA_FROM_DEVICE);
-#else
-	dma_ops->sync_single_for_device(NULL, sCPUPhysStart.uiAddr, sCPUPhysEnd.uiAddr - sCPUPhysStart.uiAddr, DMA_TO_DEVICE);
-	dma_ops->sync_single_for_cpu(NULL, sCPUPhysStart.uiAddr, sCPUPhysEnd.uiAddr - sCPUPhysStart.uiAddr, DMA_FROM_DEVICE);
-#endif
+	dma_sync_single_for_device(dev, sCPUPhysStart.uiAddr, sCPUPhysEnd.uiAddr - sCPUPhysStart.uiAddr, DMA_TO_DEVICE);
+	dma_sync_single_for_cpu(dev, sCPUPhysStart.uiAddr, sCPUPhysEnd.uiAddr - sCPUPhysStart.uiAddr, DMA_FROM_DEVICE);
 }
 
 void OSCleanCPUCacheRangeKM(PVRSRV_DEVICE_NODE *psDevNode,
@@ -142,16 +136,11 @@ void OSCleanCPUCacheRangeKM(PVRSRV_DEVICE_NODE *psDevNode,
 							IMG_CPU_PHYADDR sCPUPhysEnd)
 {
 	struct device *dev = psDevNode->psDevConfig->pvOSDevice;
-	struct dma_map_ops *dma_ops = get_dma_ops(dev);
 
 	PVR_UNREFERENCED_PARAMETER(pvVirtStart);
 	PVR_UNREFERENCED_PARAMETER(pvVirtEnd);
 
-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0))
-	dma_ops->sync_single_for_device(dev, sCPUPhysStart.uiAddr, sCPUPhysEnd.uiAddr - sCPUPhysStart.uiAddr, DMA_TO_DEVICE);
-#else
-	dma_ops->sync_single_for_device(NULL, sCPUPhysStart.uiAddr, sCPUPhysEnd.uiAddr - sCPUPhysStart.uiAddr, DMA_TO_DEVICE);
-#endif
+	dma_sync_single_for_device(dev, sCPUPhysStart.uiAddr, sCPUPhysEnd.uiAddr - sCPUPhysStart.uiAddr, DMA_TO_DEVICE);
 }
 
 void OSInvalidateCPUCacheRangeKM(PVRSRV_DEVICE_NODE *psDevNode,
@@ -161,16 +150,11 @@ void OSInvalidateCPUCacheRangeKM(PVRSRV_DEVICE_NODE *psDevNode,
 								 IMG_CPU_PHYADDR sCPUPhysEnd)
 {
 	struct device *dev = psDevNode->psDevConfig->pvOSDevice;
-	struct dma_map_ops *dma_ops = get_dma_ops(dev);
 
 	PVR_UNREFERENCED_PARAMETER(pvVirtStart);
 	PVR_UNREFERENCED_PARAMETER(pvVirtEnd);
 
-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0))
-	dma_ops->sync_single_for_cpu(dev, sCPUPhysStart.uiAddr, sCPUPhysEnd.uiAddr - sCPUPhysStart.uiAddr, DMA_FROM_DEVICE);
-#else
-	dma_ops->sync_single_for_cpu(NULL, sCPUPhysStart.uiAddr, sCPUPhysEnd.uiAddr - sCPUPhysStart.uiAddr, DMA_FROM_DEVICE);
-#endif
+	dma_sync_single_for_cpu(dev, sCPUPhysStart.uiAddr, sCPUPhysEnd.uiAddr - sCPUPhysStart.uiAddr, DMA_FROM_DEVICE);
 }
 
 PVRSRV_CACHE_OP_ADDR_TYPE OSCPUCacheOpAddressType(PVRSRV_CACHE_OP uiCacheOp)
-- 
2.7.4
