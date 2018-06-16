Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:35788 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932719AbeFPNia (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Jun 2018 09:38:30 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergey Larin <cerg2010cerg2010@mail.ru>,
        dri-devel@lists.freedesktop.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] i2c: algos: bit: mention our experience about initial states
Date: Sat, 16 Jun 2018 22:37:57 +0900
Message-Id: <20180616133757.5994-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180616133757.5994-1-wsa+renesas@sang-engineering.com>
References: <20180616133757.5994-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

So, if somebody wants to re-implement this in the future, we pinpoint to
a problem case.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/algos/i2c-algo-bit.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index 0c0eb16d710f..6ec65adaba49 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -647,6 +647,11 @@ static int __i2c_bit_add_bus(struct i2c_adapter *adap,
 	if (bit_adap->getscl == NULL)
 		adap->quirks = &i2c_bit_quirk_no_clk_stretch;
 
+	/*
+	 * We tried forcing SCL/SDA to an initial state here. But that caused a
+	 * regression, sadly. Check Bugzilla #200045 for details.
+	 */
+
 	ret = add_adapter(adap);
 	if (ret < 0)
 		return ret;
-- 
2.11.0
