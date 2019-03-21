Return-Path: <SRS0=/KHX=RY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD451C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 20:48:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F95C218A5
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 20:48:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2rZmBni"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbfCUUsE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Mar 2019 16:48:04 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38170 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbfCUUsE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Mar 2019 16:48:04 -0400
Received: by mail-pf1-f196.google.com with SMTP id 10so5079655pfo.5;
        Thu, 21 Mar 2019 13:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=zJe73aWNwlyl29mj/+BhNg3V5EJRVjNFjRTWme+p9Ls=;
        b=b2rZmBni/2qgIS8htVpQCRNah8p0I0eQlGnN1d0wk8vVGT6IJVov971gM3PTJYbot8
         db/AiVaqRoZm9a7p9a7N9nF5txUbEA8JkL57orQslUBGjNedSA5W35f/K2Lh7ESkZzpD
         F2btvtximXIklW4GWg/9a/qWJUeDIhGhvikuvEiaOnL2Xh8+5LV8k1rxqDX7yjn8pazH
         IjMuy6jmrNJz+ntGvQ1AyKAsvnRnCrdNy6XnOJdlRT2cw0nRlTo8oGGPnLd+fYownIno
         RCdcKWS7qVcDy9hAqMZbt+lEaZQSFoWLcqZUinMXndWKM0XUcQR/iYLvcZ1UMfgD/P6B
         nsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zJe73aWNwlyl29mj/+BhNg3V5EJRVjNFjRTWme+p9Ls=;
        b=K24Xhbo6TzSCeZxA+5FlNXYiaCXttGHofp4KQrz0YZ/MlDFwo5HqlSQabzQfcRIcxY
         W6tTPy0nGtKACUaQ25IaCK5nu4R2UQff2N9LN5F2Vgd200Mcmln8GoqmIC0XUZRvKIHu
         RmvYDDiCcN5jl3bIFUoaMzfkWBTU58jqVVgx+Ab4AWplAsQty4QNufONzATaP7yhtbZM
         4C5xYMqMVFadvEvwLyWeshpEXCl4GP+m0ZIJda7XQa+ZYIoAcB0vQ78ECN/SYuZ41eOo
         BeelbzIF6CvcxY0Shd0YkadRhSi3pYtH0VziLkH3DRB5+DOKBLuoK5CuuYHonu4CkRPv
         VnLA==
X-Gm-Message-State: APjAAAWh1HnZ0s9UJIVXZh7mmswywJL66Jou9fuY3LuwNhduMkHozKhK
        iG3phOKimi5Ubel2u5xbQApNpeh3
X-Google-Smtp-Source: APXvYqwz+jNVH1vtNL5JeITlSp57mxt2+qXjiLeP268wkr7pYsD4cOD0xFlm99a/smT44qyTyyQQmA==
X-Received: by 2002:a17:902:3f83:: with SMTP id a3mr5350015pld.6.1553201282392;
        Thu, 21 Mar 2019 13:48:02 -0700 (PDT)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id b8sm6383851pgq.33.2019.03.21.13.48.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 21 Mar 2019 13:48:01 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH/RFT] thermal: rcar_gen3_thermal: Update calculation formula due to HW evaluation
Date:   Fri, 22 Mar 2019 05:47:53 +0900
Message-Id: <1553201273-16757-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Dien Pham <dien.pham.ry@renesas.com>

1/ As evaluation of hardware team, temperature calculation formula
 of M3-W is difference from all other SoCs as below:
 - M3-W: Tj_1: 116 (so Tj_1 - Tj_3 = 157)
 - Others: Tj_1: 126 (so Tj_1 - Tj_3 = 167)

2/ Update the formula to calculate CTEMP:
  Currently, the CTEMP is average of val1 (is calculated by
  formula 1) and val2 (is calculated by formula 2). But,
  as description in HWM (chapter 10A.3.1.1 Setting of Normal Mode)

  If (STEMP < Tj_T) CTEMP value should be val1.
  If (STEMP > Tj_T) CTEMP value should be val2.

3/ Update the formula to calculate temperature:
  Currently, current TEMP is calculated as
  average of val1 (is calculated by formula 1)
  and val2 (is calculated by formula 2). But,
  as description in HWM (chapter 10A.3.1.2 Normal Mode.)

  If (TEMP_CODE < THCODE2[11:0]) CTEMP value should be val1.
  If (TEMP_CODE > THCODE2[11:0]) CTEMP value should be val2.

Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
[ykaneko0929@gmail.com: use the data field of the of_device_id for Tj_1]
[ykaneko0929@gmail.com: revise a description of case 1 of the commit log]
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 drivers/thermal/rcar_gen3_thermal.c | 86 +++++++++++++++++++++++++------------
 1 file changed, 58 insertions(+), 28 deletions(-)

This patch is based on the master branch of Linus Torvalds's linux tree.

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 88fa41c..de6f244 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -63,6 +63,15 @@
 
 #define TSC_MAX_NUM	3
 
+static int tj_2;
+
+/* default THCODE values if FUSEs are missing */
+static int thcode[TSC_MAX_NUM][3] = {
+	{ 3397, 2800, 2221 },
+	{ 3393, 2795, 2216 },
+	{ 3389, 2805, 2237 },
+};
+
 /* Structure for thermal temperature calculation */
 struct equation_coefs {
 	int a1;
@@ -77,6 +86,7 @@ struct rcar_gen3_thermal_tsc {
 	struct equation_coefs coef;
 	int low;
 	int high;
+	int id; /* thermal channel id */
 };
 
 struct rcar_gen3_thermal_priv {
@@ -124,30 +134,29 @@ static inline void rcar_gen3_thermal_write(struct rcar_gen3_thermal_tsc *tsc,
 #define RCAR3_THERMAL_GRAN 500 /* mili Celsius */
 
 /* no idea where these constants come from */
-#define TJ_1 116
-#define TJ_3 -41
+#define TJ_2 (INT_FIXPT(tj_2))	/* Tj_T */
+#define TJ_3 -41		/* Tj_L */
 
 static void rcar_gen3_thermal_calc_coefs(struct equation_coefs *coef,
-					 int *ptat, int *thcode)
+					 int *ptat, int *thcode,
+					 unsigned int ths_tj_1)
 {
-	int tj_2;
-
 	/* TODO: Find documentation and document constant calculation formula */
 
 	/*
 	 * Division is not scaled in BSP and if scaled it might overflow
 	 * the dividend (4095 * 4095 << 14 > INT_MAX) so keep it unscaled
 	 */
-	tj_2 = (FIXPT_INT((ptat[1] - ptat[2]) * 157)
-		/ (ptat[0] - ptat[2])) - FIXPT_INT(41);
+	tj_2 = (FIXPT_INT((ptat[1] - ptat[2]) * (ths_tj_1 - TJ_3))
+		/ (ptat[0] - ptat[2])) + FIXPT_INT(TJ_3);
 
 	coef->a1 = FIXPT_DIV(FIXPT_INT(thcode[1] - thcode[2]),
 			     tj_2 - FIXPT_INT(TJ_3));
 	coef->b1 = FIXPT_INT(thcode[2]) - coef->a1 * TJ_3;
 
 	coef->a2 = FIXPT_DIV(FIXPT_INT(thcode[1] - thcode[0]),
-			     tj_2 - FIXPT_INT(TJ_1));
-	coef->b2 = FIXPT_INT(thcode[0]) - coef->a2 * TJ_1;
+			     tj_2 - FIXPT_INT(ths_tj_1));
+	coef->b2 = FIXPT_INT(thcode[0]) - coef->a2 * ths_tj_1;
 }
 
 static int rcar_gen3_thermal_round(int temp)
@@ -163,15 +172,19 @@ static int rcar_gen3_thermal_round(int temp)
 static int rcar_gen3_thermal_get_temp(void *devdata, int *temp)
 {
 	struct rcar_gen3_thermal_tsc *tsc = devdata;
-	int mcelsius, val1, val2;
+	int mcelsius, val;
 	u32 reg;
 
 	/* Read register and convert to mili Celsius */
 	reg = rcar_gen3_thermal_read(tsc, REG_GEN3_TEMP) & CTEMP_MASK;
 
-	val1 = FIXPT_DIV(FIXPT_INT(reg) - tsc->coef.b1, tsc->coef.a1);
-	val2 = FIXPT_DIV(FIXPT_INT(reg) - tsc->coef.b2, tsc->coef.a2);
-	mcelsius = FIXPT_TO_MCELSIUS((val1 + val2) / 2);
+	if (reg <= thcode[tsc->id][1])
+		val = FIXPT_DIV(FIXPT_INT(reg) - tsc->coef.b1,
+				tsc->coef.a1);
+	else
+		val = FIXPT_DIV(FIXPT_INT(reg) - tsc->coef.b2,
+				tsc->coef.a2);
+	mcelsius = FIXPT_TO_MCELSIUS(val);
 
 	/* Make sure we are inside specifications */
 	if ((mcelsius < MCELSIUS(-40)) || (mcelsius > MCELSIUS(125)))
@@ -186,13 +199,15 @@ static int rcar_gen3_thermal_get_temp(void *devdata, int *temp)
 static int rcar_gen3_thermal_mcelsius_to_temp(struct rcar_gen3_thermal_tsc *tsc,
 					      int mcelsius)
 {
-	int celsius, val1, val2;
+	int celsius, val;
 
 	celsius = DIV_ROUND_CLOSEST(mcelsius, 1000);
-	val1 = celsius * tsc->coef.a1 + tsc->coef.b1;
-	val2 = celsius * tsc->coef.a2 + tsc->coef.b2;
+	if (celsius <= TJ_2)
+		val = celsius * tsc->coef.a1 + tsc->coef.b1;
+	else
+		val = celsius * tsc->coef.a2 + tsc->coef.b2;
 
-	return INT_FIXPT((val1 + val2) / 2);
+	return INT_FIXPT(val);
 }
 
 static int rcar_gen3_thermal_set_trips(void *devdata, int low, int high)
@@ -318,12 +333,29 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
 	usleep_range(1000, 2000);
 }
 
+static const unsigned int rcar_gen3_ths_tj_1 = 126;
+static const unsigned int rcar_gen3_ths_tj_1_m3_w = 116;
 static const struct of_device_id rcar_gen3_thermal_dt_ids[] = {
-	{ .compatible = "renesas,r8a774a1-thermal", },
-	{ .compatible = "renesas,r8a7795-thermal", },
-	{ .compatible = "renesas,r8a7796-thermal", },
-	{ .compatible = "renesas,r8a77965-thermal", },
-	{ .compatible = "renesas,r8a77980-thermal", },
+	{
+		.compatible = "renesas,r8a774a1-thermal",
+		.data = &rcar_gen3_ths_tj_1_m3_w,
+	},
+	{
+		.compatible = "renesas,r8a7795-thermal",
+		.data = &rcar_gen3_ths_tj_1,
+	},
+	{
+		.compatible = "renesas,r8a7796-thermal",
+		.data = &rcar_gen3_ths_tj_1_m3_w,
+	},
+	{
+		.compatible = "renesas,r8a77965-thermal",
+		.data = &rcar_gen3_ths_tj_1,
+	},
+	{
+		.compatible = "renesas,r8a77980-thermal",
+		.data = &rcar_gen3_ths_tj_1,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, rcar_gen3_thermal_dt_ids);
@@ -349,6 +381,7 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 {
 	struct rcar_gen3_thermal_priv *priv;
 	struct device *dev = &pdev->dev;
+	const unsigned int *rcar_gen3_ths_tj_1 = of_device_get_match_data(dev);
 	struct resource *res;
 	struct thermal_zone_device *zone;
 	int ret, irq, i;
@@ -357,11 +390,6 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	/* default values if FUSEs are missing */
 	/* TODO: Read values from hardware on supported platforms */
 	int ptat[3] = { 2631, 1509, 435 };
-	int thcode[TSC_MAX_NUM][3] = {
-		{ 3397, 2800, 2221 },
-		{ 3393, 2795, 2216 },
-		{ 3389, 2805, 2237 },
-	};
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -418,11 +446,13 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 			ret = PTR_ERR(tsc->base);
 			goto error_unregister;
 		}
+		tsc->id = i;
 
 		priv->tscs[i] = tsc;
 
 		priv->thermal_init(tsc);
-		rcar_gen3_thermal_calc_coefs(&tsc->coef, ptat, thcode[i]);
+		rcar_gen3_thermal_calc_coefs(&tsc->coef, ptat, thcode[i],
+					     *rcar_gen3_ths_tj_1);
 
 		zone = devm_thermal_zone_of_sensor_register(dev, i, tsc,
 							    &rcar_gen3_tz_of_ops);
-- 
1.9.1

