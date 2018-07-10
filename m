Return-Path: <linux-i2c-owner@vger.kernel.org>
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eddie James <eajames@linux.vnet.ibm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 2/3] i2c: recovery: require either get_sda or set_sda
Date: Tue, 10 Jul 2018 23:42:16 +0200
Message-Id: <20180710214217.1336-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180710214217.1336-1-wsa+renesas@sang-engineering.com>
References: <20180710214217.1336-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

For bus recovery, we either need to bail out early if we can read SDA or
we need to send STOP after every pulse. Otherwise recovery might be
misinterpreted as an unwanted write. So, require one of those SDA
handling functions to avoid this problem.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c |  7 ++++++-
 include/linux/i2c.h         | 12 ++++++------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 301285c54603..871a9731894f 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -202,7 +202,8 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 		/*
 		 * If we can set SDA, we will always create STOP here to ensure
 		 * the additional pulses will do no harm. This is achieved by
-		 * letting SDA follow SCL half a cycle later.
+		 * letting SDA follow SCL half a cycle later. Check the
+		 * 'incomplete_write_byte' fault injector for details.
 		 */
 		ndelay(RECOVERY_NDELAY / 2);
 		if (bri->set_sda)
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
index 465afb092fa7..9d1818c56775 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -581,12 +581,12 @@ struct i2c_timings {
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
