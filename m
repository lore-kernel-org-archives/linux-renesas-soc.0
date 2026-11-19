Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795109723;
	b=QRRCBid84bSHLtOyYSazgHBDLjlfgHgzVANorZfYsN1n5sgl8v1gpxOZtTbXNK3Ao8K/
	 UcZWwsbZcMiDCpjSQCeDL2Em5voYpy1n6H1Xc58+KbIYUz9aEYQ4fvnnfQeh8I3umFoOR
	 X8gFeUc7Ql+kR2d9EO8kHHAengRggck8tu+HniwmFXTdf6hyRX49A9IM30Yr7pBwKST6W
	 7Lmf2Araxn1Ndnuki+WQ5e+0HSEyCd9kkk++D61NlOYXQ4hJ3uutDTTTvG+zHd3OSXBkD
	 oidq78TTcyhE5mkUU87KDF8SFWoTiy/23/t3kjaYZU8+0L2w1lioQ7hOYAtjWVp4ECw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109723;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=pV3R118iRDzWd/A+Y4PGJVkDtwTBx6+BDMX9mIM1EIE=;
	b=yQQc+oPNfg7FAoOAK9PMA1WC5mI6wzd03PoynePbLMXnSfbaHv8MQ2Io7LyMzDmANVU9
	 GjNEWeOVIfzvkviBj9VrRX+jFOlAfTc99euogqjBiQ4LIV1G2g9B6xpUAiZvW/jwnDD1k
	 fQA9mhzNcr18u3kIQLzam1+rrcbul7ZMJvDBnakTaSmmw/P6dPUc5+5RR3cXGUxKAWDI5
	 COVPN86RXhCJbyvzPF02HMg4zumYslRQ8NxYXC/Gp/LxKCAuXlFc2oEjVoqPHoh7JcxMP
	 gTwrGO+r+G+7yVftsyfltEbAjDVNwNGRqMSjIimAo4a4M0akhcaIwmop8on25+Ate9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b="I/vuQv0G";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.57
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEC4606A32C;
	Thu, 19 Nov 2026 17:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFEC4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=I/vuQv0G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRGLVQlZz00g6ukrZ7zLJLowt5E9h3yXr7aIqnDj/CPoDsM2A2Omb0yMt97ch0dG14Hx0pJHShJcMFQQzUKameUTFJafu60qHt2TzctwZdzkI/es1x0j41VH9n6S56pdS6oVuCUpgT7iL/RVo+DzEu5tQnlZkAslfBC1lMqQ5JtkMzvtYRHAvglVPYCHj7+WRC4Y8HK2aEyv+Znr5WUxxV5PuBpg1zLhuDwHqnBGcPjAz3Ut1arZ+KWd/2UOJK/HoS0SZIJwFy8qdw8pSbELwJ9MfE3GXZL4kksKh2FYig7WHYFnXwfF+Hj+kdcVGWoZ7BBbzmv5Om0rKikCi+e4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pV3R118iRDzWd/A+Y4PGJVkDtwTBx6+BDMX9mIM1EIE=;
 b=xhLEe6cMlAhMFG89ytIfHNBb5VJnz3ARGre9hV83E983ikux03xKCeDGtl+pjVT6dxeAIGK7Vzg/Mq4ItD7CymiVytLc49GgAPFOdWp7hLEsAT6DjWVt4LU2FQHoSghcqK7YtOffP/PWlrYzycrPZbGD/+Oiumba0m7n1+MF1PG+N8SY4nEloUyUsEWzOLef9s9ZYbdsCGXhfEQTPYVBuJW22aks1Gyj3GQHpcNtZ1F3E39IsVNJi1Dq7G5Xob2tbpxCnZXbqN855yro3/CoMMgzBMpG7ZTNvYgAcISIv7GRe41JADZPL0Q0wAiw91Diw1HHZ+2le5xhNS+e3lgp4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pV3R118iRDzWd/A+Y4PGJVkDtwTBx6+BDMX9mIM1EIE=;
 b=I/vuQv0GRVJL0YWt5kMevtI86wL2M4UcNWd8EEwOPr4Ja9n8YChoB87rHLzpkFpFJxpWUsni0OmfBi0Da31n7Hs1ar93z9RE4bXk5/CieQRR37FiKohoyT6SotzpAdRawRwwgDURApgrqvVlaxJVCYSHqSQlX65U+ndWOrawL4o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by OS3PR01MB10422.jpnprd01.prod.outlook.com
 (2603:1096:604:1fe::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 17:35:20 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 17:35:20 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: jacopo.mondi@ideasonboard.com,
	tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 10/10] media: i2c: ov5645: Add suspend/resume support
Date: Thu, 19 Nov 2026 18:34:13 +0100
Message-ID: <20261119173413.341658-11-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119173413.341658-1-tommaso.merciai.xr@bp.renesas.com>
References: <20261119173413.341658-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0126.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::10) To OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOPR01MB295138:EE_|OS3PR01MB10422:EE_
X-MS-Office365-Filtering-Correlation-Id: d81bcafb-f2c0-44e3-8aca-08df46637bc7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|38350700014|56012099006|11063799006|261021121427099003|261009223027099003|10067099003|261102123227099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OI5aU143saLmf4l+P0IAFrOUQ7cx5ygZFwatkpbldJj9rrUJJlbcahaG4DcsJI2o+s6CzrJZBjFpOgsY6lEe4kleZ0KettfMDaIO1jjCnFQIH/du8akHgD8w/X55Fd80GJOt9NP9VBRcpXojpQ82v+mP8MhY0gdsif+FP0tO/Os77qFUBYIzaWpoVh3F71Kt0BgbGFUuwrFluPTWAp+YGLEuDYcG7P9W3NURyDKUMq7nrF4fIqgOHsMZRmC+2BP1idK1et0Ez16426P5zPM8XWU9VuJeAjUCcbUB28Pu7+O4yrHhRzFvU0IUjNw1XP+XT7CSLC0KYWdfj0j1s3i6h42/m5DIrbJYMm+gc9gtq26zr0Zine830+ej+ifueM8ZkP8edtAioZgaqAraG3QdjP+JUOLrmdXWd5USPQUCj/2zzpFjyphje4miWMOxy3Yg1n9jpbA2bcUqIx6qBxOe56AyAUquSYxy3pOzugDWcOLiFlQH6j3osVKtZzsOJeXbyOYpUQIE/Z/eV1KCPzIeem4uysa9eSr6VNF+E/1ITFeO8q1iCysidp+xOFJoR0xv3kyNvxUJNesBhKqkbmsmKHRVY7NbqHF4k2J+LiLgDpW5w+pzgJ9eVvJkkfDAV2NNpDba8gny4BHSEIBRCSjVyPlxOF2GYiVf0+ZcvXeE76RUC/uDUDKdPyl8NhknTO0vZDVeCsc6Br4ysJoa1dD010cnXFrCn9DTx7kLjfDhPtw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(38350700014)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(10067099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NuZ1mWg3Dnx0e5ApoBVGrO5zyQqUSmbM3YzrpE+eUPfVFhxMBVuzGV5Dr30i?=
 =?us-ascii?Q?Yqsyf2XmIAFulzxWZ336s31PCA4kkFHH8crRTK/cR+uLZ8pW27Ly585FvbS/?=
 =?us-ascii?Q?yeFfcK8xrg8N38Cz5kLWlaBAtXRiEfYd6iZrkkEnDcJBDsGWsYietWh0QCbd?=
 =?us-ascii?Q?Euz1+E8XvJUQyBun8ppfrVQynR2rVs1zhC0j5OPw2421b1iEcNWJ+e0H4dE7?=
 =?us-ascii?Q?MdSW9Ld/jv3uTbm3Ejv1rA0QiMdN/Ueq+LGOQyGCJMKtWQ8rDZy3vaT5z43N?=
 =?us-ascii?Q?qHxiUUBulq5Dg7J0WXp9gl6YoubslBoyN5alQxmLmoC/NnRJ3T/bLGtMgS43?=
 =?us-ascii?Q?Sb49M5Y62uPCPMiGOi591M8UdYTlcUEG8AiW1JunKx+CyT+IoXnW7UxdX8Od?=
 =?us-ascii?Q?DBOMPAjU8PBIl1xg0RCmvG7z0tc2wtuhzFtrjE6QkkYwnxexN3xglOiAZJur?=
 =?us-ascii?Q?0LCy1YXZn4l32uxGwLGuiBKRw1eHiKFeBxrOZMiM6BZHfF3e6BDtHpfMz4/J?=
 =?us-ascii?Q?YPcDreOLgfxfoyH67qI7GZ/yStMYLE/kz/GMz4SKZvU/uNoTZ0sm8skePTX5?=
 =?us-ascii?Q?pnbtrc2EsAHekIoOHaUwYnC1SaWRONuMDoPN2J99c9bWUdhCC3bJUomxkxp4?=
 =?us-ascii?Q?GUYYSjrUmAyfZLA+RuCcpwrPfoHXjBPKWRx2mVIjnN7/GjOHV37q1BVLzBDC?=
 =?us-ascii?Q?BL7x7reMi2XIem2S9Qis6jAUGo08HN8K8BdPBnUO2kDN0Z7883jaimeBGDdd?=
 =?us-ascii?Q?IQfIbhPpzY/EoyZleM6o3Ko849SeJRNd/E8mR97Dx5uigFZrl8CXYsCknSpv?=
 =?us-ascii?Q?zbWC21EXstDuF08+ETuIZPG+aFDmlPNPTcmfwL/gdvjBuXjPTgVwYgAGNwrB?=
 =?us-ascii?Q?5H8L2DfVRXHBN4wIdem+cPjtNiwY1QWJmLBK/nRdc6N0co6ZYG7wnDuntuyA?=
 =?us-ascii?Q?+3EIEvwpaBzUxqQHbm4dYF8iCrHu38P/8z+fTHe+Q7jOwtgmv6g+SXTwqt+m?=
 =?us-ascii?Q?xykORoDiKccP8iDunMAG45CwzCO7Ea+kh1qd3y2P56YMRyFpPmEtdhKsKGCI?=
 =?us-ascii?Q?a80k9yACilj76t10VZDVW/KDsXfYMcNTNfBOO5BE3pkRejQCQweFzBJMn5Um?=
 =?us-ascii?Q?8t6mceY8MWiiVTx4knjwpjbwh2JBkKkl6XgBfrGHUxXSlpReqCzaXU5rhjw9?=
 =?us-ascii?Q?+2M/TIz+3dxfQFXcQ2BkXUHWofQqxPT80rKiY8OfX5ik3p37rmw7RKt/qDRo?=
 =?us-ascii?Q?G7EwGFklhGkP7UlUlOenmbFw5Qbic2NKoxcbKygKoxw7wOoivEoKEsHRynMJ?=
 =?us-ascii?Q?aub6kiQLCuHYQGY3P+S1kM3JxgCHxFkDvVkDC71SJq6H0vMEbsZdamPkFMEU?=
 =?us-ascii?Q?6qOxPto7/pjLUdrxG51YpWdWRa+0x+6nToIgFKbjzyzwZ4oqtiLbyHwIoqRd?=
 =?us-ascii?Q?rnP+VAV1AwZJMDKwYJ/qNqHSOhrRa9yk36/TSgsQW+Wmko3/yHQfSJS//Mn3?=
 =?us-ascii?Q?IRMGJcgolv5Bt+SUeiy1jQRbOJelGHMduD9jb+Yt13LUclKqogDvnouy4AiN?=
 =?us-ascii?Q?U8A9edo+JsR4RRtNJBynxxcyGa5viL3l8b4DEXd8chqkIrh0V4jqcDQP5R6g?=
 =?us-ascii?Q?7N7YORiVZCtMtPhsHUT6RV4bO8oNYW4UOefHqSnt6duUEJ0s/omv/RRosvWC?=
 =?us-ascii?Q?QDNMhwBmJMCAt1fFKcAozxd7tJf14XSQ3v/O9wjyqk9P4O4azoWMntkuxGYa?=
 =?us-ascii?Q?dqqSvDZ/kwQUqdQK/FzhK/wY96efpkXERyrjPqi5SexcdoWl104i?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81bcafb-f2c0-44e3-8aca-08df46637bc7
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:35:20.3360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y23ameMizAKggOvuP8cCPZ/C/y38xoqUV6pytlyDy7pKI02wbvqJANDYnaY21i7Psbzt9wqiGSg3jWoxCwKHsVKPbHx5QnoC3j4gr4RHkJJ0NfQfZN9mD9grOMqxHN2X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10422

Add suspend/resume support to the ov5645 driver.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - No changes.

 drivers/media/i2c/ov5645.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 6a6ebcb8f4f1..437017ed8974 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1234,6 +1234,7 @@ MODULE_DEVICE_TABLE(of, ov5645_of_match);
 
 static const struct dev_pm_ops ov5645_pm_ops = {
 	RUNTIME_PM_OPS(ov5645_set_power_off, ov5645_set_power_on, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct i2c_driver ov5645_i2c_driver = {
-- 
2.54.0

