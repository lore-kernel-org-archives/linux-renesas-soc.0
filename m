Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EF6C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:30:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97C22206C0
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:30:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKIuGNnc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbeLOCa0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 21:30:26 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36596 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbeLOCaZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 21:30:25 -0500
Received: by mail-wr1-f66.google.com with SMTP id u4so6170040wrp.3;
        Fri, 14 Dec 2018 18:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kqYHpaHX9SnIcZdI2imac77gyXJ3aSrfZwdKHTyCWK0=;
        b=CKIuGNncGHczD7geq3NDoOXnNoU3B76NkJ3pv7hUAhEGG02v9PeJjE9Gq5oTKM2WoO
         HzPWoUH8KHHucYLO6L5OQs5VZsAg7/V71+9PfwTAw0bggh/MCYsY9tc95ipZBKIamBZ3
         KzTw4y7nan5t0OcK778hfR9LFOeI95km3naccC71ak2CzEvuWry91Tf/pty8lZwX+tSD
         MEtYmnKPOd7kqVTuyYnTbXLWW8PCncB83gYxb7HJCGidV6SONhWJk9SBfCHxfJ6V2Jwb
         XqsGvYNoJHZN03U5njYOb7wTC/iQolypFw+6MNvB6XIe3TWZ9DWX0h8pFpsUK2nBzCCX
         Oe3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kqYHpaHX9SnIcZdI2imac77gyXJ3aSrfZwdKHTyCWK0=;
        b=cJ3C/ipKBtgDpZyftZj7sCApZkHLLcXd1vcRNLG8vJltCzfz/EESXvAJAM403zICmY
         YK4fFqBGjCGMyxWZy7oPlDylWxCX4JCR5oKBdXdH9VwT5cJ7mnsELI/XuDAUx3Q3FYS5
         BIF55x33+bINAcvqI6KQyv9vLMjUQbOagttggogl9WHrzcYkWzCbBKWECvcw3xBZjw/3
         toz/E4M2oCY6Bx675c8CwTxHKIIBCQY1gtqCkdIPMVkGSwuPF0LSfcBuTr16HGtB8+f6
         gBpblJ8YtGgx494uVkOu9O4/a9W8SYgn0NToiP2edAmrXcnUPTXt5pr70bDWDPylDSlw
         JAtw==
X-Gm-Message-State: AA+aEWYIicYk9n9b51uJg0q2DUU/3YYwr9TuHwLVVCkzSwlOJgm0o7c1
        Kck81fjJNPlmIN+LRsFXBD6Y4xoi
X-Google-Smtp-Source: AFSGD/WlysQ22DwBuuhBYwMyYv+GwG+FrBIwrWL/SqlTNszhLbEH0frBLDqAVUpTfu63cCg0BWgHTw==
X-Received: by 2002:adf:fb0d:: with SMTP id c13mr4658639wrr.285.1544841022929;
        Fri, 14 Dec 2018 18:30:22 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v19sm12151423wrd.46.2018.12.14.18.30.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 18:30:21 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH V2 1/6] thermal: split thermal_zone_of_sensor_register{,_param}()
Date:   Sat, 15 Dec 2018 03:30:05 +0100
Message-Id: <20181215023010.2857-2-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215023010.2857-1-marek.vasut+renesas@gmail.com>
References: <20181215023010.2857-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Introduce new thermal_zone_of_sensor_register_params() function, which
allows passing struct thermal_zone_params into it and convert original
thermal_zone_of_sensor_register() to call it with params set to NULL.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-pm@vger.kernel.org
---
V2: Add EXPORT_SYMBOL_GPL() to fix build as a module
---
 drivers/thermal/of-thermal.c | 51 +++++++++++++++++++++++++++++++++---
 include/linux/thermal.h      | 12 +++++++++
 2 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
index 4bfdb4a1e47d..1fb450d02ab5 100644
--- a/drivers/thermal/of-thermal.c
+++ b/drivers/thermal/of-thermal.c
@@ -446,7 +446,8 @@ thermal_zone_of_add_sensor(struct device_node *zone,
 }
 
 /**
- * thermal_zone_of_sensor_register - registers a sensor to a DT thermal zone
+ * thermal_zone_of_sensor_register_params - registers a sensor to a DT thermal
+ *					zone with thermal zone parameters
  * @dev: a valid struct device pointer of a sensor device. Must contain
  *       a valid .of_node, for the sensor node.
  * @sensor_id: a sensor identifier, in case the sensor IP has more
@@ -454,6 +455,7 @@ thermal_zone_of_add_sensor(struct device_node *zone,
  * @data: a private pointer (owned by the caller) that will be passed
  *        back, when a temperature reading is needed.
  * @ops: struct thermal_zone_of_device_ops *. Must contain at least .get_temp.
+ * @tzp: thermal zone platform parameters
  *
  * This function will search the list of thermal zones described in device
  * tree and look for the zone that refer to the sensor device pointed by
@@ -478,8 +480,9 @@ thermal_zone_of_add_sensor(struct device_node *zone,
  * check the return value with help of IS_ERR() helper.
  */
 struct thermal_zone_device *
-thermal_zone_of_sensor_register(struct device *dev, int sensor_id, void *data,
-				const struct thermal_zone_of_device_ops *ops)
+thermal_zone_of_sensor_register_params(struct device *dev, int sensor_id,
+	void *data, const struct thermal_zone_of_device_ops *ops,
+	struct thermal_zone_params *tzp)
 {
 	struct device_node *np, *child, *sensor_np;
 	struct thermal_zone_device *tzd = ERR_PTR(-ENODEV);
@@ -533,6 +536,48 @@ thermal_zone_of_sensor_register(struct device *dev, int sensor_id, void *data,
 
 	return tzd;
 }
+EXPORT_SYMBOL_GPL(thermal_zone_of_sensor_register_params);
+
+/**
+ * thermal_zone_of_sensor_register - registers a sensor to a DT thermal zone
+ * @dev: a valid struct device pointer of a sensor device. Must contain
+ *       a valid .of_node, for the sensor node.
+ * @sensor_id: a sensor identifier, in case the sensor IP has more
+ *             than one sensors
+ * @data: a private pointer (owned by the caller) that will be passed
+ *        back, when a temperature reading is needed.
+ * @ops: struct thermal_zone_of_device_ops *. Must contain at least .get_temp.
+ *
+ * This function will search the list of thermal zones described in device
+ * tree and look for the zone that refer to the sensor device pointed by
+ * @dev->of_node as temperature providers. For the zone pointing to the
+ * sensor node, the sensor will be added to the DT thermal zone device.
+ *
+ * The thermal zone temperature is provided by the @get_temp function
+ * pointer. When called, it will have the private pointer @data back.
+ *
+ * The thermal zone temperature trend is provided by the @get_trend function
+ * pointer. When called, it will have the private pointer @data back.
+ *
+ * TODO:
+ * 01 - This function must enqueue the new sensor instead of using
+ * it as the only source of temperature values.
+ *
+ * 02 - There must be a way to match the sensor with all thermal zones
+ * that refer to it.
+ *
+ * Return: On success returns a valid struct thermal_zone_device,
+ * otherwise, it returns a corresponding ERR_PTR(). Caller must
+ * check the return value with help of IS_ERR() helper.
+ */
+
+struct thermal_zone_device *
+thermal_zone_of_sensor_register(struct device *dev, int sensor_id, void *data,
+				const struct thermal_zone_of_device_ops *ops)
+{
+	return thermal_zone_of_sensor_register_params(dev, sensor_id, data,
+						      ops, NULL);
+}
 EXPORT_SYMBOL_GPL(thermal_zone_of_sensor_register);
 
 /**
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 5f4705f46c2f..922034eae74b 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -378,6 +378,10 @@ struct thermal_trip {
 struct thermal_zone_device *
 thermal_zone_of_sensor_register(struct device *dev, int id, void *data,
 				const struct thermal_zone_of_device_ops *ops);
+struct thermal_zone_device *
+thermal_zone_of_sensor_register_params(struct device *dev, int id, void *data,
+			const struct thermal_zone_of_device_ops *ops,
+			struct thermal_zone_params *tzp);
 void thermal_zone_of_sensor_unregister(struct device *dev,
 				       struct thermal_zone_device *tz);
 struct thermal_zone_device *devm_thermal_zone_of_sensor_register(
@@ -393,6 +397,14 @@ thermal_zone_of_sensor_register(struct device *dev, int id, void *data,
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct thermal_zone_device *
+thermal_zone_of_sensor_register_params(struct device *dev, int id, void *data,
+			const struct thermal_zone_of_device_ops *ops,
+			struct thermal_zone_params *tzp)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline
 void thermal_zone_of_sensor_unregister(struct device *dev,
 				       struct thermal_zone_device *tz)
-- 
2.18.0

