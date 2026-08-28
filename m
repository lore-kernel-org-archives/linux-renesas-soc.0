Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59E4279907
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2026 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922259; cv=fail; b=piyXhJZlE1bfvyu2mP9tyDeafLpdKq2dQIhwhgFZtnkr8zcSygz8o/lHq7BVQU0Au1ULBOsbgJWW3/TEcnCmq8BlD+bO2ZtygGV4WdXlV0Od/HVwleC/WHp2nLOjtorHJMeVuqNGR/DwishQ+OvicWHKkT/yw2K4doHjtxqnTPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922259; c=relaxed/simple;
	bh=maTViIz/0FzWhABzo0blJ6LcNkPkjusGfm18lLhhgJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZaDvHgl9hCMFSTtoRhpvlecisgF7gmcgAvBxoCk/rHT5dTJeVJgdB581JFXR5GS4W5Zl9y3UaIRmQ7ljNGpszLwSAcIZQfldzRV7cRgd+/SsWXloi5AGknCSwiy5MjybyovOc+uSHgnrIuHa7s39CCr6IKJq3AzFxg47U0RsMh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=a2rWiMk7; arc=fail smtp.client-ip=52.101.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="a2rWiMk7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRp7oSl8jL+w0w1XwnvM8chPN9dv0SYkd7G4zIBVwVPKOgkVu0Lmied9hpkIXdopGHmrLyN2cMSz2aVdMAGZ8f4qyenDjJoEl/7Tu2WGl7tn+iv4oo9xs48GTdFup1Y2aBvjs4nth3fDORF4EF2gi2WDDAVOfNCCmA2WBJ7ZIGUcws41T4U9ImSHMosbD07F5tT1GcxJgdMKHkyxcyuKKxSwegylrGmFmQbIzIJsRQzDB24ZtaVrNvxKvwEym9zo60s0jga3x6HujeLs0QPg7ohwk7cRaHRGZygB2RY7oBVMwe/qAq2Z1/2se9dGSNWTzGzXeIu1xOxuHmIGqyGwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OVo4LfZ0crFWQ1X+G+SUlb23ZXjqnjdOwuzMIOJuZU=;
 b=UqXKEyzSaF2te47HcQoORAtJCjQxhQbIhbcPDj2WUjUpjC6YNmAKfmJvTViQSvsdDa7A3bW/hMl7l2ZDDnObmZK++7YQhCeFJj12fzzeOkT2RssWyUCjRyJJofbvQAaqmo2dcuIENHBI/0RdEnOQdiUxWdkJkpN8zowBEb856GsWWznWZqieq9ZidsLjLBaFRriYMZf0A9mYjniKtDYTya/824GBmEnaao5M9BY29GQBgNo54ZpB3YllhOsre/prlp99PDfngGhGYeWQiOvQONUgeI/KX+2s++sSG+n2raxdXiM2RuxbdzTyvISvwvhDU4MMDaIukvGrgVF8Ee2fVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OVo4LfZ0crFWQ1X+G+SUlb23ZXjqnjdOwuzMIOJuZU=;
 b=a2rWiMk7p9iVaz8FJ/puMWpnZzQpb9T2LoLxOyvA+smgrtfbk0IAqJXzDbbdIAlF2g9NdGYgz2LUNhogMBdHXEc0c/p8iv6I4O6YRjyATtMBbLDYhT2zPgAiY2yyoKgG8zoh4t0fDVI1GWIug20R7HWJbKOH+QRI+ifcTShTajw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB13935.jpnprd01.prod.outlook.com (2603:1096:604:369::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 13:04:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 13:04:13 +0000
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
Date: Fri, 28 Aug 2026 14:01:51 +0100
Message-ID: <20260828130202.275826-2-biju.das.jz@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 508c0467-6c33-4751-8424-08df0504d9f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8zvHdXEoGpzD2rcO5rP8Wseg9+XZvZfxVChHvJBFOs6i5eGg3KBWKdeGytuElrw+iE2NOon11YAvePy2oztkhmbfU6x/ickmV6TA1/U0Bf4Ft4BrOMkxYk5n2wAQOCPj403MA3Xcq6D07hq11E5VQVJYV7Eze8IwCy8E5ZnJqhazgpLjHKOArrVwvtd5NKiJcGF6TBrpZm4RzUSPEOLXYKj5EwFIVx4r7mBTVGXnLtqg4b/zmNXD6/tBCUL2g79aYIdo2YUoErQDmPW2KNo1V0sSPqkIAwyibmvtMyFUeY/9FpjkKcUKRz0Y8pIiJWI1vHafRPZjeXMrv9fJ3AV/jhT+0eAjSAal2Goisn97o+6ZJK1vP7LE9nxVwiIyLVFa1QxkqE1nTIIbvhwKTqnFA4rlt1TOVRHar/AZRJetcQHHaxlRM5OdEaZ/bSiNgm6CrpGXH/Wu5/DtKD6NhhPs/vvGbfE8oagRNT4gP+/neJ1zooLomYP76BIR6dOgJ15BVF3EEmyO3DhrKFfldZevJjaUKpZFpl6Z2rCSfkZ/LRaIIzQrAdz+QZKtC+gV2G3HQyRqqo9W4+SHlqcqtS6bx5cTwrzu7ADaA9ImfznItArpu4/VkH+rQMA8YlWhoZgHGvJYdjVaolnTotYFULsLz1z9USAe+hYJp0ysrzfaLMkfEIKkViCix+NhFzBqTvK0Rv5Jsrl159Sb5NqSvWKiq2HZwftbNWUV5LhBqwmKPdI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vQmMtpOITEza482DNnnd0mD8QLX/HiOrf8xQiaDcLZ3UpJUHwqEVU3vt06Pf?=
 =?us-ascii?Q?Y+AvFI9tK8ViKBu8Nu2fs622ejO8wqFDz6PcYVgHKKmrGBRlpb5ZvIrGlFDW?=
 =?us-ascii?Q?nCxT6wF8HNRzIAGCPaBn1vw+dOOtgNS+xgjf+wSOkM3KXasB272k6JYJgNDo?=
 =?us-ascii?Q?EWtFsTjFT9AsV6z8zhYuN8YclhzRw0e78z0DxCmsZc99z9nH3C37pn0jkwPH?=
 =?us-ascii?Q?YYCqqJrWyjMUxLxrqXcEVXf89L0z7M78qdpxJ7X4qbhbgsZcJdia2wk8QwBl?=
 =?us-ascii?Q?chyT2RAYMjK8rUYkEh+iqE4XRFBEECIF68mFHmFuttCz6jxzsZ+/OznljsvF?=
 =?us-ascii?Q?Fqln9QPyMBx1OWsMpQZ+/t5rA+rk94GLxbSWyhibNOCIw+53TEboMHzxXKMm?=
 =?us-ascii?Q?Nkp8v72mj4AhpfBI6C/xUvOeGXj9RKEOKgKb6/viDTvRSJA3TTl+gPNZJYh+?=
 =?us-ascii?Q?N/J/QMkkmMdQjt9p+B22Xm6lxCTlU0jNhYqodyKExTvf/Lc0mbgUNlAtPkWZ?=
 =?us-ascii?Q?j2qyBrsvmxAMyW/J3v3KOOwtPHM4NtV721jz6XBXSld4rN/+QRLU0pIjo1nE?=
 =?us-ascii?Q?HnbIJGxhT0Dj02yQujjVpydW80tZrerhup+S4n83i4MzdvqTiCLjk+xLUBcm?=
 =?us-ascii?Q?A+gyX8odQ2CZ7CECOCpsaGJUrKEXHTsPcziNXajpj+qu6kC4Ay0NdOj3tOt4?=
 =?us-ascii?Q?JXkWTIXFNlc1jDJjuh/cNFza+F9ao5gy8SzwYZkmbdaI22eZTt++6HZjwjFV?=
 =?us-ascii?Q?GBdTZetgKzi1dllX/4HFR96lNp9X/+3NjqDo1SyEJPHgNx4nekx9rJXIxDzD?=
 =?us-ascii?Q?WRlSGd5CTp4MDY0zmPRxzvY4C/xRCcV0su++PxzlORp1nBXChvdM6dVd6Hf6?=
 =?us-ascii?Q?TJBG0gfVH4bdwD8zmHQTF+4Z3EdgCX3PL4ZpqUqDXw+lBEk8Lxr2zNh4diib?=
 =?us-ascii?Q?tLm60TMEozDJ6fLeWP16x041MwwSHEqgmXXq4/PalKK/0XPYCu2KAic9F+Zv?=
 =?us-ascii?Q?9R6MK/737fLHxopyyVXhP4PQLnCSkiK/P3jNsRYfe7ihClVN0hAgI8yejNyN?=
 =?us-ascii?Q?iNbSNEABSjG0OPBaZN2Q88NnwnhZIZdTOUzHqhFDoM8xJomlW1Mn1Yz2rQvz?=
 =?us-ascii?Q?/1mLv/agZEZAMR7bkJ+pV/qpB5hANyccTA9XRhX3lYC60drVPXPmrL4HQOuG?=
 =?us-ascii?Q?7DPNqbV3BIHovN/GTxD3i6IcQHp+ZPAonLFei0Bjvt4v0k+tq/10ocK57GxT?=
 =?us-ascii?Q?Xr+H8QuaqxOgqqh4lOxm8PwCK6rHfjhMTc9TP8qqmLiRM0PbljpKrN9w2wbq?=
 =?us-ascii?Q?JBSsJqh2YaUFX9UMKuPdsvaRxbZviKX+na62aFjzoj0qHh/W4GnBpO0Lt+6q?=
 =?us-ascii?Q?1whX4soXhF4ZbJmqBEAxV06LxYocqsavuLYJ+SB5xEEuxzyQDU7ntsYr8yKF?=
 =?us-ascii?Q?YEN+RaEn5QGKn940USqbAbPz/AF+AM251BxkMUxocSqK2Gd1oqTgvDtNLVx8?=
 =?us-ascii?Q?vo8NI4QTMLvKfXrGUIjP3kiFxB4+DDSEz0RRfmNAJoykrIsljg68iHJwKOJt?=
 =?us-ascii?Q?YqBqAeKXwuQHLI2BtXTfIbmNywwUvc+Mgh61UCzcC3di/dbWCqDArZ1U+mCH?=
 =?us-ascii?Q?9AsQuiUxSpk0A5kxB/lxf/3xiZlyH7v5tn8TEf6pUBcDi8paZuzQqYkAGB4b?=
 =?us-ascii?Q?scNQmDNTEHR+QPsfTgcFQNWgb5qZhW7J7PZZ/VopGVm7ogkQZQIVDXOrfc/d?=
 =?us-ascii?Q?j3TOpKX3vgArgDJkL5dxEGOV0+PvqtU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508c0467-6c33-4751-8424-08df0504d9f8
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:04:10.7418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMWeZ5I5Ri6nZUTJyQ6fGS4Cop8Ap9sqn8NgCS2xj45dglWOheWSwcXu5t6arICW5oQW3iLZqCbWshUCx7D9eBmJtdHQTSJdm9TvLcwimBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13935

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

