Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD2A43CE6D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2026 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924169; cv=fail; b=eDLw2YEo9PAkNten1wffEyQ0rzo/7p/e/889XRWMPOVSlgPI0/3aDe1Ef/ili5j8PvVesZEJprPx4GJtYDc+ftjK2Vmf5EU1mfkH6wUUUb2iB5ZO43ESVcCQlIMxsi4Bg1BTkxSwrp6TaIeqpGsN6Fl0aWEG90aGssTyThtws0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924169; c=relaxed/simple;
	bh=JO2sxDV6UoVJHc52IAYMwEEClDJdcu4vLYPUonzblHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZnLgjOYxIuXc7LMWjRCFd2jWymRAR+Btd0p9m6AFSoGpylhgWBc4+LRuriMZAbUpfLxsE7FpZr5Vwzv5fgl9WELYHC9+DFnKUFl3/LLkj5xI2Dy/ruaVcjJy9YCmN2WawwU+wa/V3QcOwpiLhF07xHOGZac64e+SZuY24JxSefM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nYgZFEQh; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nYgZFEQh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2KGG/HrtmiT9Ke/3KwgKPVeMxjVB61brkXP7EaDpnsPnqv2kF0pidy5ZsHw213eOPMalbf9WPnfft7ry06J/DIRvYpBTVUAWFM8h6sPu2lMMLE42aAmJsi/N/SrP22e3ex9w78hN3CrIjYIPGFo4sCc3EL7FvnvmAHZt9McR13dp1XPGg7yp6EP1k8OY8q6i6FpLfy9tInvrcivgg7ZBNR517B/0H/PU3tRbSvq8VWKhyg5bJeE2FdPfCVzYa0eM1iuYBMMtJQ31KqBOOPONARf/8pVVbWQDQ/IVaykS+5wp6KT9VIMJLjxp1AnOqEFan2Czs8mPugKD/0Ysmy6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktYUiXQn3G9m6x7K9btwa13WGPCxfSVEwKJicaKOEpk=;
 b=QtUHynyMcDOitGjiZugrIi3hPGZSvi1DJosHX8p4c/fL2okT1ysj7AL7JMkoSUtnNifF7476/kPUYQ0U0YAEpCn9UhA3XcIN0TdCX428IXDwTKx91GFAZKIeOCEHACaiACvbnBAFsQfcrcBO7usPpjk7RnQNz1lpJvgrdgsV2fFNSH/ETMoO0rzeoC9SFLc3G1pjZH481fUI7vRd401y1JegVzqrFMokZV42r6VMznLSE4N3qXmjznq/rrkox35IRv84Wr1M0VVEUnfkVbKtzu8hrGIvO42W1CzTUaN8jCZuu1nKFL6JFZ6PC7HXgdo8mzgYjj3G/zYrQyt1sI/8Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=bp.renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=bp.renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktYUiXQn3G9m6x7K9btwa13WGPCxfSVEwKJicaKOEpk=;
 b=nYgZFEQh+TMvThrct9UnOMKpnnC1KG5qrLCoD3HchUirt/0VAjbtwtJKowp4gSIBr4ntFEq5KRYsiCEr1p8lRfJczvrEFFSnhulviiWhIt2F9eMf7hArhOBfAkSLu6/0UxATVPQt+gQ23rjio0CY+uvBVjr7u096hmz1JPQhG44=
Received: from OS0P286CA0026.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:9d::13)
 by TYCPR01MB11786.jpnprd01.prod.outlook.com (2603:1096:400:3e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 13:35:59 +0000
Received: from OS3PEPF0000003B.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9d:cafe::98) by OS0P286CA0026.outlook.office365.com
 (2603:1096:604:9d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 13:35:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=bp.renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bp.renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of bp.renesas.com
 designates 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003B.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 28 Aug 2026 13:35:59 +0000
Received: from biju-VirtualBox.adwin.renesas.com (nld-5cg2232q0r.diasemi.com [10.24.0.28])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id B8F413000242;
	Fri, 28 Aug 2026 22:35:54 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 3/5] reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
Date: Fri, 28 Aug 2026 14:35:03 +0100
Message-ID: <20260828133509.276281-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828133509.276281-1-biju.das.jz@bp.renesas.com>
References: <20260828133509.276281-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003B:EE_|TYCPR01MB11786:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 78ee3def-55c4-49b2-682d-08df05094bb3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|10067099003|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	Bt1JlKxHX49D3+gnJmzXHtWIhuSEP+qhktcyAkcTUD+Mwlf2srVqBZijrFaLnZph1xOyFxbZRJxINzDDNqZvSBt0ypBwlueuC1XOnZ11sPOoXDzOjoBYHMdbauNtIeS6p2vaYYqTUtV0IU4whRFfIHTstBR/DNKGJE346Sbz68qlBzDKXo2QVYvhUOUtGo5jyeE2jxgUs+ns2styzOlw8I+NJRnGty3i4W6wrPIfT0+Xmd6AsY+wmtD0+lh6AzhbpoYq7auqvlFCUz5fJYEccr/jwtTKYfGfkgPW/rQLotZHURmZ/Ul67Ajy8jgKRLqzlAVSa2UXsGZPBa7WXpBW/ObJkljKJ/4f0aeJsKpRc0lc+HlzCO/6J/G/oxrD8I6jmUzxR0Qcu5dAydcDp5OUyiUnwLPWTQlfhdlHo3ZO2L212uPLpmS17PxKPgxHTmZE5IeJtIjCVziO9ILH46Z06xvKFw7EM9WBQ9fA8YaZmoJRD3KvSdfmaBCFkVWEWnuJf4YyxR8kwOdGmFGaPXwhk7oXeoYSjLhaiuxqX+ay1hEeaTsdIPbhHWGq17RU5MfG6LhoB4ak/SUEH75Q6Bb1fmItQpbxkZROUMPPr+SXM86z3CiOECbsmZ0rHM+zcHNZGucG5Nk6AL5VEuirP2o9RPBl6RSuhXUoWphuUt+Em/VcfKDqEAMpFLBwVJ0BxfiIjhdU/UK7c1xrASQNQYuTzA==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	M0sVUmuvaDt4Dj98Gu9aa03Z5JlLLit398qEMPl+Td7cqnsWVPt7laq5qnIlF0vV1kNfPA4A+18CII0kLu6MxUhQEzCH4kOG406GXn248hgqPxAqDRr9Kb7lGwPKY1jrwiqb7knZnTj0SRgzfE01+/bq5kG7LosnzXF6bazGEmuq3q90VLXOSduPj3e8Xi4aIct3yqwldBZxHy5yR2JvcF++FruHZe3rZM7ywpUkhWHRXwJK/iYLDHPmVArlDiDir99lY1Vae/Jx36gG+HIfx12adD+Jz44+ySA1DJiOe7UnBSkPfE/oOux1K45r5Uw66wdi0iWLjWso+9MdUs5sMtjhsuVyvpKm3UNNxhGOaHnccSGGcdinz1HQt891mYC/02wQNn74VC4gKBls1SubajgZD5ZeAixOUcwVjYJua6jwpNK6xgpq8htR8CxYCFlA
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:35:59.2162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ee3def-55c4-49b2-682d-08df05094bb3
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003B.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11786

Replace the integer flag RZG2L_USBPHY_CTRL_PWRRDY with a structured
rzg2l_usbphy_ctrl_info type to hold per-compatible configuration data.
The new struct currently carries a pwrrdy boolean. The probe function
now retrieves this struct via device_get_match_data() and
conditionally calls rzg2l_usbphy_ctrl_pwrrdy_init() based on the
pwrrdy flag, removing the previous integer cast approach.

This refactoring prepares the driver for RZ/G3L (r9a08g046) support,
which requires a different regulator configuration with two per-port
VBUS regulators.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * No change.
v7->v8:
 * No change.
v6->v7:
 * No change.
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
 * Updated the commit description.
 * Moved the handling of regulator_driver_name to patch #3
   in preparation for id_table match.
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 32 ++++++++++++++-----------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index f90fdb7e6ea4..79503f6f4b23 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -41,6 +41,10 @@ struct rzg2l_usbphy_ctrl_priv {
 	spinlock_t lock;
 };
 
+struct rzg2l_usbphy_ctrl_info {
+	bool pwrrdy;
+};
+
 #define rcdev_to_priv(x)	container_of(x, struct rzg2l_usbphy_ctrl_priv, rcdev)
 
 static int rzg2l_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
@@ -106,14 +110,15 @@ static void rzg2l_usbphy_ctrl_init(struct rzg2l_usbphy_ctrl_priv *priv)
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
-#define RZG2L_USBPHY_CTRL_PWRRDY	1
+static const struct rzg2l_usbphy_ctrl_info rzg2l_info = {};
+
+static const struct rzg2l_usbphy_ctrl_info rzg3s_info = {
+	.pwrrdy = true,
+};
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
-	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
-	{
-		.compatible = "renesas,r9a08g045-usbphy-ctrl",
-		.data = (void *)RZG2L_USBPHY_CTRL_PWRRDY
-	},
+	{ .compatible = "renesas,rzg2l-usbphy-ctrl", .data = &rzg2l_info },
+	{ .compatible = "renesas,r9a08g045-usbphy-ctrl", .data = &rzg3s_info },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
@@ -153,14 +158,9 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
 {
 	struct reg_field field;
 	struct regmap *regmap;
-	const int *data;
 	u32 args[2];
 	int ret;
 
-	data = device_get_match_data(dev);
-	if ((uintptr_t)data != RZG2L_USBPHY_CTRL_PWRRDY)
-		return 0;
-
 	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
 						      "renesas,sysc-pwrrdy",
 						      ARRAY_SIZE(args), args);
@@ -188,6 +188,7 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
 
 static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 {
+	const struct rzg2l_usbphy_ctrl_info *info;
 	struct device *dev = &pdev->dev;
 	struct rzg2l_usbphy_ctrl_priv *priv;
 	struct platform_device *vdev;
@@ -206,9 +207,12 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	error = rzg2l_usbphy_ctrl_pwrrdy_init(dev, priv);
-	if (error)
-		return error;
+	info = device_get_match_data(dev);
+	if (info->pwrrdy) {
+		error = rzg2l_usbphy_ctrl_pwrrdy_init(dev, priv);
+		if (error)
+			return error;
+	}
 
 	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(priv->rstc))
-- 
2.43.0

