Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41314 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726264AbeHXS2I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 14:28:08 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Jun Gao <jun.gao@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] i2c: sh_mobile: fix leak when using DMA bounce buffer
Date: Fri, 24 Aug 2018 16:52:46 +0200
Message-Id: <20180824145246.19987-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180824145246.19987-1-wsa+renesas@sang-engineering.com>
References: <20180824145246.19987-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We only freed the bounce buffer after successful DMA, missing the cases
where DMA setup may have gone wrong. Use a better location which always
gets called after each message and use 'stop_after_dma' as a flag for a
successful transfer.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 456581e3c1d2..c56a86da958e 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -515,8 +515,6 @@ static void sh_mobile_i2c_dma_callback(void *data)
 	pd->pos = pd->msg->len;
 	pd->stop_after_dma = true;
 
-	i2c_put_dma_safe_msg_buf(pd->dma_buf, pd->msg, true);
-
 	iic_set_clr(pd, ICIC, 0, ICIC_TDMAE | ICIC_RDMAE);
 }
 
@@ -714,6 +712,10 @@ static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
 		timeout = wait_event_timeout(pd->wait,
 				       pd->sr & (ICSR_TACK | SW_DONE),
 				       adapter->timeout);
+
+		/* 'stop_after_dma' tells if DMA transfer was complete */
+		i2c_put_dma_safe_msg_buf(pd->dma_buf, pd->msg, pd->stop_after_dma);
+
 		if (!timeout) {
 			dev_err(pd->dev, "Transfer request timed out\n");
 			if (pd->dma_direction != DMA_NONE)
-- 
2.11.0
