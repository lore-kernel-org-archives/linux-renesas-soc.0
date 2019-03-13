Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A27C10F03
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 16:56:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17D822171F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 16:56:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfCMQ4P (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 12:56:15 -0400
Received: from sauhun.de ([88.99.104.3]:49254 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725992AbfCMQ4O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 12:56:14 -0400
Received: from localhost (p54B33543.dip0.t-ipconnect.de [84.179.53.67])
        by pokefinder.org (Postfix) with ESMTPSA id BA8AE3E4305;
        Wed, 13 Mar 2019 17:56:12 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v7 1/3] i2c: core: improve return value handling of i2c_new_device and i2c_new_dummy
Date:   Wed, 13 Mar 2019 17:55:24 +0100
Message-Id: <20190313165526.28588-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Heiner Kallweit <hkallweit1@gmail.com>

Currently i2c_new_device and i2c_new_dummy return just NULL in error
case although they have more error details internally. Therefore move
the functionality into new functions returning detailed errors and
add wrappers for compatibility with the current API.

This allows to use these functions with detailed error codes within
the i2c core or for API extensions.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
[wsa: rename new functions to 'errptr' style and fix minor kdoc issues]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 70 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 57 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index cb6c5cb0df0b..bbca2e8bb019 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -710,7 +710,7 @@ static int i2c_dev_irq_from_resources(const struct resource *resources,
 }
 
 /**
- * i2c_new_device - instantiate an i2c device
+ * i2c_new_device_errptr - instantiate an i2c device
  * @adap: the adapter managing the device
  * @info: describes one I2C device; bus_num is ignored
  * Context: can sleep
@@ -723,17 +723,17 @@ static int i2c_dev_irq_from_resources(const struct resource *resources,
  * before any i2c_adapter could exist.
  *
  * This returns the new i2c client, which may be saved for later use with
- * i2c_unregister_device(); or NULL to indicate an error.
+ * i2c_unregister_device(); or an ERR_PTR to describe the error.
  */
-struct i2c_client *
-i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
+static struct i2c_client *
+i2c_new_device_errptr(struct i2c_adapter *adap, struct i2c_board_info const *info)
 {
 	struct i2c_client	*client;
 	int			status;
 
 	client = kzalloc(sizeof *client, GFP_KERNEL);
 	if (!client)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	client->adapter = adap;
 
@@ -799,7 +799,29 @@ i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 		client->name, client->addr, status);
 out_err_silent:
 	kfree(client);
-	return NULL;
+	return ERR_PTR(status);
+}
+
+/**
+ * i2c_new_device - instantiate an i2c device
+ * @adap: the adapter managing the device
+ * @info: describes one I2C device; bus_num is ignored
+ * Context: can sleep
+ *
+ * This function has the same functionality like i2c_new_device_errptr, it just
+ * returns NULL instead of an ERR_PTR in case of an error for compatibility
+ * with current I2C API.
+ *
+ * This returns the new i2c client, which may be saved for later use with
+ * i2c_unregister_device(); or NULL to indicate an error.
+ */
+struct i2c_client *
+i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
+{
+	struct i2c_client *ret;
+
+	ret = i2c_new_device_errptr(adap, info);
+	return IS_ERR(ret) ? NULL : ret;
 }
 EXPORT_SYMBOL_GPL(i2c_new_device);
 
@@ -850,7 +872,7 @@ static struct i2c_driver dummy_driver = {
 };
 
 /**
- * i2c_new_dummy - return a new i2c device bound to a dummy driver
+ * i2c_new_dummy_errptr - return a new i2c device bound to a dummy driver
  * @adapter: the adapter managing the device
  * @address: seven bit address to be used
  * Context: can sleep
@@ -865,15 +887,37 @@ static struct i2c_driver dummy_driver = {
  * different driver.
  *
  * This returns the new i2c client, which should be saved for later use with
- * i2c_unregister_device(); or NULL to indicate an error.
+ * i2c_unregister_device(); or an ERR_PTR to describe the error.
  */
-struct i2c_client *i2c_new_dummy(struct i2c_adapter *adapter, u16 address)
+static struct i2c_client *
+i2c_new_dummy_errptr(struct i2c_adapter *adapter, u16 address)
 {
 	struct i2c_board_info info = {
 		I2C_BOARD_INFO("dummy", address),
 	};
 
-	return i2c_new_device(adapter, &info);
+	return i2c_new_device_errptr(adapter, &info);
+}
+
+/**
+ * i2c_new_dummy - return a new i2c device bound to a dummy driver
+ * @adapter: the adapter managing the device
+ * @address: seven bit address to be used
+ * Context: can sleep
+ *
+ * This function has the same functionality like i2c_new_dummy_errptr, it just
+ * returns NULL instead of an ERR_PTR in case of an error for compatibility
+ * with current I2C API.
+ *
+ * This returns the new i2c client, which should be saved for later use with
+ * i2c_unregister_device(); or NULL to indicate an error.
+ */
+struct i2c_client *i2c_new_dummy(struct i2c_adapter *adapter, u16 address)
+{
+	struct i2c_client *ret;
+
+	ret = i2c_new_dummy_errptr(adapter, address);
+	return IS_ERR(ret) ? NULL : ret;
 }
 EXPORT_SYMBOL_GPL(i2c_new_dummy);
 
@@ -996,9 +1040,9 @@ i2c_sysfs_new_device(struct device *dev, struct device_attribute *attr,
 		info.flags |= I2C_CLIENT_SLAVE;
 	}
 
-	client = i2c_new_device(adap, &info);
-	if (!client)
-		return -EINVAL;
+	client = i2c_new_device_errptr(adap, &info);
+	if (IS_ERR(client))
+		return PTR_ERR(client);
 
 	/* Keep track of the added device */
 	mutex_lock(&adap->userspace_clients_lock);
-- 
2.11.0

