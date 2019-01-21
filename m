Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27160C31684
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 17:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F408E20879
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 17:08:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbfAURID (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 12:08:03 -0500
Received: from sauhun.de ([88.99.104.3]:45428 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbfAURID (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 12:08:03 -0500
Received: from localhost (p54B3319E.dip0.t-ipconnect.de [84.179.49.158])
        by pokefinder.org (Postfix) with ESMTPSA id C30AA2E4001;
        Mon, 21 Jan 2019 18:08:01 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] i2c: rcar: comment maintenance
Date:   Mon, 21 Jan 2019 18:07:59 +0100
Message-Id: <20190121170800.21144-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190121170800.21144-1-wsa+renesas@sang-engineering.com>
References: <20190121170800.21144-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update copyright years and remove a comment which grew incorrect and
useless over time.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 254e6219e538..4da7a1f6178b 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -2,8 +2,8 @@
 /*
  * Driver for the Renesas R-Car I2C unit
  *
- * Copyright (C) 2014-15 Wolfram Sang <wsa@sang-engineering.com>
- * Copyright (C) 2011-2015 Renesas Electronics Corporation
+ * Copyright (C) 2014-19 Wolfram Sang <wsa@sang-engineering.com>
+ * Copyright (C) 2011-2019 Renesas Electronics Corporation
  *
  * Copyright (C) 2012-14 Renesas Solutions Corp.
  * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
@@ -355,9 +355,6 @@ static void rcar_i2c_next_msg(struct rcar_i2c_priv *priv)
 	rcar_i2c_prepare_msg(priv);
 }
 
-/*
- *		interrupt functions
- */
 static void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
 {
 	struct dma_chan *chan = priv->dma_direction == DMA_FROM_DEVICE
-- 
2.11.0

