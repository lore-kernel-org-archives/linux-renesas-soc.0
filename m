Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E43413776B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2026 13:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922285; cv=fail; b=qYuLegYqwZ9cr8Q5n3aNXq0hnjAbn9de8k3RGICq77XoSqbOE7eUKiFqY0M+9aPeHMI7wf+Q+UIjtu5JoSpTq9lpD9mFnF0EBFRYW5grgIibazFtf2iEPmh+bUMyCZYAMqFSlxxIfWqyAw+MgufwLtNXQOJo8w9GFgsSFcG1P+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922285; c=relaxed/simple;
	bh=Bh/EumdXxaVhAns3FEXuz4XHs+nrQlwFx24R1ZL6Z90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AA1DGgOCbgfMJyDDhrfD68WMdoCW1wHRiaWPVY9JKGmrJe0JsiOhJxE9id2HKpCr/r1t4UFZjgxMLAzhNoFMMo9iXdv0sIpYYwViR4M9vVEvakJYUHxCG8Fg1Ditu7fUA/IATW9AFY/c2G2JDeV3ExtJXCoucTxcccPOV/SBXAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FiBNF04V; arc=fail smtp.client-ip=52.101.125.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FiBNF04V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxYbuOegoAxG9wtd1zBm9RxaVEEps7DlPKoQABVQnbredY0024Aj1GXb9zVMCJyeqTPveoVKwAH/ZY8A4CYK2BnJ3rNSj3jYsFTGF0hl/8OGen55ExL72W8lDN7GZviSS+aQDjRf3eouC5ZynXo8ih+sbcaYtRO45zwtIz8FN1uuTTRM2Qflaf4MGXAESeDAUK5oGPMO6a99nd5cKK+s1vd1QsBdJp22oDgpftI4XhN7wrwLsF+GBxEAvf/r3EByD3rNUliLnldenpb3QoaKYL6GXoJ2SMHiaJ2IXIOpg25hposypAL99cznU+7KGab3UhStfFu/AnC06TpM9DJtlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHZwsfJo+mD2N1e1Sln6aZxaTOL/qydMaBq+BQ2GLLw=;
 b=kZzuJNr5uLTcAtVU7Jjn2x74AevWwL0QKuzZaQmUf512iQhuCHg0OmLO0CKlyXnGjsQeTIsfwQOYTnPzrfr10/eNcLVd8zSX8GmzBsmsGo74sUBpefMPQnIuXYw2hFk4eE7a1Fr01nDgS0+xZegUd/wrkqE4fMtO4iYUlAAxnvGDJf7ygORIoYoXGumNx40JNq9ac0ndD2VT0VzJNKg/OmaMVaguYTCElB8Td2yKYpeZn1o3MI1JIQ/tTUE1hSYyCP32t1qEs+86svtk2bzTKdKRqlwKtJG0TbDwPzbfN9eqO5rwwZicGLMm23MTb40b5PbDWqtjnEHAhm3DAk/kFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHZwsfJo+mD2N1e1Sln6aZxaTOL/qydMaBq+BQ2GLLw=;
 b=FiBNF04VFDv+YkJA/32d6VKl+gyRormiFpGMDHWVcRz0aCVX4OKJ0F16/qpULM3n11vhffrRWmSrypuJyBvEAdANChW5RYUKIymYu1Gh5RhTgmQuzXW2eJQ7PVZq0gZT5FbW1htzIxTVuPbP9b0kPPiDpGr3r5keBNC8d82bdE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB13935.jpnprd01.prod.outlook.com (2603:1096:604:369::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 13:04:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 13:04:41 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 4/5] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Date: Fri, 28 Aug 2026 14:01:54 +0100
Message-ID: <20260828130202.275826-5-biju.das.jz@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 95149c78-2a7e-4cc7-963b-08df0504ebee
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uQlKGTH69e5k5x/7lJYUsjxK+pOhXfdO46lQ3rAfhLkeBT5zQYt/LhQkGImkx2evL/dOqtxpaxCKl9sLxfUOHXQv4sIlOv/RUfICUbckI0ncDgLSFJXy3TWK3qK+ZMQTMcsV81Wl+HrF19cV1TFCMOErSOOPbRBVrmjTsK101CZmGeu613Lunafo0v1KxJOyekfmCrepUZRsuFag1HnwUUI1N3rPEDK2Aq64SnrmxzChEOUqhkezj9Ns+78oSF8j8jt3EhKavIfPp8EoUHmHOHMZFVq4sw1k1woizwkY1gwUOpwukmiiXNkEuNQ4DmVkvskNid+FNlBgMfdTPqNkbDvDxRgIk4ViN6g7RLcfisdJo3VbkTVMo5cvXMRhSapI6Np+89fdMmiMrVKfXepG4A+dPACPN5rwpPVDKOoiAsjYg8rKb9Xv972RhoPXgLiWgc3YKCl6P6ppXUhYh/LLT2XZ3ZHS7AduAM2zNzrpLlKlItWPEQe+Gv8CPX5zXqGIHVK46Bw3J+qI+YauMdwfUY/L0GNowKBFTEE8NU45H3tvJ5w/Cxw3mUZH2kxcFRxEGRkuoCHrKSS7DSL//1Le8KNiCVyMcRWAWa2zIVOCtTfkUZb9Ppz/2yYnX/XlzWV7EI+chCpE2v7yJmA2faGPQsUS9XJelvEQV/mfzjXBpM6g3wNqorNwxcl1TZIZuBqNiC0oN7hmqjjWik1nxA34lw2ak1aXIvF+5aznxWPlYxc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z6LlIEZvGA2cHXfBkbVaK6UrC2H1039MdBvZwVlazS2wXJmsqbMUY6uD6WiZ?=
 =?us-ascii?Q?NowvuFew06vXJ5vMCC1bLRYXyyvLa6FFb87QxJCPqUkbeF4YY+Vl2UnVDMDz?=
 =?us-ascii?Q?gxkBur4dMjeRR+c0i/7mfWfcE+VdPOb8wQjJim2eyDEb9r6rYx8MvNVFTjb+?=
 =?us-ascii?Q?4aQQiv6IkYWm2ifz2vVr6U9zVQXdPxsF6Tlfhb/s4buoGLwtGBYwkgZzQG9b?=
 =?us-ascii?Q?rxghfdQMqK4oDgfUC7taVX388qiaVjUFuu/AgtaJ2HuddmP7i+0FRrI+Gnk7?=
 =?us-ascii?Q?LtmPbw1NAfGij5kd8VZDU/nrinHilpCg447gAdXubwddqhnaz3NwGFdoi6v+?=
 =?us-ascii?Q?pxly4MEflHAUUDTA9N3b63Ms1bZ+GxaYrpF2ZCjdqGe32Jo9x49MHAGakUzd?=
 =?us-ascii?Q?k6SenDnnva0U0bpEjoUGg4+Sj3SBjrDxFSWBN03M6P6HcN651GoqsrhMBw2M?=
 =?us-ascii?Q?WKBd8GVsH81mLLYBf1eIFQtFBE5TDIGiW9gYu/FU5xigMjafOk4lORxHaauj?=
 =?us-ascii?Q?6oIqoPA38t7LUz6Rrri8U7aDS5h4bctSBgXpQxVRi5LLnGtK3InLkAHiJnzX?=
 =?us-ascii?Q?K0QHIxAfBgTxemWeWo9oBMpf6qDQuptMIbcbtx/DK8wHLfCV6CrUBuq7G7iR?=
 =?us-ascii?Q?9elQQt0MLVydcV2pvYYUtffj9R7Y4WqEdIme60Gf8WNrs/hKSl+kOczsdJxH?=
 =?us-ascii?Q?2RbO5DCM71FxMMDD/cjdsBcgGED1veYDJTPNUwDcHa/4krQNdIX3FyOepGZ/?=
 =?us-ascii?Q?EiNkpkf19kjH8NBn4loHBCEMbNm+AduAurQ/Kqnth89ELg4RPgmGH8xS/KwM?=
 =?us-ascii?Q?N2lbvWpYwwKVe2qYJ+oBJpeDalLaYzZ+RWROI0EOGUNpaAoLhJnxhnyi4ThR?=
 =?us-ascii?Q?BLIuD+/05MgBDF0b0zyFXbXpGIxwrxRnBUExmcJuJeCkK43w8MIxPTYtZD/N?=
 =?us-ascii?Q?LUzkToiIih57zoqVjOw9LkBI0kVyc2RpXX2GP5lNFea51/7PE1YekM6pm61B?=
 =?us-ascii?Q?tYfwbVJ5qxfkGfQArOZU0d9hcNPDm0nQARXwWCp0aPOzTIYenLdAfVZNbVqL?=
 =?us-ascii?Q?1HunJ7YQ8Gsc9JilU5lxeNxLPJsCiJGR9MmDghIplm6xkCMsZE0Lic9EQQzG?=
 =?us-ascii?Q?9EqBu9evGr2VdcbznzjmFWYKEaaBEX3QDDpWgA2j00VnJNCQ5k+RzJLNhGbl?=
 =?us-ascii?Q?hKQxoF9p98gFTPillElJCwQTvhkOTHIk+DH/SfPM7D6GBE3Tf7WcFVv0Y2ut?=
 =?us-ascii?Q?mvSXO77Kduq1cCOvhzPdbsZccuBRvB8s25gPKCE3Y18Nk4lB1w236kpZ8ZDh?=
 =?us-ascii?Q?AlZpyqd4vZHOlxdypyLw3iznGodD8sGtO9J4cYL4rw6alZHCKLbcbW6phlJO?=
 =?us-ascii?Q?1OSXk3JEaZD6QK2+LxOYOZK6kyD2Ox2K7/91O75s+ncddkj52XWgf6EIS9tm?=
 =?us-ascii?Q?7KD8GtGkC6kJEl/mN5r5n1p9BZFOtmbmi8kUZvrkszO/B/+N98gbbatYsLI/?=
 =?us-ascii?Q?boBj7wlQtGwUtdgQdO2L6PKSs6KHrT1nw84rgDN3MvNu0LRSVYtYh1t7bC+m?=
 =?us-ascii?Q?a5/izI8cpdnsrCnEIMgc4hr+uh62jrl4FcUtzOoqIHJ1a4xPMk4YaFM0SAPg?=
 =?us-ascii?Q?9+1lwCC8mowBWPLRtKGet7jpEzszpQ1vSd4789cc57z60gRMfuVP5QRAQCDe?=
 =?us-ascii?Q?NUbqCDydSg37PMzN2pX/5gTtET6lzu4f1ElVOkjHZJOHzkZaf+uq03xGEu+X?=
 =?us-ascii?Q?MvVTGpLBJKoqLS3YxdU4QhbhW8eTDic=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95149c78-2a7e-4cc7-963b-08df0504ebee
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:04:41.3372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPnvJA9r/Xi+U6AX7K5S2SQpa5O06gbz2013/9aAVXtpc/3XkgzSC/bv3Rj2EoxIRdnPBY/3EYXeZL+5UNtOAHxYWVm+nHnQQ5MSAG4xaWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13935

Add the renesas,r9a08g046-usbphy-ctrl compatible string to the OF match
table for the RZ/G3L (r9a08g046) SoC, using a dedicated rzg3l_info
struct with pwrrdy set, similar to RZ/G3S.

The RZ/G3L SoC has 2 OTG controllers compared to one on RZ/G3S, so it
uses a separate rzg3l-vbus-regulator driver to handle the additional
VBUSEN control for port 2. The regulator_name field is used as
the platform device name passed to platform_device_alloc(), and must
exactly match the name the corresponding regulator driver registers
via its id_table for platform bus matching to succeed.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * Buid dependency on patch[1] for API changes
 * Replaced pwrseq_power_on() with pwrseq_enable()
 * Replaced pwrseq_power_off() with pwrseq_disable()
 * Dropped redundant devm_add_action_or_reset() for pwrseq.
[1] https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=d51fc9d4cd6eb18ac82913d83ecf7bd8c85f71ee
v7->v8:
 * Avoided code duplication by moving devm_add_action_or_reset() to
   rzg2l_usbphy_ctrl_pwrrdy_init().
v6->v7:
 * No change.
v5->v6:
 * No change.
v4->v5:
 * Replaced the variable regulator_driver_name->regulator_name in struct
   rzg2l_usbphy_ctrl_info
 * Switched to power sequence consumer for controlling pwrrdy signal.
 * Updated commit description.
v3->v4:
 * Updated the commit description.
 * Migrated to id_table match using driver_name and reduced the length
   < 24.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 70 +++++++++++++++++++++----
 1 file changed, 61 insertions(+), 9 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 79503f6f4b23..4d07c461230a 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -10,6 +10,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
@@ -37,11 +38,13 @@ struct rzg2l_usbphy_ctrl_priv {
 	void __iomem *base;
 	struct platform_device *vdev;
 	struct regmap_field *pwrrdy;
+	struct pwrseq_desc *pwrseq;
 
 	spinlock_t lock;
 };
 
 struct rzg2l_usbphy_ctrl_info {
+	const char *regulator_name;
 	bool pwrrdy;
 };
 
@@ -110,15 +113,24 @@ static void rzg2l_usbphy_ctrl_init(struct rzg2l_usbphy_ctrl_priv *priv)
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
-static const struct rzg2l_usbphy_ctrl_info rzg2l_info = {};
+static const struct rzg2l_usbphy_ctrl_info rzg2l_info = {
+	.regulator_name = "rzg2l-vbus-regulator",
+};
 
 static const struct rzg2l_usbphy_ctrl_info rzg3s_info = {
+	.regulator_name = "rzg2l-vbus-regulator",
+	.pwrrdy = true,
+};
+
+static const struct rzg2l_usbphy_ctrl_info rzg3l_info = {
+	.regulator_name = "rzg3l-vbus-regulator",
 	.pwrrdy = true,
 };
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl", .data = &rzg2l_info },
 	{ .compatible = "renesas,r9a08g045-usbphy-ctrl", .data = &rzg3s_info },
+	{ .compatible = "renesas,r9a08g046-usbphy-ctrl", .data = &rzg3l_info },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
@@ -153,13 +165,12 @@ static void rzg2l_usbphy_ctrl_pwrrdy_off(void *data)
 	rzg2l_usbphy_ctrl_set_pwrrdy(data, false);
 }
 
-static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
-					 struct rzg2l_usbphy_ctrl_priv *priv)
+static int rzg2l_usbphy_ctrl_pwrrdy_syscon_init(struct device *dev,
+						struct rzg2l_usbphy_ctrl_priv *priv)
 {
 	struct reg_field field;
 	struct regmap *regmap;
 	u32 args[2];
-	int ret;
 
 	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
 						      "renesas,sysc-pwrrdy",
@@ -179,11 +190,40 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
 	if (IS_ERR(priv->pwrrdy))
 		return PTR_ERR(priv->pwrrdy);
 
-	ret = rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
-	if (ret)
-		return ret;
+	return rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
+}
+
+static int rzg2l_usbphy_ctrl_pwrrdy_powerseq_init(struct device *dev,
+						  struct rzg2l_usbphy_ctrl_priv *priv)
+{
+	priv->pwrseq = devm_pwrseq_get(dev, "usb-pwrrdy");
+	if (IS_ERR(priv->pwrseq)) {
+		/*
+		 * This platform requires a sequencer. If we can't get it, we
+		 * must return the error (including -EPROBE_DEFER to wait for
+		 * the provider to appear)
+		 */
+		return dev_err_probe(dev, PTR_ERR(priv->pwrseq),
+				     "Failed to get required power sequencer\n");
+	}
 
-	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, priv->pwrrdy);
+	return pwrseq_enable(priv->pwrseq);
+}
+
+static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
+					 struct rzg2l_usbphy_ctrl_priv *priv)
+{
+	int ret;
+
+	if (of_property_present(dev->of_node, "renesas,sysc-pwrrdy"))
+		ret = rzg2l_usbphy_ctrl_pwrrdy_syscon_init(dev, priv);
+	else
+		ret = rzg2l_usbphy_ctrl_pwrrdy_powerseq_init(dev, priv);
+
+	if (!ret && priv->pwrrdy)
+		ret = devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, priv->pwrrdy);
+
+	return ret;
 }
 
 static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
@@ -245,7 +285,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (error)
 		goto err_pm_runtime_put;
 
-	vdev = platform_device_alloc("rzg2l-vbus-regulator", pdev->id);
+	vdev = platform_device_alloc(info->regulator_name, pdev->id);
 	if (!vdev) {
 		error = -ENOMEM;
 		goto err_pm_runtime_put;
@@ -300,6 +340,12 @@ static int rzg2l_usbphy_ctrl_suspend(struct device *dev)
 	if (ret)
 		goto reset_deassert;
 
+	if (priv->pwrseq) {
+		ret = pwrseq_disable(priv->pwrseq);
+		if (ret)
+			goto reset_deassert;
+	}
+
 	return 0;
 
 reset_deassert:
@@ -314,6 +360,12 @@ static int rzg2l_usbphy_ctrl_resume(struct device *dev)
 	struct rzg2l_usbphy_ctrl_priv *priv = dev_get_drvdata(dev);
 	int ret;
 
+	if (priv->pwrseq) {
+		ret = pwrseq_enable(priv->pwrseq);
+		if (ret)
+			return ret;
+	}
+
 	ret = rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
 	if (ret)
 		return ret;
-- 
2.43.0

