Return-Path: <SRS0=Xcmt=RF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13271C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  2 Mar 2019 13:48:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF96520838
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  2 Mar 2019 13:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfCBNrt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 2 Mar 2019 08:47:49 -0500
Received: from sauhun.de ([88.99.104.3]:36380 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbfCBNrt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Mar 2019 08:47:49 -0500
Received: from localhost (p54B33179.dip0.t-ipconnect.de [84.179.49.121])
        by pokefinder.org (Postfix) with ESMTPSA id 095F84A177B;
        Sat,  2 Mar 2019 14:47:47 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Peter Rosin <peda@axentia.se>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Stefan Lengfeld <contact@stefanchrist.eu>,
        Phil Reid <preid@electromag.com.au>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 7/7] i2c: algo: bit: HACK! add atomic callback
Date:   Sat,  2 Mar 2019 14:47:35 +0100
Message-Id: <20190302134735.4393-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190302134735.4393-1-wsa+renesas@sang-engineering.com>
References: <20190302134735.4393-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This is only for testing and will work only for bitbanging which is done
without generating irqs. Not for upstream!

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/algos/i2c-algo-bit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index 5e5990a83da5..a9c361947de1 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -615,8 +615,9 @@ static u32 bit_func(struct i2c_adapter *adap)
 /* -----exported algorithm data: -------------------------------------	*/
 
 const struct i2c_algorithm i2c_bit_algo = {
-	.master_xfer	= bit_xfer,
-	.functionality	= bit_func,
+	.master_xfer = bit_xfer,
+	.master_xfer_atomic = bit_xfer,
+	.functionality = bit_func,
 };
 EXPORT_SYMBOL(i2c_bit_algo);
 
-- 
2.11.0

