Return-Path: <SRS0=PMmv=P3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1F5C61CE8
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 19 Jan 2019 12:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99FF820821
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 19 Jan 2019 12:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbfASMRE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 19 Jan 2019 07:17:04 -0500
Received: from sauhun.de ([88.99.104.3]:56406 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727965AbfASMRE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Jan 2019 07:17:04 -0500
Received: from localhost (p54B33180.dip0.t-ipconnect.de [84.179.49.128])
        by pokefinder.org (Postfix) with ESMTPSA id 2942E2DDAB4;
        Sat, 19 Jan 2019 13:17:02 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] i2c: algo-bit: include main i2c header
Date:   Sat, 19 Jan 2019 13:16:53 +0100
Message-Id: <20190119121655.5576-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190119121655.5576-1-wsa+renesas@sang-engineering.com>
References: <20190119121655.5576-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We are using symbols from it, so we should include it directly. Found
after sorting includes in a driver.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/i2c-algo-bit.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/i2c-algo-bit.h b/include/linux/i2c-algo-bit.h
index 63904ba6887e..d64cebc6e65a 100644
--- a/include/linux/i2c-algo-bit.h
+++ b/include/linux/i2c-algo-bit.h
@@ -25,6 +25,8 @@
 #ifndef _LINUX_I2C_ALGO_BIT_H
 #define _LINUX_I2C_ALGO_BIT_H
 
+#include <linux/i2c.h>
+
 /* --- Defines for bit-adapters ---------------------------------------	*/
 /*
  * This struct contains the hw-dependent functions of bit-style adapters to
-- 
2.11.0

