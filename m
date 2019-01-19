Return-Path: <SRS0=PMmv=P3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC0EC61CE4
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 19 Jan 2019 12:17:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D580C2086D
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 19 Jan 2019 12:17:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbfASMRF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 19 Jan 2019 07:17:05 -0500
Received: from sauhun.de ([88.99.104.3]:56432 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727938AbfASMRF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Jan 2019 07:17:05 -0500
Received: from localhost (p54B33180.dip0.t-ipconnect.de [84.179.49.128])
        by pokefinder.org (Postfix) with ESMTPSA id 7FEA42DDABA;
        Sat, 19 Jan 2019 13:17:03 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] i2c: gpio: sort includes
Date:   Sat, 19 Jan 2019 13:16:55 +0100
Message-Id: <20190119121655.5576-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190119121655.5576-1-wsa+renesas@sang-engineering.com>
References: <20190119121655.5576-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Less risk for duplications when adding new ones.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-gpio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index b9d43bc2853f..d8205b56f243 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -9,15 +9,15 @@
  */
 #include <linux/debugfs.h>
 #include <linux/delay.h>
-#include <linux/i2c.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c-algo-bit.h>
-#include <linux/platform_data/i2c-gpio.h>
+#include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/platform_device.h>
-#include <linux/gpio/consumer.h>
 #include <linux/of.h>
+#include <linux/platform_data/i2c-gpio.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
 
 struct i2c_gpio_private_data {
 	struct gpio_desc *sda;
-- 
2.11.0

