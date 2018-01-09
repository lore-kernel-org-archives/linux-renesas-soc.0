Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41837 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758437AbeAIN7J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jan 2018 08:59:09 -0500
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Phil Reid <preid@electromag.com.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 4/6] i2c: ensure SDA is released in recovery if SDA is controllable
Date: Tue,  9 Jan 2018 14:58:57 +0100
Message-Id: <20180109135859.20771-5-wsa@the-dreams.de>
In-Reply-To: <20180109135859.20771-1-wsa@the-dreams.de>
References: <20180109135859.20771-1-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

If we have a function to control SDA, we should ensure that SDA is not
held down by us. So, release the GPIO in this case.

Tested-by: Phil Reid <preid@electromag.com.au>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index a8b3fbe16fa08c..54cef80990a11a 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -169,6 +169,8 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 		bri->prepare_recovery(adap);
 
 	bri->set_scl(adap, val);
+	if (bri->set_sda)
+		bri->set_sda(adap, 1);
 	ndelay(RECOVERY_NDELAY);
 
 	/*
-- 
2.11.0
