Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18468C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:56:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF2452133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:56:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZRiLXBT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387918AbeLQP4y (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 10:56:54 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40765 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387786AbeLQP4y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 10:56:54 -0500
Received: by mail-wm1-f66.google.com with SMTP id q26so13102056wmf.5;
        Mon, 17 Dec 2018 07:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=y324M4dQHn4UD9VCX0Twm/DD2bu3vc7zxIBqfwPo090=;
        b=dZRiLXBTOauEhRBLhGk8wwckB35n7DJm85RjPss0D2slf1sR9lm4XPN91yBeaHNCQ4
         ZQCYF7h/HoLzwrWGNGbj1uanmUd+xhw3COINyYluOAf9QzrwiRxwRpUTaeHM0lx8xIQK
         1u8+L6oZjbxG3T+VpmKvTSl5H4UxCMdFOIoz45F77xciqUE4Vvkqz2QUnCvhriW1fuoH
         OyxRzQ7VuVYWH+enl3PzGzTTXUma+iM66y7Wpe1VoX4bQ8xvODlwCXCKQU+MxrzY6gv2
         9AF4y6vkOhuoDlHG33+mLpLgXSjFK/5LEjujel7OMHcEtMOqQpM7nR/scZYedIrWiVyn
         NbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=y324M4dQHn4UD9VCX0Twm/DD2bu3vc7zxIBqfwPo090=;
        b=IQsoFOR045Apl8ZUZCtlYLjRt3IeFUjj20g07Six8Zdo6+F9k4VbJce/tyJkPdVL4X
         ZOgy47gfCFHFioOGDA5F0qY9F/bRvxaEdvfrP6aKYF88gJbpCs15hXSQ69bCTYvmdcg5
         HzUDYvZS024+Ffi94s3PUdNARibO5nRip+yJqfKzUoynXsWVPvm1VqnziXr207lk943T
         9+hUW0/JQm7+IzVriAhleYN47FC1CFeO55/Nl/cfwMJVHxBuypnRF7sltKFOUEaI4lB9
         ucaH5kOkqeq8w1g0PbSN13l8+BmxRCRGAiWaxb9M6yW75ZRruQvaFpSyE6606mZmI6nG
         jP8Q==
X-Gm-Message-State: AA+aEWZH/fcDqiJda3Hdy1anmEJi5awGVvMLB4wW3U7WWhcuNJnmYbhN
        hunvV/BsSPDE6b9yKXqqJB8aNcVV
X-Google-Smtp-Source: AFSGD/URMdeqkA+3isrHc9OKriR2RGaetcXk4piLFPCnXEMPeN2Gj7D7KyE/8RGmMPqjpU4GLaKh1A==
X-Received: by 2002:a1c:9a4c:: with SMTP id c73mr12696981wme.35.1545062211444;
        Mon, 17 Dec 2018 07:56:51 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id z17sm869465wrv.2.2018.12.17.07.56.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Dec 2018 07:56:50 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [PATCH V3 1/6] thermal: split thermal_zone_of_sensor_register{,_param}()
Date:   Mon, 17 Dec 2018 16:56:39 +0100
Message-Id: <20181217155644.29278-2-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181217155644.29278-1-marek.vasut@gmail.com>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut@gmail.com>

Introduce new thermal_zone_of_sensor_register_params() function, which
allows passing struct thermal_zone_params into it and convert original
thermal_zone_of_sensor_register() to call it with params set to NULL.

From: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-pm@vger.kernel.org
Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
---
V2: Add EXPORT_SYMBOL_GPL() to fix build as a module
V3: - Work around the From line and SoB line checkpatch warning
    - Reorder the SoB line at the end
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

