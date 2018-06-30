Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56714 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751189AbeF3RIU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 30 Jun 2018 13:08:20 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: recovery: directly exit when SCL is stuck low
Date: Sat, 30 Jun 2018 19:08:13 +0200
Message-Id: <20180630170813.13194-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If SCL is stuck low, the bus cannot be recovered. No need to check SDA
or futilely trying to send a STOP. Just exit.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index bfefeb2ab2fd..cbbfe3fd387b 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -189,7 +189,7 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 				dev_err(&adap->dev,
 					"SCL is stuck low, exit recovery\n");
 				ret = -EBUSY;
-				break;
+				goto exit_unprepare;
 			}
 			/* Break if SDA is high */
 			if (bri->get_sda && bri->get_sda(adap))
@@ -227,6 +227,7 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 		ndelay(RECOVERY_NDELAY / 2);
 	}
 
+ exit_unprepare:
 	if (bri->unprepare_recovery)
 		bri->unprepare_recovery(adap);
 
-- 
2.11.0
