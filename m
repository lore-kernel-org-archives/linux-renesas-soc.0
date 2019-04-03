Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE23C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 12:41:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97DD32084C
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 12:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbfDCMk6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 08:40:58 -0400
Received: from sauhun.de ([88.99.104.3]:48360 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726724AbfDCMkm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 08:40:42 -0400
Received: from localhost (p54B3311F.dip0.t-ipconnect.de [84.179.49.31])
        by pokefinder.org (Postfix) with ESMTPSA id 17FCD3E43D3;
        Wed,  3 Apr 2019 14:40:41 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Peter Rosin <peda@axentia.se>,
        Stefan Lengfeld <contact@stefanchrist.eu>,
        linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 12/12] i2c: gpio: flag atomic capability if possible
Date:   Wed,  3 Apr 2019 14:40:19 +0200
Message-Id: <20190403124019.8947-13-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190403124019.8947-1-wsa+renesas@sang-engineering.com>
References: <20190403124019.8947-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If switching GPIOs does not sleep, then we can support atomic transfers.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index bba5c4627de3..9684a0ac2a6d 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -413,6 +413,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 
 	if (gpiod_cansleep(priv->sda) || gpiod_cansleep(priv->scl))
 		dev_warn(dev, "Slow GPIO pins might wreak havoc into I2C/SMBus bus timing");
+	else
+		bit_data->can_do_atomic = true;
 
 	bit_data->setsda = i2c_gpio_setsda_val;
 	bit_data->setscl = i2c_gpio_setscl_val;
-- 
2.11.0

