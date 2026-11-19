Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795109694;
	b=rARTb71qO+DYuAWLjwwSciYlGjPVQ1LlaP6oSpG9MrSvcC73Wty84NlNIR+gJip0IVFT
	 ljNxplijI4sed11YPjaQ6EJDrY5cx7XQtSKUR9CW9dusqZDYgLdhKd0mZYzh15cc0O7xT
	 lTlVovMFeiQSlX3lZdu/kDDQzHbe5BFV3TrSFQflJXR6uMW5VSSJUii4kHOU4O3nT1TQY
	 s1YV2U5FbqvqKOLgytxEsQSmt2e0EXl2TMHvH3mjBi6D4jIFp9JgZGff64VxiEGDjj4QT
	 4NAAX0xS3iX/4Bwn7BVrZNg4hBVFxnwNAvTevYlrwDLxiWFPKPKCz7KQSkNYTXyV9Og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109694;
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
	bh=YzwJCvlyMFs6PqozeYM34OLAe9TL0O/EyQOOO4DZbs4=;
	b=5ChV6sp3oCUZLK+mO4sFF/wajm2sPubMBtpSOWvBJDmuSwn/H4RZsMkS+mI7EnBOI+CZ
	 qYfqRLJfLUK7I1/KRwjkaty/JwgEtwTbc4SuXr5L/UHJSnMzYdVUgj+Uqj6bI0gJw7D40
	 iwQeyAGqm5NnBe+ceMgQwdS1heKv0KD2TCNZg5lBp58spbUslVRkVz9smupW6OHcMXaw2
	 n+iBY9rraVOpi0++MHlFLPAT0qr1nm0+/D2nKOfQZyMHmXRvErJr3mRpBKh1yFC1Il4io
	 SnAjkxwKueekhPlaIiLqSuSwPBSMJxtzJ+eXj5D1sixUUm5mnQFd0G30Ej/BIutYA5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b="kisBirA/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.14
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010014.outbound.protection.outlook.com [52.101.228.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355D2606A324;
	Thu, 19 Nov 2026 17:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 355D2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=kisBirA/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNPYWH8o7X/GFyjHg7Mmih87E49BsXzQFIwwlaGnEXb/8uLdNerP9g9aJuHCXwP9XbvAVCvfpCkTbDN6mK1g/gH4modW1yTM2Q8ZCRep8MTL2LJTmYJgegWNZ5/sR0dSD4JmAqP6bTbAifU0ufm4CmZ/nOJVWpmUK1EuFId48fIcTBKsu52gQpestzSYRrdPJO29nTrpiCakVIY2fvQzgde/ts3p+Q4yu3knttP7NC7yG+wnPSSkGbCADkpbi4uqUk3h0sa93K1KrxI1rWLAv13ekw5HpcTcA5hrD68mQ/zN/DLLZtRUo/ai4hUR7U9MXjhZkk3yMMN787/SqPwn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzwJCvlyMFs6PqozeYM34OLAe9TL0O/EyQOOO4DZbs4=;
 b=yl83wvFyteSJyCH3Heshuq2QLsdTXSQ5LHPG0zum1SB2jM/9YKpOUFC/UlkEyurvVQMSXkhxhvZS1iVpgpshQb3dnTTHfeRdjThzEfH0hcliiueZfAIoquXenEoOlv3kW/0WNF6Dz8CbJB457F8rxl7/xiWPI6tTfi+HNO8IQdKZl4veYurWqyjDMPejAUfGvEuQ+Vn9y22OJewctpadSLDA+gmtxoHHzxf60MTJaoNscXXFInn3qz4JV5BU9j/jbLecFU3A6l1KZ924uWzP0TAdhCsUbFKDZYIhAjci9jzcrjpnZ7eBEGGVYhWoKb4vcUH4ZeYfaUXifx3Ol/sk5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzwJCvlyMFs6PqozeYM34OLAe9TL0O/EyQOOO4DZbs4=;
 b=kisBirA/K1CMy+z/b+FeVTMWi+7iDTFDbClBrsRZ6Q2+lhZG3L6MW7HcqEpPUWiUEKMF6QMi65xUMoQ4u82lovMIFp9fRXNJ2vPoKLo6+YkqWtWmZc918V3CszyQpZzBEizPBpZ5a1f3iZyUOaj1mlPq+iLDCoxXZ5dvYqEP6vg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by OS3PR01MB10422.jpnprd01.prod.outlook.com
 (2603:1096:604:1fe::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 17:34:51 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 17:34:51 +0000
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
Subject: [PATCH v2 03/10] media: rzg2l-cru: csi2: Add device_link from CSI-2 to sensor
Date: Thu, 19 Nov 2026 18:34:06 +0100
Message-ID: <20261119173413.341658-4-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 41747ed3-edaa-43bc-454d-08df46636a99
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|38350700014|56012099006|11063799006|261021121427099003|261009223027099003|10067099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zBdUNT91dgDDUn4PjGB5UUm+atQ9pblSaKFijmcW4MwQ1gGMPLuXGmwF+UYJ2J2TbwJT1g/Cw0XC9s0Z0NFJG0kZHJCI51Wk5kysozooVDdo8/n3q0Kj+iTamZ9FIyGG8ubc+d2dcAtPy7WsBwWvjhaurAj7LdcrJCC3iT1BKvqjfv2v4CTyfwu3+8AjaihRpHfcTx7WyDIuerRAeHl3FzFkSQGbm5AqFk+eghZtlJWshwyLhYROoeznfMPfZR/5cK6kACeZGScnPGI7IJRhCx145Vuup+EHnftlydMchEFd26WiOUl7jdoEe0DiIN0D9nF5c+u5bx3bmSelBjCc+5K6Km7jyM096Mvm+UZQbWJE4x9YPJ0+UZpeamN9HphMN8fD+7bRymRLuU4Mv/nHFdsZAmz5wcyDHFQgrP7c+qG4TVB0pHDqP3ggUucd+60svGEiJJeHdLiAi6lIFWZmN3VjaDrU9mVfetds13h/kxF1jb2NZniNFPtMCalcnrjUhwInjU6Sf2q5hm+U4E4Zq5ooutyU3b9D4CoDANoMVTEMDCywVEDRTYhmyzqf9YhdIsOHwS00PI/Yy/JRVJ9HKrLlnFvW0bD7zM+/0/e1E60OufwjyN2cxFl7Xw//4QAUlsTzs2Df8rV+LH5qN0WePdoCHWL22eXt/G327TLJb7+E04+M8P9rz6XxQZHN4ZxK7HRJFZrQdclhZzeO8A8pEPWLZ9xaSL56sYzNR/LngoY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(38350700014)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(10067099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8M7Ku5r0sQuAL8pzwPComz8Qx2EQCBnsEhwYHpfzIz59tUXGTb8H0w8kgVzW?=
 =?us-ascii?Q?XMxo0wRk6RSifo5tMwYLNAYn+GeAozMdkGkxRN2+24cKnzrxrRPgvQlEaXgf?=
 =?us-ascii?Q?nDY3NCnp1sBwdnCJK84eUHjwgXfda6bGUtJA1iXP7CzHc9OMWbeMFoYIKI4G?=
 =?us-ascii?Q?1J4k/d0DufIU12jBtx/qtXqwGH4wZg2UDJX7VNayIOenTW1l5DLhvzf1XgZi?=
 =?us-ascii?Q?SuEwhOkORVa+5akepfiymJMUXqEDgQOpwtU3V5YfLLvjt/Gpyag9SItC7Hqh?=
 =?us-ascii?Q?Z3K4lus7QSHd3LQdabnsNBcnMfanEnnJ3VLEA8+mhjbKb0bO7/eDtkSkQLYd?=
 =?us-ascii?Q?dvs65th3vDTlgf3arZVRrge1uXSCSZEs9Y0qNzEP14yn9FAUfsxZb2xc01jC?=
 =?us-ascii?Q?SwQv3YkHYoupd1xo1VH6S0svKiiLM0aipp8PfCvXTr0HpLJxPxNaSBfZfDJb?=
 =?us-ascii?Q?sNfNtTO9poN25qRMkFfGtNOejVTgC7t3KJUIILx1L+BNPSlWxBb7lfsymvoP?=
 =?us-ascii?Q?ioDFkbgLdkpkagHRjgtNGXZDsIb28FAiBPvan7iWJ3/py9K5whGN8Cb6wRLR?=
 =?us-ascii?Q?2Vz850UeCTns/gHKEWHqTGTd8QsEuZLkiVJRYAknsAPqhqM3C08TYmHiKbqs?=
 =?us-ascii?Q?/9t7un5WvxoHs6W4RSv/xLygCEuRMYsBSQwtut0rREA3sdV86qPAJ/TKPUru?=
 =?us-ascii?Q?svx3kY953OyVR+sal5cwAIzSZkZaBxk0KedC14tl4coQSO5Mf1teE0dBI50z?=
 =?us-ascii?Q?HUJO4RsEbzxaU4QDS9iRjJ+pQZSBesYBCQw5YAIyZvH8mxMTefsYJu8X3feq?=
 =?us-ascii?Q?rxsSkwGoh4fgKhpC+e7Br5ymD3IWhTHFMmHXGr/x5LwqobTAVNsJLGM032ve?=
 =?us-ascii?Q?9tHvcrv8uBrDTqBbfQpj0qO49N37iyxlOu8UWtQUb3ij5unlUSyfV1kTjjPH?=
 =?us-ascii?Q?EMzJ4UYxrIPlAQzvRGfqUz6PAQ5acgw8XywiGyqv0qC8fTg3mP4G0Acra1vB?=
 =?us-ascii?Q?9VUGkFFP4GU/lBHxDO74azZ+CZV4ImD7ZSmei9X9YAbHoZN+cZN98InmRd5H?=
 =?us-ascii?Q?vKWJfTyehT2RgiSL0jRdB+69/ZH8qmbvtUMdXcz0ebTqbcPUZyuCI7JfKalB?=
 =?us-ascii?Q?KUv7oBrHoSaCpGguzv1IcVVyzG9yIKplO6ObM1ZWcjB8vMQEV6CVH8L1nt5f?=
 =?us-ascii?Q?V6EgWzUxdzJIMsgNj+0XPF0WVGcGdQBKNSp0c60tcCiNptqxa5pE1l+rrrFM?=
 =?us-ascii?Q?btxL+vyFTqNlKDhtpcCCvp9RTQNLoPfWzSXCaiCJRfCqY9Ult/dLH+0DTTf9?=
 =?us-ascii?Q?2sqTRqI/V9yqcEg43NwdQwgGKxIpEkkwucuQ2HjkLEEdeK+epvTOsFM6uBLV?=
 =?us-ascii?Q?qOhHNEJ9OzhWEuKKE6+ihm4fgfpqxpY1wlrWau5+lvWCU1bbnUzpoGr2SbSQ?=
 =?us-ascii?Q?nAxcXNOaBKeFJ8fkwBfB6wDhHqiXtCiT2xMXTUmi4ry9X219Yozy7CXU2Rh+?=
 =?us-ascii?Q?AGqy1UnDJTYaD9hzqUUni+DzsxkDA3dDaT8srU33Du+ieLDMlhtPRtwTc4UI?=
 =?us-ascii?Q?RWwneF5V1VG6oCNcvTbbxqBFl6K8klJJgKSrjLr83DwpR6kG80HM7sGJ6tlr?=
 =?us-ascii?Q?3SSBkFek9/+XBzdrEcIbp42NFrkcPHELi4MGDjq9yCJid6jRuZPpK8Me9J3I?=
 =?us-ascii?Q?QZ5a6BTnZioPw+NMCyPwUXts6dDRbY12+3i7dFCCBU22LGBli9/cGmKichrL?=
 =?us-ascii?Q?gHV2XYAzbLzKrrQydWDsUMmr1iqxEdkOHDhmu5WgyvDbLGPI0e+n?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41747ed3-edaa-43bc-454d-08df46636a99
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:34:51.4940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NrJVJwCPpLh0pzGGdqG+TCuLr00OOgcO5rjhbP1TKi0MBw5aZ38je8OSgqG4A4vGq81DCa/+nKHTlcGnruDKKMMeWB9nq12seBLBlKzkrcnbRy8xRMFkumcXxykXKPIf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10422

The CSI-2 receiver depends on its remote sensor being powered and
configured before it can receive data. Without an explicit device_link
the PM core has no knowledge of this dependency and may suspend the
sensor while CSI-2 is still active, or resume CSI-2 before the sensor
is ready.

Add a DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME device_link from the CSI-2
device to the sensor device when the sensor subdev binds. This instructs
the PM core to suspend CSI-2 before the sensor and to resume the sensor
before CSI-2. The link is deleted on unbind.

Move csi2->remote_source assignment to the end of the function.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Added DL_FLAG_PM_RUNTIME, as CSI-2 supports runtime PM.

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 64650dafb22a..860e989e8706 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -774,15 +774,29 @@ static int rzg2l_csi2_notify_bound(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_connection *asd)
 {
 	struct rzg2l_csi2 *csi2 = notifier_to_csi2(notifier);
+	int ret;
 
-	csi2->remote_source = subdev;
+	if (!device_link_add(csi2->dev, subdev->dev,
+			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
+		dev_err(csi2->dev, "Failed to create device link to sensor %s\n",
+			subdev->name);
+		return -EINVAL;
+	}
 
 	dev_dbg(csi2->dev, "Bound subdev: %s pad\n", subdev->name);
 
-	return media_create_pad_link(&subdev->entity, RZG2L_CSI2_SINK,
-				     &csi2->subdev.entity, 0,
-				     MEDIA_LNK_FL_ENABLED |
-				     MEDIA_LNK_FL_IMMUTABLE);
+	ret = media_create_pad_link(&subdev->entity, RZG2L_CSI2_SINK,
+				    &csi2->subdev.entity, 0,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		device_link_remove(csi2->dev, subdev->dev);
+		return ret;
+	}
+
+	csi2->remote_source = subdev;
+
+	return 0;
 }
 
 static void rzg2l_csi2_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -791,6 +805,7 @@ static void rzg2l_csi2_notify_unbind(struct v4l2_async_notifier *notifier,
 {
 	struct rzg2l_csi2 *csi2 = notifier_to_csi2(notifier);
 
+	device_link_remove(csi2->dev, subdev->dev);
 	csi2->remote_source = NULL;
 
 	dev_dbg(csi2->dev, "Unbind subdev %s\n", subdev->name);
-- 
2.54.0

