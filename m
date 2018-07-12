Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58906 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726349AbeGLR76 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jul 2018 13:59:58 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: recovery: make pin init look like STOP
Date: Thu, 12 Jul 2018 19:49:19 +0200
Message-Id: <20180712174919.14447-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When we we initialize the pins, make sure it looks like STOP by dividing
the delay into halves. It shouldn't matter because SDA is expected to be
held low by a device, but for super-safety, let's do it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 51cbb0c158f2..e57231ccb32a 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -191,9 +191,10 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 		bri->prepare_recovery(adap);
 
 	bri->set_scl(adap, scl);
+	ndelay(RECOVERY_NDELAY / 2);
 	if (bri->set_sda)
-		bri->set_sda(adap, 1);
-	ndelay(RECOVERY_NDELAY);
+		bri->set_sda(adap, scl);
+	ndelay(RECOVERY_NDELAY / 2);
 
 	/*
 	 * By this time SCL is high, as we need to give 9 falling-rising edges
-- 
2.11.0
