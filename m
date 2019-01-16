Return-Path: <SRS0=SHeS=PY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00D2C43613
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 21:06:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E63720675
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 21:06:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbfAPVGJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 16:06:09 -0500
Received: from sauhun.de ([88.99.104.3]:34474 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727234AbfAPVGJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 16:06:09 -0500
Received: from localhost (p54B333D5.dip0.t-ipconnect.de [84.179.51.213])
        by pokefinder.org (Postfix) with ESMTPSA id 6137A2CF60B;
        Wed, 16 Jan 2019 22:06:07 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC/RFT 2/7] i2c: sh_mobile: remove get_data function
Date:   Wed, 16 Jan 2019 22:05:50 +0100
Message-Id: <20190116210555.12209-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It makes the code much easier comprehensible to explicitly code that the
first byte will be client address and all the following bytes are the
actual data.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index e18e3cedf817..27b57b376549 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -358,18 +358,6 @@ static bool sh_mobile_i2c_is_first_byte(struct sh_mobile_i2c_data *pd)
 	return pd->pos == -1;
 }
 
-static void sh_mobile_i2c_get_data(struct sh_mobile_i2c_data *pd,
-				   unsigned char *buf)
-{
-	switch (pd->pos) {
-	case -1:
-		*buf = i2c_8bit_addr_from_msg(pd->msg);
-		break;
-	default:
-		*buf = pd->msg->buf[pd->pos];
-	}
-}
-
 static int sh_mobile_i2c_isr_tx(struct sh_mobile_i2c_data *pd)
 {
 	unsigned char data;
@@ -379,8 +367,13 @@ static int sh_mobile_i2c_isr_tx(struct sh_mobile_i2c_data *pd)
 		return 1;
 	}
 
-	sh_mobile_i2c_get_data(pd, &data);
-	i2c_op(pd, sh_mobile_i2c_is_first_byte(pd) ? OP_TX_FIRST : OP_TX, data);
+	if (sh_mobile_i2c_is_first_byte(pd)) {
+		data = i2c_8bit_addr_from_msg(pd->msg);
+		i2c_op(pd, OP_TX_FIRST, data);
+	} else {
+		data = pd->msg->buf[pd->pos];
+		i2c_op(pd, OP_TX, data);
+	}
 
 	pd->pos++;
 	return 0;
@@ -393,7 +386,7 @@ static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
 
 	do {
 		if (sh_mobile_i2c_is_first_byte(pd)) {
-			sh_mobile_i2c_get_data(pd, &data);
+			data = i2c_8bit_addr_from_msg(pd->msg);
 			i2c_op(pd, OP_TX_FIRST, data);
 			break;
 		}
-- 
2.11.0

