Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
To: vinod.koul@intel.com, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, iommu@lists.linux-foundation.org
Cc: robin.murphy@arm.com, laurent.pinchart@ideasonboard.com,
	geert+renesas@glider.be, linus.walleij@linaro.org,
	dan.j.williams@intel.com, arnd@arndb.de,
	linux-arch@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 5/9] dmaengine: rcar-dmac: slave address are physical
Date: Tue,  8 Mar 2016 03:42:50 +0100
Message-Id: <1457404974-1800-6-git-send-email-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <1457404974-1800-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
References: <1457404974-1800-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Slave addresses coming from a client is physical not dma. Store the
address using the correct data type. This is in preparation for hooking
up the dma-mapping API to the slave addresses.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/dma/sh/rcar-dmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 7820d07..01cf82f 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -144,8 +144,8 @@ struct rcar_dmac_chan {
 
 	unsigned int src_xfer_size;
 	unsigned int dst_xfer_size;
-	dma_addr_t src_slave_addr;
-	dma_addr_t dst_slave_addr;
+	phys_addr_t src_slave_addr;
+	phys_addr_t dst_slave_addr;
 	int mid_rid;
 
 	spinlock_t lock;
-- 
2.7.2
