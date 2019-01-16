Return-Path: <SRS0=SHeS=PY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABA4C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 21:06:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D62AA20652
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 21:06:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfAPVGL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 16:06:11 -0500
Received: from sauhun.de ([88.99.104.3]:34500 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725888AbfAPVGL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 16:06:11 -0500
Received: from localhost (p54B333D5.dip0.t-ipconnect.de [84.179.51.213])
        by pokefinder.org (Postfix) with ESMTPSA id 42A4D2CF60F;
        Wed, 16 Jan 2019 22:06:09 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC/RFT 5/7] i2c: sh_mobile: replace break; with if-block
Date:   Wed, 16 Jan 2019 22:05:53 +0100
Message-Id: <20190116210555.12209-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In preparation to remove the do-while-loop.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index ef9101cde29f..ab6969ed7eff 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -394,11 +394,10 @@ static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
 				break;
 			}
 
-			if (real_pos < 0) {
+			if (real_pos < 0)
 				i2c_op(pd, OP_RX_STOP);
-				break;
-			}
-			data = i2c_op(pd, OP_RX_STOP_DATA);
+			else
+				data = i2c_op(pd, OP_RX_STOP_DATA);
 		} else if (real_pos >= 0) {
 			data = i2c_op(pd, OP_RX);
 		}
-- 
2.11.0

