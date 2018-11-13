Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:47240 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726581AbeKMVNd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 16:13:33 -0500
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: rcar: check bus state before reinitializing
Date: Tue, 13 Nov 2018 12:15:42 +0100
Message-Id: <20181113111542.5224-1-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

We should check the bus state before reinitializing the IP core.
Otherwise, the internal bus busy state which also tracks multi-master
activity is lost.

Credits go to the Renesas BSP team for suggesting this change.

Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Fixes: ae481cc13965 ("i2c: rcar: fix resume by always initializing registers before transfer")

---

Tested with a Lager board (R-Car H2) and used the GPIO fault injector to ensure
the bus recovery mechanism still works as expected.

 drivers/i2c/busses/i2c-rcar.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 4aa7dde876f3..254e6219e538 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -779,6 +779,11 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 
 	pm_runtime_get_sync(dev);
 
+	/* Check bus state before init otherwise bus busy info will be lost */
+	ret = rcar_i2c_bus_barrier(priv);
+	if (ret < 0)
+		goto out;
+
 	/* Gen3 needs a reset before allowing RXDMA once */
 	if (priv->devtype == I2C_RCAR_GEN3) {
 		priv->flags |= ID_P_NO_RXDMA;
@@ -791,10 +796,6 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 
 	rcar_i2c_init(priv);
 
-	ret = rcar_i2c_bus_barrier(priv);
-	if (ret < 0)
-		goto out;
-
 	for (i = 0; i < num; i++)
 		rcar_i2c_request_dma(priv, msgs + i);
 
-- 
2.11.0
