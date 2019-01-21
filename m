Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FD6C2F3D5
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 14:17:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB7D120861
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 14:17:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729955AbfAUORK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 09:17:10 -0500
Received: from sauhun.de ([88.99.104.3]:44418 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729012AbfAUORK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 09:17:10 -0500
Received: from localhost (p54B3319E.dip0.t-ipconnect.de [84.179.49.158])
        by pokefinder.org (Postfix) with ESMTPSA id 27FDD2E4001;
        Mon, 21 Jan 2019 15:17:08 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] i2c: gpio: fault-injector: sort debugfs files alphabetically
Date:   Mon, 21 Jan 2019 15:16:56 +0100
Message-Id: <20190121141657.18924-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190121141657.18924-1-wsa+renesas@sang-engineering.com>
References: <20190121141657.18924-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is no value in chronological sorting. Make it easier to follow for
humans.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index d8205b56f243..ca04fa25a141 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -181,12 +181,12 @@ static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
 	if (!priv->debug_dir)
 		return;
 
-	debugfs_create_file_unsafe("scl", 0600, priv->debug_dir, priv, &fops_scl);
-	debugfs_create_file_unsafe("sda", 0600, priv->debug_dir, priv, &fops_sda);
 	debugfs_create_file_unsafe("incomplete_address_phase", 0200, priv->debug_dir,
 				   priv, &fops_incomplete_addr_phase);
 	debugfs_create_file_unsafe("incomplete_write_byte", 0200, priv->debug_dir,
 				   priv, &fops_incomplete_write_byte);
+	debugfs_create_file_unsafe("scl", 0600, priv->debug_dir, priv, &fops_scl);
+	debugfs_create_file_unsafe("sda", 0600, priv->debug_dir, priv, &fops_sda);
 }
 
 static void i2c_gpio_fault_injector_exit(struct platform_device *pdev)
-- 
2.11.0

