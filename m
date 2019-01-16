Return-Path: <SRS0=SHeS=PY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071B2C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 21:06:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D235820652
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 21:06:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbfAPVGK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 16:06:10 -0500
Received: from sauhun.de ([88.99.104.3]:34496 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbfAPVGK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 16:06:10 -0500
Received: from localhost (p54B333D5.dip0.t-ipconnect.de [84.179.51.213])
        by pokefinder.org (Postfix) with ESMTPSA id A3E7D2C790E;
        Wed, 16 Jan 2019 22:06:08 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC/RFT 4/7] i2c: sh_mobile: remove is_first_byte function
Date:   Wed, 16 Jan 2019 22:05:52 +0100
Message-Id: <20190116210555.12209-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

All state machines deal with pd->pos values. This helper function is an
exception and makes it only more confusing.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index ae5804c12998..ef9101cde29f 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -352,11 +352,6 @@ static unsigned char i2c_op(struct sh_mobile_i2c_data *pd, enum sh_mobile_i2c_op
 	return ret;
 }
 
-static bool sh_mobile_i2c_is_first_byte(struct sh_mobile_i2c_data *pd)
-{
-	return pd->pos == -1;
-}
-
 static int sh_mobile_i2c_isr_tx(struct sh_mobile_i2c_data *pd)
 {
 	if (pd->pos == pd->msg->len) {
@@ -364,7 +359,7 @@ static int sh_mobile_i2c_isr_tx(struct sh_mobile_i2c_data *pd)
 		return 1;
 	}
 
-	if (sh_mobile_i2c_is_first_byte(pd))
+	if (pd->pos == -1)
 		i2c_op(pd, OP_TX_FIRST);
 	else
 		i2c_op(pd, OP_TX);
@@ -379,7 +374,7 @@ static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
 	int real_pos;
 
 	do {
-		if (sh_mobile_i2c_is_first_byte(pd)) {
+		if (pd->pos == -1) {
 			i2c_op(pd, OP_TX_FIRST);
 			break;
 		}
-- 
2.11.0

