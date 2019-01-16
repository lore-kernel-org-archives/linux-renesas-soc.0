Return-Path: <SRS0=SHeS=PY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0114FC43444
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 21:06:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2F9D20840
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 21:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbfAPVGM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 16:06:12 -0500
Received: from sauhun.de ([88.99.104.3]:34496 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725943AbfAPVGL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 16:06:11 -0500
Received: from localhost (p54B333D5.dip0.t-ipconnect.de [84.179.51.213])
        by pokefinder.org (Postfix) with ESMTPSA id 7507C2CF68A;
        Wed, 16 Jan 2019 22:06:10 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC/RFT 7/7] i2c: sh_mobile: update copyright and comments
Date:   Wed, 16 Jan 2019 22:05:55 +0100
Message-Id: <20190116210555.12209-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update copyright years and add Renesas to it. Add/update comments to
make driver easier to understand.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index dd4df961d8eb..568245f964cb 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -2,8 +2,8 @@
 /*
  * SuperH Mobile I2C Controller
  *
- * Copyright (C) 2014 Wolfram Sang <wsa@sang-engineering.com>
- *
+ * Copyright (C) 2014-19 Renesas Electronics Corporation
+ * Copyright (C) 2014-19 Wolfram Sang <wsa@sang-engineering.com>
  * Copyright (C) 2008 Magnus Damm
  *
  * Portions of the code based on out-of-tree driver i2c-sh7343.c
@@ -373,6 +373,7 @@ static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
 	unsigned char data;
 	int real_pos;
 
+	/* switch from TX (address) to RX (data) adds two interrupts */
 	real_pos = pd->pos - 2;
 
 	if (pd->pos == -1) {
@@ -717,8 +718,7 @@ static const struct i2c_adapter_quirks sh_mobile_i2c_quirks = {
 };
 
 /*
- * r8a7740 chip has lasting errata on I2C I/O pad reset.
- * this is work-around for it.
+ * r8a7740 has an errata regarding I2C I/O pad reset needing this workaround.
  */
 static int sh_mobile_i2c_r8a7740_workaround(struct sh_mobile_i2c_data *pd)
 {
-- 
2.11.0

