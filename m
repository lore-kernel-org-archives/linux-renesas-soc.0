Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:55344 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754165AbeFOFRs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jun 2018 01:17:48 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org, cerg2010cerg2010@mail.ru
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFT] i2c: algos: bit: prepare/unprepare before sending initial STOP
Date: Fri, 15 Jun 2018 14:17:23 +0900
Message-Id: <20180615051723.7193-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Some adapters need to be prepared/unprepared before bitbanging the bus.
Do this for the initial STOP, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Ok, another idea to fix the regression. I'm not 100% sure if the placement is
perfect, but it should serve well enough as a proof of concept to see if this
is the actual issue. It looks promising, though.

 drivers/i2c/algos/i2c-algo-bit.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index 4a34f311e1ff..fab4437ecbb5 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -648,10 +648,19 @@ static int __i2c_bit_add_bus(struct i2c_adapter *adap,
 		adap->quirks = &i2c_bit_quirk_no_clk_stretch;
 
 	/* Bring bus to a known state. Looks like STOP if bus is not free yet */
+	if (bit_adap->pre_xfer) {
+		ret = bit_adap->pre_xfer(adap);
+		if (ret < 0)
+			return ret;
+	}
+
 	setscl(bit_adap, 1);
 	udelay(bit_adap->udelay);
 	setsda(bit_adap, 1);
 
+	if (bit_adap->post_xfer)
+		bit_adap->post_xfer(adap);
+
 	ret = add_adapter(adap);
 	if (ret < 0)
 		return ret;
-- 
2.11.0
