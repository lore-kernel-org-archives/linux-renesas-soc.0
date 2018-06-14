Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:48120 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935530AbeFNB1p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 21:27:45 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org, cerg2010cerg2010@mail.ru
Cc: linux-renesas-soc@vger.kernel.org,
        drivers_video-dri@kernel-bugs.osdl.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFT 2/2] i2c: algos: bit: make sure to send STOP
Date: Thu, 14 Jun 2018 10:27:14 +0900
Message-Id: <20180614012714.5937-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180614012714.5937-1-wsa+renesas@sang-engineering.com>
References: <20180614012714.5937-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If SCL was low but SDA high, we would simply raise SCL but not send a
STOP. To make sure we always send STOP initially, lower both lines
first.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/algos/i2c-algo-bit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index c76cf51975d0..344649847885 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -650,6 +650,8 @@ static int __i2c_bit_add_bus(struct i2c_adapter *adap,
 		adap->quirks = &i2c_bit_quirk_no_clk_stretch;
 
 	/* Bring bus to a known state. Looks like STOP if bus is not free yet */
+	scllo(bit_adap);
+	sdalo(bit_adap);
 	sclhi(bit_adap);
 	sdahi(bit_adap);
 
-- 
2.11.0
