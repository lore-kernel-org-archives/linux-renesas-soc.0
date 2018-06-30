Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56696 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751280AbeF3RHN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 30 Jun 2018 13:07:13 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] i2c: recovery: require either get_sda or set_sda
Date: Sat, 30 Jun 2018 19:07:04 +0200
Message-Id: <20180630170704.13103-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180630170704.13103-1-wsa+renesas@sang-engineering.com>
References: <20180630170704.13103-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

For bus recovery, we either need to bail out early if we can read SDA or
we need to send STOP after every pulse. Otherwise recovery might be
misinterpreted as an unwanted write. So, require one of those SDA
handling functions to avoid this problem.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c |  9 +++++++--
 include/linux/i2c.h         | 12 ++++++------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 2cb4129c9585..bfefeb2ab2fd 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -202,10 +202,11 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 		/*
 		 * If we can't read SDA, we don't know when to bail out early.
 		 * So, always create STOP then to ensure the additional pulses
-		 * will do no harm.
+		 * will do no harm. Check the 'incomplete_write_byte' fault
+		 * injector for details.
 		 */
 		ndelay(RECOVERY_NDELAY / 2);
-		if (!bri->get_sda && bri->set_sda)
+		if (!bri->get_sda)
 			bri->set_sda(adap, val);
 		ndelay(RECOVERY_NDELAY / 2);
 	}
@@ -274,6 +275,10 @@ static void i2c_init_recovery(struct i2c_adapter *adap)
 			err_str = "no {get|set}_scl() found";
 			goto err;
 		}
+		if (!bri->set_sda && !bri->get_sda) {
+			err_str = "either get_sda() or set_sda() needed";
+			goto err;
+		}
 	}
 
 	return;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 254cd34eeae2..969ddb992c88 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -576,12 +576,12 @@ struct i2c_timings {
  *      recovery. Populated internally for generic GPIO recovery.
  * @set_scl: This sets/clears the SCL line. Mandatory for generic SCL recovery.
  *      Populated internally for generic GPIO recovery.
- * @get_sda: This gets current value of SDA line. Optional for generic SCL
- *      recovery. Populated internally, if sda_gpio is a valid GPIO, for generic
- *      GPIO recovery.
- * @set_sda: This sets/clears the SDA line. Optional for generic SCL recovery.
- *	Populated internally, if sda_gpio is a valid GPIO, for generic GPIO
- *	recovery.
+ * @get_sda: This gets current value of SDA line. This or set_sda() is mandatory
+ *	for generic SCL recovery. Populated internally, if sda_gpio is a valid
+ *	GPIO, for generic GPIO recovery.
+ * @set_sda: This sets/clears the SDA line. This or get_sda() is mandatory for
+ *	generic SCL recovery. Populated internally, if sda_gpio is a valid GPIO,
+ *	for generic GPIO recovery.
  * @prepare_recovery: This will be called before starting recovery. Platform may
  *	configure padmux here for SDA/SCL line or something else they want.
  * @unprepare_recovery: This will be called after completing recovery. Platform
-- 
2.11.0
