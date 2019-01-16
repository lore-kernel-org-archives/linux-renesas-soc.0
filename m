Return-Path: <SRS0=SHeS=PY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEF8C43612
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 21:06:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EEFB20652
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 21:06:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbfAPVGI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 16:06:08 -0500
Received: from sauhun.de ([88.99.104.3]:34464 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727194AbfAPVGI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 16:06:08 -0500
Received: from localhost (p54B333D5.dip0.t-ipconnect.de [84.179.51.213])
        by pokefinder.org (Postfix) with ESMTPSA id B8E4B2CF609;
        Wed, 16 Jan 2019 22:06:06 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC/RFT 1/7] i2c: sh_mobile: simplify sending address for RX
Date:   Wed, 16 Jan 2019 22:05:49 +0100
Message-Id: <20190116210555.12209-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

pd->pos won't be smaller than -1, so we can simplify the logic.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index a64f2ff3cb49..e18e3cedf817 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -392,13 +392,9 @@ static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
 	int real_pos;
 
 	do {
-		if (pd->pos <= -1) {
+		if (sh_mobile_i2c_is_first_byte(pd)) {
 			sh_mobile_i2c_get_data(pd, &data);
-
-			if (sh_mobile_i2c_is_first_byte(pd))
-				i2c_op(pd, OP_TX_FIRST, data);
-			else
-				i2c_op(pd, OP_TX, data);
+			i2c_op(pd, OP_TX_FIRST, data);
 			break;
 		}
 
-- 
2.11.0

