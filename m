Return-Path: <linux-i2c-owner@vger.kernel.org>
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Jun Gao <jun.gao@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] i2c: sh_mobile: define start_ch() void as it only returns 0 anyhow
Date: Fri, 24 Aug 2018 16:52:45 +0200
Message-Id: <20180824145246.19987-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180824145246.19987-1-wsa+renesas@sang-engineering.com>
References: <20180824145246.19987-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

After various refactoring over the years, start_ch() doesn't return
errno anymore, so make the function return void. This saves the error
handling when calling it which in turn eases cleanup of resources of a
future patch.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 16c35d474398..456581e3c1d2 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -610,8 +610,8 @@ static void sh_mobile_i2c_xfer_dma(struct sh_mobile_i2c_data *pd)
 	dma_async_issue_pending(chan);
 }
 
-static int start_ch(struct sh_mobile_i2c_data *pd, struct i2c_msg *usr_msg,
-		    bool do_init)
+static void start_ch(struct sh_mobile_i2c_data *pd, struct i2c_msg *usr_msg,
+		     bool do_init)
 {
 	if (do_init) {
 		/* Initialize channel registers */
@@ -635,7 +635,6 @@ static int start_ch(struct sh_mobile_i2c_data *pd, struct i2c_msg *usr_msg,
 
 	/* Enable all interrupts to begin with */
 	iic_wr(pd, ICIC, ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
-	return 0;
 }
 
 static int poll_dte(struct sh_mobile_i2c_data *pd)
@@ -706,9 +705,7 @@ static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
 		pd->send_stop = i == num - 1 || msg->flags & I2C_M_STOP;
 		pd->stop_after_dma = false;
 
-		err = start_ch(pd, msg, do_start);
-		if (err)
-			break;
+		start_ch(pd, msg, do_start);
 
 		if (do_start)
 			i2c_op(pd, OP_START, 0);
-- 
2.11.0
