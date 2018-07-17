Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33850 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729650AbeGQJbm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 05:31:42 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2] i2c: recovery: make pin init look like STOP
Date: Tue, 17 Jul 2018 11:00:05 +0200
Message-Id: <20180717090005.14997-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When we we initialize the pins, make sure it looks like STOP by dividing
the delay into halves. It shouldn't matter because SDA is expected to be
held low by a device, but for super-safety, let's do it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Peter Rosin <peda@axentia.se>
Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---

I decided to keep the tags, let me know if you disagree.

 drivers/i2c/i2c-core-base.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 57538d72f2e5..02d6f27b19e4 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -190,10 +190,17 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 	if (bri->prepare_recovery)
 		bri->prepare_recovery(adap);
 
+	/*
+	 * If we can set SDA, we will always create a STOP to ensure additional
+	 * pulses will do no harm. This is achieved by letting SDA follow SCL
+	 * half a cycle later. Check the 'incomplete_write_byte' fault injector
+	 * for details.
+	 */
 	bri->set_scl(adap, scl);
+	ndelay(RECOVERY_NDELAY / 2);
 	if (bri->set_sda)
-		bri->set_sda(adap, 1);
-	ndelay(RECOVERY_NDELAY);
+		bri->set_sda(adap, scl);
+	ndelay(RECOVERY_NDELAY / 2);
 
 	/*
 	 * By this time SCL is high, as we need to give 9 falling-rising edges
@@ -211,13 +218,7 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 
 		scl = !scl;
 		bri->set_scl(adap, scl);
-
-		/*
-		 * If we can set SDA, we will always create STOP here to ensure
-		 * the additional pulses will do no harm. This is achieved by
-		 * letting SDA follow SCL half a cycle later. Check the
-		 * 'incomplete_write_byte' fault injector for details.
-		 */
+		/* Creating STOP again, see above */
 		ndelay(RECOVERY_NDELAY / 2);
 		if (bri->set_sda)
 			bri->set_sda(adap, scl);
-- 
2.11.0
