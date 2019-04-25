Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2ECC4321A
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 14:19:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07A1120717
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 14:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfDYOT6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 10:19:58 -0400
Received: from sauhun.de ([88.99.104.3]:45564 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727175AbfDYOT6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 10:19:58 -0400
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
        by pokefinder.org (Postfix) with ESMTPSA id CEC683E6076;
        Thu, 25 Apr 2019 16:19:56 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Peter Rosin <peda@axentia.se>, linux-renesas-soc@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 1/2] i2c: core: ratelimit 'transfer when suspended' errors
Date:   Thu, 25 Apr 2019 16:19:47 +0200
Message-Id: <20190425141948.29255-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190425141948.29255-1-wsa+renesas@sang-engineering.com>
References: <20190425141948.29255-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There are two problems with WARN_ON() here. One: It is not ratelimited.
Two: We don't see which adapter was used when trying to transfer
something when already suspended. Implement a custom ratelimit once per
adapter and use dev_WARN there. This fixes both issues. Drawback is that
we don't see if multiple drivers are trying to transfer with the same
adapter while suspended. They need to be discovered one after the other
now. This is better than a high CPU load because a really broken driver
might try to resend endlessly.

Fixes: 9ac6cb5fbb17 ("i2c: add suspended flag and accessors for i2c adapters")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 5 ++++-
 include/linux/i2c.h         | 3 ++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 4e6300dc2c4e..f8e85983cb04 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1867,8 +1867,11 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 
 	if (WARN_ON(!msgs || num < 1))
 		return -EINVAL;
-	if (WARN_ON(test_bit(I2C_ALF_IS_SUSPENDED, &adap->locked_flags)))
+	if (test_bit(I2C_ALF_IS_SUSPENDED, &adap->locked_flags)) {
+		if (!test_and_set_bit(I2C_ALF_SUSPEND_REPORTED, &adap->locked_flags))
+			dev_WARN(&adap->dev, "Transfer while suspended\n");
 		return -ESHUTDOWN;
+	}
 
 	if (adap->quirks && i2c_check_for_quirks(adap, msgs, num))
 		return -EOPNOTSUPP;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 03755d4c9229..be27062f8ed1 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -694,7 +694,8 @@ struct i2c_adapter {
 	int retries;
 	struct device dev;		/* the adapter device */
 	unsigned long locked_flags;	/* owned by the I2C core */
-#define I2C_ALF_IS_SUSPENDED	0
+#define I2C_ALF_IS_SUSPENDED		0
+#define I2C_ALF_SUSPEND_REPORTED	1
 
 	int nr;
 	char name[48];
-- 
2.11.0

