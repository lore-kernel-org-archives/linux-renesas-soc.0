Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D5947B429;
	Tue, 16 Jun 2026 17:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629615; cv=fail; b=Ch24q1snKi2F0V38wxwoLw+J1+rX1/2D/9DuB1R7O6LrWTzx1jwaC9xgrcfOdkWHwT4C6cPlu0GmJYtDS/ZBEVx39OmitxVeXbgi2KurpGA8KBpgNZk5oZXst/zY1HGRazr4PwTd+ffu1xj4DD0Rc3MyWVv/lJlPQHHprg1uZrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629615; c=relaxed/simple;
	bh=UxcobB3KSaPrbzjXzfN9w1GuWo8cgIU/b5D/I5OLQpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ev7U9uIprXdw+3EWzrB+NbH4ZEdcyaDzdK+XSIvgn0WejEGOhtWs/YTX8oD7d+uhIRpyHJToDqFLwmmpLHtlbQNSe2/eOYS4dH6NbgcXtEjayvJFnOp/oQkwjNweuO2ZazZjmNe4T4quanEuHTazf67osGwFUYgQYn1aXWGGzo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oP6jtYmm; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oP6jtYmm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Woet4aiY8+n+wISmuSHcJ3U/njSOvLIlCWtAaYSGCW8giv2WDYvbVjvFAID5i0Xh6m32n3Yq/QCOZi9ccTJ8qn6gVtO+BvI3eke2T5N3LiouTSmzl0temVyGFWXjtjz8nST6OFTg1ax9kOkBAOTdKMt2dDcSL37gtVv8+1/Lz9jUZIXUhoJashckUbj7bEbfoszFY6/naetUrN5QlILPbmh7jy9gFg3gk8QJHnZtCO29RWDAppo7DnP5ZJqRTC9aa5RGbBdZ2hqmcEyUxB0JH8alNfE+6lWJdXAwtJag+1mnZxQ6QYxQf3O/Y/AH3s0dV/W7u8MxhYkaP0tVnyUI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+k52C55LhVCFj0g7iyXrq4nhBwEbAWSUPkCQP300uGM=;
 b=KnJf0j//29uiezRhkCBktqDcdM26JaDGaX0Irfto9B3uK/O1EY9+IDV3NXkUieBF3ZF4g27xTCG1jVeX/mgB3zeqsH0RLFiIqqGos5o92Motwodn5FDnDasiV1cF50TdAKpE4qDf3lTHgbMQ7o98NDbdFdyw0i02Eknt0cGqc+gitmYr7bILHD/qxETkXQqsj1kdu38RtYYyxn4Oq7C+1fNieP0yqV/OF8YL1ZU7u3DLTxYOiL4XnLiyXSGI/ARRANHBQQu3oS5y5sLBm79jgu/ToWMkTsVahwewhggUjc5YLgbaEszNdnPpf9Mcye2x2z/18Qs1aYYobJGlOAHrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+k52C55LhVCFj0g7iyXrq4nhBwEbAWSUPkCQP300uGM=;
 b=oP6jtYmmvgo9gUnEWteGiM0DK2VVluONarG6JosPsF61imzajdwvfAVFOEaPww3xsUXOd8OENlKW0izzs3rJDgfhFhzay083Tvia4TlIQ87EPpmir3oAm3HD+AfNtEM2/rSUdPwMxTZcUkZiGq8ht9FoW5mJ/zrh/Se6KUsPbm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB9637.jpnprd01.prod.outlook.com (2603:1096:604:1cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 17:06:52 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 17:06:52 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] media: rzg2l-cru: Move active_slot reset into rzg2l_cru_set_stream()
Date: Tue, 16 Jun 2026 19:05:35 +0200
Message-ID: <20260616170542.447804-6-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0393.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: fbfcaf25-9989-424a-7856-08decbc9a8ef
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|56012099006|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Xx+3w0i2aUt1Xhtt7SCPUna5paUCZ+7GreHIZLCHLCtZqtmNnvXTjD3tGEPjE7/IZBk/vwcLIHVcprUO2y+A41iNPsda6o2G/LTWMlp2h/anhEGjhG1ZmMzqGC5csCm22axgM9yPJhf1f9M770J4ISDrSb8tqPuVrUI07HAUTDt4999Yj516FXlHJ8u5pwP6b+V9PrOJRGeh1atuk0d20kyecsReLbVZFzirrpaZdNG3D/GBgBkk9+7D4BrLvJkj6o8C52YknCukuW21hc1krTDrq0xDZNog2GW51CK26uUyaXUqzmPpfkmkNqLrKBqJ5DwY9aYqxKIHRJfLujr4CEELd5xmle1R5BF8bwozlGW5ph708PaniWgCz/AapeCJn3zyN1sPa6tWSvvqugfhmfNlL7z9fczeoHcX+DwtskALCSLIlPtvSGlAraD3Oz9fs6Af1zk7NlHEWHwZqA0Xn7+AQ9m/Gkr2LNnBX1Tdbq4FiYo/Ozv37P+CVKGNvYx5oBk9uwkZAWK+JoJxiKVuWTH/y5l+NWIjUTdHW+pWTd4lPdI+r8bPTlwraKXK64qRa3CClCRme/78bhNPI9Ts2xyzWraBPTX8z4J35E5wtpc++HxjMXhfPPA7gX2uYvgAmWTouuZk89IFvcQeiNpDDOQqGFma44+WEZkj0MphT52RZk1eaf9BGCNNcoTZvxuXFS64tgjzN5nBSKmghJngOUYzijp6cBwGcRgmHSd2Z3xtgF4Mri7Okt875l6nZ+py
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wfKOFC10yeWN9uRj9lNtNBfUuHcZq8ZbafJX/gTjnlZZdCWzROE70xy4MaHs?=
 =?us-ascii?Q?kKBOp9NfYEGhsGym+w2wpd8gkPbrOl8rSgSGq5EQuZz6dUVTm89OMoVOrE7u?=
 =?us-ascii?Q?TQUuQXR+9L+aAPzSUIpWWte9kbFwFmjOJOn/8e2Qnn/DSSpZxxRpp1PpAQx/?=
 =?us-ascii?Q?yvPZ29WtZT/Lgyc4dT/9tYUD37O/Ncbt+fkbg0EfVZHB/6Dr0wtwS51GbFMg?=
 =?us-ascii?Q?DZaKt1bo/u0vXVibbtiH6O9KcRFIf0FzOl+E0R7xPb47PdpfBcVw9JgRtATq?=
 =?us-ascii?Q?//FBnB6ZlsFnr+ucrBppqsfgbnuwdrGDZoprXwNbxjgk/ZSlIhvv0JUo88NN?=
 =?us-ascii?Q?5SbmTBzY0kLMkrJYbV/Ad0EP1L0cNiXAL9xIH+2j9gy+4JrSsHOoCn7SzqAM?=
 =?us-ascii?Q?3AUPbk6nnzfE2+bR++nLx4oUJKlLyT3X7zVWf7Ps5NenXQO1N+MB/Xdor54c?=
 =?us-ascii?Q?Zbiy66u/wjxB8hQkJ9Y8RRUp0BQEKNZGnE1OTMiF8sT/2DuehS6FWjLCNV+3?=
 =?us-ascii?Q?+RtDPcKe12p+CmsBtIISmnM5/Y0mO75URqkTvkUBO1j3ZdHGw2hAWvZvk6ZS?=
 =?us-ascii?Q?okA7j/arudRK0XfkDSRhDknE/HPMo8RtosKhHsh3Ukbv7tgDIAN90vuUtV81?=
 =?us-ascii?Q?mxB0f12ZLqOc8fVya7OBJCBHLDIQFxp8NfGJgw7iJZwt/9ukTipLpp9Xlk0D?=
 =?us-ascii?Q?746jkDyiph6r+1I5umxIezDfRGh2OjMXPXFC9Z8BZVIe2gIux4lysX9spAE4?=
 =?us-ascii?Q?c80aPtaCMku0eeX4Q7RalzGnZfnhb5yuUS4OGR92zjYn6MWK6Z2/kbiuDeIU?=
 =?us-ascii?Q?M5SaJ4wAxGumgH5hzibqnekyVNSfa70WzL3tY/7oDaPq/PZtoLlHHPsF0Hr6?=
 =?us-ascii?Q?qjdZInEm4kaFJzX72EZ0nekk+ICUSuD2WpDCVidiHTFXYPG7EOK/zdn4YdTp?=
 =?us-ascii?Q?3ZkaK4CcPgrwxxKWW3R7ZqN4V+fwg8Pb1EeqO82vqgIcHo0GueguU6Jfddxp?=
 =?us-ascii?Q?aJrYSt1xY+fHQHK2Xf/tfXk9Jnr+WbVH7Dml2hZXlF/n9LmKsiXC/TarfKeS?=
 =?us-ascii?Q?JrcjWLHr5JNrsi/zpS2hHyRNOAq8pHnY4v91GbgqFhyS0iymAJq3QUk4IByC?=
 =?us-ascii?Q?KP6BpnaIrp3Tt/ScWbJWziCpka1FiE4B9Mu32ZDiGv26itxYURwv3fmHwA5X?=
 =?us-ascii?Q?Qxh+wwFQiPAXDuHSRBJax1Z6OA8lCZFjOtvBmUSGof++s4ui5WCL56mH6+p4?=
 =?us-ascii?Q?2KLGtVPIczxI6rU8PDBKxHpZD/c6iNJYGXLPS7RjRVw9PIMqQj0IFyjSq0Ol?=
 =?us-ascii?Q?z3nNJhTXCddO+RMrJO1bpR5UXxgFKXwvUHjVSi25AhJSKqS8u4PFefsTpLgs?=
 =?us-ascii?Q?JyDSv+9onaraIW9J6/Wko1uotMCFZ/OtR0D5xoy3FF3oO5pO91Obx9ayYv6H?=
 =?us-ascii?Q?3BOg4hzbaDWSz3fJ2Y2g12p6NGDS8hAdioDh3e5LNOm+sXHmmreOBwsuhDTL?=
 =?us-ascii?Q?oQW9BE1D/3gx97upAD7dYcju4rTTc1MIk4Tfu9zx1iZ+LLwPuaR4JsP76xyC?=
 =?us-ascii?Q?fRHW/6+ibjvZHJf6jUdKJPPMYpHe91qypKA3hYoXM79P6NTr2JVv7yYx34as?=
 =?us-ascii?Q?K4wXSi8/NyYyGj7KxDyB/Jm0cwFw7uxq+L7zrGMiexIPMjUktryUn/avrXgO?=
 =?us-ascii?Q?3wkD2yTo3HPvzA4glieN+5X170e2t0i6YrMzWY84k0dVANfuI07gkqlasRPT?=
 =?us-ascii?Q?0b05J7MzLOYTLvHapFcXNiCIpGSKxbQ3eMqgEhyIz3zZEZqWIwj1?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfcaf25-9989-424a-7856-08decbc9a8ef
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 17:06:52.0318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yj56Q/A4FYuoFOcnkPyfDpjw47GwiJ31RyA6pjngYnNyMmCBylDge5KSHPkVTZS24qeTOaxORi0FCbQs6VqvGMruBngsE9DdKdrVTfHMyIxENyBbRZ+WPKzokO6xGNl1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9637

active_slot tracks the current DMA slot index and must always be reset
to zero before starting a new stream. Previously callers were responsible
for this reset before each rzg2l_cru_set_stream(cru, 1) invocation.

Move the reset inside rzg2l_cru_set_stream() so the invariant is
enforced in a single place and future callers cannot accidentally omit
it.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index e283d9b69342..71d9c671f739 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -559,6 +559,7 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
 		return stream_off_ret;
 	}
 
+	cru->active_slot = 0;
 	pipe = media_entity_pipeline(&sd->entity) ? : &cru->vdev.pipe;
 	ret = video_device_pipeline_start(&cru->vdev, pipe);
 	if (ret)
@@ -698,7 +699,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 		goto err_assert_resets;
 	}
 
-	cru->active_slot = 0;
 	cru->sequence = 0;
 
 	ret = rzg2l_cru_set_stream(cru, 1);
-- 
2.54.0

