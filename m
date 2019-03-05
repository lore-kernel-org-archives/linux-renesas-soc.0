Return-Path: <SRS0=F/Q8=RI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52210C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 17:54:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 273C920643
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 17:54:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730674AbfCERyv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Mar 2019 12:54:51 -0500
Received: from sauhun.de ([88.99.104.3]:36298 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730799AbfCERyv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Mar 2019 12:54:51 -0500
Received: from localhost (p54B3334F.dip0.t-ipconnect.de [84.179.51.79])
        by pokefinder.org (Postfix) with ESMTPSA id 52FB72E3565;
        Tue,  5 Mar 2019 18:54:49 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] i2c: rcar: wait for data empty before starting DMA
Date:   Tue,  5 Mar 2019 18:54:34 +0100
Message-Id: <20190305175434.13107-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When sending with DMA, the driver transfers the first byte with PIO (as
documented). However, it started DMA right after the first byte was
written. This worked, but was not according to the datasheet which
suggests to wait until data register was empty again. Implement this.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 7e009febe97f..63286b3cc69b 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -480,6 +480,10 @@ static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
 	if (!(msr & MDE))
 		return;
 
+	/* Check if DMA can be enabled and take over */
+	if (priv->pos == 1 && rcar_i2c_dma(priv))
+		return;
+
 	if (priv->pos < msg->len) {
 		/*
 		 * Prepare next data to ICRXTX register.
@@ -490,13 +494,6 @@ static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
 		 */
 		rcar_i2c_write(priv, ICRXTX, msg->buf[priv->pos]);
 		priv->pos++;
-
-		/*
-		 * Try to use DMA to transmit the rest of the data if
-		 * address transfer phase just finished.
-		 */
-		if (msr & MAT)
-			rcar_i2c_dma(priv);
 	} else {
 		/*
 		 * The last data was pushed to ICRXTX on _PREV_ empty irq.
-- 
2.11.0

