Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:35776 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932719AbeFPNiV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Jun 2018 09:38:21 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergey Larin <cerg2010cerg2010@mail.ru>,
        dri-devel@lists.freedesktop.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] Revert "i2c: algo-bit: init the bus to a known state"
Date: Sat, 16 Jun 2018 22:37:56 +0900
Message-Id: <20180616133757.5994-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180616133757.5994-1-wsa+renesas@sang-engineering.com>
References: <20180616133757.5994-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This reverts commit 3e5f06bed72fe72166a6778f630241a893f67799. As per
bugzilla #200045, this caused a regression. I don't really see a way to
fix it without having the hardware. So, revert the patch and I will fix
the issue I was seeing originally in the i2c-gpio driver itself. I
couldn't find new users of this algorithm since, so there should be no
one depending on the new behaviour.

Reported-by: Sergey Larin <cerg2010cerg2010@mail.ru>
Fixes: 3e5f06bed72f ("i2c: algo-bit: init the bus to a known state")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/algos/i2c-algo-bit.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index 4a34f311e1ff..0c0eb16d710f 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -647,11 +647,6 @@ static int __i2c_bit_add_bus(struct i2c_adapter *adap,
 	if (bit_adap->getscl == NULL)
 		adap->quirks = &i2c_bit_quirk_no_clk_stretch;
 
-	/* Bring bus to a known state. Looks like STOP if bus is not free yet */
-	setscl(bit_adap, 1);
-	udelay(bit_adap->udelay);
-	setsda(bit_adap, 1);
-
 	ret = add_adapter(adap);
 	if (ret < 0)
 		return ret;
-- 
2.11.0
