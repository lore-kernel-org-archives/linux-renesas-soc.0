Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF82C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 12:44:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99379206BA
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 12:44:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbfCLMos (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 08:44:48 -0400
Received: from sauhun.de ([88.99.104.3]:38880 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbfCLMos (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 08:44:48 -0400
Received: from localhost (p54B335FE.dip0.t-ipconnect.de [84.179.53.254])
        by pokefinder.org (Postfix) with ESMTPSA id 009672C282F;
        Tue, 12 Mar 2019 13:44:45 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v2] i2c: add extra check to safe DMA buffer helper
Date:   Tue, 12 Mar 2019 13:44:42 +0100
Message-Id: <20190312124442.10098-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make sure we report 'no buffer' for 0-length messages. This can only
happen if threshold is set to 0 which is kind of bogus but we should
still handle this situation. Update the docs and add a debug message
to educate callers of this function.

Reported-by: Hsin-Yi Wang <hsinyi@chromium.org>
Fixes: e94bc5d18be0 ("i2c: add helpers to ease DMA handling")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
	* add debug print
	* update kernel doc
	* update commit message

 drivers/i2c/i2c-core-base.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index cb6c5cb0df0b..986e56cee44b 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2258,7 +2258,8 @@ EXPORT_SYMBOL(i2c_put_adapter);
 /**
  * i2c_get_dma_safe_msg_buf() - get a DMA safe buffer for the given i2c_msg
  * @msg: the message to be checked
- * @threshold: the minimum number of bytes for which using DMA makes sense
+ * @threshold: the minimum number of bytes for which using DMA makes sense.
+ * 	       Should at least be 1.
  *
  * Return: NULL if a DMA safe buffer was not obtained. Use msg->buf with PIO.
  *	   Or a valid pointer to be used with DMA. After use, release it by
@@ -2268,7 +2269,11 @@ EXPORT_SYMBOL(i2c_put_adapter);
  */
 u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold)
 {
-	if (msg->len < threshold)
+	/* also skip 0-length msgs for bogus thresholds of 0 */
+	if (!threshold)
+		pr_debug("DMA buffer for addr=0x%02x with length 0 is bogus\n",
+			 msg->addr);
+	if (msg->len < threshold || msg->len == 0)
 		return NULL;
 
 	if (msg->flags & I2C_M_DMA_SAFE)
-- 
2.11.0

