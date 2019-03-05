Return-Path: <SRS0=F/Q8=RI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1B8C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 17:54:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4507F20643
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 17:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730800AbfCERyu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Mar 2019 12:54:50 -0500
Received: from sauhun.de ([88.99.104.3]:36280 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730776AbfCERyu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Mar 2019 12:54:50 -0500
Received: from localhost (p54B3334F.dip0.t-ipconnect.de [84.179.51.79])
        by pokefinder.org (Postfix) with ESMTPSA id 58B482E355F;
        Tue,  5 Mar 2019 18:54:47 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] i2c: rcar: sanity check for minimal DMA length
Date:   Tue,  5 Mar 2019 18:54:32 +0100
Message-Id: <20190305175434.13107-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use a macro for the hardcoded value and apply a build check. If it is
not met, the driver logic will not work anymore.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 3ce74edcd70c..925858915569 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -85,6 +85,7 @@
 /* ICFBSCR */
 #define TCYC17	0x0f		/* 17*Tcyc delay 1st bit between SDA and SCL */
 
+#define RCAR_MIN_DMA_LEN	8
 
 #define RCAR_BUS_PHASE_START	(MDBS | MIE | ESG)
 #define RCAR_BUS_PHASE_DATA	(MDBS | MIE)
@@ -412,8 +413,8 @@ static void rcar_i2c_dma(struct rcar_i2c_priv *priv)
 	int len;
 
 	/* Do various checks to see if DMA is feasible at all */
-	if (IS_ERR(chan) || msg->len < 8 || !(msg->flags & I2C_M_DMA_SAFE) ||
-	    (read && priv->flags & ID_P_NO_RXDMA))
+	if (IS_ERR(chan) || msg->len < RCAR_MIN_DMA_LEN ||
+	    !(msg->flags & I2C_M_DMA_SAFE) || (read && priv->flags & ID_P_NO_RXDMA))
 		return;
 
 	if (read) {
@@ -921,6 +922,9 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	struct i2c_timings i2c_t;
 	int irq, ret;
 
+	/* Otherwise logic will break because some bytes must always use PIO */
+	BUILD_BUG_ON_MSG(RCAR_MIN_DMA_LEN < 3, "Invalid min DMA length");
+
 	priv = devm_kzalloc(dev, sizeof(struct rcar_i2c_priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-- 
2.11.0

