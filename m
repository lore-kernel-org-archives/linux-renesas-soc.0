Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010059.outbound.protection.outlook.com [52.101.229.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA1A447806
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2026 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924167; cv=fail; b=iTLZWQBeRk8eWFsTFfWvVgI4T/sE1XQpQi5AGJE3ckkEisD90GTBtthxQhPwVUX3Ko9moYo8FgG4D60uWkTpkIzaxQAStlCdU/1WQmy5XT3S0O0ddsFFSu53GNRRwSK2V6UfPftkXknKqPcO01vAMCbsR+cZMLIGHUV3DeHMcJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924167; c=relaxed/simple;
	bh=maTViIz/0FzWhABzo0blJ6LcNkPkjusGfm18lLhhgJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cos/Mk4G1YyiXH/xBqRxJjIxFoW58zPLxMkTkCPrjp/GmKWJmchMxNDKx8fO8aY1JhI15HU8zlZjVnDvYPyUTc3ctwFojF3LYbWeN8MKQHNoCI3fPuVAiPjL+WwSUVMruu6uyqY2s9mf/CKaUds6wlVWgmp28OwYL4874AnfR/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=h2nbvtCT; arc=fail smtp.client-ip=52.101.229.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="h2nbvtCT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhgFl/Qvjzt1RGPnhhN/5Tro9fZ4+mluTtD8adfq5LBB36YTuhXUooXM/5JsKRvMxdcrtU5jFrjip2H7IfqPYToSEFzVonMn6vu30aTtndTcjvfF4Bj+365kuaH1SKyi4r707FkPCUaWvF4KqgPfPYl0PCf8FTkQTWY1xstQO/8iyoDb2/ccR1YNGoxcfYEucrG36m7ohsP/tSvpYT1ud5Kibn0CGleqE/MuPAnl+PhIl3q6aM5TOspAQl5bSRb7nJYNoWkXxh2tD+iIybWa9fT5AWUlTxU/WXZl3iNs6/SpzjmT8IGR0uuRFy9YmMoPWJzmxFe2Xe56KMbL3v91HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OVo4LfZ0crFWQ1X+G+SUlb23ZXjqnjdOwuzMIOJuZU=;
 b=F8m9uLPfeLMdYLlg/28kGM/fAb87fAIMX1bWNpdY8yvImXIM6VCb3Y5ynYnxcsv9rW45yxbyRSWj3almkl2ymseQcpEiAujLga2uclosqQf18OB9MaQ6IfWywe47pivFTFnB/thmei/N0fowkvV+euaPakhrhTPm7fAhkLFw/tmzv6BJOjZS1ISs2viwrGZg+on92tw6Rp+hUTbUu6vv24CrxfjyJk82JCoAEBWKa1UpwQLTbw8I6aNka/7RSQcyLz4R4W2SAIrycdI5CxWd2gy9hP6TRJC+IE1VHZcJGGNylNKzGA8wHxKJmc7vBWXSDOCJpZmrHpQfbrqZQew+9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=bp.renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=bp.renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OVo4LfZ0crFWQ1X+G+SUlb23ZXjqnjdOwuzMIOJuZU=;
 b=h2nbvtCTx93yjRwTjishY06ZYHt3D1EYreKtd7DwAkVqC39ZevPgVR8gUSB0HEXv5Cg6u7UAD5QKzqzop9ki5GGlD1UrBaVxVC19a/uLXv95ToGSyl3ou0MkNdaqnAtNGLQLZDypFiHKSfHwJvd7g1apjMMmsrgDIFRvFFGI7V4=
Received: from TY4P286CA0135.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:37f::18)
 by TY4PR01MB15851.jpnprd01.prod.outlook.com (2603:1096:405:2af::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 13:35:46 +0000
Received: from TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f:cafe::29) by TY4P286CA0135.outlook.office365.com
 (2603:1096:405:37f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 13:35:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=bp.renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bp.renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of bp.renesas.com
 designates 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005020.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 28 Aug 2026 13:35:46 +0000
Received: from biju-VirtualBox.adwin.renesas.com (nld-5cg2232q0r.diasemi.com [10.24.0.28])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id F124E3000242;
	Fri, 28 Aug 2026 22:35:33 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v9 1/5] regulator: renesas-usb-vbus-regulator: Rename platform device to rzg2l-vbus-regulator
Date: Fri, 28 Aug 2026 14:35:01 +0100
Message-ID: <20260828133509.276281-2-biju.das.jz@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYO1EPF00005020:EE_|TY4PR01MB15851:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ef8446b9-f92d-45f9-a4d4-08df050943f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lDbsJh7RAdS72AWvmdhaNXAO9SDi7EK5Se8aMBQPdIb3Bu6yt90oohVWe4tY3qshCxF4EMVGIirNgEw6DVmIhWvhsyKfDZJipzp2/3sMGe0yNkOJNZJ/8Lii+htzqvyqEcszmZ7ami2KbB8d0Gn8l0jnLpGx9CvJon18IYhv2iqdMLUPS8utCR/HkxsUg7dIo2a49QGUYo6J0mA3AJ5A94uHSibLpzE+iIsRVqGJPbYQ1EcbHoHKtrBvIbkbWwXnQj16EtPn+sgm2RiO2s6vdPeJWMOJtgiwt++OqnPa0ErbCHEP8a1QOq7+ooK2TMb5sMUMZwCON2p3A5Tc7YVccArmsV5OCakixFdizRqBlKKJdct41nLOHoFia2ti8n7bEF+sMX4TuXzII1YJ4tGJfv8elBFRhMigI5ittsUujKZY2VBTHaiS8fmrbhqJeiZZ8L7sUMcueTELUE6s1Sn+p7x6qL6PypLNBaMUOT4yYvpykd3toq77/C3a67pDKsqU4c22xQUmRiaIbl7D8dTPTLet06l8qhW5juW57OEkMtgIaIxAuM0tD6PUJVNAKpsVcluhYppzpu4Hy9KSgxi/KCbpbwPcFWrB26+NH5L1CS6DwC9iTKFLjN2EOdJSGfV7kmQxV0VE1tYjtxqRfcBTYkRGxB/nml1RT62JR9E9GIy9pZLHwd/DxAEuGHGluOEy0cuQ5Gi+WIWSV7Sp1cpRpA==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NhYXLRyVkwwtGcmQX2r4Cv1DvXsq3QEicm56aUtL35Fs8SmOyvrsy3o0eDiJB5fhH+zsHOOp7/2iRWUMT6IT75fGHcnfwhjAAX5NOgYQUtqUwSOTAwqaLK2Xe09pIKTpzM0tyMFNjA24ZmuTK7QepuRNPYIwRMj0YxhloYCUJ8wNpWFEFgTJ1rSR9PTsu3FRBIPB8i2s0FJzGEcR7YhVIf63OyZ+SDZJnnZ+c5gBfCR2W2zXk+yxEEH0PF+Pi+8+3IWy8grG0RU3vkorvCdSHKg0xOLkkG3pEX+5s99ScF9Tcsd5IPCrJCg7c/YiGQO299jL0oCntPM7qi85psJDPVt1wcCk1Yw05QVbitPnbmsSw1UgvknYFV/GxkbQmixi9WKo/PE0v24el+GjsMAAmNcTwsnrAlq/u2Pmo/GwnxlWkJ2omNzyDhEz91z+gzM+
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:35:46.2358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8446b9-f92d-45f9-a4d4-08df050943f4
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15851

Rename the platform device name from "rzg2l-usb-vbus-regulator" to
"rzg2l-vbus-regulator" so that it fits within the platform device ID
table's name size restriction, allowing the driver to be converted to
use ID table based matching (struct platform_device_id) instead of
matching purely on driver name string. Update both the driver name in
the regulator driver and the matching platform_device_alloc() call in
reset-rzg2l-usbphy-ctrl.c to keep the two in sync.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * No change.
v7->v8:
 * Collected tag
v6->v7:
 * No change.
v6:
 * New patch
---
 drivers/regulator/renesas-usb-vbus-regulator.c | 2 +-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/regulator/renesas-usb-vbus-regulator.c
index 9ba791bd72ec..22fcf0d10c85 100644
--- a/drivers/regulator/renesas-usb-vbus-regulator.c
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -58,7 +58,7 @@ static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
 static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
 	.probe = rzg2l_usb_vbus_regulator_probe,
 	.driver	= {
-		.name = "rzg2l-usb-vbus-regulator",
+		.name = "rzg2l-vbus-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index f003b360629c..f90fdb7e6ea4 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -241,7 +241,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (error)
 		goto err_pm_runtime_put;
 
-	vdev = platform_device_alloc("rzg2l-usb-vbus-regulator", pdev->id);
+	vdev = platform_device_alloc("rzg2l-vbus-regulator", pdev->id);
 	if (!vdev) {
 		error = -ENOMEM;
 		goto err_pm_runtime_put;
-- 
2.43.0

