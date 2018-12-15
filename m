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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023A6C43444
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:30:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A506206C0
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:30:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeqaQkgV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbeLOCa1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 21:30:27 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:32995 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727757AbeLOCa1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 21:30:27 -0500
Received: by mail-wm1-f65.google.com with SMTP id r24so426462wmh.0;
        Fri, 14 Dec 2018 18:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WZyz/Mi3K7VXg98ytLeGLi+HoTbZnk/9YYcnRzNRzqM=;
        b=SeqaQkgVT+GfRBrn/86u/qPkYTOnRya4hMgrZvWbiPkuwUL1DqPvKhDfSVM/lUH1ZC
         RjlkhgCp7cXsdQXD5UXVYL2y55AhVnQovHTFDiTaH2zaDRTXT2RciExSc1F41YFbeoDR
         VJcO55VpVgBi8cnoOic1niSm36ECaqjN8iUbvMt5W1cbULF0oCwC/YlbBOEuJ2pZVxo6
         fv0/z+TmeWJkLci0zOEuTtUtpncukYKcb3NAw06SNT8W9dwVGmMB9Xh1PqCkTNWEzOwk
         78np4RLRdw2H/4RvcnVGPEK7uDTY5sLMRlW+0mbSxIymqAM4iAiYlkWKHqUFuMcuQ8xg
         sH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WZyz/Mi3K7VXg98ytLeGLi+HoTbZnk/9YYcnRzNRzqM=;
        b=J8BIxXJ5sHwtMDNNoSq7V1prDN82sDY5Y5vmkLhGGhHStIVUVxZA6ZiJDD5ZrBmpgD
         yS8/s0Bj0yPch0Gu9MqthIj8dIBf7Nve+MWCpJ+f8hobhklbvZoNPyd9/MT2rtAw3jUn
         TnprTWPM/KT/gGu4MJ2eDT2mS/qzKb+AI5yS47YQYtoNi5JtwGiTv73BfXw0pKLokQFy
         yad0ohS5MOcPc8YQqALs8I9fa8nsDHKaxVsTcAqY5dR/ZiQJfzo62GTAbPLdyDcbQyun
         f/gAmr6eGOzjovnyo5qoThMlKDEAwtfyTS5o+p2dSQ0ofnuo7ElYEpgXkWSlAMXxVPiq
         7svw==
X-Gm-Message-State: AA+aEWY3B7ot4GF4SVXHJ1GeGEU9liFiq7g6WZeo3+brz9bI4rvamqXT
        p1pVZ7I10ZdChxQlm5lKiyojTxnq
X-Google-Smtp-Source: AFSGD/UeKmpp/JARjm++v/3Jz5kRtoPfyAufshn+imHg8jL8/p8Uqz/D197wPA7GWlr9SAEe7tLz/g==
X-Received: by 2002:a1c:d988:: with SMTP id q130mr5139612wmg.41.1544841024280;
        Fri, 14 Dec 2018 18:30:24 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v19sm12151423wrd.46.2018.12.14.18.30.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 18:30:23 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH V2 2/6] thermal: split devm_thermal_zone_of_sensor_register{,_param}()
Date:   Sat, 15 Dec 2018 03:30:06 +0100
Message-Id: <20181215023010.2857-3-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181215023010.2857-1-marek.vasut+renesas@gmail.com>
References: <20181215023010.2857-1-marek.vasut+renesas@gmail.com>
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
V2: Add EXPORT_SYMBOL_GPL() to fix build as a module
---
 drivers/thermal/of-thermal.c | 43 +++++++++++++++++++++++++++++++-----
 include/linux/thermal.h      | 13 +++++++++++
 2 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
index 1fb450d02ab5..e1a303a5698c 100644
--- a/drivers/thermal/of-thermal.c
+++ b/drivers/thermal/of-thermal.c
@@ -638,8 +638,8 @@ static int devm_thermal_zone_of_sensor_match(struct device *dev, void *res,
 }
 
 /**
- * devm_thermal_zone_of_sensor_register - Resource managed version of
- *				thermal_zone_of_sensor_register()
+ * devm_thermal_zone_of_sensor_register_params - Resource managed version of
+ *				thermal_zone_of_sensor_register_params()
  * @dev: a valid struct device pointer of a sensor device. Must contain
  *       a valid .of_node, for the sensor node.
  * @sensor_id: a sensor identifier, in case the sensor IP has more
@@ -647,8 +647,9 @@ static int devm_thermal_zone_of_sensor_match(struct device *dev, void *res,
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
@@ -656,9 +657,10 @@ static int devm_thermal_zone_of_sensor_match(struct device *dev, void *res,
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
 
@@ -667,7 +669,8 @@ struct thermal_zone_device *devm_thermal_zone_of_sensor_register(
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	tzd = thermal_zone_of_sensor_register(dev, sensor_id, data, ops);
+	tzd = thermal_zone_of_sensor_register_params(dev, sensor_id, data,
+						     ops, tzp);
 	if (IS_ERR(tzd)) {
 		devres_free(ptr);
 		return tzd;
@@ -678,6 +681,34 @@ struct thermal_zone_device *devm_thermal_zone_of_sensor_register(
 
 	return tzd;
 }
+EXPORT_SYMBOL_GPL(devm_thermal_zone_of_sensor_register_params);
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

