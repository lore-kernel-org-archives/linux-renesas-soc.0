Return-Path: <SRS0=SHeS=PY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284BCC43612
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 21:06:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F401A20675
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 21:06:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbfAPVGK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 16:06:10 -0500
Received: from sauhun.de ([88.99.104.3]:34488 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727194AbfAPVGK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 16:06:10 -0500
Received: from localhost (p54B333D5.dip0.t-ipconnect.de [84.179.51.213])
        by pokefinder.org (Postfix) with ESMTPSA id 0E2BE2CF60E;
        Wed, 16 Jan 2019 22:06:08 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC/RFT 3/7] i2c: sh_mobile: drop 'data' argument from i2c_op function
Date:   Wed, 16 Jan 2019 22:05:51 +0100
Message-Id: <20190116210555.12209-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It is clear that we always send the address in TX_FIRST and data in TX.
No need to pass it from the caller.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 41 ++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 27b57b376549..ae5804c12998 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -303,13 +303,12 @@ static int sh_mobile_i2c_v2_init(struct sh_mobile_i2c_data *pd)
 	return sh_mobile_i2c_check_timing(pd);
 }
 
-static unsigned char i2c_op(struct sh_mobile_i2c_data *pd,
-			    enum sh_mobile_i2c_op op, unsigned char data)
+static unsigned char i2c_op(struct sh_mobile_i2c_data *pd, enum sh_mobile_i2c_op op)
 {
 	unsigned char ret = 0;
 	unsigned long flags;
 
-	dev_dbg(pd->dev, "op %d, data in 0x%02x\n", op, data);
+	dev_dbg(pd->dev, "op %d\n", op);
 
 	spin_lock_irqsave(&pd->lock, flags);
 
@@ -317,12 +316,12 @@ static unsigned char i2c_op(struct sh_mobile_i2c_data *pd,
 	case OP_START: /* issue start and trigger DTE interrupt */
 		iic_wr(pd, ICCR, ICCR_ICE | ICCR_TRS | ICCR_BBSY);
 		break;
-	case OP_TX_FIRST: /* disable DTE interrupt and write data */
+	case OP_TX_FIRST: /* disable DTE interrupt and write client address */
 		iic_wr(pd, ICIC, ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
-		iic_wr(pd, ICDR, data);
+		iic_wr(pd, ICDR, i2c_8bit_addr_from_msg(pd->msg));
 		break;
 	case OP_TX: /* write data */
-		iic_wr(pd, ICDR, data);
+		iic_wr(pd, ICDR, pd->msg->buf[pd->pos]);
 		break;
 	case OP_TX_STOP: /* issue a stop (or rep_start) */
 		iic_wr(pd, ICCR, pd->send_stop ? ICCR_ICE | ICCR_TRS
@@ -360,20 +359,15 @@ static bool sh_mobile_i2c_is_first_byte(struct sh_mobile_i2c_data *pd)
 
 static int sh_mobile_i2c_isr_tx(struct sh_mobile_i2c_data *pd)
 {
-	unsigned char data;
-
 	if (pd->pos == pd->msg->len) {
-		i2c_op(pd, OP_TX_STOP, 0);
+		i2c_op(pd, OP_TX_STOP);
 		return 1;
 	}
 
-	if (sh_mobile_i2c_is_first_byte(pd)) {
-		data = i2c_8bit_addr_from_msg(pd->msg);
-		i2c_op(pd, OP_TX_FIRST, data);
-	} else {
-		data = pd->msg->buf[pd->pos];
-		i2c_op(pd, OP_TX, data);
-	}
+	if (sh_mobile_i2c_is_first_byte(pd))
+		i2c_op(pd, OP_TX_FIRST);
+	else
+		i2c_op(pd, OP_TX);
 
 	pd->pos++;
 	return 0;
@@ -386,13 +380,12 @@ static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
 
 	do {
 		if (sh_mobile_i2c_is_first_byte(pd)) {
-			data = i2c_8bit_addr_from_msg(pd->msg);
-			i2c_op(pd, OP_TX_FIRST, data);
+			i2c_op(pd, OP_TX_FIRST);
 			break;
 		}
 
 		if (pd->pos == 0) {
-			i2c_op(pd, OP_TX_TO_RX, 0);
+			i2c_op(pd, OP_TX_TO_RX);
 			break;
 		}
 
@@ -401,18 +394,18 @@ static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
 		if (pd->pos == pd->msg->len) {
 			if (pd->stop_after_dma) {
 				/* Simulate PIO end condition after DMA transfer */
-				i2c_op(pd, OP_RX_STOP, 0);
+				i2c_op(pd, OP_RX_STOP);
 				pd->pos++;
 				break;
 			}
 
 			if (real_pos < 0) {
-				i2c_op(pd, OP_RX_STOP, 0);
+				i2c_op(pd, OP_RX_STOP);
 				break;
 			}
-			data = i2c_op(pd, OP_RX_STOP_DATA, 0);
+			data = i2c_op(pd, OP_RX_STOP_DATA);
 		} else if (real_pos >= 0) {
-			data = i2c_op(pd, OP_RX, 0);
+			data = i2c_op(pd, OP_RX);
 		}
 
 		if (real_pos >= 0)
@@ -687,7 +680,7 @@ static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
 		start_ch(pd, msg, do_start);
 
 		if (do_start)
-			i2c_op(pd, OP_START, 0);
+			i2c_op(pd, OP_START);
 
 		/* The interrupt handler takes care of the rest... */
 		timeout = wait_event_timeout(pd->wait,
-- 
2.11.0

