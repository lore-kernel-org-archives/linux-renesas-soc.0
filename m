Return-Path: <SRS0=QYV/=RG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBA1C10F00
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  3 Mar 2019 15:03:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2BB020857
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  3 Mar 2019 15:03:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfCCPDY (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 3 Mar 2019 10:03:24 -0500
Received: from sauhun.de ([88.99.104.3]:45696 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726324AbfCCPDY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Mar 2019 10:03:24 -0500
Received: from localhost (p54B334AE.dip0.t-ipconnect.de [84.179.52.174])
        by pokefinder.org (Postfix) with ESMTPSA id 5D4B54A0BD4;
        Sun,  3 Mar 2019 16:03:22 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] i2c: rcar: explain the lockless design
Date:   Sun,  3 Mar 2019 16:03:14 +0100
Message-Id: <20190303150314.6528-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190303150314.6528-1-wsa+renesas@sang-engineering.com>
References: <20190303150314.6528-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To make sure people can understand the lockless design of this driver
without the need to dive into git history, add a comment giving an
overview of the situation.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 6410896f717b..3ce74edcd70c 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -611,6 +611,15 @@ static bool rcar_i2c_slave_irq(struct rcar_i2c_priv *priv)
 	return true;
 }
 
+/*
+ * This driver has a lock-free design because there are IP cores (at least
+ * R-Car Gen2) which have an inherent race condition in their hardware design.
+ * There, we need to clear RCAR_BUS_MASK_DATA bits as soon as possible after
+ * the interrupt was generated, otherwise an unwanted repeated message gets
+ * generated. It turned out that taking a spinlock at the beginning of the ISR
+ * was already causing repeated messages. Thus, this driver was converted to
+ * the now lockless behaviour. Please keep this in mind when hacking the driver.
+ */
 static irqreturn_t rcar_i2c_irq(int irq, void *ptr)
 {
 	struct rcar_i2c_priv *priv = ptr;
-- 
2.11.0

