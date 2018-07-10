Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45532 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732277AbeGJVnX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jul 2018 17:43:23 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eddie James <eajames@linux.vnet.ibm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 1/3] i2c: recovery: if possible send STOP with recovery pulses
Date: Tue, 10 Jul 2018 23:42:15 +0200
Message-Id: <20180710214217.1336-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180710214217.1336-1-wsa+renesas@sang-engineering.com>
References: <20180710214217.1336-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I2C clients may misunderstand recovery pulses if they can't read SDA to
bail out early. In the worst case, as a write operation. To avoid that
and if we can write SDA, try to send STOP to avoid the
misinterpretation.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 31d16ada6e7d..301285c54603 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -198,7 +198,16 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 
 		val = !val;
 		bri->set_scl(adap, val);
-		ndelay(RECOVERY_NDELAY);
+
+		/*
+		 * If we can set SDA, we will always create STOP here to ensure
+		 * the additional pulses will do no harm. This is achieved by
+		 * letting SDA follow SCL half a cycle later.
+		 */
+		ndelay(RECOVERY_NDELAY / 2);
+		if (bri->set_sda)
+			bri->set_sda(adap, val);
+		ndelay(RECOVERY_NDELAY / 2);
 	}
 
 	/* check if recovery actually succeeded */
-- 
2.11.0
