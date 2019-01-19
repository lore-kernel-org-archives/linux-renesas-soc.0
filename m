Return-Path: <SRS0=PMmv=P3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD07C61CE8
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 19 Jan 2019 12:03:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 20DA42086A
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 19 Jan 2019 12:03:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbfASMDc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 19 Jan 2019 07:03:32 -0500
Received: from sauhun.de ([88.99.104.3]:56306 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727924AbfASMDc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Jan 2019 07:03:32 -0500
Received: from localhost (p54B33180.dip0.t-ipconnect.de [84.179.49.128])
        by pokefinder.org (Postfix) with ESMTPSA id 3CC122D1FE5;
        Sat, 19 Jan 2019 13:03:29 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Haavard Skinnemoen <hskinnemoen@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: gpio: merge two very similar comments
Date:   Sat, 19 Jan 2019 12:36:42 +0100
Message-Id: <20190119113642.5348-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I think it is clear enough if we have the explanation once and make it
clear it is applicable for both SCL and SDA.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-gpio.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index c008d209f0b8..b9d43bc2853f 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -286,10 +286,10 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 
 	/*
 	 * First get the GPIO pins; if it fails, we'll defer the probe.
-	 * If the SDA line is marked from platform data or device tree as
-	 * "open drain" it means something outside of our control is making
-	 * this line being handled as open drain, and we should just handle
-	 * it as any other output. Else we enforce open drain as this is
+	 * If the SCL/SDA lines are marked from platform data or device tree
+	 * as "open drain" it means something outside of our control is making
+	 * these lines being handled as open drain, and we should just handle
+	 * them as any other output. Else we enforce open drain as this is
 	 * required for an I2C bus.
 	 */
 	if (pdata->sda_is_open_drain)
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
2.11.0

