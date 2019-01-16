Return-Path: <SRS0=SHeS=PY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BBC3C43612
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 21:06:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3360B20675
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 21:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbfAPVGL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 16:06:11 -0500
Received: from sauhun.de ([88.99.104.3]:34504 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725896AbfAPVGL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 16:06:11 -0500
Received: from localhost (p54B333D5.dip0.t-ipconnect.de [84.179.51.213])
        by pokefinder.org (Postfix) with ESMTPSA id D637A2CF689;
        Wed, 16 Jan 2019 22:06:09 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC/RFT 6/7] i2c: sh_mobile: refactor rx isr
Date:   Wed, 16 Jan 2019 22:05:54 +0100
Message-Id: <20190116210555.12209-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Remove the do_while loop which was just there to have an easy exit with
"break;" and replace it with if-else-blocks which should make the state
machine clearer.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 50 ++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 29 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index ab6969ed7eff..dd4df961d8eb 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -373,39 +373,31 @@ static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
 	unsigned char data;
 	int real_pos;
 
-	do {
-		if (pd->pos == -1) {
-			i2c_op(pd, OP_TX_FIRST);
-			break;
-		}
-
-		if (pd->pos == 0) {
-			i2c_op(pd, OP_TX_TO_RX);
-			break;
-		}
-
-		real_pos = pd->pos - 2;
+	real_pos = pd->pos - 2;
 
-		if (pd->pos == pd->msg->len) {
-			if (pd->stop_after_dma) {
-				/* Simulate PIO end condition after DMA transfer */
-				i2c_op(pd, OP_RX_STOP);
-				pd->pos++;
-				break;
-			}
-
-			if (real_pos < 0)
-				i2c_op(pd, OP_RX_STOP);
-			else
-				data = i2c_op(pd, OP_RX_STOP_DATA);
-		} else if (real_pos >= 0) {
-			data = i2c_op(pd, OP_RX);
+	if (pd->pos == -1) {
+		i2c_op(pd, OP_TX_FIRST);
+	} else if (pd->pos == 0) {
+		i2c_op(pd, OP_TX_TO_RX);
+	} else if (pd->pos == pd->msg->len) {
+		if (pd->stop_after_dma) {
+			/* Simulate PIO end condition after DMA transfer */
+			i2c_op(pd, OP_RX_STOP);
+			pd->pos++;
+			goto done;
 		}
 
-		if (real_pos >= 0)
-			pd->msg->buf[real_pos] = data;
-	} while (0);
+		if (real_pos < 0)
+			i2c_op(pd, OP_RX_STOP);
+		else
+			data = i2c_op(pd, OP_RX_STOP_DATA);
+	} else if (real_pos >= 0) {
+		data = i2c_op(pd, OP_RX);
+	}
 
+	if (real_pos >= 0)
+		pd->msg->buf[real_pos] = data;
+ done:
 	pd->pos++;
 	return pd->pos == (pd->msg->len + 2);
 }
-- 
2.11.0

