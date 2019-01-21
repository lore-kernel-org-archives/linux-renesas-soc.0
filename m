Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2396C31681
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 17:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5F8920879
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 17:08:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbfAURIE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 12:08:04 -0500
Received: from sauhun.de ([88.99.104.3]:45432 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726197AbfAURIE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 12:08:04 -0500
Received: from localhost (p54B3319E.dip0.t-ipconnect.de [84.179.49.158])
        by pokefinder.org (Postfix) with ESMTPSA id 5AEBA2E354D;
        Mon, 21 Jan 2019 18:08:02 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] i2c: rcar: refactor TCYC handling
Date:   Mon, 21 Jan 2019 18:08:00 +0100
Message-Id: <20190121170800.21144-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190121170800.21144-1-wsa+renesas@sang-engineering.com>
References: <20190121170800.21144-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The latest documentation made it clear that we need to initialize the
TCYC value independently of DMA. Simplify the code to do that.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 4da7a1f6178b..48312f22094c 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -39,8 +39,8 @@
 #define ICSAR	0x1C	/* slave address */
 #define ICMAR	0x20	/* master address */
 #define ICRXTX	0x24	/* data port */
-#define ICDMAER	0x3c	/* DMA enable */
-#define ICFBSCR	0x38	/* first bit setup cycle */
+#define ICFBSCR	0x38	/* first bit setup cycle (Gen3) */
+#define ICDMAER	0x3c	/* DMA enable (Gen3) */
 
 /* ICSCR */
 #define SDBS	(1 << 3)	/* slave data buffer select */
@@ -83,7 +83,6 @@
 #define TMDMAE	(1 << 0)	/* DMA Master Transmitted Enable */
 
 /* ICFBSCR */
-#define TCYC06	0x04		/*  6*Tcyc delay 1st bit between SDA and SCL */
 #define TCYC17	0x0f		/* 17*Tcyc delay 1st bit between SDA and SCL */
 
 
@@ -212,6 +211,10 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
 	rcar_i2c_write(priv, ICMSR, 0);
 	/* start clock */
 	rcar_i2c_write(priv, ICCCR, priv->icccr);
+
+	if (priv->devtype == I2C_RCAR_GEN3)
+		rcar_i2c_write(priv, ICFBSCR, TCYC17);
+
 }
 
 static int rcar_i2c_bus_barrier(struct rcar_i2c_priv *priv)
@@ -363,9 +366,6 @@ static void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
 	/* Disable DMA Master Received/Transmitted */
 	rcar_i2c_write(priv, ICDMAER, 0);
 
-	/* Reset default delay */
-	rcar_i2c_write(priv, ICFBSCR, TCYC06);
-
 	dma_unmap_single(chan->device->dev, sg_dma_address(&priv->sg),
 			 sg_dma_len(&priv->sg), priv->dma_direction);
 
@@ -461,9 +461,6 @@ static void rcar_i2c_dma(struct rcar_i2c_priv *priv)
 		return;
 	}
 
-	/* Set delay for DMA operations */
-	rcar_i2c_write(priv, ICFBSCR, TCYC17);
-
 	/* Enable DMA Master Received/Transmitted */
 	if (read)
 		rcar_i2c_write(priv, ICDMAER, RMDMAE);
-- 
2.11.0

