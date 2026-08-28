Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC6438AC8A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2026 13:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922277; cv=fail; b=MC6BcmHxwKRMYxxsVJMcONuHBMZLzQCWDSZVwohYD6my6gZmMe9nT0GwPcrqba1d8BU0eBMyBqyl5o/Y8CXSzkD0H/+EqEjKHNDfv5lLjbwGyoAJwUFjpvZQaU0BmF4JWHhBbWbikHsLmw8+suMiHZyjJ1tmvJv3+vuRZRn4s1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922277; c=relaxed/simple;
	bh=JO2sxDV6UoVJHc52IAYMwEEClDJdcu4vLYPUonzblHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qIfnWtynNHNVEtYg3a9vih/CAdvV5p7j9xl5WXY8gRm76+vXY51EWgttQWWofiGPzfF/MF8SO8Gk03Y4ZckMw1xirZY2FRlexmCVJ3eHAuQyzGrmlwgLrnLGhP2QQec52v1bmeUYqcqkfTd+ckbnxaLS+ChKq9GFjqVlD7mPctI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JR1TvZL7; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JR1TvZL7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJ/g6iQ0hB79xpb2kd7S5cGUw8cEjuL/YCXeE9KHA7gXdppJLsYXOCb2Zxft87exBsQRfA7m4ReGdksljRMVOezQWwGg2yq4QWLMkqgc42WfDWC/tjU9OMqGLEQGVbVeugF1rNxGYEQfJb6cc7558qTGTokxVs5ctpyoLoJ95MLbAAQgjEQqstQ6xvWOjWOEcDwpcLbU/Cyo8XIz2RFwRbQYushLGnElsscya8DLcuToSgJW3w6B6ugi/tdoG0AFPhD7HDbFsbw0mU3rv+85vfzTi74rgCaFwVi1p84CmsUrjOG/gT/Cl5jHgVoUgXYbb7k/8dhzU4N/O1uidxoLOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktYUiXQn3G9m6x7K9btwa13WGPCxfSVEwKJicaKOEpk=;
 b=pgcZ4ZntfXSVbWXCOsluLt0w5jt6j+ch0PwtnL5iX8n1iNTshIUESc8T09mBhko50W0rAcenrpc1sgYwqqRwFKKtOlffPVIWfgMup24Dp2UQi+0k7eaabLmGcv3wbjolD206DuXnonuSKgQoqyhVZhWb2Aix0C/5TyMY/zwBgIzFPK5aDQ2/bdZKY2hSl926jHTYV7ajAkh5PAmn6VbcLrad83UGQqOoYulurtbA1t4uQVN/x5X6CYwNCAGuJgUoZ9OzSZDPFVFymOah9wKi7WfFVRvfbDdieqZAgPaDjaoKwJafgT3MJO54CHwMYQVOLNN5G/fIfewMeAX12GLrnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktYUiXQn3G9m6x7K9btwa13WGPCxfSVEwKJicaKOEpk=;
 b=JR1TvZL7JyaF5E/6BOxhgobdO3iH5JOxeU/OSnjb5VwhfkFstV/EheaJoB4EhgD8WyRsaoeeeMa3jrAfgeN4c2Ydg9+uGrrxhb2r+9DbsOAn9Ryt/QbR6W4Okenp6UJ6wrx5LWvLnDgIZTr3SzJhtP0JIOyH30WGmvhk1QUL6uQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB13935.jpnprd01.prod.outlook.com (2603:1096:604:369::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 13:04:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 13:04:34 +0000
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
Date: Fri, 28 Aug 2026 14:01:53 +0100
Message-ID: <20260828130202.275826-4-biju.das.jz@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: a40c3d13-1e5a-48fc-92a2-08df0504e739
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VeQpgLVV6jpl3nmrY69DqOtN+LV/Y8A1eUrMRL4q400qjnKa3qCG242RLisGkP9s5Nid5Q7f9Ma5Qj/cMj2M2Ujzhtf6zCkHT0BXsVKgEGHKc0PJot+G67Ss7tG2xCabWJUGqrYkkswbzOtPOuQLhyCW0IDmEdf/xQHOXXEgV2sk+inGVqGItoEBX7F7i0D5ALkTShYmPFgn9APkZ+p5PgfO4mVbv4cCOUKlj/RuCP5WZM14gg5TCtR13i5cqSyT2Re1kZviBGzQUS75b339jrkx4xRZRi7kyrFt7rz7+tFmcr66eIdCADKWvM6Bs5Bdt52NXNl0/WYNeJ6Igb6TjE6xT9VgiOv0YMSPzHq3cabkZ/SNAOXDSansE177XYziq0w1b9ChpJ6luOWnKbU2WOPt2K7kvg0p6yahTz+xZbK2+y/dOgIhUawBud97+FtqlJ0nTQ2hUOHx4fahIjHr5zmFRbonFNifsHcpryPQZJxhB00ztEfG9V8R+gbc2oeGX8II1DK6Nj2BJU3zh6dSywb3e8GuCo8ztvahf9GSsMTOOCDB9HwRBJ/lkfWa4Fcvjz/I/vYFK0jmXYOrxwRAUP2OVlqYc9P5wJpCW2v9gXcqduQEeVmPLG0GqR0te+LpskFn7tI2LZlWCJS78BRQyyJQ+KTnwfKGKtS0sMCoT2j3F47khVQ6hUcQBg3VMuAsu8lmrf8ipQV55eYJKcN05uTF3ZSTut7W/GCQgL0Zcig=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1bRG9e+BrWaslr5/93BXAQI0ga9yjyKT2tX5DkgVfCO6GAi6pdJ8asZG+91X?=
 =?us-ascii?Q?7DGIsM7F487RwAkuf6odTNdZ5kIprdczXOeZayj8YbVBQcYFa7mUduFrhBbE?=
 =?us-ascii?Q?Gu6pV9VJUGLoBahND8wS7C23+ddjoiE7J8B+yBf5UxFSD9Li5ViE9hkLhDOY?=
 =?us-ascii?Q?D8SJRYGDiB0NZT35GN/foG/ha+mOuXcA9cxrsthy/pU2dxE5rDwOjc9mAkBU?=
 =?us-ascii?Q?ziQtBPv4sR6Xo/0LQ/mMcfPe5lWqHW0euG2IinhSw6YHbyRCdlHbVOJN2PNF?=
 =?us-ascii?Q?FF9jan0TPNHVg2C2YfLpgSb1B5VAu0iGyClYeU9/SszGNeTOHdxOOtOtAb6e?=
 =?us-ascii?Q?JuIQDfpag9VmzoOPLUpwq7EvdJWTIBuFxDkRNQ0bxmOJl5UO/ETgK7c0dj7c?=
 =?us-ascii?Q?X8bOok9j9gWp3x7mRk1T4OO5dEvucg+hnUGrpspja7MwlNDXIg/J2HLdrRoj?=
 =?us-ascii?Q?RmEl9173IAIaT8x+kWfLB/+elUdKtfqs7eQfu9CxOF3LVopLe1vZThM7+QJT?=
 =?us-ascii?Q?YHxbjJdqfeJUkEWVQ66E/zhx1fVPCXVkTfQpBk7fH5ZnXVPh/2WgPnkty6Ex?=
 =?us-ascii?Q?bpA2J6ClQfmpOioNsfwFrYDwkh+OI+vWqs5kyZo069wIAsmfVXpjWLWd4klR?=
 =?us-ascii?Q?PtMUj8LEjN0jqIg+sjseFYY8O91BaZ+RULdj4/xh7+G0K2Q3M42gl0ZbfywS?=
 =?us-ascii?Q?eIAAXfUbEh/pVxmqm3vTyzFceCHb2xTnWEu6MWRGt/ZwcMSiOPJb9V2eY0DX?=
 =?us-ascii?Q?KEtNeZTHHU1BJ+mQLdwY79+PrVy/u8sZUug3eNPImm3RB4qQRaN1gRN0FUqM?=
 =?us-ascii?Q?hc3zL39U0ZPQ6aHpinJS4CjG1FsH3InfL9ambLycQaA+rQH8vF4H6YSJQ46V?=
 =?us-ascii?Q?i+wUOrQXpcu+9R0yIr5PGcZh2zQhvP8ZF9jsyus51XShwy3ENvsmPLeWN3H+?=
 =?us-ascii?Q?v9Ee4I5g/JJTthDw5stdSn2KOSStCSS9Pw+MNwodbzmpHI4TD3XvsJWREeMK?=
 =?us-ascii?Q?+VCvmRZOMCMIfsMv5GRgjwjUBAqMEhl1vqQaz1+X2+8Z59sTcsmI9H8rz7Q6?=
 =?us-ascii?Q?pMAjgN5OQExPdK808jaIteYxC089JUQ0MUiyJADqYUFT7ePCL6mHzVDqPYjF?=
 =?us-ascii?Q?LVzdUH7wtG0OXOEbqZyOdLTkoCv2lV8Fw7m48qXTWICERc8ubybwG1EhPX1D?=
 =?us-ascii?Q?xkuEaXMudgThrrqjeBmIZFGDqstCC8Xq3y+pTSedxs/tz4evoih8fK3M0LEZ?=
 =?us-ascii?Q?vOAjvFp+MYu9J9cKmObyOlcIKVgo8pbuSIsYDsKOIq2ceQDCLAe11ffpBlQ8?=
 =?us-ascii?Q?AAUo8500Fq7mWpYU9VcTMd0btAnLRcjmeMXLrpSjCMIecU8dwagP9ofMxPo7?=
 =?us-ascii?Q?TSA71EwYzdNnzjLMK33mb2yZs8uuDEkOqt9BqZZYYGJZEu6pwva1jDQ7EZNI?=
 =?us-ascii?Q?m8/TpcqPRkfIkVvXhpsmRrrbfCrhg2w+9IOfWmoXsi5Uk/0xUs+IErErsNAJ?=
 =?us-ascii?Q?jD1QaB3iiRZIfxvN+6/0C/03DYBK0860I/uOBjHUDvmZCV0tcac+F2VE6iVf?=
 =?us-ascii?Q?FBlvx7NBIz2HF7HbHlBINZBuB3MGmOkOXjd846QMgIIdNj6uaafKqN12d4bR?=
 =?us-ascii?Q?iu2AoIgQ/q8vVvAUSw75KZVH0xrxlkx80m8QsDzu6Shvh2yjI2K2Rl+m0TXS?=
 =?us-ascii?Q?n/nHwCaDyTHfW9eOQlpeDPLW8rtxIA0MT2fWSELoP9fHnAdNEN3ykVhfxet+?=
 =?us-ascii?Q?8sS1y8dDldBgiHMZv7xluYrDkVDI4Gw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a40c3d13-1e5a-48fc-92a2-08df0504e739
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:04:33.9982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ezwd5D+R9cf+w4YpMcOwt1IOKqb4pnTeni1B8r1aRcGt5NyEe0X0+2BH5e0+NJpmwYVkuzt6O1yAfOzTv5lgIw9LDY+j+jz3ttaySyQ5h8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13935

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

