Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45554 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732314AbeGJVnY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jul 2018 17:43:24 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eddie James <eajames@linux.vnet.ibm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 3/3] i2c: recovery: refactor recovery function
Date: Tue, 10 Jul 2018 23:42:17 +0200
Message-Id: <20180710214217.1336-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180710214217.1336-1-wsa+renesas@sang-engineering.com>
References: <20180710214217.1336-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

After exiting the while loop, we checked if recovery was successful and
sent a STOP to the clients. Meanwhile however, we send a STOP after
every pulse, so it is not needed after the loop. If we move the check
for a free bus to the end of the while loop, we can shorten and simplify
the logic. It is still ensured that at least one STOP will be sent to
the wire even if SDA was not stuck low.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 871a9731894f..c7995efd58ea 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -191,9 +191,6 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 				ret = -EBUSY;
 				break;
 			}
-			/* Break if SDA is high */
-			if (bri->get_sda && bri->get_sda(adap))
-				break;
 		}
 
 		val = !val;
@@ -209,22 +206,13 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 		if (bri->set_sda)
 			bri->set_sda(adap, val);
 		ndelay(RECOVERY_NDELAY / 2);
-	}
-
-	/* check if recovery actually succeeded */
-	if (bri->get_sda && !bri->get_sda(adap))
-		ret = -EBUSY;
 
-	/* If all went well, send STOP for a sane bus state. */
-	if (ret == 0 && bri->set_sda) {
-		bri->set_scl(adap, 0);
-		ndelay(RECOVERY_NDELAY / 2);
-		bri->set_sda(adap, 0);
-		ndelay(RECOVERY_NDELAY / 2);
-		bri->set_scl(adap, 1);
-		ndelay(RECOVERY_NDELAY / 2);
-		bri->set_sda(adap, 1);
-		ndelay(RECOVERY_NDELAY / 2);
+		/* Break if SDA is high */
+		if (val && bri->get_sda) {
+			ret = bri->get_sda(adap) ? 0 : -EBUSY;
+			if (ret == 0)
+				break;
+		}
 	}
 
 	if (bri->unprepare_recovery)
-- 
2.11.0
