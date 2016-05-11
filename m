Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
To: dan.j.williams@intel.com, vinod.koul@intel.com,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	arnd@arndb.de
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] dmaengine: of_dma: approximate an average distribution
Date: Wed, 11 May 2016 15:15:11 +0200
Message-Id: <1462972511-20927-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Currently the following DT description would result in dmac0 always
being tried first and dmac1 second if dmac0 was unavailable. This
results in heavier use of dmac0 then of dmac1. This patch adds an
approximate average distribution over the two nodes lessening the load
of anyone of them.

   i2c6: i2c@e60b0000 {
           ...
           dmas = <&dmac0 0x77>, <&dmac0 0x78>,
                  <&dmac1 0x77>, <&dmac1 0x78>;
           dma-names = "tx", "rx", "tx", "rx";
           ...
   };

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/dma/of-dma.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/of-dma.c b/drivers/dma/of-dma.c
index 1e1f298..faae0bf 100644
--- a/drivers/dma/of-dma.c
+++ b/drivers/dma/of-dma.c
@@ -240,8 +240,9 @@ struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
 	struct of_phandle_args	dma_spec;
 	struct of_dma		*ofdma;
 	struct dma_chan		*chan;
-	int			count, i;
+	int			count, i, start;
 	int			ret_no_channel = -ENODEV;
+	static atomic_t		last_index;
 
 	if (!np || !name) {
 		pr_err("%s: not enough information provided\n", __func__);
@@ -259,8 +260,15 @@ struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
 		return ERR_PTR(-ENODEV);
 	}
 
+	/*
+	 * approximate an average distribution across multiple
+	 * entries with the same name
+	 */
+	start = atomic_inc_return(&last_index);
 	for (i = 0; i < count; i++) {
-		if (of_dma_match_channel(np, name, i, &dma_spec))
+		if (of_dma_match_channel(np, name,
+					 (i + start) % count,
+					 &dma_spec))
 			continue;
 
 		mutex_lock(&of_dma_lock);
-- 
2.8.2
