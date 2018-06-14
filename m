Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:48106 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935532AbeFNB1k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 21:27:40 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org, cerg2010cerg2010@mail.ru
Cc: linux-renesas-soc@vger.kernel.org,
        drivers_video-dri@kernel-bugs.osdl.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFT 1/2] i2c: algos: bit: apply generic delays on initial STOP
Date: Thu, 14 Jun 2018 10:27:13 +0900
Message-Id: <20180614012714.5937-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180614012714.5937-1-wsa+renesas@sang-engineering.com>
References: <20180614012714.5937-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When using the generic functions for setting SCL/SDA high, we make sure
necessary delays are met.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/algos/i2c-algo-bit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index 3df0efd69ae3..c76cf51975d0 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -650,9 +650,8 @@ static int __i2c_bit_add_bus(struct i2c_adapter *adap,
 		adap->quirks = &i2c_bit_quirk_no_clk_stretch;
 
 	/* Bring bus to a known state. Looks like STOP if bus is not free yet */
-	setscl(bit_adap, 1);
-	udelay(bit_adap->udelay);
-	setsda(bit_adap, 1);
+	sclhi(bit_adap);
+	sdahi(bit_adap);
 
 	ret = add_adapter(adap);
 	if (ret < 0)
-- 
2.11.0
