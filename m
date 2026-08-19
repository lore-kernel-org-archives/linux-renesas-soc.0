Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878F43F1ABF;
	Wed, 19 Aug 2026 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787135352; cv=fail; b=b2/DgMEqZheFfIt53HHSoTTDBBTw0KK8pbx668BzYTtCcat5GPJjtupWbeahNsbuI32PwvZ91H4zSMxeMFa+LfMGPL/dj2l0ImZZ0LGtDxBUvZwjZ2zXF8vD0xUMxWWkA3JBZWw+yXgiBwUweGEMzJfuMCftXZBHacNt3FJlv+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787135352; c=relaxed/simple;
	bh=FYi0OC3ySCL6v3Va5Qbu/g01f7HySVIyiGiHawtQr+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RTKROhRcEg+5CzL8+VhltftmozyWczsSfDnmDNBBwzMGVXFOxkie/u24xmar4yehQxp2bQXej8RCRbEeEM+JS7hIrfdBT57TExaxjypfmc2bA5z6ixcBx+PetK1CggdLMHqfNS3nSIQzDUM3PfGaqpTDKGMhhk/UXgjS49MMQ2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=V2IwH95r; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="V2IwH95r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOVmQEdMWwlKdJ7qaMEBGVz70daVnzQHzqmTvk3ZJ550EWcoaOhYFsFy8zFN7tnZxXdFhEuuB2Gneg9DDxir3EdGRaQTTtTsCpNRSA0mRmJsdDpkkyjNzS8SUOtzH5Rs4y6dLnQZV2ju7orN618qYnpL1O+qXdbRUgHwANd4W/qRDTWTa8GA7ytSZ64yPtE0BSDFOOYU5B83WeR61j/f1T2pIdHKYP1ag0TY+VH3xKxoogjUNBpE+O9ay09nMBHf0LRI2RD6YEiD3ZjWn5Bg7a8k8rQDwrFXYfpVAi1j/O6y0qMAlkDlPt+SmEG3k1RP0xmBONw87BtFye6vU8C2hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75J4v7zRO44B7g19E9adFR0y4jLwsAM+UCDTiP4KVtM=;
 b=HunxX+O2L5mTYAb3Eb5XVA2XHbif7FZyOt50resLYEgM40qRX//B0gn77/DkhQmKGf5YaEwrRq98L8exoA8NdtN+AfGV9n9JorzdJZY6mSTsoE1N7iDBZFkvueixK7m0A3bxBYHv0Wa/05dr3vrGftIVtxADEaSjyZroQeSuAt/6JbYDakvpktDCGEjRGWrFFeqIflHTpU/RmTQ+PAb24Jkh8aN24HTinC3vIbJJDHdTAUTRXlVVtCvLapYV6XYUVzomecLofJiVlsSUaz93f4tJF5gUp+6Ozz6ypyqj8emF0a4sida1rwYWsk6ateqRpU9PcaomIKU7mUQVVwro3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75J4v7zRO44B7g19E9adFR0y4jLwsAM+UCDTiP4KVtM=;
 b=V2IwH95rurOz29RLhcFsFE8vJ5hNrdwf4tCZOnBF3utOTFNaXv+6Lrwg7oKtucRJgGmQEeS4OfqxupyCc+TUQLcLvUbHjZfB//8gJGfROdS2O0fcAsx7hrfTcWp+aHyEkiG2Jm+TySHbRB+JRt+AhwfOA+rKywFcm0KqVpawkhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS7PR01MB14761.jpnprd01.prod.outlook.com (2603:1096:604:394::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 10:29:08 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 10:29:08 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: jacopo.mondi@ideasonboard.com,
	tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/5] media: rzg2l-cru: Replace has_stride with stride_align field
Date: Wed, 19 Aug 2026 12:28:09 +0200
Message-ID: <20260819102812.2592880-6-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0015.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::14) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS7PR01MB14761:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c75c5b0-5ba5-4536-6913-08defddcb37d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|52116014|18002099003|22082099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 lXghkS5+yKEk+64qzHG2A1WYrULqNcfN3TcR6vmO10w02lk2hqnkXNEunBaPKJjzhMVtRCKpEMBr/0hm7iDAArG7nwOqAmSOpmk4NcI8+PK5v7PkJR2fgm77WQChDyaaVXSa+yA4Fh2qOdADyntKymBYx9Uh2UOPf2gzNgkoOeD1z1bXR1LvlWPzmqq7EL9OMNRzP2bFjXueU7pVI9drSwO2xsmYWB8+7mjMsJkGSEoR2HGgi8sTBWWM8THG0SAe51v20Z+bLHdy2RD3tfkhywLIVgWdNTaa0VlyerG8kaCxHGdXaVJkTXA8G/onnalGeKDRHw5WGFHArV67blUoW8gKBl34zLwdn5bJz8YcY9u1IZ/ZmrAj5KRw1eKpWhBwILVKsh61OVwib/e1c1iJrZNQ+2YbelWTnqvhsQ9vreOHqBZL1e8mfIAcAqgUfyIZ+2lqqyRB4ik803Snizw04cfksJXo9YHIKgvUNlDS6c6cW4OgJesQN5BZsuaTeBLpEGsLXcsCJ3HJDi4h3Fc1ogIlBl1JzPNm4/anZm+KQ2x189fSQr1/8+Dkwlw0/OkLXK7GXUIsZte8fOmAJwYvxLnX3ohSXGmnL6DM8rLMEtXSsKg0IFP3q9G6Jl5qySBD6twr5D5gNgDgn+s9pRtnriL+881+156T4raANM1BtexMZfhxVAq/d1zsD8ctL2aRRHpWmqea/1NaJ3rB5hUMFmBYnvAyV0f3nxTW3WjuFtQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(52116014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Ras0voHO9AucAYcd3o5Y/Kyse5dwR9ucdSwyvrmJzmMX5Se5Kshma8ayaQ/f?=
 =?us-ascii?Q?dBnfuJ/VXeUP+YmhkudZ+l+pGFB+XQ89G5HH6BOVMCiuHr7f+gsBjilcKDVL?=
 =?us-ascii?Q?LF9bM36V8wudviQWYVE4K7wnfXkPgXbjFfJamo+LI8O/m0VAW7Ny5EcmFVMr?=
 =?us-ascii?Q?YLWQlWvNpLhs7uHtEjBier8j7zleekhwpcyKLKlc54T9UMlqrx+asMPbwc2x?=
 =?us-ascii?Q?Wo5K4Jg4jyYgYBJGo9EA4lZXQjqCFx8aVtrDC9QVaWnxsa9qUiSft+6/U7Th?=
 =?us-ascii?Q?AqV+1FtFDXzbznp1+Euo3hOGAw6d8B+RNOnF8aZ7l3PkmSKAvMH/pYd6e7PB?=
 =?us-ascii?Q?/GbfvxQZGV9edjq2ESdqb92J8ZEnKv6Oc0n31nOpMrKBSqQeWfxy/itK+XZv?=
 =?us-ascii?Q?ZPHHNb60QCBfs2KmwxcfcL1oh2Axjtr0oo/idhgB5zwGu+o+LixP3D6gGJ/d?=
 =?us-ascii?Q?4/P+PHKP0w/6QUXNLbx89VWFsJk1m+W57KGDMv4zZtwxmzRWKgRhd8Ebn3LP?=
 =?us-ascii?Q?rfBJDKRb7AiZhyVuSPwBb25C9kBqJ3hLLb5F8vilSjTLp+GqXC862P0Vxolb?=
 =?us-ascii?Q?KAslWiJ3C1HaJYW1zcSDS/3eerdF0AKfT1v7KHMG2NXuSy75BYALnhKqRDyB?=
 =?us-ascii?Q?c1hJHc91aoayAFcGdqxLzosa5EuqiDXmxMJPIO63Me3x39IXrxlEOCSgSuts?=
 =?us-ascii?Q?2YNzdmvRhWHzNHRa1/ScEyC70DL6vd5neOSM6c7H0qVXTGMr7Mg2dKylDdFq?=
 =?us-ascii?Q?ejVLvMirTECw2XOB/t6ujrfy2wTUvR7iCG9yPO9JsaczT0sUXAuucuJVGluP?=
 =?us-ascii?Q?FvBtgfIv5LLXxO2MEUAZTXD7F9VCKENLxlqZ2iRFg6sm67seilTDMdL1QxvD?=
 =?us-ascii?Q?X1E7iN1hJJn+I+ltI5QT4hr8cKf2AXb1LI7ggEej0A7HwiCRBT/vKEnFzEzB?=
 =?us-ascii?Q?GAVlA/mrXmsCRECEc7j4jx75ffmuCiTmXmKjK/+/QijQL2Nr3Nf4gVONwASz?=
 =?us-ascii?Q?WL0wFPmtCfrBFT3QvBscqB/BmfVlqr3Sp7x1WPm7CJffOAJeaeuxLc1mm/oj?=
 =?us-ascii?Q?f8I9pve+rcDnRSE/bODafkI4BRlypuZV4yhRdGJV2egs0YxAe5SR8+qed2T0?=
 =?us-ascii?Q?ZPgsauHi1khzt84Qaq1bffViBFnBWoJIGKrKhGG2UzGrTkfSlQ2r8hE/dcD3?=
 =?us-ascii?Q?KVyRBmdRpFMjw91ljNOnHd+72zmXf63EguygK7Rx69iVVVhr9z+1qaydLixx?=
 =?us-ascii?Q?nQ+HmX56zn6DMp/xg8Im18iW9Zhb3hQRFrstDqqiciZj8JkJ/pyAWSmwpI6o?=
 =?us-ascii?Q?NHhf892ECYMrXaWD+Hx1iNy3C09DJ/p/X3ZLz+Um44Wsokl9I/4hqzD1rskd?=
 =?us-ascii?Q?WJZMRp/cKA+m+XKPAKFgT6zAwKt7hwX+RDNAWY+chJjrqzUODJ+dhcTQlzF1?=
 =?us-ascii?Q?8jG3u+g/dZ3fUwoabmUNEkk7ZdPGyIBcdClAZcUsSRbyCec2lJLqsj7+EK9f?=
 =?us-ascii?Q?IjOEkqjvUSHrHgSsS7K6+4ZpxxwiYleq8W7eJXfgyAaDQH61Zf8JI1GXP/TS?=
 =?us-ascii?Q?pVMUBg9u9imxYmlQ44t6s7Jo5QXCIjE/P+SAER5wkDycu+2oRIzbo9Hxlpat?=
 =?us-ascii?Q?fjrAd4UPzilcpyu1aSnMwmrqqwJW0yF3vn0kWww/UM+363nshTH89AJgvpfd?=
 =?us-ascii?Q?n2UnKxjpCsRM5bOt7EyJzbprC3kPkPJcq5gLBJkm5BSrChWBTkYU8LR7ZL5E?=
 =?us-ascii?Q?7IWLsvjfX//Ty5pngC+T/07qlwh6Bvq7yOSTCd1B/5ZbZbbfPb9j?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c75c5b0-5ba5-4536-6913-08defddcb37d
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 10:29:08.0251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bv0uydEWv5cWRWDzyerkgThuY0Qj7yq/Wod2Yy4Ig3VAMAaicFNsRCl7eOB15LKiBavK4QlcuzuOiDv+zmj9IxSPWMNDFY8OG59VlC8XBFRbm783LpQTVA81gpMNHglD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14761

RZG2L_CRU_STRIDE_ALIGN hardcodes an alignment only RZ/G3E and RZ/V2H
need, as only they have an AMnIS register.

Store the alignment into rzg2l_cru_info instead: 128 on RZ/G3E, 1 on
RZ/G2L, and update the code accordingly.

No functional change intended.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - New patch.

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 3 ++-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 2 +-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 7 +++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3c5fbd857371..a2b833e2bf9a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -361,7 +361,7 @@ static const struct rzg2l_cru_info rzg3e_cru_info = {
 	.max_width = 4095,
 	.max_height = 4095,
 	.image_conv = ICnIPMC_C0,
-	.has_stride = true,
+	.stride_align = 128,
 	.regs = rzg3e_cru_regs,
 	.irq_handler = rzg3e_cru_irq,
 	.enable_interrupts = rzg3e_cru_enable_interrupts,
@@ -406,6 +406,7 @@ static const struct rzg2l_cru_info rzg2l_cru_info = {
 	.max_width = 2800,
 	.max_height = 4095,
 	.image_conv = ICnMC,
+	.stride_align = 1,
 	.regs = rzg2l_cru_regs,
 	.irq_handler = rzg2l_cru_irq,
 	.enable_interrupts = rzg2l_cru_enable_interrupts,
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index b426bc7898bf..2c192d370dcb 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -75,7 +75,7 @@ struct rzg2l_cru_info {
 	unsigned int max_height;
 	u16 image_conv;
 	const u16 *regs;
-	bool has_stride;
+	u8 stride_align;
 	irqreturn_t (*irq_handler)(int irq, void *data);
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 27a35ef2a6df..a7b6dce66570 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -32,7 +32,6 @@
 #define RZG2L_CRU_DEFAULT_COLORSPACE	V4L2_COLORSPACE_SRGB
 
 #define RZG2L_CRU_STRIDE_MAX		32640
-#define RZG2L_CRU_STRIDE_ALIGN		128
 
 struct rzg2l_cru_buffer {
 	struct vb2_v4l2_buffer vb;
@@ -277,11 +276,11 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 		rzg2l_cru_fill_hw_slot(cru, cru->num_buf - 1);
 	}
 
-	if (info->has_stride) {
+	if (info->stride_align > 1) {
 		u32 stride = cru->format.bytesperline;
 		u32 amnis;
 
-		stride /= RZG2L_CRU_STRIDE_ALIGN;
+		stride /= info->stride_align;
 		amnis = rzg2l_cru_read(cru, AMnIS) & ~AMnIS_IS_MASK;
 		rzg2l_cru_write(cru, AMnIS, amnis | AMnIS_IS(stride));
 	}
@@ -850,7 +849,7 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 			      &pix->height, 240, info->max_height, 2, 0);
 
 	v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->height,
-				 info->has_stride ? RZG2L_CRU_STRIDE_ALIGN : 1);
+				 info->stride_align);
 
 	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
 		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
-- 
2.54.0

