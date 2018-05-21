Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49658 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750867AbeEUH3m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 03:29:42 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 1/2] i2c: mux: demux-pinctrl: use proper parent device for demux adapter
Date: Mon, 21 May 2018 09:29:38 +0200
Message-Id: <20180521072939.2836-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180521072939.2836-1-wsa+renesas@sang-engineering.com>
References: <20180521072939.2836-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Due to a typo, the wrong parent device was assigned to the newly created
demuxing adapter device. It got connected to the demuxing platform
device but not to the selected parent I2C adapter device. Fix it to get
a proper parent-child relationship of the demuxed busses.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/muxes/i2c-demux-pinctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
index 428de4c97fb2..035032e20327 100644
--- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
@@ -106,7 +106,7 @@ static int i2c_demux_activate_master(struct i2c_demux_pinctrl_priv *priv, u32 ne
 	priv->cur_adap.owner = THIS_MODULE;
 	priv->cur_adap.algo = &priv->algo;
 	priv->cur_adap.algo_data = priv;
-	priv->cur_adap.dev.parent = priv->dev;
+	priv->cur_adap.dev.parent = &adap->dev;
 	priv->cur_adap.class = adap->class;
 	priv->cur_adap.retries = adap->retries;
 	priv->cur_adap.timeout = adap->timeout;
-- 
2.11.0
