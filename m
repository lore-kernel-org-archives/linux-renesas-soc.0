Return-Path: <SRS0=uGqO=RM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86A6C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 10:54:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A3C720851
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 10:54:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbfCIKyu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 9 Mar 2019 05:54:50 -0500
Received: from sauhun.de ([88.99.104.3]:40474 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726233AbfCIKyu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Mar 2019 05:54:50 -0500
Received: from localhost (p5486CD1C.dip0.t-ipconnect.de [84.134.205.28])
        by pokefinder.org (Postfix) with ESMTPSA id 4BF802E3551;
        Sat,  9 Mar 2019 11:54:48 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH] i2c: add extra check to safe DMA buffer helper
Date:   Sat,  9 Mar 2019 11:54:41 +0100
Message-Id: <20190309105441.18472-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make sure we report no buffer for 0-length messages. This can only
happen if threshold is set to 0 which is kind of bogus but we should
handle this situation nonetheless.

Reported-by: Hsin-Yi Wang <hsinyi@chromium.org>
Fixes: e94bc5d18be0 ("i2c: add helpers to ease DMA handling")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index cb6c5cb0df0b..22c8f38bf68c 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2268,7 +2268,8 @@ EXPORT_SYMBOL(i2c_put_adapter);
  */
 u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold)
 {
-	if (msg->len < threshold)
+	/* also skip 0-length msgs for bogus thresholds of 0 */
+	if (msg->len < threshold || msg->len == 0)
 		return NULL;
 
 	if (msg->flags & I2C_M_DMA_SAFE)
-- 
2.19.1

