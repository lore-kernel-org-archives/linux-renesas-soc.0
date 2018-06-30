Return-Path: <linux-i2c-owner@vger.kernel.org>
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] i2c: recovery: send STOP if get_sda is not available
Date: Sat, 30 Jun 2018 19:07:03 +0200
Message-Id: <20180630170704.13103-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180630170704.13103-1-wsa+renesas@sang-engineering.com>
References: <20180630170704.13103-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If we can't read SDA to bail out early and toggle too many pulses,
slaves may misunderstand these pulses. In the worst case, as a write
operation. To avoid that and if we can write SDA, try to send STOP to
avoid the misinterpretation.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 31d16ada6e7d..2cb4129c9585 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -198,7 +198,16 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 
 		val = !val;
 		bri->set_scl(adap, val);
-		ndelay(RECOVERY_NDELAY);
+
+		/*
+		 * If we can't read SDA, we don't know when to bail out early.
+		 * So, always create STOP then to ensure the additional pulses
+		 * will do no harm.
+		 */
+		ndelay(RECOVERY_NDELAY / 2);
+		if (!bri->get_sda && bri->set_sda)
+			bri->set_sda(adap, val);
+		ndelay(RECOVERY_NDELAY / 2);
 	}
 
 	/* check if recovery actually succeeded */
-- 
2.11.0
