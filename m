Return-Path: <linux-i2c-owner@vger.kernel.org>
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
To: wsa@the-dreams.de, linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: arnd@arndb.de,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] i2c: rcar: use dma_request_chan()
Date: Thu, 19 May 2016 10:29:17 +0200
Message-Id: <1463646557-22489-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

New drivers should not use dma_request_slave_channel_reason() but
dma_request_chan(). The former is a macro to the later so this change do
not effect the driver in any way.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/i2c/busses/i2c-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index c42d52a..cf82438 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -626,7 +626,7 @@ static struct dma_chan *rcar_i2c_request_dma_chan(struct device *dev,
 	char *chan_name = dir == DMA_MEM_TO_DEV ? "tx" : "rx";
 	int ret;
 
-	chan = dma_request_slave_channel_reason(dev, chan_name);
+	chan = dma_request_chan(dev, chan_name);
 	if (IS_ERR(chan)) {
 		ret = PTR_ERR(chan);
 		dev_dbg(dev, "request_channel failed for %s (%d)\n",
-- 
2.8.2

