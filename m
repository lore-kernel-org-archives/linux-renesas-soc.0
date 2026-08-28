Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010058.outbound.protection.outlook.com [52.101.229.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFC5305665
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2026 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924179; cv=fail; b=PyIomL/sLgIhcrENrpDzo0ta5IV7QdHx8kXaBFeiI4i/B1pbkOrOz6xgiHBIIcUw6ChuSLC8fox0MXFyuk3bTWqIetpoHSRe6rkrZgmjrrCkzHG1k/aGi+MsG8/s8+LXBYuiMt0aiHIrGjcK1w7cVwHLSEpd5xCR15hz55oysoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924179; c=relaxed/simple;
	bh=Bh/EumdXxaVhAns3FEXuz4XHs+nrQlwFx24R1ZL6Z90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bIs35WM8DZWnFgMmTBgR74lcuZRPdpEgHjKilr//GUjYhr6zWLlsftR3eptdo+izkRIWqx04A5z69zifDwbZMVdovSt1TPLBDvogT/ET6mwNp7d9u0uQSpvrIFPAyggglPT7IbwL7bXd/OVtBk5BGSjjgmXkQxleNo6Qv1RU+E8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sdLhfSgN; arc=fail smtp.client-ip=52.101.229.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sdLhfSgN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpwB7FD+8b0F3DBTO/VCkPBDYOYnar3p5aaQPSKqi2972TvvGqWNd7IG5dKsx1L+RhQ5+p+Ya/bnWpguLv4HzKobDbZIgCQDko3D3/lbgMLg+TBVvhjUYxkmMlDRiFlwhN2LPehdK6jgbBEL/yol1ZT1bxuGkyQjDxYdX9VUfH0M5Y7WgS1fHlRbeyFs2gr9ksSza9jbLHTJkg+OgqawlvxU/aO3+fgT1ZOlHMOHbA3aAJjTb3n/y7pk8IcQO2Gb/zfQWPmQ0A6PJvIlF2jAr/dT8ty085oi8y8Cd7CD85nPrhvBc6tHgn/P32zs8BUK9vQHyWgB2J+AbTv738n8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHZwsfJo+mD2N1e1Sln6aZxaTOL/qydMaBq+BQ2GLLw=;
 b=ZQOq9fu6GN/NB0ktMG3thb4vtJUsZU8YIie/5qjFj1Zk2vSMALK+YFVv4nI8zhMQ/rfnH8imTD8CkbQbux/xdquIi389zw+rROhd6OBs1SzabwwZ+iw/IlGVnkwdV05dtPaesgDjhTziONZRupyVMhCQXFJy6U9AAeMqm+J649HGljmkQPBLnQkUsopRrUU5xM1HJwuIUdPA8J0gt1WKzXpZfzJ96FOeWpYHzUN5GlsNMlBzMA8pT8mP0cHMniKA9YkaKQI5ze5YJyqcn70Y7hb224iV8hEPHdTOolCdOW3XdUTT5/cBWhyC6trHPpsU3xl71kPQ79Ib0ltgiH3R4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=bp.renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=bp.renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHZwsfJo+mD2N1e1Sln6aZxaTOL/qydMaBq+BQ2GLLw=;
 b=sdLhfSgNTuQC+rGkKb9sHrlwORvA0E7mDhPLvSsUSikM5n4X5i/xTcgxVyD7C07XGKAbtYlKRLyTpoWzyFwf3ojlEQuNKF8SDaTnmH1M9ACq5LHsXOKX3J/7zOq9Ux1szf457FVKlwlmsT/xqRNmVTS/X59zbkHL861sM63BJYQ=
Received: from TYCP286CA0337.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:38e::15)
 by TYCPR01MB11509.jpnprd01.prod.outlook.com (2603:1096:400:37a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 13:36:04 +0000
Received: from TYO1EPF00005023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e:cafe::8) by TYCP286CA0337.outlook.office365.com
 (2603:1096:400:38e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 13:36:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=bp.renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bp.renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of bp.renesas.com
 designates 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005023.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 28 Aug 2026 13:36:04 +0000
Received: from biju-VirtualBox.adwin.renesas.com (nld-5cg2232q0r.diasemi.com [10.24.0.28])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 54D9C3000242;
	Fri, 28 Aug 2026 22:35:59 +0900 (JST)
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
Date: Fri, 28 Aug 2026 14:35:04 +0100
Message-ID: <20260828133509.276281-5-biju.das.jz@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYO1EPF00005023:EE_|TYCPR01MB11509:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f1e96653-8df2-4f06-cf6b-08df05094f0a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|18002099003|22082099003|11063799006|56012099006|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info:
	oNnD7Z3h0XmlgAAXnDHtY1WkOmaTVos9qgTBVH93boS7QQyPKsVNsZ0ZM/bv+Vy99sbtN8I5DhIyDkl/sbTz4j9iPHNCDVmZGep3MiJ8ykj5Wdcv3W5RCU77eVdFbxVaXHn9BTh8oaZmMwF1ihBWhS5gIRDm02zlC1FEj9zDTCCcE8I8MjS69A9RVpeqbqFkSG4kwwfiNZJTLnwD8sU94ZXpdzBcWRB6w46TLW7x90Hm7e+wT2I3pHIRBFQ/iPQJiOi1ChAUYaesaQWt5YTAlaRnOq2cuWHubLUVa28mCFjsJ0CnqAwzYbtPbwUYNNSF/DJkn+5mKY9jRt9Uz13XmK6Cgep5Ix0gOhLEp/OXcJbX470cif7dQtawZd34rDs0oj8YxK/K62vQ4BKTdS/aEdUtmUn6IIlpQ3ZskQpKAahrS8cOiGOCf+X51CdxGDd/9GgL/Ufew5cHU1+Yamrw7pzp9l9BAWEdtcjTgwvUSclO+L/j8EM+oO6RReW7ggxcZTv3RV4uUm2GEb3Wv73pbvzz9gLSTdAAjDwf4rnYYGncgz/uHflIg7Voyt4fgs1+xKPKU4hPT7O4SCk0aO8Y1FkttsEcQhFn6d/nLdsExWTV1yMaXUUbdHMYSAxgagLnyBsmernNxEeCxGyT+uyXfAKlRx7ZdDdyUqoWZOEOWTV3Vji5NQ6pfrBPvX2AXoXGLrJNbBlFdyuM1fcdgh7U6A==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I0VKvFwqB60Y11D8gOkyupxCbQuZKLTaiibLuIv3nCCiKr4uRH9cp1x1FVn+oX39QDOJbN2rfN/mtkx8rRtGGdOfHXAxndjlRLoKtoJJ0xxszK/7cLNeuUWzP8Fmlc/qu93sqnaJefD+uqX/TARYcxwZqnFCdmqMSwa//p8/j06O1yv3rJsjLeawnpeg4Ckd+XDCHW1ZnZb9LxvXcVtG0GUhOQFEXDfShInaWpaLgbQDuJbihnfUR5NwRot55uNSLuSmSjikrqqkm+5VQA9DtS2oQr+rG3bhLREB2KO12MYOFoLd2XrLlEAnvw+/zCX3PI9OgvRZKk4zpxlxk/GpOyPGw7cKe3ugiWtQ0LTw2ZkyD4y80nOOJu1Q/1/LIi/BIxNRjqXllMngH/Ml/vvo/ILhgp6zpqDofZvOfE8bzpkFb1aZglSm5gt7MMKajKkj
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:36:04.8296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e96653-8df2-4f06-cf6b-08df05094f0a
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005023.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11509

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

