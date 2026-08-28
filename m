Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9D4221F39
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2026 13:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922292; cv=fail; b=QwTZrQkuZ60ymte2ZShcfzNkbtpWKHgeIfJ2mZdAWV++c8P0YihPJdHnmuW38lMLvxv5B8o8LkBC5zCpEn48uwYv4GL3RrLQja1YzHI0aAKTTzodj83WZsblTclo+hhlgt5zy4kt9u8usRDTiLZ8zxzY5TMCwOIio8WlrDOyK6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922292; c=relaxed/simple;
	bh=dU2MR8/udT6ZqMJ/vCPpI98B6ITNeoWygCvJsDIohDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=re+vvODFIPbioy126fFUTVaudYHrEHBf7/0M/0lPl8ZoTK+dm8ExWH9kPAiTC8se9JNHLiMMVBo58Hd3RTnF4x6Qi9ZbmyLxoyc+aI+br6aPSDp10gO4SThArGMCQ/9i5sACYv6JUZPxGA/0azDsaD7IVjyv2dPuHK1qc4sjRIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=eSYL/fco; arc=fail smtp.client-ip=52.101.125.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="eSYL/fco"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rz7Dpiiq63VNxyids5Cbr6gXxvb+1i8x5bV35pHf6AGtlzKAHZP3spRWugYe2c64F7TE40f9xYPQIPVkYJC3kygrNlMCOFK9N3DfqG2W6C5UTFilCN/ayYyjRjsbTTMFskGxH7xzCOT/vcrcCADKT0pTBWtaJfxpVXkmVAVm6DugSM45+ciNSpXJKN2UBeoa/3HRSP8LZWDlyrd/Oa5fMzP3gv0GI3fwQEREGzgzsnsFnFVYYPW5RG8xddLTcOcqA4XBcIu/6fT6cowxYPQHL3NSQgc+nuxmPP/BGN00XuLweBJ/AlHxry1bFs1Et9dQEaxKOVt4WiIOmQuDy/A0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXG1CE9SK30sScl+kr19Ts9ytezT9oPAE9EnbkouyRs=;
 b=o/rGvEH+NgVTygtnuc0/zO9iW/TDyU4HMBgQsYXB2rxwRK5j7xRrkYmdInvzOPM1X/1/C8X7BOSV9NGTGmkhUYKcxueKOCp7UShDA/7yagw+b7AF77jAbIUrMHZW5X2FCnQ4bmVW73vcZAOsuQA8x2vPs/IXaWHtzP8gKnxKSa2PXqdH+P08lj5IXkZ2g84g8INaotY07bPWHUUzJcEA0eMAqgLhM/NKxfCzts+7h6xt5Jr5xnz4MVXtlNmPTkQQUUI10SPT/ErReGyDgRjvIiwYW/kcoJo3xquVlxlvfc4ZdfhDLcCqB6yR28WHey2sGYoqXPddECFmxRDuAq+XlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXG1CE9SK30sScl+kr19Ts9ytezT9oPAE9EnbkouyRs=;
 b=eSYL/fcoYmsgW7zqyTtGK1/ZGY88WZNKYI8GsFNWSB4p7wKHUufbyOFSiMTnm9+XxthdoE7/G6ZjhqY9pQ393qksujY4d0plVGBZh4nj18cQZT+ruhDXlCL+CnguY+U4P3xQ6ehQXysEWgcf+J6Jrb+VzBUHdkH6yZ4MlXluqX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB13935.jpnprd01.prod.outlook.com (2603:1096:604:369::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 13:04:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 13:04:48 +0000
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
Date: Fri, 28 Aug 2026 14:01:55 +0100
Message-ID: <20260828130202.275826-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828130202.275826-1-biju.das.jz@bp.renesas.com>
References: <20260828130202.275826-1-biju.das.jz@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::15) To TY3PR01MB11346.jpnprd01.prod.outlook.com
 (2603:1096:400:3d0::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11346:EE_|OS7PR01MB13935:EE_
X-MS-Office365-Filtering-Correlation-Id: f845c724-c8f2-476b-a6f4-08df0504f09c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	w8JFEA0NL6umy7Msve97WldK+Egu6z8h4NsYnOqLR4+Viw3/SdSq0ZpGU8Skmz/nsxa/c1j+H+lfBFcz04G6sG5kbecIkm2rcmJgshZJYc4MmGIRr8xoo+FYqTToqTaw8h+UYoBlXAlCA31heav0fyI/HjfEV+eJUP4Zpablrt5TzabvgaCZBuUrDsoA/YtiCfUii0z/XJ+ghvWgpOc5qf2KGZ3zXWmEJLcXxBwFvfjU8siM9LyJm9cYeZ9aR2zIYxEi86KguajvrTMf5I37iucVZhQyR/ZEy/m9y3AXPdKPfKGEQJsgbC1U/DvsVc4qF3iVUe6lxLCDiHQtyS5H86OGN9sTys0ITzYXD+5gW7OGfb6UqY1l59KB+EyeraaHryAeTyW8+N+aHKfr1HwQcyxYPUDB+KkJ7/7AYqVburKLNA/7p2TStkruwqedDPAfiHU/TXczDDq3f8TFo9m/s6k+BmFR7UOGENfVEeYh2MZ+2MRS3+m2ihi1V9R50KAROeul3ovJWNVNsspEh+icHW2RLEijgr887N+Vngj5rx31cNgMHUZPg4S3gxJ9ryApojQn5Xcc2Ugzn+cZGY2x6Mri3RX9TKl4SAJVQUt1V06MphBk7Qhpm1hFSxT8PTgxm/GFNomcQfAfgQdqVHin/Wb6nMrSd5xgqvEALNxY06H0tdaEIJTfN3CHsGin5fTzqePUCriW93RfE6+pd26uOJD06sf67nM3Sl7my4NwzB8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5jmPGS4ttaVLWPlK9Dz2WQHX1zaBn3NJzvr9AWFDcWukZ57jEtG4WqXcGZJv?=
 =?us-ascii?Q?M4YYW43EWa2jgHjGtWZOohaymYoCfh/yyl3TO6b6BN9Vg6zjKEV07l/xVQ4J?=
 =?us-ascii?Q?nQsdUlhreFa1V322H1JC70PySFaPb9Ne8uEwh2NfJiQ1YqswmY2zQIYj/hYR?=
 =?us-ascii?Q?SLcE8e/TGmjdY7LnM+DwTccT5NzCeq4Idl4mXgpmFKIZXq/B22dxxJtyV4qL?=
 =?us-ascii?Q?2C/dB9dVzcz48uvYKp9jJjmPeTdFY0T0iuE3K219D/E9xIbdzPTcY1qKq1Am?=
 =?us-ascii?Q?h2m0AH3r58Vj5NzBD/nVDDweH6pg6T3tqhj6PbCacmelW9MitfBd8Cnk/Gb0?=
 =?us-ascii?Q?h02qHB7OJGrRbW+MdpY2gzLpsGk9xRwUWGfZSKmKQWAJ+dPkdOP7yT/ry+Vo?=
 =?us-ascii?Q?pi54AaJilf00tFdEZ7BIcTqds5L8JUkTstWbWZwy0OHAKVTnywqOVnSnP2Y6?=
 =?us-ascii?Q?8kxF6wrm+jA10zzEBWnO56qY/NbHKesEb+qRm3IXZjwF+A6M9i9KKdZLvgT/?=
 =?us-ascii?Q?1e/niNRBodz4ib29EtbdfW1PeUqCu1F4SurpZ1+9H9/NZic8eRzALq9IXeSq?=
 =?us-ascii?Q?4Rzet3Yd+q8PXQuNBw3wqa0Ts+E0m+0feFTejTEDiTrVmkhmbgSlUHpnPFv2?=
 =?us-ascii?Q?zk+dir/kwMAGsI/Sbx3Cn437PKPWykRVVNtcMxKaHX8xxQJQiLAo2zybuImK?=
 =?us-ascii?Q?pf158/ezl7wO7KSSZhJgiFqiNFeRgkHQGHzrsE1Uvrij9VwbW8jBul1U7otr?=
 =?us-ascii?Q?GNgZufEzHM3y+kXat9wTesViy8Rm2C0FlZmsk+6O4P5wJbLn6PWpg7DvGXvu?=
 =?us-ascii?Q?YndWFgqCmFTuhYFU/r725y3VDXnl4UEWKOl7QES8N/Ncpn7fwLziZNKUH0d4?=
 =?us-ascii?Q?QCfRsKXVBKiiOla4nda1qkxclhFH15a9EcpxvwumRNhkGb8e/5hOVF+6ra85?=
 =?us-ascii?Q?bXVOGWPFr6UFR5W9yC2ieXUfHxW56fiWjLXfjZdyXXJm9/069IwlwLDjKTnY?=
 =?us-ascii?Q?kYEDzSpnsqH8XPkSMr1H2T9qRcTzNsyfrYqgHgQhx92rAOHcst5mo4zlYTIb?=
 =?us-ascii?Q?gh+FP3kVG0+iDDnYiiZRrsvoBypnzCGNToi+rLfSUIZYVxOBWt6LULsEmvrl?=
 =?us-ascii?Q?QXc8l36OK7pvLt8miu04nDz85YnDKMHfkAQ9bkgh+plohpOAnDV7XJzXDS+d?=
 =?us-ascii?Q?QcAixtmV1FMdQJrc16J4bp5gZzCujq87Wlm+Ug85ZIs68V83f6/2Mawryx7y?=
 =?us-ascii?Q?MjYdH8x1cRRtQsmKNSZZPbdMHEvGTz+OL3l4j/PySZctsugKjRiqeFHM1spB?=
 =?us-ascii?Q?xxB2g9eQzxpkRmDlJqba+HPu2R6PRbYHmVZuWlTq7YHdO6+fha2fhK5YxBWw?=
 =?us-ascii?Q?neHNTdvNxR/JGixMcg09nCnh1rI/yMUpdix+npOmH0XMuxc8FeB1KtU+cQYL?=
 =?us-ascii?Q?sEjBZDAu/WHZ9Xw7484aEBeJQYpefKqRSTdAGufPZ0/GZgvoLzgrYEAf0uQH?=
 =?us-ascii?Q?hTF92YJ5Rp6gO3PSD2NGt2PnNT/eCM7Zvzj9G2PPPHZwWdvxCg+8xm4e/oYC?=
 =?us-ascii?Q?NKrRGdxfFd8SDaFvCWHdusyEGxnTUx0SRSXr7l/Aaz6OozQ3zJ9n+0nwRkTw?=
 =?us-ascii?Q?X9+5QDqiLlnLK+h5fUCYcmftQiXCnM/IS3OkpCwh0IipDIgSlgfr8Nog4Mx2?=
 =?us-ascii?Q?zNdgVLpAhD6FHE1+I5rEdYhgFkdDcX4L81YFuJI4QJ9BXzgf0NW7LxucGrsE?=
 =?us-ascii?Q?1p4vK3Pwc+MgrJL0KXt9aqfYKnHbWn4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f845c724-c8f2-476b-a6f4-08df0504f09c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:04:48.6998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lgp30ymDz4yVikxwAB7uwXXgkBVryhKKHy9XOiz/jGzl4aEZkEETCamvgJLrY0yG4r/iadcljzSbyyKK71qHIwnKeqqBCXSAT4iC5F7uCF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13935

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

