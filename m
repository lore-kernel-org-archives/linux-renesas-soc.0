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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA40C6783B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:49:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D50D20811
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:49:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbJ5+csH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D50D20811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbeLLBtw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:49:52 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40203 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbeLLBtw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:49:52 -0500
Received: by mail-wm1-f68.google.com with SMTP id q26so4201451wmf.5;
        Tue, 11 Dec 2018 17:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=E5/XHxyZIlHBRuK6HftNxAREyZX/VMjB/BexH0nigiQ=;
        b=UbJ5+csHtJAThvN8iOOaEwtmu9KVltscl11pKG0AY/mMQRnKBNkQZuq1V3t3Vgm7W8
         l4R+iPS/uSDBSFFgUlSWCx6SywdWMnybzw6ZOhtFlL61cRW6zsHwBOI0SpjquN5i5Ccx
         jNLKPvJt9jhnBP1gR22veGCZG1E35xHz7PTOTqUAdr7WG/+nScpP2P5LvVYboupeGowi
         0soDipzDMIwqXKah6YwsJXIuAKRJZk1TVTM0BRzzGIvhuvr6h48NVxQEuBrXstzZf54W
         z+JeeNBI7PqMZYytUvhuKzXQBHGvCqyx9FPkNOHkhJjrsnkAt+NiiU6N7eevuQH349AL
         OqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=E5/XHxyZIlHBRuK6HftNxAREyZX/VMjB/BexH0nigiQ=;
        b=lLFFjBWZL2W/vwYTK//jf/0yH8ocEgPquE2bx6Qv5Dl58Rsgwzy5RMk4ihytTEkFW1
         xu8nySLrHS6yVIS/RjRECpnoDGo5Tpm5bnoZ8LhlRU7PUOJ2fnhg21+WeekXiRnnVSxu
         uB4D05S9VjfLFzVfYFIfNB5h/X0LywPimJs7mPkLNyRYNokBMLOMNps1eNG2AbDwuifi
         zxY9F97llD2fWIFGF6DiVbTnJ5qer7ZBHXSRY3tIddPsoZulIkbWOmFseAxMEvwmJ5oF
         we/YQ1OnBAnwj4CPTH49x7hl3lD4NFbr+Efr7drkE6k21JpOd6C9MOhJlr5Z2QhjNYjy
         IzLA==
X-Gm-Message-State: AA+aEWYoN2tDYN2Q+G8KbiajSnXe648870nGPAmkenYesYqj7lk6FkHD
        qiGwkcTf3ktgW3HoXy5M4/rMztH4
X-Google-Smtp-Source: AFSGD/X7yV3CvHLGHNPlaDBvJ/dXYZ8We0K63s9Yq6QRBx6h+Sbun/dSuUl7Rrj9gvNmyXWcK+7EVg==
X-Received: by 2002:a1c:6e01:: with SMTP id j1mr4360489wmc.103.1544579388717;
        Tue, 11 Dec 2018 17:49:48 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v8sm12887250wrq.53.2018.12.11.17.49.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:49:47 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH 1/6] thermal: split thermal_zone_of_sensor_register{,_param}()
Date:   Wed, 12 Dec 2018 02:49:22 +0100
Message-Id: <20181212014927.25840-2-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
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
 drivers/thermal/of-thermal.c | 50 +++++++++++++++++++++++++++++++++---
 include/linux/thermal.h      | 12 +++++++++
 2 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
index 4bfdb4a1e47d..eb0ef7a21035 100644
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
@@ -533,6 +536,47 @@ thermal_zone_of_sensor_register(struct device *dev, int sensor_id, void *data,
 
 	return tzd;
 }
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

