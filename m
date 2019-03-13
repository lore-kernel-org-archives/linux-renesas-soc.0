Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71657C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 16:56:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49A1C2171F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 16:56:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbfCMQ4P (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 12:56:15 -0400
Received: from sauhun.de ([88.99.104.3]:49268 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726842AbfCMQ4P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 12:56:15 -0400
Received: from localhost (p54B33543.dip0.t-ipconnect.de [84.179.53.67])
        by pokefinder.org (Postfix) with ESMTPSA id 47C523E4306;
        Wed, 13 Mar 2019 17:56:13 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v7 2/3] i2c: core: add device-managed version of i2c_new_dummy
Date:   Wed, 13 Mar 2019 17:55:25 +0100
Message-Id: <20190313165526.28588-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Heiner Kallweit <hkallweit1@gmail.com>

i2c_new_dummy is typically called from the probe function of the
driver for the primary i2c client. It requires calls to
i2c_unregister_device in the error path of the probe function and
in the remove function.
This can be simplified by introducing a device-managed version.

Note the changed error case return value type:
i2c_new_dummy returns NULL whilst devm_new_i2c_dummy returns an ERR_PTR.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
[wsa: rename new functions to 'errptr' style and fix minor kdoc issues]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/driver-model/devres.txt |  3 +++
 drivers/i2c/i2c-core-base.c           | 44 +++++++++++++++++++++++++++++++++++
 include/linux/i2c.h                   |  3 +++
 3 files changed, 50 insertions(+)

diff --git a/Documentation/driver-model/devres.txt b/Documentation/driver-model/devres.txt
index b277cafce71e..e36dc8041857 100644
--- a/Documentation/driver-model/devres.txt
+++ b/Documentation/driver-model/devres.txt
@@ -266,6 +266,9 @@ GPIO
   devm_gpio_request_one()
   devm_gpio_free()
 
+I2C
+  devm_i2c_new_dummy_errptr()
+
 IIO
   devm_iio_device_alloc()
   devm_iio_device_free()
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index bbca2e8bb019..7f20c6b8857f 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -921,6 +921,50 @@ struct i2c_client *i2c_new_dummy(struct i2c_adapter *adapter, u16 address)
 }
 EXPORT_SYMBOL_GPL(i2c_new_dummy);
 
+struct i2c_dummy_devres {
+	struct i2c_client *client;
+};
+
+static void devm_i2c_release_dummy(struct device *dev, void *res)
+{
+	struct i2c_dummy_devres *this = res;
+
+	i2c_unregister_device(this->client);
+}
+
+/**
+ * devm_i2c_new_dummy_errptr - return a new i2c device bound to a dummy driver
+ * @dev: device the managed resource is bound to
+ * @adapter: the adapter managing the device
+ * @address: seven bit address to be used
+ * Context: can sleep
+ *
+ * This is the device-managed version of @i2c_new_dummy. It returns the new i2c
+ * client or an ERR_PTR in case of an error.
+ */
+struct i2c_client *devm_i2c_new_dummy_errptr(struct device *dev,
+					     struct i2c_adapter *adapter,
+					     u16 address)
+{
+	struct i2c_dummy_devres *dr;
+	struct i2c_client *client;
+
+	dr = devres_alloc(devm_i2c_release_dummy, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return ERR_PTR(-ENOMEM);
+
+	client = i2c_new_dummy_errptr(adapter, address);
+	if (IS_ERR(client)) {
+		devres_free(dr);
+	} else {
+		dr->client = client;
+		devres_add(dev, dr);
+	}
+
+	return client;
+}
+EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_errptr);
+
 /**
  * i2c_new_secondary_device - Helper to get the instantiated secondary address
  * and create the associated device
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 383510b4f083..93075c2ad9dc 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -470,6 +470,9 @@ extern struct i2c_client *
 i2c_new_dummy(struct i2c_adapter *adap, u16 address);
 
 extern struct i2c_client *
+devm_i2c_new_dummy_errptr(struct device *dev, struct i2c_adapter *adap, u16 address);
+
+extern struct i2c_client *
 i2c_new_secondary_device(struct i2c_client *client,
 				const char *name,
 				u16 default_addr);
-- 
2.11.0

