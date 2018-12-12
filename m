Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237AAC67839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:49:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD9EA2086D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:49:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeECvwMO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD9EA2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbeLLBtw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:49:52 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41378 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbeLLBtw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:49:52 -0500
Received: by mail-wr1-f67.google.com with SMTP id x10so16007381wrs.8;
        Tue, 11 Dec 2018 17:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QXLDufqRXvG7o62lPyI68QyNfPzXBGucSuLu2gNoT4w=;
        b=IeECvwMOnRQnQDius/py4Y4mhI2bvyDiSznOBSQzar7ORHNmu+CWyzKTXNdMkOL/96
         V4RW/7vbZycUL6K61znfRtBO5tWNi45bmxyMGpdmihftsbqLvfh6l2CQvJzCsx2tUeKT
         LGB3oeuTvMJXZNI4DgjRtu1iJBY75gxqaO9aDEazglzgOEVRM4LRgSaCyvKKeusnaC5J
         bUF18mWECmNgnOV7DSE6Zx8r18AOjkLxpfAX6k/HidEr+rBumHrbz+4px8jBzYyyJsxK
         e3KE45cpkFtRUDns5i3Y0Js2h8AFgWomsM6etbHYdqeamZv+hmRXyywozf+9zKcMJ22l
         be6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QXLDufqRXvG7o62lPyI68QyNfPzXBGucSuLu2gNoT4w=;
        b=QnG+C0g2onnLpXU6LesIj8zGFlWtPhbWGgAfaGgjX5iPFyf9gZCrMl3KHfzkM1u3vk
         zrxzDsiiogyUdg0QjhmhXdHs3WIzDgOS/YFg2zwNWaYOePyltp/yU1du8F2EQTSgDO87
         A2WDtmUNOVs8yFnFGWoS0Md8z9ZpwMCByqLZgOF5WwU79QsiKsEncv1qJJJpzyxNqVjT
         IpHYjVrHBXLllI8ujsWujNpLyPRUYIrQQM9BiqF+hMBIF0GWCxvI2PeY9lyZGNu5t3r2
         dp0KI8Ox6Nvw7mKaymBs4Hf1zMEwXppAXr5LSbPib6yLpIF06wOnCjYjIrPzh9BZnRzW
         /CEg==
X-Gm-Message-State: AA+aEWbM/5IRPD7VWKUjus/W7ZD1rAJjG9MieoB1Aq0Lf0RwkNV/K65g
        g2oRGYGyqXqP0JXbviTFZ/D8Q+eG
X-Google-Smtp-Source: AFSGD/UQi0P54HiEr/l7lIFPDrS3W8b9XbXoN73np/Sh6b1PzfsGoH+aZstpbCOYI28H7nfubnBTRw==
X-Received: by 2002:adf:e407:: with SMTP id g7mr14944861wrm.277.1544579390037;
        Tue, 11 Dec 2018 17:49:50 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v8sm12887250wrq.53.2018.12.11.17.49.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:49:49 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH 2/6] thermal: split devm_thermal_zone_of_sensor_register{,_param}()
Date:   Wed, 12 Dec 2018 02:49:23 +0100
Message-Id: <20181212014927.25840-3-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Introduce new split:devm_thermal_zone_of_sensor_register_params()
function, which allows passing struct thermal_zone_params into it
and convert original devm_thermal_zone_of_sensor_register() to call
it with params set to NULL.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-pm@vger.kernel.org
---
 drivers/thermal/of-thermal.c | 42 ++++++++++++++++++++++++++++++------
 include/linux/thermal.h      | 13 +++++++++++
 2 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
index eb0ef7a21035..901d8799587a 100644
--- a/drivers/thermal/of-thermal.c
+++ b/drivers/thermal/of-thermal.c
@@ -637,8 +637,8 @@ static int devm_thermal_zone_of_sensor_match(struct device *dev, void *res,
 }
 
 /**
- * devm_thermal_zone_of_sensor_register - Resource managed version of
- *				thermal_zone_of_sensor_register()
+ * devm_thermal_zone_of_sensor_register_params - Resource managed version of
+ *				thermal_zone_of_sensor_register_params()
  * @dev: a valid struct device pointer of a sensor device. Must contain
  *       a valid .of_node, for the sensor node.
  * @sensor_id: a sensor identifier, in case the sensor IP has more
@@ -646,8 +646,9 @@ static int devm_thermal_zone_of_sensor_match(struct device *dev, void *res,
  * @data: a private pointer (owned by the caller) that will be passed
  *	  back, when a temperature reading is needed.
  * @ops: struct thermal_zone_of_device_ops *. Must contain at least .get_temp.
+ * @tzp: thermal zone platform parameters
  *
- * Refer thermal_zone_of_sensor_register() for more details.
+ * Refer thermal_zone_of_sensor_register_params() for more details.
  *
  * Return: On success returns a valid struct thermal_zone_device,
  * otherwise, it returns a corresponding ERR_PTR(). Caller must
@@ -655,9 +656,10 @@ static int devm_thermal_zone_of_sensor_match(struct device *dev, void *res,
  * Registered thermal_zone_device device will automatically be
  * released when device is unbounded.
  */
-struct thermal_zone_device *devm_thermal_zone_of_sensor_register(
+struct thermal_zone_device *devm_thermal_zone_of_sensor_register_params(
 	struct device *dev, int sensor_id,
-	void *data, const struct thermal_zone_of_device_ops *ops)
+	void *data, const struct thermal_zone_of_device_ops *ops,
+	struct thermal_zone_params *tzp)
 {
 	struct thermal_zone_device **ptr, *tzd;
 
@@ -666,7 +668,8 @@ struct thermal_zone_device *devm_thermal_zone_of_sensor_register(
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	tzd = thermal_zone_of_sensor_register(dev, sensor_id, data, ops);
+	tzd = thermal_zone_of_sensor_register_params(dev, sensor_id, data,
+						     ops, tzp);
 	if (IS_ERR(tzd)) {
 		devres_free(ptr);
 		return tzd;
@@ -677,6 +680,33 @@ struct thermal_zone_device *devm_thermal_zone_of_sensor_register(
 
 	return tzd;
 }
+
+/**
+ * devm_thermal_zone_of_sensor_register - Resource managed version of
+ *				thermal_zone_of_sensor_register()
+ * @dev: a valid struct device pointer of a sensor device. Must contain
+ *       a valid .of_node, for the sensor node.
+ * @sensor_id: a sensor identifier, in case the sensor IP has more
+ *	       than one sensors
+ * @data: a private pointer (owned by the caller) that will be passed
+ *	  back, when a temperature reading is needed.
+ * @ops: struct thermal_zone_of_device_ops *. Must contain at least .get_temp.
+ *
+ * Refer thermal_zone_of_sensor_register() for more details.
+ *
+ * Return: On success returns a valid struct thermal_zone_device,
+ * otherwise, it returns a corresponding ERR_PTR(). Caller must
+ * check the return value with help of IS_ERR() helper.
+ * Registered thermal_zone_device device will automatically be
+ * released when device is unbounded.
+ */
+struct thermal_zone_device *devm_thermal_zone_of_sensor_register(
+	struct device *dev, int sensor_id,
+	void *data, const struct thermal_zone_of_device_ops *ops)
+{
+	return devm_thermal_zone_of_sensor_register_params(dev, sensor_id,
+							   data, ops, NULL);
+}
 EXPORT_SYMBOL_GPL(devm_thermal_zone_of_sensor_register);
 
 /**
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 922034eae74b..a9e7bdeea1bb 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -387,6 +387,10 @@ void thermal_zone_of_sensor_unregister(struct device *dev,
 struct thermal_zone_device *devm_thermal_zone_of_sensor_register(
 		struct device *dev, int id, void *data,
 		const struct thermal_zone_of_device_ops *ops);
+struct thermal_zone_device *devm_thermal_zone_of_sensor_register_params(
+		struct device *dev, int id, void *data,
+		const struct thermal_zone_of_device_ops *ops,
+		struct thermal_zone_params *tzp);
 void devm_thermal_zone_of_sensor_unregister(struct device *dev,
 					    struct thermal_zone_device *tz);
 #else
@@ -418,6 +422,15 @@ static inline struct thermal_zone_device *devm_thermal_zone_of_sensor_register(
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct thermal_zone_device *
+	devm_thermal_zone_of_sensor_register_params(
+		struct device *dev, int id, void *data,
+		const struct thermal_zone_of_device_ops *ops,
+		struct thermal_zone_params *tzp)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline
 void devm_thermal_zone_of_sensor_unregister(struct device *dev,
 					    struct thermal_zone_device *tz)
-- 
2.18.0

