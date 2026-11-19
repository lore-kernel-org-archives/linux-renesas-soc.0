Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795109691;
	b=yI30bCsCZrMj4xXH4HdzCHOULhV4Xbnlwij1f5P3MM9zldSp4Uy3BRhSFvn3CheZ6/lN
	 Ul2aTDB4Nk01n5KVKE+lKO/tsxXsBF0sFMhWXr9u50f3LCBGGPu+npq5uTxhvcpyd5D/X
	 oqh2ySYEJH9aFjzCWN6ykMZUj2d5E9tbO1D/j93REdgdynFgxfIeaD0QSTuBZmOTZcDQS
	 Pl5I7jJdeJBfAc+YmpvnDXCLeeE/+WaubX+i0l0hiqIklRNED5LB3JbXpVGo103shsLIf
	 Q3hco3tCYkgofXrHxmkCEKw8Nim2fq03WMUU/SxtiT6shJjEM4ih7DcT1GQEo1An0mQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109691;
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
	bh=S7LQ1ApqPe6nyvp65GxyxYp6FpedaoCLdHMILyGxOjA=;
	b=rdG0Q39w3Tc2LEZ0NqPQ75x7sv019Fj0KOD4QBCQzLWOx2bUlDDgqTRnIrM8Z9ROVQ1d
	 il03A5fKmRhJHKoE5Dmgl0GIq8vT93fmlUMx6VPLICgO2ybTn+mf5zkr68n9sNKX5H63k
	 H5iOWdapxzvUWvoCGFJKgWDkeh8mZ0d8vnTKlDtays5CG1E4VY5pAba+/UrlNlcTKhASL
	 bPPkFysKC/NSOdD4zyc2sDnnJZziROCQg2WGYRE+uVZBJnEv/D+yYpux103NOc7oG5PRc
	 EtTBa/a/x+AiApWck/ivvaxsh2Wxt7ShGnC7Qf7LrmlI4zx1sJstSvAObU07OyntvOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=JATeNnG2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.5
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1AE606A32C;
	Thu, 19 Nov 2026 17:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB1AE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=JATeNnG2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXDc6mgzY574lcAeecBZJCZ3VeQ8TUExrsDrE44VrtXAeYZQ7XkpgF+UeXfL2pqnehKFsF69asaxdXcUTNKMQPthW1zNGzXNrX7ZbEYJIYEPuKNxqeSFdu0JRZQdkiNKkilOQiPAQ2r0N13fTZaLQdTgkpNLVNKAPiY0hhbnswShxSIsdLInkdTAbAkNnC8RxfFx7Ihpud7p5ffwt16sobuJlWD+RMcO8NsmTqK8rtgy95PhrrOG8wwKUzotN2pecb7qkzp8Tzciv/2w/4gC8JMq+J7v7HWaz7elizNx/tWkJp/bMRU//JtMUFUTPx3vWVK+vdapdUiUUB+cA3OkXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7LQ1ApqPe6nyvp65GxyxYp6FpedaoCLdHMILyGxOjA=;
 b=NWyFIkmye5Zg6YVrSQkQnAgE2N98IsWnxPBZXVYFNX8sqlvCJYqTCl/8m29MbrxBBrilEh8p62DwbqDZ8vAJ+0ZXuU3j/nUWTSEX4GgWsVMhiQANZMhbdqoUH+rajV8wFttzvx7qX/TyfdrWPrQ3lRO8BGqrZKtnxUpFVw5wvgB6G4NX4IxHPUy3yVmC9ItCcDsnR7bYVUe0FsPlpVKYu4oxXwURe5rEAlvEsXK0wjrEsdrub8URN9YgAcGQyqytq8KmsF/Mx96ZfgIZIUTL62PBJ0CXNU4vRXR9JXsizT13V1t+sYlxsU0h+s+Nz6/h1Q60WgslnKeb96vs7BsQNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7LQ1ApqPe6nyvp65GxyxYp6FpedaoCLdHMILyGxOjA=;
 b=JATeNnG2VntKAT8/NLH880+Snvn/m/SjyOn1LvMHCCpCKl9sriqCOBxm7Dr6yL6B3Njegw/jgui15emg32WDh9WoDeTHi7ilXxLv8eXLeJ4fLR9lxEGU9S/VdeIkI5A/virqJAeR59nngJ+dc5357famzk5fGh7a8fVfmHyvOUw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by OS3PR01MB10422.jpnprd01.prod.outlook.com
 (2603:1096:604:1fe::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 17:34:45 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 17:34:45 +0000
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
Subject: [PATCH v2 01/10] media: rzg2l-cru: Drop mdev_lock from async notifier bound/unbind
Date: Thu, 19 Nov 2026 18:34:04 +0100
Message-ID: <20261119173413.341658-2-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: f7eb046e-712b-4183-27d3-08df466365c4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|38350700014|56012099006|11063799006|261021121427099003|261009223027099003|10067099003|261102123227099003|261026140227099003|261022105027099003|261022075727099003|261022115727099003|261026121527099003|261028144727099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PrJaOcaExlMp7BCl1SWLqL2DooGUOya+obpi3heYU6bErbYkda+Lwue02yiE9B6WqxuXSmr4Rrb8/enOWVypfLjPtXKn/dAk18qmkdIK96MC3aenFJfIIFGftI9VWLCRmgjWUwrODAppqW1OHWjbQ+h77McHsi1cgbWiVHqfKjpBTy+E8heuePd+SITlnC6lL7LXLJ+X3Hmrm20zVS0ThaqmQJP/sd+nbqlqEtpA5aHgZ2T6NECWUMmeqyqP/8GAwZhPr4+2eeKkUMX/GRptpt5N6IwhhV0gIoKnKGtftXehM0yRJJSYXnZoFI5dMkkg2f6vUPydcYiVueuZhRgcy72/5KBcjE9GW269HyggcOETViwxoLXosTpq0oUIg0mOMva8G9jZjhgFQQ1159cN6h6bQLdtB4RP2E3mSbFaxHIrzQ6qOTAPkcUoWR/ARW1v34fnDwybzsU6jcFe74+OZ0GRhZ06Y0fyes5CIaHfzfNP5/Br3Y3ZlPOssyip+B2C48LI3szvW/8mV2+EUciyBGcnvAI9pgDr+GgGKUxfLKw1FCvvHBfzCdtoP3kOOzVmkMxLrpci2ZGnk0avm6UzGgw6VdBRIHRjoZFpPo+IPoGcT2nqyKqWEWZRL0u2LYjgtma8DbDi/GTpRHM+KU2yS6r+ET/4Y9VRtIieiQ3RbBpPYc32sw+cv/dHEPz4DgWKkzWm1qmKismc6GaGl+ctH6+yj9cPautZq3+t+IFlVbc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(38350700014)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(10067099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(261022115727099003)(261026121527099003)(261028144727099003)(261021123027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+w+0kK/9n+aLTvW8hkVgnxK2oH8G+OuNXzRVgd8U0UtM8l25u8Xl6E/k5iSS?=
 =?us-ascii?Q?VuOZ6zTvGgo3+68VKjluSq2iIySI/Z9fIJFrAZTfWzQnltxp+Oh7mS4lbbKh?=
 =?us-ascii?Q?Xfk3FurtNINsCtdChTTBqTDYc9p/Cb7FEJCyW71r6092jCFy3mMChdfe+U8I?=
 =?us-ascii?Q?Zal7HR7Vbm2jUrYdHsNXBv7EcnbACSwxGCCFs/ngh3U6olcBnxAS8wip4Q/C?=
 =?us-ascii?Q?QfVaIE2xmUodCLprvpSCOxEE5D3NvMze/d+5Cg46/SuF/1JdGpKTms3nGAiP?=
 =?us-ascii?Q?74wb19All++qCaS3s+lf2UnwrG6JY37ElEJ4h0zHRTpldjkalsLwgbGB7EYM?=
 =?us-ascii?Q?iJEvs2QkGJ0uQ3ioNlpzign15nrOH+8MxucvH+OmM6yNvIAjpYBYln9Y21+2?=
 =?us-ascii?Q?NNvLsv5F6sTgLp8cYwzEoTysk1Q+ILRD3Q71DcpwNyV25BJ0O+ZFUD7fN9+y?=
 =?us-ascii?Q?7aeO9p6Kmv8HNBcPlwYK3lRV1QFq6Goo4y7zrv6+Azb7xJyolAyfBSVkOItZ?=
 =?us-ascii?Q?EUmrqaLjBYQkQc5+lVX6lpLOLt5ZgRLkABab0DIoIK5MhZ05q47OkS7+z8Vh?=
 =?us-ascii?Q?sxIJlqWwiT3AO/8qKaZ+jqBvCySH8xZH3WndRzu4qrIIZheT12XO406YL4GH?=
 =?us-ascii?Q?DV1qeLOGXZtEV26z69SBQLsGL5Gg9l+/nCa9hP5eY02oE6/oqMhwGaYBwjv9?=
 =?us-ascii?Q?ARx+Jn0HT4reSxQQ0vwmQoeALSM4HVDtQk+CMHZUAfytwpgxERrX3OQ5MtHZ?=
 =?us-ascii?Q?EFN+BsSirXqLlyPKOM+abpPV7uNMmyJxtq5DLZo9v+m7OyGxTqRTi5fXz+1r?=
 =?us-ascii?Q?IKJTrXTcK6Jqvv4o7JrEVIgyVOkVA6kXkLq5akx3TkNpOkmLU1DN80Kh07sY?=
 =?us-ascii?Q?3TFvzBmN83O0z4JUdp8Egk9Bsma+zCQD7Ge3Efy7R1xSi1wuIF3bYS4Bf6N/?=
 =?us-ascii?Q?q+lJbwLmXNCPAOTS9fw2CCq2Pz3FqppiGfYo0GhvfGBK0f6h4qUgyXa9CP2e?=
 =?us-ascii?Q?dMwNZwraFkTzqIaabQhakZbFzm7hJrNMIPwnJgGDOfECtFHb/S75MimgPO6s?=
 =?us-ascii?Q?k1RExWu1gKAnqSQS9yHcJkb+cRbyMt4VZawY8A2/V0K4gigBKi0lUM5x+JJK?=
 =?us-ascii?Q?Nq/DnGr79Dpdni0nOp/34T0A1jOPhz4VUau2cCnDZAtGhfGL/b0ScvI8y8Q+?=
 =?us-ascii?Q?5GLiSR68fNWWGvhEXi2KXFiuI/z37FSl88OwwpmMNXIAcQ7WltZ7lYQZe//l?=
 =?us-ascii?Q?ccqj2130E9NhgEsOveyRd1zqoAuCEQWezTRiahyHPqJUCDBb7jME4ipXSqTN?=
 =?us-ascii?Q?73li2BvgOOUJ1kHDjFXgcQIx1vUPVEtNJRARO8mNB8HIZ1G0z5DZaRKykK5d?=
 =?us-ascii?Q?XOMlAe8YyRGKo+7I2tNRVHKg30FC52AybnujtIwrE+MLx1YLpGA4xU8I3g5A?=
 =?us-ascii?Q?nmaARYi9vjFC1bgr7paeskCUbvSwuxiM1IvDMOeGbtRgRKjtE5FtPmg7X7pe?=
 =?us-ascii?Q?rcvIgi9ZhOcok1elDzkZ0DR/ro/X90WnoxeViAr+JjNUqRQAOvJ9AeM0cq1J?=
 =?us-ascii?Q?2TK8Gsc56gXJz/W3PVYANW5orULxozSe3szBLl+aw5AYlXvQya3p+6I3ojqb?=
 =?us-ascii?Q?ZJfKso0TCvvSUAYayLH/A8apnwJUmQjB0914XApYdoGtlqEyt5nQHpRU8Gv8?=
 =?us-ascii?Q?j6i0ALrHNCVYuLO+0/jo9eHYnfEtCyZeFTeqsOUATUxJWUb5YloR9EaElbTb?=
 =?us-ascii?Q?VFfenvU2nxPo0U5y1ClU55S1AQahtYa1NEkLM8zQOImZbzPheaeg?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7eb046e-712b-4183-27d3-08df466365c4
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:34:43.3735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1mu4EqyagSa9n3b11kHC3ygufwIinKlc58e6kcHIEo6E2DUF/CHRgzg+g2Ogq43zPx/vcqBpeC4AvDVmC+JYLb0N+8ixUFFWdEzGiV3uGcrjsVyAOm2xEa6MN2r8aIu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10422

The v4l2-async core already serializes the .bound() and .unbind()
callbacks of a notifier under its global list_lock, so taking mdev_lock
around them does not protect anything.

Drop the mdev_lock usage from rzg2l_cru_group_notify_bound() and
rzg2l_cru_group_notify_unbind().

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch.

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 8 --------
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h  | 2 +-
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 4083ce189b6d..0609f381091b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -97,14 +97,10 @@ static void rzg2l_cru_group_notify_unbind(struct v4l2_async_notifier *notifier,
 
 	rzg2l_cru_ip_subdev_unregister(cru);
 
-	mutex_lock(&cru->mdev_lock);
-
 	if (cru->csi.asd == asd) {
 		cru->csi.subdev = NULL;
 		dev_dbg(cru->dev, "Unbind CSI-2 %s\n", subdev->name);
 	}
-
-	mutex_unlock(&cru->mdev_lock);
 }
 
 static int rzg2l_cru_group_notify_bound(struct v4l2_async_notifier *notifier,
@@ -113,15 +109,11 @@ static int rzg2l_cru_group_notify_bound(struct v4l2_async_notifier *notifier,
 {
 	struct rzg2l_cru_dev *cru = notifier_to_cru(notifier);
 
-	mutex_lock(&cru->mdev_lock);
-
 	if (cru->csi.asd == asd) {
 		cru->csi.subdev = subdev;
 		dev_dbg(cru->dev, "Bound CSI-2 %s\n", subdev->name);
 	}
 
-	mutex_unlock(&cru->mdev_lock);
-
 	return 0;
 }
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 2c192d370dcb..0bab2cb12a61 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -102,7 +102,7 @@ struct rzg2l_cru_info {
  * @ip:			Image processing subdev info
  * @csi:		CSI info
  * @mdev:		media device
- * @mdev_lock:		protects the count, notifier and csi members
+ * @mdev_lock:		protects the count and notifier members
  * @pad:		media pad for the video device entity
  *
  * @hw_lock:		protects the @active_slot counter, hardware programming
-- 
2.54.0

