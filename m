Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82312451998
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2026 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924190; cv=fail; b=bEUNo/puF6dsDYlMFmK0exyHoOImiwX+dCDT+GE6tcndmvRYru4yL2+CTGuEmU4E7NPiqOVVcrO/Nay2wyRIWxx1jEk2YkGrRg6wFLH2l4dHuw4fB9M0oeV9K+IzDrraf0oaE5smrxhSd7VsgFR6r6aNtIpfmsckEx08lF9aj98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924190; c=relaxed/simple;
	bh=dU2MR8/udT6ZqMJ/vCPpI98B6ITNeoWygCvJsDIohDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kHf+3Y4CbpcKpiE+v06fIcvmxrLtmeDC9eZ/5kv7qU94jG/UJMZbOOItmQ8n7wOFhprb6eQTbwsP9ehvQQdX6TJbLRy2NLckiB9eaXedBilG2MXk7mzUmuAffyNHd8UPsO4PsRfEYUW7xZkoZaWyVUyJ4uG/T4YGBnj3XxR2CAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IdpbqYEn; arc=fail smtp.client-ip=40.107.74.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IdpbqYEn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOpJrwoIpX9uKvEaNSzKEh9S3pPgYutfkZFeqU7FFcsRX4iSHwFgbDxAgBrkEp+g+AQsqUCfEOs3jccV3GSO9d1g+4W6ejIKfxbGZ2mmm6Yx3hpzqpwD02DJQZucMZCLCc3NlxMfip34Gc5yvNfsvNYAnXCoJuwAax13OYXG0yljDO298isJ7DEJRJ4kqZBkI+NgdNNl5NQ9u9sVXd1HWrTRHbom7FPqTAW6mNMDqSe6RRYYzrO4N7C9S8njMkaw5irNmWbn0iXb42q6/FeaHFiV31EbhEFGR1FQrOMDdxxY2Rg3RGOtgEYY9JH08fyDICazDlVPMpL7jfMT+dv/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXG1CE9SK30sScl+kr19Ts9ytezT9oPAE9EnbkouyRs=;
 b=Smm2KV9Ex1Pk1GqrIpDJgfheDy6h1PQZ74PXicm6obNq12UyzmOA5zOhBD7pQZmuIGdnZT2gcACGi8qi7+RtTYk08wEZhf9AttNsZFlelPcpBNvuEY10UImS+mlZMRLS82GM7UHbXfsamCkqmzamaPZmGJw9RjdpPbWkamhinYMkGXPWe7nl9bw2OGb2ks64FhNcaqeWQHEHx95aJO/me04yvLe8xD5SlKa8H/BD2oqStld9wmLnwx8t1Xe5lBMyD3pxWOex8+ecgpANT1hhmgeEozK1Sc+G39jFimcsX6kiY1HVJFr6LSNoUK0L6nXug0gd3XnmiJweFWfA5W3QCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=bp.renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=bp.renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXG1CE9SK30sScl+kr19Ts9ytezT9oPAE9EnbkouyRs=;
 b=IdpbqYEnkgcu9s2aSso3Ytt9VIvytxnAdspSXkmGVHBlQsLaZFDhe4VGAtGj4cDcYGWYFe0ruxQHnFS59RnivyLvHMAihfaSq4j3dvXKfj5LcdXTBhOrU2sGSJDzRF9+Z8Y9X5snr402PlCL2dH6RzvotHCLlK3WQnOuraNXImw=
Received: from TYCP286CA0029.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:263::19)
 by TY7PR01MB15702.jpnprd01.prod.outlook.com (2603:1096:405:290::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 13:36:10 +0000
Received: from TY1PEPF0000BAD7.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263:cafe::59) by TYCP286CA0029.outlook.office365.com
 (2603:1096:400:263::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 13:36:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=bp.renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bp.renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of bp.renesas.com
 designates 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD7.mail.protection.outlook.com (10.167.240.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 28 Aug 2026 13:36:10 +0000
Received: from biju-VirtualBox.adwin.renesas.com (nld-5cg2232q0r.diasemi.com [10.24.0.28])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id C036B3000242;
	Fri, 28 Aug 2026 22:36:05 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v9 5/5] regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator support
Date: Fri, 28 Aug 2026 14:35:05 +0100
Message-ID: <20260828133509.276281-6-biju.das.jz@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD7:EE_|TY7PR01MB15702:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: db13aa02-4fdc-47ef-eda7-08df05095293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZMhmNYxLSrNnkMwEVS6ZaN+7btd2AxM+cMkc05bktKsqwJiMjOJmL44aF2zjlUHDBEXVKzHPzI2MQLl9R3GqkbDauQ0ssxldR9zzfRHo++s/B6M/nZBqMS3LrCb7jK3OptKig15cSJlmAdhs25Ex9moexVSH76CbZU2TeArfq6o8Xq3O6D7avy/ZZY8Uq0t6qE9i8YTGRDeTF6jCsEsCS55Pw2V+a2i7069Xt4UudE2RWDlLJCWUnlTx6rXiYsXq1BMXJrietO9YI13Co5Ixfy0EVTuwmAGtY0CdUmdJr90aGMqMgGbCJp/aDzjQpKx1lJLSzTMNRYRbSeK6Q5DuCGuejmjVJpAIasAj0iORWgp4cJ2dD3gMXV5nt7mMJ1tyxI3ArJrqbDAN7kqq0kTlRKthhdCIqOCk2g4gbSmFVfu714bU6PnrbLZKSyAFS5kGC5WFUKercE/5VhLZJvl2GToasRiNm4kL+/DYrnrq5FEYaKagGjRCM03Av21+9pjWluuxMGP8zSN5N3yYvFqS+CDLQIDksRseGAZLo4exN/Ly52UY/RV2UO9/x76taGhRtqiaJ/Q8eKU76Ze6JyBvtAuVB7Kyw1yofCvPq3DMAB+J2qr1DRXSksUeSrzvFWL1BSyKr+7V5z4/SocPAAXdBBdEM3C29xrSZxELlcW6BU4SfYSvUOYB/k7OlMr6mwnaXRecpPDHopTgKG6bwvHecw==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F/L+tB1mNi1CxHOBRUsBfJ6xT1kbh5pk+0n3+4r3bXVheuuT442zy7/da89rymXHFoDIOl819beCGt2PXxgRCMOCtVAm6cti41weIVm2ah3d46MFRIG2TMf0RROvDS+iKW0d0c+Xwl7tXBC9HJxqDkSzkS8WpIB2qlkDOSIIOpJmDuhVg1kIbDY4C6utsVHqIbpGmmWL1zF4cpEVrU3Lp+QnY4jY+FyltSDVewbVLfn2w1ivYisaARj9/eH3jwAUS8F82/RZtB441/xqN+tJDSEp9XhxKQKYvqa7fJVRcx+iygYE/zrn6+JjyckDMsiBaxku/MiHET7GqCiVR7aHQ80+EFp7+KPSAax8h01FPj/t8+eU+tcLOQn5a1vfi57VurFxaolwFfaZh9Pui1Y3sO7jP/r7YmSQp65kNUtWZ0eFp1B4yHBOOuvqkH9jQefy
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:36:10.7667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db13aa02-4fdc-47ef-eda7-08df05095293
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD7.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB15702

Add dual USB VBUS regulator support for the RZ/G3L (r9a08g046) SoC, which
has two OTG controllers (one per port), unlike RZ/G3S which has only one.

Introduce a RZG3L_USB_VBUS_REG macro and a rzg3l_usb_vbus_regulators
array with two descriptors: vbus0 (BIT(0)) and vbus1 (BIT(1)), both
sourced from a regulators sub-node as defined in the binding. Add a
dedicated rzg3l_usb_vbus_regulator_probe() that iterates over the array
and registers both regulators using devm_regulator_register().

Convert the existing platform driver to use an id_table, allowing it to
dispatch to either the RZ/G2L or RZ/G3L probe function based on the
matched platform device name.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * No change.
v7->v8:
 * No change.
v6->v7:
 * No change.
v5->v6:
 * Replaced dev_err->dev_err_probe() in error path of
   rzg3l_usb_vbus_regulator_probe().
 * Retained the tag as the change is trivial.
v4->v5:
 * Collected the tag.
v3->v4:
 * Dropped rzg3l specific platform driver.
 * Dropped the tag as there are new changes.
 * Added id_table handling by introducing a common probe().
v2->v3:
 * No change.
v1->v2:
 * Passing pointer to an array of regulators to make it scalable.
 * Updated commit description.
---
 .../regulator/renesas-usb-vbus-regulator.c    | 73 ++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/regulator/renesas-usb-vbus-regulator.c
index 22fcf0d10c85..050820a30efb 100644
--- a/drivers/regulator/renesas-usb-vbus-regulator.c
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -55,8 +55,79 @@ static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#define RZG3L_USB_VBUS_REG(rname, en_mask)				\
+	{								\
+		.name			= #rname,			\
+		.of_match		= of_match_ptr(#rname),		\
+		.regulators_node	= of_match_ptr("regulators"),	\
+		.type			= REGULATOR_VOLTAGE,		\
+		.owner			= THIS_MODULE,			\
+		.ops			= &rzg2l_usb_vbus_reg_ops,	\
+		.enable_reg		= 0,				\
+		.enable_mask		= (en_mask),			\
+		.enable_is_inverted	= true,				\
+		.fixed_uV		= 5000000,			\
+		.n_voltages		= 1,				\
+	}
+
+static const struct regulator_desc rzg3l_usb_vbus_regulators[] = {
+	RZG3L_USB_VBUS_REG(vbus0, BIT(0)),
+	RZG3L_USB_VBUS_REG(vbus1, BIT(1)),
+};
+
+static int rzg3l_usb_vbus_regulator_probe(struct platform_device *pdev)
+{
+	struct regulator_config config = { };
+	struct device *dev = &pdev->dev;
+	struct regulator_dev *rdev;
+
+	config.dev = pdev->dev.parent;
+	config.regmap = dev_get_regmap(dev->parent, NULL);
+	if (!config.regmap)
+		return dev_err_probe(dev, -ENOENT, "Failed to get regmap\n");
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(rzg3l_usb_vbus_regulators); i++) {
+		rdev = devm_regulator_register(dev, &rzg3l_usb_vbus_regulators[i],
+					       &config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "failed to register %s regulator\n",
+					     rzg3l_usb_vbus_regulators[i].name);
+	}
+
+	return 0;
+}
+
+static int rzg2l_usb_vbus_regulator_common_probe(struct platform_device *pdev)
+{
+	int (*probe_func)(struct platform_device *pdev);
+	const struct platform_device_id *id;
+
+	id = platform_get_device_id(pdev);
+	if (!id)
+		return dev_err_probe(&pdev->dev, -ENODEV, "No ID match found\n");
+
+	probe_func = (int (*)(struct platform_device *))id->driver_data;
+
+	return probe_func(pdev);
+}
+
+static const struct platform_device_id rzg2l_usb_vbus_regulator_ids[] = {
+	{
+		.name = "rzg2l-vbus-regulator",
+		.driver_data = (kernel_ulong_t)rzg2l_usb_vbus_regulator_probe
+	},
+	{
+		.name = "rzg3l-vbus-regulator",
+		.driver_data = (kernel_ulong_t)rzg3l_usb_vbus_regulator_probe
+	},
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, rzg2l_usb_vbus_regulator_ids);
+
 static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
-	.probe = rzg2l_usb_vbus_regulator_probe,
+	.probe = rzg2l_usb_vbus_regulator_common_probe,
+	.id_table = rzg2l_usb_vbus_regulator_ids,
 	.driver	= {
 		.name = "rzg2l-vbus-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-- 
2.43.0

