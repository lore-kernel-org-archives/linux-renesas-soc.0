Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382F2C43612
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:56:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EFE662133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:56:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dY15H86R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387944AbeLQP4z (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 10:56:55 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35310 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387635AbeLQP4z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 10:56:55 -0500
Received: by mail-wr1-f68.google.com with SMTP id 96so12831693wrb.2;
        Mon, 17 Dec 2018 07:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RgMbdf0OE/Qx1hhsOcMyiHLydPB1qy5mcv/RggX2Jxc=;
        b=dY15H86R6LZdZXh2AO0XXjgI933kLx3HCV7GGn/8mhUek+nVlUXQ9XO/e+n0bT14vA
         ELygpc+L3dsg9Y9ktYeZ3ICaIqi7/iAxGeT4s8Tjx0CSOD7xA25+AdE0GWfhqG7dV/MN
         5Lp5dbSQkbUHUJt8rugU/jsg2nChqc3WEp3MexU1bvOWCc6M6EJVUM4buPvdvqW31nnl
         c9wx/JHOgEn6qVapyOezSv+coPCwgZhc5vF+abkbFiXK7S733XzqdWwtvyqmPFMdQ/gF
         8ehxvdBTwtkBuEjwOfteMZNbCkWd2SIadyTShq2MfADnJNVQWOucc/hsY0h2s+hGtmgP
         /CMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RgMbdf0OE/Qx1hhsOcMyiHLydPB1qy5mcv/RggX2Jxc=;
        b=q+JujyRKTSJLk+qHWVyLLP9o3Aw7zClPg3jMZ+Lf2K6M4D4TxlaZgiR6ZcJIAMJj4c
         K4LhPWXBjnuBxPkXBbGsGp/gMYTGcGtki4oQRaFZtzFpe4nSKh8FgLVi0BsbJWzOBimX
         87+ib8ay/E/B0YrOmHgp+gl6g05o+t2Z135b2nIxJnhVOVQwWbF1VYLX334VYweOrTgg
         cNcs/RAWL6ti4FkWwNLXGzHC1+UYcu5Li2eXM0j2U8r1W+tcGxk+CrwT3iCr/3CizJi3
         nlbFeDSvoOe2EZigtzpIPL697gFvfqKdWU/G+2uP4J90tfq4we5OLz11EXLPk4n+PIx6
         Zlhw==
X-Gm-Message-State: AA+aEWYQ9yKU6ZWgVjPY5c+9kz0n/QhrXwrthHzxZt8yHzkWMNUsm8of
        DkTYAvbUdL0iVXX6ouZ1vIPGuL4g
X-Google-Smtp-Source: AFSGD/UjN44iyfcKrMjml3tlmUPONVlDehBttQ+Gu4zj5vDjmx9wdroX9VX6zdJeC3qxn0KMps+A2w==
X-Received: by 2002:adf:b307:: with SMTP id j7mr12010128wrd.46.1545062212867;
        Mon, 17 Dec 2018 07:56:52 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id z17sm869465wrv.2.2018.12.17.07.56.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Dec 2018 07:56:51 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [PATCH V3 2/6] thermal: split devm_thermal_zone_of_sensor_register{,_param}()
Date:   Mon, 17 Dec 2018 16:56:40 +0100
Message-Id: <20181217155644.29278-3-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181217155644.29278-1-marek.vasut@gmail.com>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut@gmail.com>

Introduce new split:devm_thermal_zone_of_sensor_register_params()
function, which allows passing struct thermal_zone_params into it
and convert original devm_thermal_zone_of_sensor_register() to call
it with params set to NULL.

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

