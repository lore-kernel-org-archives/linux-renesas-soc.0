Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56738 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751241AbeF3RJp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 30 Jun 2018 13:09:45 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: recovery: rename variable for easier understanding
Date: Sat, 30 Jun 2018 19:09:39 +0200
Message-Id: <20180630170939.13240-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I think it does, but I am open for discussion, of course.

 drivers/i2c/i2c-core-base.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index cbbfe3fd387b..6bf9c7b4af64 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -169,12 +169,12 @@ static void set_sda_gpio_value(struct i2c_adapter *adap, int val)
 int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 {
 	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
-	int i = 0, val = 1, ret = 0;
+	int i = 0, scl = 1, ret = 0;
 
 	if (bri->prepare_recovery)
 		bri->prepare_recovery(adap);
 
-	bri->set_scl(adap, val);
+	bri->set_scl(adap, scl);
 	if (bri->set_sda)
 		bri->set_sda(adap, 1);
 	ndelay(RECOVERY_NDELAY);
@@ -183,7 +183,7 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 	 * By this time SCL is high, as we need to give 9 falling-rising edges
 	 */
 	while (i++ < RECOVERY_CLK_CNT * 2) {
-		if (val) {
+		if (scl) {
 			/* SCL shouldn't be low here */
 			if (!bri->get_scl(adap)) {
 				dev_err(&adap->dev,
@@ -196,8 +196,8 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 				break;
 		}
 
-		val = !val;
-		bri->set_scl(adap, val);
+		scl = !scl;
+		bri->set_scl(adap, scl);
 
 		/*
 		 * If we can't read SDA, we don't know when to bail out early.
@@ -207,7 +207,7 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 		 */
 		ndelay(RECOVERY_NDELAY / 2);
 		if (!bri->get_sda)
-			bri->set_sda(adap, val);
+			bri->set_sda(adap, scl);
 		ndelay(RECOVERY_NDELAY / 2);
 	}
 
-- 
2.11.0
