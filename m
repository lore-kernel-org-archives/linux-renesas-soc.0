Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C0B44C657;
	Wed, 19 Aug 2026 10:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787135334; cv=fail; b=Tqyv2FTu3Q3NX5oev+XqxrZUmRU3d4mOEbzkVAqQ6oDaU5H56OisfbdR9TDc8GdEh7K3ACf97EtJ+df03Hhm9Odi4SiqGL4n5cQL0akM4Knr9FXT87kg5vgTHum/xTvMEMDbXrJs8CiU57vE8wvBE4yM0d3HvVUoC/TvRrTNd4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787135334; c=relaxed/simple;
	bh=jPu6jif79iPhrnAj4XIp3b41IWKeSBTG9gjWVo76/+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XKi2YIgxxRYCvTC4FSwmumTOaPe9IrUK5O1Csh9ho8YPHfzUY3UVfu98bQ9D6VBhtAqt9v/W4p8N9k63mEWX+hlUGLkAopVNImLrSiaKub2Y86AteGbGzGiojyNXCrihqyYZVAvegfqJIdhIk8yBFFDSVLx/IlkAV310+7ugTOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fgJRxVMA; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fgJRxVMA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7fjJPrEyyr8wSb+HRajBnNCfg1b8cBircSPypY+EeUn5WiHQu1zJyP2Ucbw+alMYw73rOPK5oJiNGahrFynL9Ql5zmmRk0JqIJ8pwPT1uJ89cYt4XIGFucG3ko48manfEK5kigGjKArjvHma+NFOJ1Qu5PgkXji/6FMTQx4LSLCGTw19i10AhUegqiisrVnne7fBuOYZsFpcAQSniVK0Sr4xj3JPx6N9MasNUBVSSggMzaFkTB5976u6NAHc3pHxqDtx+IUWXMaC+RSk4Kt8MRkJm28v52Zd0b+Qo90znZcAwJ6ALLcsms/EBnDb4v7dYPF7896Tl+A8v8h9MhqjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MxvJeoRnDXpwMlf56e+YMEll2SCBai9dFjcIyDz1mg=;
 b=fCznrxvVvL+cdwtT+x8d9KvuDIqzigekMVRw/80S9/Nh3UekHij6mXW8eHzygw7hWq5XoDf0GDGVljSPY1+lYKX4/R7nuCOl6cAvM4hM3Emj4vonJtjqYXrQVTWfk/Cpm+TYpdT42gQXWdi7sWc5VlB+NlmsYxUjMcq7mEp3lneWDuCp2R9pH36tegjVxK6u4FC0JmHUpTxWTOXOe5IwGuHdPzyOPtKjxHuinoTlgPVqrhQ184Di2ZZof1KHj5N03G2gyFM79ec2p6ZDS16mafv0SI1/gv4LEI7Aj3iMkdbaZOGCI85tCcDqvxjmobPuPRtHPITb3RkBsG071dHeRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MxvJeoRnDXpwMlf56e+YMEll2SCBai9dFjcIyDz1mg=;
 b=fgJRxVMA/w09QBCZ1jvJ8AyeZsWiigOxx7XQgtMOD+64eDe84uHXEKLIn+X/nvtWx2R93Z/wTvOaMm9KpBanAn4PyJitYX1Ypf3S6pJ4U9KK0XW1F5TlmHxETN7qBdbXAQI4Z9HviSWt0kCGJ7lrMIS/ArDu4y/ZiuJmCNOZtTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS7PR01MB14761.jpnprd01.prod.outlook.com (2603:1096:604:394::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 10:28:49 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 10:28:49 +0000
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
	linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v6 2/5] media: v4l2-common: Add v4l2_fill_pixfmt_aligned() helper
Date: Wed, 19 Aug 2026 12:28:06 +0200
Message-ID: <20260819102812.2592880-3-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: e0f63a71-84e1-411c-c00b-08defddca86b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|52116014|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 1U54rextK7kLt7r7Kli2qDlfhA2MCb3uwaTszZsU5NoELFPFG4c3BN3GxuC9ynKVtvVZdvf+yJIQg8rkGSFBHYnYdLVvOnA3OnS699YTIUCh0oMk0aQa4B5p0OJYBtkPU4frO1YW8lGvfAYhhi6AQKoGrYEdydeWGdxIOKzwLeB9Vwc8dduhzu9Rj2tlxPqJELNTX4wo9fMYSNdam4q7vE4prDEhCgnnY4akQz3LpnHi4FPNmMX3kqQ3EXwwoFTA1JJqZoF3HyPVNYGzDBgPdRY7hKcD8HgzcG1G1SAd+70LGrjeFf7VO+lhlJhWOmtXAA9u8wL6cfOYt3UzqP6NzyfAvhanQqxyCFZ7ynN4hf/9IeXG/N7r2fbRvp8LxwgnQPozIW2YlY1kJpj9gt7Xr69zjaMaPY/SbPjmSGQNgjjTGmcS+OIOGUfq9MhaD9IOIXVJvmvFXYI9dhz3YnMts01I93T5n3A7AVuKwe7JHwntOK9osKdCHfytFw59kISRzxt7XlvuTExpbZwk88CPN/W/KCsgv2oRl08mS7AOHXdapBptCaAGbznid2bWIaiIxe4n/rrkgRh2ibV1mguT54Gx2k2Hmc7P3HPzdlUxGmaZ7NQKAUqyZWeo2L0XszDsOCdx16yMzcgOzvn7U+LGIR4Ai4gtt0w6DsEMoXmPN8cNORvD1WUtBwUpllUTdqEkhdGSAUdFRGxyC9CAXahQMw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(52116014)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?E/LmSXTlGBlv5dN0Q5KQ5EEuPSQnjFEEh1MANYtWIbJ7H/apns7zsYFI+FP5?=
 =?us-ascii?Q?RydQqef1Ie7tZA8Ned6WyAfFoiCrV6OZ95AOGIgqfUw1oT2QCr0EPCT3a0x5?=
 =?us-ascii?Q?8qnpkQrruTlsamHSDHLFc8CiuPltr2zU6ecGSKcWECrGyptByPQ7INXXIAeZ?=
 =?us-ascii?Q?1dQFRUsh3wYMgSbZhqCkaFJmRyaNDprhOEvHqW+9q92QLDHihnq+xkp9FHq9?=
 =?us-ascii?Q?ImYxZiffWfXbA8cZjG5KEInmUt4q7d46Ztjeu/XQfX9hRG1Yd6XV2TBvA/CP?=
 =?us-ascii?Q?2oqsre30oz+X3hYg96INEQVgpy7RQwYORCS7H/LtTYqHOQ2VXAHAc4SQhY90?=
 =?us-ascii?Q?wvLQwC6ZWwfosKhbFlBNrKXzQqdKVHtJAtWXXQX6N5JVTMOp5jBWcStjZpPS?=
 =?us-ascii?Q?RXqKOL3ThqLLcszG9tomphBigTOrkhMJiT3vdrcoIlLYq1/1KIvyDNg9cuB4?=
 =?us-ascii?Q?lWcCnEfYPITtnotmy4pCyS94dBbYKNwRjdzYv+Q+BDTaR8B200vDRTc5z8SE?=
 =?us-ascii?Q?L+pmkFlR9md5UxgY7DE0sW77Sodu/phHI9zGH8n0FJgV1OI8Fqz+Xa12hiqD?=
 =?us-ascii?Q?3jyexIvv59vV2mIT/Q+CLNmHmdXOPFAgLbWZ7ZRNe4zr1xjuE+5qDHrj6RQ5?=
 =?us-ascii?Q?Tq3ZQmTGoxSDTqhhjHFRU+DC72Fzoq6nRU9efhPP6PE/B1MDUbXtsA9ReacS?=
 =?us-ascii?Q?TQVbhA46l9VF4susB0sy4Znz+nvMcVD0AfR7TURADgmRyfZcvfFGmYGf4UJj?=
 =?us-ascii?Q?HLQDD3mOrzIzasBJMLFm7z/piC3rgF4ZV0DgTB4/7BPDXuFpWXtW8dWee7Iv?=
 =?us-ascii?Q?8Ex0VLa1frXe0lGRynjfu9S/oD5pxB8xienCeAJWcZL/AyS7G6jseEfjGe6Z?=
 =?us-ascii?Q?OGd5DfYWdPPWCJfGCR4jv8Fkertbt3quU23WtxB1P48RPbqbL0fpHdTPAot1?=
 =?us-ascii?Q?iiRSYU1OSNlbebgChXB1WHvxnWE4ze6e0Cn8EdtuL0SUH5GWOhxmQRRwL/nb?=
 =?us-ascii?Q?6Jii1ttDl2r7iCsqke1+5ubOucRU0EIpqNh7D90zZqFPv1DfUTLJRNWw5lrv?=
 =?us-ascii?Q?9xKYBDTOekfw62vMzVF5jgxaJAXwyUzSph2uCcd1F2sgaeSilZlo2RxHmMZa?=
 =?us-ascii?Q?DUsxv5kLkSQ+mG8NWeB6vVmoXMCNF2GPP7+cYZbPZ/ZzYw3CZbdlnTDMA5jn?=
 =?us-ascii?Q?Y/m21Rb+XT3rhZIoUCBiCe1pJ2VQYM6C34tSNpVg3m96SnnaI2SH2/gWqYLE?=
 =?us-ascii?Q?8+4SAb35HEMZP6NXiAyOeD2hJ8WfCfR0inaxgT6yrqD7+2xFEYONZgqt9DID?=
 =?us-ascii?Q?Ja8lufqYJpRgriXwfufrl7ESh1EILCyhXmJSLGpN5XNfwlt8dTSMGT/d+40B?=
 =?us-ascii?Q?5HNSOz9dWkDunF7JjTAxGNnJUcnNbzBBtmWMoOY0FjzCB0ypGZFaFXJV+cAc?=
 =?us-ascii?Q?+JxYmONlqXqDfetgmwAJfqysNiITsHxMJ6KlyUJ0CWThP/TGYuZplfhI48m7?=
 =?us-ascii?Q?8lBKEa+btLFx4PVsT9WAMd0i70hpYN3dqYlUx8oZ7xF4NV3l9S/AtoFJeTrG?=
 =?us-ascii?Q?sqcbe7ElkFtyRq6zzh70mcCAYac450QgXi43QwqNIrnd15rhvTzIMtlhvN9d?=
 =?us-ascii?Q?58OTIrF3PjoWy/DwYtAN3KGqJoUVXczvpH9UyssiZTNqJfo70+bWp+yvRk5A?=
 =?us-ascii?Q?1jTzWcfjLVuP8FwCi80cn2ejlXlV5QqUoub7DR1uFZ4qG8YP0sm8Qqu3+yPS?=
 =?us-ascii?Q?NNvyOYLtDLp+OjHphPArYOMGP53T6BqMZb7zYa2ntXlPZFEBlqQU?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f63a71-84e1-411c-c00b-08defddca86b
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 10:28:49.4378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RXJcv3zlXEfl7ZPmxJzGKIM3S8dMdw5c/SGbsQZq0YhqTGPI/54HmCt5xqGnDdNPIIv5s+WGKXWqHQlIwvg98XR2HmJuPfam8qD22AQ/JuCUJOJaELlsLB8FpG8l7PK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14761

Add v4l2_fill_pixfmt_aligned(), a variant of v4l2_fill_pixfmt()
that accepts a stride_alignment parameter, mirroring the existing
v4l2_fill_pixfmt_mp() / v4l2_fill_pixfmt_mp_aligned() pair.

v4l2_fill_pixfmt() is refactored to call v4l2_fill_pixfmt_aligned()
with stride_alignment=1, preserving its existing behaviour.

The new helper is needed by drivers whose DMA engine requires the
line stride to be a multiple of a specific value, such as the
Renesas RZ/G3E CRU which requires 128-byte alignment.

Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes.

v4->v5:
 - No changes.

v3->v4:
 - Collected tag.
 - Removed "." at the end of the function's brief description
 - Removed "component" from @pixfmt->sizeimage line
 - Removed wrong tab
 - Fixed example (e.g NV12) -> (e.g. YUV420) into function description

v2->v3:
 - No changes, just moved to from PATCH 3/4 to PATCH 2/4

v1->v2:
 - Move v4l2_fill_pixfmt() into v4l2-common.h as inline wrapper
 - Add v4l2_fill_pixfmt_aligned() helper documentation.

 drivers/media/v4l2-core/v4l2-common.c | 12 +++++----
 include/media/v4l2-common.h           | 38 +++++++++++++++++++++++++--
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 54995ba8c20d..2ce4f1c20fbc 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -537,8 +537,8 @@ int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
 
-int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
-		     u32 width, u32 height)
+int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
+			     u32 width, u32 height, u8 stride_alignment)
 {
 	const struct v4l2_format_info *info;
 	int i;
@@ -554,15 +554,17 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 	pixfmt->width = width;
 	pixfmt->height = height;
 	pixfmt->pixelformat = pixelformat;
-	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width, 1);
+	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width,
+							stride_alignment);
 	pixfmt->sizeimage = 0;
 
 	for (i = 0; i < info->comp_planes; i++)
 		pixfmt->sizeimage +=
-			v4l2_format_plane_size(info, i, width, height, 1);
+			v4l2_format_plane_size(info, i, width, height,
+					       stride_alignment);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
+EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_aligned);
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 static s64 v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 749fe38c134e..4e5c5ffaf651 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -554,8 +554,42 @@ static inline bool v4l2_is_format_bayer(const struct v4l2_format_info *f)
 const struct v4l2_format_info *v4l2_format_info(u32 format);
 void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
 				    const struct v4l2_frmsize_stepwise *frmsize);
-int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
-		     u32 width, u32 height);
+
+/**
+ * v4l2_fill_pixfmt_aligned - Fill in a &struct v4l2_pix_format with stride
+ *	alignment requirements
+ *
+ * @pixfmt: pointer to the &struct v4l2_pix_format to be filled
+ * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
+ * @width: image width in pixels
+ * @height: image height in pixels
+ * @stride_alignment: stride alignment in bytes, must be a power of 2
+ *
+ * Fills all fields of @pixfmt for the given pixel format, dimensions, and
+ * stride alignment. Only formats stored in a single memory plane are
+ * supported; returns -EINVAL for multi-memory-plane formats.
+ *
+ * @pixfmt->bytesperline is set to the stride of the primary (plane 0) plane,
+ * rounded up to a multiple of @stride_alignment. For formats that store
+ * multiple component planes in a single memory buffer (e.g. YUV420), the
+ * alignment applied to each component plane's stride is scaled relative to
+ * @stride_alignment so that the chroma stride remains consistently derivable
+ * from the luma stride. @pixfmt->bytesperline therefore reflects only the
+ * primary plane stride.
+ *
+ * @pixfmt->sizeimage is set to the total size in bytes of all planes.
+ *
+ * Return: 0 on success, -EINVAL if @pixelformat is unknown or uses multiple
+ * memory planes.
+ */
+int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
+			     u32 width, u32 height, u8 stride_alignment);
+
+static inline int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,
+				   u32 pixelformat, u32 width, u32 height)
+{
+	return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, height, 1);
+}
 
 /* @stride_alignment is a power of 2 value in bytes */
 int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
-- 
2.54.0

