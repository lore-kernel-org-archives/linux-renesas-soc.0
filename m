Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3234C43219
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 14:36:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0187D2067D
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 14:36:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfDYOgD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 10:36:03 -0400
Received: from sauhun.de ([88.99.104.3]:45658 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726957AbfDYOgD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 10:36:03 -0400
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
        by pokefinder.org (Postfix) with ESMTPSA id BCC9D2CF687;
        Thu, 25 Apr 2019 16:36:01 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Haavard Skinnemoen <hskinnemoen@gmail.com>
Subject: [PATCH] MAINTAINERS: friendly takeover of i2c-gpio driver
Date:   Thu, 25 Apr 2019 16:35:55 +0200
Message-Id: <20190425143555.29659-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I haven't heard from Haavard in years despite putting him to the CC list for
i2c-gpio related mails. Since I was doing the work on this driver for a while
now, let me take official maintainership, so it will be more clear to users.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>
---

Haavard: please let me know if you agree to this patch, or want some more
discussion about it.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 09f43f1bdd15..50c643393af6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6461,7 +6461,7 @@ S:	Maintained
 F:	drivers/media/radio/radio-gemtek*
 
 GENERIC GPIO I2C DRIVER
-M:	Haavard Skinnemoen <hskinnemoen@gmail.com>
+M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 S:	Supported
 F:	drivers/i2c/busses/i2c-gpio.c
 F:	include/linux/platform_data/i2c-gpio.h
-- 
2.11.0

