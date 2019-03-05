Return-Path: <SRS0=F/Q8=RI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BABC00319
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 17:54:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72A5920643
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 17:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730802AbfCERyv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Mar 2019 12:54:51 -0500
Received: from sauhun.de ([88.99.104.3]:36290 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730674AbfCERyu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Mar 2019 12:54:50 -0500
Received: from localhost (p54B3334F.dip0.t-ipconnect.de [84.179.51.79])
        by pokefinder.org (Postfix) with ESMTPSA id BB9052E3564;
        Tue,  5 Mar 2019 18:54:48 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] i2c: rcar: let DMA enable routine return success status
Date:   Tue,  5 Mar 2019 18:54:33 +0100
Message-Id: <20190305175434.13107-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We will need to know if enabling DMA was successful in a later patch.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 925858915569..7e009febe97f 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -399,7 +399,7 @@ static void rcar_i2c_dma_callback(void *data)
 	rcar_i2c_dma_unmap(priv);
 }
 
-static void rcar_i2c_dma(struct rcar_i2c_priv *priv)
+static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
 {
 	struct device *dev = rcar_i2c_priv_to_dev(priv);
 	struct i2c_msg *msg = priv->msg;
@@ -415,7 +415,7 @@ static void rcar_i2c_dma(struct rcar_i2c_priv *priv)
 	/* Do various checks to see if DMA is feasible at all */
 	if (IS_ERR(chan) || msg->len < RCAR_MIN_DMA_LEN ||
 	    !(msg->flags & I2C_M_DMA_SAFE) || (read && priv->flags & ID_P_NO_RXDMA))
-		return;
+		return false;
 
 	if (read) {
 		/*
@@ -435,7 +435,7 @@ static void rcar_i2c_dma(struct rcar_i2c_priv *priv)
 	dma_addr = dma_map_single(chan->device->dev, buf, len, dir);
 	if (dma_mapping_error(chan->device->dev, dma_addr)) {
 		dev_dbg(dev, "dma map failed, using PIO\n");
-		return;
+		return false;
 	}
 
 	sg_dma_len(&priv->sg) = len;
@@ -449,7 +449,7 @@ static void rcar_i2c_dma(struct rcar_i2c_priv *priv)
 	if (!txdesc) {
 		dev_dbg(dev, "dma prep slave sg failed, using PIO\n");
 		rcar_i2c_cleanup_dma(priv);
-		return;
+		return false;
 	}
 
 	txdesc->callback = rcar_i2c_dma_callback;
@@ -459,7 +459,7 @@ static void rcar_i2c_dma(struct rcar_i2c_priv *priv)
 	if (dma_submit_error(cookie)) {
 		dev_dbg(dev, "submitting dma failed, using PIO\n");
 		rcar_i2c_cleanup_dma(priv);
-		return;
+		return false;
 	}
 
 	/* Enable DMA Master Received/Transmitted */
@@ -469,6 +469,7 @@ static void rcar_i2c_dma(struct rcar_i2c_priv *priv)
 		rcar_i2c_write(priv, ICDMAER, TMDMAE);
 
 	dma_async_issue_pending(chan);
+	return true;
 }
 
 static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
-- 
2.11.0

