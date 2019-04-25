Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E563C4321D
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 14:20:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36D5A20717
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 14:20:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbfDYOT7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 10:19:59 -0400
Received: from sauhun.de ([88.99.104.3]:45574 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727188AbfDYOT7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 10:19:59 -0400
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
        by pokefinder.org (Postfix) with ESMTPSA id 3C4433E43BB;
        Thu, 25 Apr 2019 16:19:57 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Peter Rosin <peda@axentia.se>, linux-renesas-soc@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 2/2] i2c: core: apply 'is_suspended' check for SMBus, too
Date:   Thu, 25 Apr 2019 16:19:48 +0200
Message-Id: <20190425141948.29255-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190425141948.29255-1-wsa+renesas@sang-engineering.com>
References: <20190425141948.29255-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We checked I2C calls, but not SMBus. Refactor the helper to an inline
function and use it for both, I2C and SMBus.

Fixes: 9ac6cb5fbb17 ("i2c: add suspended flag and accessors for i2c adapters")
Reported-by: Peter Rosin <peda@axentia.se>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c  |  9 ++++-----
 drivers/i2c/i2c-core-smbus.c |  4 ++++
 drivers/i2c/i2c-core.h       | 11 +++++++++++
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index f8e85983cb04..f7ae416f1e08 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1867,11 +1867,10 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 
 	if (WARN_ON(!msgs || num < 1))
 		return -EINVAL;
-	if (test_bit(I2C_ALF_IS_SUSPENDED, &adap->locked_flags)) {
-		if (!test_and_set_bit(I2C_ALF_SUSPEND_REPORTED, &adap->locked_flags))
-			dev_WARN(&adap->dev, "Transfer while suspended\n");
-		return -ESHUTDOWN;
-	}
+
+	ret = __i2c_check_suspended(adap);
+	if (ret)
+		return ret;
 
 	if (adap->quirks && i2c_check_for_quirks(adap, msgs, num))
 		return -EOPNOTSUPP;
diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index fdb0fb9fb9aa..788d42f2aad9 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -555,6 +555,10 @@ s32 __i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 	int try;
 	s32 res;
 
+	res = __i2c_check_suspended(adapter);
+	if (res)
+		return res;
+
 	/* If enabled, the following two tracepoints are conditional on
 	 * read_write and protocol.
 	 */
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index f9d0c417b5a5..c88cfef81343 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -54,6 +54,17 @@ static inline int __i2c_lock_bus_helper(struct i2c_adapter *adap)
 	return ret;
 }
 
+static inline int __i2c_check_suspended(struct i2c_adapter *adap)
+{
+	if (test_bit(I2C_ALF_IS_SUSPENDED, &adap->locked_flags)) {
+		if (!test_and_set_bit(I2C_ALF_SUSPEND_REPORTED, &adap->locked_flags))
+			dev_WARN(&adap->dev, "Transfer while suspended\n");
+		return -ESHUTDOWN;
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_ACPI
 const struct acpi_device_id *
 i2c_acpi_match_device(const struct acpi_device_id *matches,
-- 
2.11.0

