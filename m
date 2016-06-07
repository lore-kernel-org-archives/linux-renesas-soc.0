Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:38669 "EHLO
	smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753707AbcFGHy4 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 03:54:56 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
To: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux@armlinux.org.uk
Cc: hch@infradead.org, dan.j.williams@intel.com, vinod.koul@intel.com,
	robin.murphy@arm.com, laurent.pinchart@ideasonboard.com,
	linus.walleij@linaro.org, arnd@arndb.de,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv8 1/6] dma-mapping: add {map,unmap}_resource to dma_map_ops
Date: Tue,  7 Jun 2016 09:54:08 +0200
Message-Id: <1465286053-27258-2-git-send-email-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <1465286053-27258-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
References: <1465286053-27258-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add methods to handle mapping of device resources from a physical
address. This is needed for example to be able to map MMIO FIFO
registers to a IOMMU.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/linux/dma-mapping.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index c980a92..a11ff9d 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -49,6 +49,12 @@ struct dma_map_ops {
 			 struct scatterlist *sg, int nents,
 			 enum dma_data_direction dir,
 			 struct dma_attrs *attrs);
+	dma_addr_t (*map_resource)(struct device *dev, phys_addr_t phys_addr,
+			       size_t size, enum dma_data_direction dir,
+			       struct dma_attrs *attrs);
+	void (*unmap_resource)(struct device *dev, dma_addr_t dma_handle,
+			   size_t size, enum dma_data_direction dir,
+			   struct dma_attrs *attrs);
 	void (*sync_single_for_cpu)(struct device *dev,
 				    dma_addr_t dma_handle, size_t size,
 				    enum dma_data_direction dir);
-- 
2.8.2
