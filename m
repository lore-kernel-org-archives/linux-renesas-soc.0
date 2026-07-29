Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C664756A3;
	Wed, 29 Jul 2026 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322611; cv=fail; b=KVZsWcUHGfo7Ijt2mg1Q6P6p+aUcZ67v4mVAhJuc+BVWzEeiB1UHyX0Hsa/c+i/zWXDcFELRbox6h3tlICHOmw+Ts42m4xTgP/UuIHcJDTFQMGmK3GUr5S0MTsGtpKO7zzPOwTNViCeSVplG67qvPBTgg0NRB/ClnCekpS2lXkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322611; c=relaxed/simple;
	bh=NcW9d6ZNFI8LeARyfNdnQmHMsIWJ/L+lfmarEsVD9rU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MDGTq2XYXq8XKkhrGLjdk2I9Kwjj9TKAS3QHVJlUubbNNRLYFAbs2HwFp5HgzqLjHaU0gIbo7wuV9kRDZbAn1UhwgQAbatcT3vQZU/HPjYscJrZXD+5i1q6YmJxMIm1IsNBTzkeaBH2+ozYqnM3DxbpStQSqhLWNsawC9QU65q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Oj3e/oBU; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Oj3e/oBU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j47tBZrVRHxdU7gnHmERI1Iyi6Y+XrO5H/MMiqq5BaZR4tYVO+1zusDB9wVOPLaQCOXQoheOYO9EWtEp5/vbQMbWMb3TY7vC23T9TcgZX5AOKN2NwPpS9vycUuEy5tbkXK8Kb/3B9nHcx3vxs7WGo0BN2gbmpnlNRru352Qd/YaVYxfyAS3xC3utFT/X+3x9vUTgeEkcwfwx2a7XzUHgyTYiZxXs9QvxJ+B8/hb89RICQ546WVnUnwf0v6NEBsKCZbfFT8pPVV+NETi916Vjuce6zMadh/MGgwZP+nVpQ5N+gvK/5/lneKEceYK8GLWPAXzSeGSN1ULBoy70DrmdyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Be+48qd/ou9rPCRUguRlprTo+mwUvPAqGg01haGurA=;
 b=G0I979Sk7GPETbCJAf8+WZ+d/KhEZj5QK8FW6VaHtyTL3NVGMAto6B9ZekCYCVKBwOtwTGEDY3VUJxUhVWFMYzbiBEuppA7kjcwcQX6ZnxPM/OVO5InA1bYQ09ya8bxGNoaqzAgvJ82/gBYzkngJ6rcVyqWcccWJkYYmIrvgo8tuKKSQyzwMQem4rBLpxbT6TA2A2emXa1vXXBWWhQ/j3HZw4P8glYpnSzxMRMIAj64lkDnWw1fe/Qiw82pj27BYuCXor1mX2dhPJZZaWaxo30DGQeh+FeSDA3ovps9mfP29JOCGiSvOquUGhYohENiG4vqmEtK6OSOxddEGZdX6zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Be+48qd/ou9rPCRUguRlprTo+mwUvPAqGg01haGurA=;
 b=Oj3e/oBUxnwgs2n4l3PVlUCTkUn4ke/Mfrjh8QryOmKB0Zvm5PKcTt3WXlvByAMP2hvMeFS/7hZstB5Xgwda/zax7XrdbEp6wIrc9wKMI72/Jbuh95zrs3pHWOU6d4Bva+JET5mZbgVesDImAGIAzQsNqcqzxKpGYEsrlY0P+Is=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYWPR01MB10274.jpnprd01.prod.outlook.com (2603:1096:400:1e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 10:56:45 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 10:56:45 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v5 3/5] media: v4l2-common: Add v4l2_fill_pixfmt_aligned() helper
Date: Wed, 29 Jul 2026 12:55:48 +0200
Message-ID: <20260729105603.1160966-4-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729105603.1160966-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260729105603.1160966-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0207.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::12) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYWPR01MB10274:EE_
X-MS-Office365-Filtering-Correlation-Id: 01debdd0-e8f3-446b-8570-08deed6014de
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|38350700014|56012099006|11063799006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 HunTJbgTlzicPvMtN8POGfB6+0PYQm4WzrNI2ptC0oJpkXgGIWyXLs/QPX3hHP54fq2EPosxfOzQeURUWUU2+NtPWQZ2NoF8M8KFn/FdbUSOkpGzPU2oPbzs1Fh6lUjOizX2X7wK8QRa5ZVF27IyoiGFqePxw+I9xt7iY7JRZRxQU/F8j3rSRnA7vzgrfUX4CfTBudCeG7WskqaliNFCsXzJknplCk2h6IUOML3GoRSgRQf3yxZVpYHDrv4nGeSExB54Un57vwD1pskCVBlyUFlJ+hm9IhHDw/fYTAJkXj4nww4m+VItunYQnfC5+V4sgfX9+YuvqLULfaNTlpwhYSzS8im4TE8HE8Ib0c613oIyw/uI8X+2vI9bGbDRfPSL05bKtB26Jo8QZooLBbAAEsGi1YRbzPsn3STk0pXs6VrTI3kJooAfLCQ6ib660v/NmfirelcGAghN2p0Xt87m3SbVZhh/Yg+jF0uD9po0lIm3335Lc8FPsjLp8gPzXZlKYOf/ZhM/ufeHOeKQWCVD4Wo+4IR7kaw++lPZ1jxJAKbE2jPmWUQdvGWtI8tzmbRRP0URCRwinRnfQqOAlqEfoIw8IDPW4VzmzoX7xJEVk8VV0Vu/3Q7CQsll8fHmAw4S1q2Y/x+LjAe9BrQexWZyE/ZMA5GgAipTeJNZQId3Ob+CQFMonWgk6pIcwjvD6pYJz+RrHbIW0lFS3yX4gYLmaA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(38350700014)(56012099006)(11063799006)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?/f8pQYlykTuw667kjOmFyVZTm5r2+6gMGQ4hbcscBGTklzsj4RcnSKwEntkp?=
 =?us-ascii?Q?jbHFL6BOR1AUxdK+sxTa6eVMOYvIeigbPvSOCmUrGDBk0oGiCowKAHlTkfBr?=
 =?us-ascii?Q?ODUu4w7EUNXM25nVKEVpHprM2o4kOvw2bXbQ9V5BqLZTZk1NofAPSqN/ZkT9?=
 =?us-ascii?Q?ZNtJTB3K3zzQxWxVh23QT7kB7rtCDjtEVtPIcDL8CN1CwHPBI62J+dd2sUIW?=
 =?us-ascii?Q?s3XUVXjlyVSpN8GctYANcDR8YUDPsaLOe2t7mg250RUXCpWCHHpIKZ/wMt0f?=
 =?us-ascii?Q?j6ymXVwa32WEPB41srUgP1uknR807j9Q51mHYT4d38JCfNNGu+eJe/6kCtY1?=
 =?us-ascii?Q?nrRWg67seLAPr8ERHwBlbd/X0CUwrDWfRraZxv5Qo8Wge679FLRHO77PoF0u?=
 =?us-ascii?Q?VTTqkIQcvKPtStK9yR17iFUntzAMP+9mB1ippO3FGAD+aONU9pVoalGphEFi?=
 =?us-ascii?Q?dRPfiMYxj5/NqlUX4Iy7IkzFErxgl1EjXnNHdozAuH1YE14aXsuMxul8fVQo?=
 =?us-ascii?Q?t52JQxwhNt1l0TgD/uIiXv8jmmns2myufI8AZ29+vcp2c5JLRjM8Vb53d8uN?=
 =?us-ascii?Q?XNS4uNhP+MuL324hhtq/ejItDXhp7G84n0ohEyulWV6NnnNxhfox96jWfyxh?=
 =?us-ascii?Q?49A+d9/DHrB6B6qkHv7qs3EHjYphZ6MRTG2L6P6mP/ek7f83RH4QMGRcvjIL?=
 =?us-ascii?Q?cRvClRHbTp4zd75nFRpaKdoa3LJ6WtOEFOAO58Xn36sdFzOBghEWU+VqgI1+?=
 =?us-ascii?Q?n5oWcRFhrvsmpEIm+rjdwpq81iklhnxrWB5BCIlENsKEPS8Vhk7roe3IJ7oz?=
 =?us-ascii?Q?9EW+jZjg0HKgX93jtbKmOwOY0YkyO6brIIYkvKDsmWEMJqZZ9rRaMPSlH4Oa?=
 =?us-ascii?Q?k/GJUckSDf1IHF5TEdlw75WNMZT5H0DB7/MTV0eLwz/4rTuR9GxkBFC1eyHG?=
 =?us-ascii?Q?/xjLe1wUKp+eYyT7+uSDgXAKgeeDG7AB0qcvxHXEuhCqDUSv7PXL4uSZmyX7?=
 =?us-ascii?Q?HHLsfEcYP+KG6NkJsBjAoHXr46PZ/uIU3GBuKBBBk9qrYtFqHXkCIv/ihwH5?=
 =?us-ascii?Q?fGg2C5yiRRzyPDQSNvUb69U/VgHoF//tDzdf1RPKZB1rpW3Ue9CH4rfrVqD/?=
 =?us-ascii?Q?jVUixSi+YSfk/DutTZnrjISveKueN1KQpgxqFCKAuO67DlYIc3s5639JGCFE?=
 =?us-ascii?Q?8VYLiAECGJevotASp83zHH3XBvq25dfzQBQ8dvHHMFwGvhiF+texbMspHZuT?=
 =?us-ascii?Q?MOfwsTscAyGPdUDKFylcPPQd3Ct2uGXzH0tR/Jtr/9ddasvnR3SJM/vNrjpG?=
 =?us-ascii?Q?N4mx+AXXvB96NtxOslxZM3IYheO2owhX5jUjQOQJZc6Lqd1dCTZImvLUyH11?=
 =?us-ascii?Q?/KG3jnFnrdKUlw7Kn+m5JXI6P39U8E5mQXnZHA8vEILOhx+rWo6erYZmBc0E?=
 =?us-ascii?Q?DZEnpPsRZsj1GPuTf0rkMKlDl5JJXBFTETBKPZ2UP4jqWLOtpNevQV+F7Pc/?=
 =?us-ascii?Q?7zqjsl9lqh34e5ywfXuS6l97SzO0KKS/XDd3k/piJSDGWNuSi+6upgCdweOs?=
 =?us-ascii?Q?TB8FI3q+nTFiftD3cn2sKZ+yMDLSV0R9gGh0427BA9tRNo6/27SKUEmen8+p?=
 =?us-ascii?Q?6LDv+Drv061VBD1qz3D637GsuXcrny5s015xgJ13UGtJdfmWG3QOsExP3DEb?=
 =?us-ascii?Q?n24cAPom4WMtpOfP4Ch5Q1T/BDgqbG/AEl48BbyilyO9n6xrHWgOX13IDrxM?=
 =?us-ascii?Q?5DHR2zNrP+CYmeHWivRCWTx2DG6x5HoIsxXNZzNKQpja9FtCYE5s?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01debdd0-e8f3-446b-8570-08deed6014de
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 10:56:45.7459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQd8f4YdMij08QARL/exrePY3CqiXYBlRU68vuTGtKlU3tI8ntldII6Qa1jqzUB0ydS2bU2trZzvkhKCq0rrYOFbaGzl6RNoeZ8obZHVo6BiO6el2Qmk8yyiXH3Tf15L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10274

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

