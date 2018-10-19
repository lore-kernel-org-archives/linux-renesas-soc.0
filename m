Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58480 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727631AbeJTDW7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Oct 2018 23:22:59 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: rcar: cleanup DMA for all kinds of failure
Date: Fri, 19 Oct 2018 21:15:26 +0200
Message-Id: <20181019191526.3712-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

DMA needs to be cleaned up not only on timeout, but on all errors where
it has been setup before.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Reported and tested by the BSP team.

 drivers/i2c/busses/i2c-rcar.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 52cf42b32f0a..4aa7dde876f3 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -806,8 +806,12 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 
 	time_left = wait_event_timeout(priv->wait, priv->flags & ID_DONE,
 				     num * adap->timeout);
-	if (!time_left) {
+
+	/* cleanup DMA if it couldn't complete properly due to an error */
+	if (priv->dma_direction != DMA_NONE)
 		rcar_i2c_cleanup_dma(priv);
+
+	if (!time_left) {
 		rcar_i2c_init(priv);
 		ret = -ETIMEDOUT;
 	} else if (priv->flags & ID_NACK) {
-- 
2.19.0
