Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548D2C282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 12:59:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 215B020818
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 12:59:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfBEM7n (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 07:59:43 -0500
Received: from sauhun.de ([88.99.104.3]:57334 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbfBEM7n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 07:59:43 -0500
Received: from localhost (unknown [46.183.103.8])
        by pokefinder.org (Postfix) with ESMTPSA id 993A72C0509;
        Tue,  5 Feb 2019 13:59:32 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Haavard Skinnemoen <hskinnemoen@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2] i2c: gpio: merge two very similar comments
Date:   Tue,  5 Feb 2019 13:58:41 +0100
Message-Id: <20190205125841.12445-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I think it is clear enough if we have the explanation once and make it
clear it is applicable for both SCL and SDA. Reword it a little with
the help of Simon's native language skills :)

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1: add Simon's rewording

 drivers/i2c/busses/i2c-gpio.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index c008d209f0b8..e8cde2c40d3f 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -286,11 +286,11 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 
 	/*
 	 * First get the GPIO pins; if it fails, we'll defer the probe.
-	 * If the SDA line is marked from platform data or device tree as
-	 * "open drain" it means something outside of our control is making
-	 * this line being handled as open drain, and we should just handle
-	 * it as any other output. Else we enforce open drain as this is
-	 * required for an I2C bus.
+	 * If the SCL/SDA lines are marked "open drain" by platform data or
+	 * device tree then this means that something outside of our control is
+	 * marking these lines to be handled as open drain, and we should just
+	 * handle them as we handle any other output. Else we enforce open
+	 * drain as this is required for an I2C bus.
 	 */
 	if (pdata->sda_is_open_drain)
 		gflags = GPIOD_OUT_HIGH;
@@ -300,13 +300,6 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->sda))
 		return PTR_ERR(priv->sda);
 
-	/*
-	 * If the SCL line is marked from platform data or device tree as
-	 * "open drain" it means something outside of our control is making
-	 * this line being handled as open drain, and we should just handle
-	 * it as any other output. Else we enforce open drain as this is
-	 * required for an I2C bus.
-	 */
 	if (pdata->scl_is_open_drain)
 		gflags = GPIOD_OUT_HIGH;
 	else
-- 
2.19.1

