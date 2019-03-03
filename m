Return-Path: <SRS0=QYV/=RG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA1DC10F06
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  3 Mar 2019 15:03:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA1D820866
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  3 Mar 2019 15:03:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbfCCPDY (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 3 Mar 2019 10:03:24 -0500
Received: from sauhun.de ([88.99.104.3]:45684 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726331AbfCCPDY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Mar 2019 10:03:24 -0500
Received: from localhost (p54B334AE.dip0.t-ipconnect.de [84.179.52.174])
        by pokefinder.org (Postfix) with ESMTPSA id BED254B60A6;
        Sun,  3 Mar 2019 16:03:21 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] i2c: rcar: fix concurrency issue related to ICDMAER
Date:   Sun,  3 Mar 2019 16:03:13 +0100
Message-Id: <20190303150314.6528-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190303150314.6528-1-wsa+renesas@sang-engineering.com>
References: <20190303150314.6528-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

This patch fixes the problem that an interrupt may set up a new I2C
message and the DMA callback overwrites this setup.

By disabling the DMA Enable Register(ICDMAER), rcar_i2c_dma_unmap()
enables interrupts for register settings (such as Master Control
Register(ICMCR)) and advances the I2C transfer sequence.

If an interrupt occurs immediately after ICDMAER is disabled, the
callback handler later continues and overwrites the previous settings
from the interrupt. So, disable ICDMAER at the end of the callback to
ensure other interrupts are masked until then.

Note that this driver needs to work lock-free because there are IP cores
with a HW race condition which prevent us from using a spinlock in the
interrupt handler.

Reproduction test:
1. Add udelay(1) after disabling ICDMAER. (It is expected to
generate an interrupt of rcar_i2c_irq())

    void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
    {
        ...
        rcar_i2c_write(priv, ICDMAER, 0);
        udelay(1);                        <-- Add this line
        ...
        priv->dma_direction = DMA_NONE;
    }

2. Execute DMA transfer.
Performs DMA transfer of read or write. In the sample, write was used.

 $ i2cset -y -f 4 0x6a 0x01 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 i

3. A log message of BUG_ON() will be displayed.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index dd52a068b140..6410896f717b 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -363,9 +363,6 @@ static void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
 	struct dma_chan *chan = priv->dma_direction == DMA_FROM_DEVICE
 		? priv->dma_rx : priv->dma_tx;
 
-	/* Disable DMA Master Received/Transmitted */
-	rcar_i2c_write(priv, ICDMAER, 0);
-
 	dma_unmap_single(chan->device->dev, sg_dma_address(&priv->sg),
 			 sg_dma_len(&priv->sg), priv->dma_direction);
 
@@ -375,6 +372,9 @@ static void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
 		priv->flags |= ID_P_NO_RXDMA;
 
 	priv->dma_direction = DMA_NONE;
+
+	/* Disable DMA Master Received/Transmitted */
+	rcar_i2c_write(priv, ICDMAER, 0);
 }
 
 static void rcar_i2c_cleanup_dma(struct rcar_i2c_priv *priv)
-- 
2.11.0

