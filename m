Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011001.outbound.protection.outlook.com [40.107.74.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FB64766B0;
	Wed, 29 Jul 2026 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322617; cv=fail; b=KU2tKlgikwXXzuH/LpiWJ/JOhpwgeKvTIE6BHzHoTZLon8eQzg4Qv9OK4CSY75P3FzEN/5UBvf+y3PULZS55hGD+rCzM5lK5ZWcGuNhEM5cfmTdzVeqbVznxHi2Awh1pj1uH1dbyXx21KLF2DKPLv5bhpfGCza3LdqG56C7w4iE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322617; c=relaxed/simple;
	bh=qCkzbXSoIHlwnIH4gRzk+KhxxTsvmQiiSMN/CerE2kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rrhnxK6UVNrBW3AmS/dDUB3YXsUCG+i/RtPajkPLbJSDjsPNaCqPipFL57NDF9enkHDBuutpT+yFRmo1QYsGWYVUJCRBfbq+FbxGS415HkXwm2aYAmnF+UdKypNSxDeFw2SrEq2xvNQ9EWOdKEbERFbDdgngdZwWJNButx3cgOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gvOfCO9v; arc=fail smtp.client-ip=40.107.74.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gvOfCO9v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DP3ctDl947l5MkNO+YATQYNMRo8g5JFOZ7a+mCvvc5Q3j/ml1U3ajYJ8C2nze2cq2YGnYCqaYwaxmdmb/QaEetaN3jbHU86T5LBUD3muq5pnFKd5LTH9natL1IBsR1XfXo6zrERayainKLwptIDwUKBTvsw6EFedgfSNmlEyUY5WyoA4ZsIOCEyaCfJ71eWhP7lDlPkm1RCL39zgfkKwBwmfhnAfbXy5Z84Nb45dGz4OoHZ+/cSK1UMDq6oYAhLwx45YMWIzZMhOjnSn7oB0wJiR44Now8XrQ9XDUvJzaTwXLKrEtJ//ni/aRpNrcpfOf8Y9STKdAExj7zSbXYWN1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhV8kREqVzv5uAy6VElgNSyaICWU5faZrL1/kvD77UQ=;
 b=D3F4k/RINS62zob+WV07NBa/5ruyTIpuIe/K/JsDFARWSCIT822FMx9Q2jas61wDYUFP4dsh/50+IcjdiA6uPXLUuHWdUndQCKHp1rnln64/8p/2qSg21cXBSirO//IePel1Q0EBEf6TSnw2qCiua9rKydWp9+jr9VZ1NyI65dtyeDagBVx87IODZHRzImDb5lGYLOXBPF97SAo2AdBrCwS3xCrc1KWM45Ng5L3vg2YpkGODIlFsP71/ENoSHw9WP7tvIbFJ4gYQpgVWayOSAvLcax8xEjklvbs5d53nsCLuLxkQlxRQbx6kicUtfX7/GrJrhjDEKzJO70RJVB+cyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhV8kREqVzv5uAy6VElgNSyaICWU5faZrL1/kvD77UQ=;
 b=gvOfCO9vRR/hEQZ0l6RCriE2p2zNg3ptaQrcfWYPWHlyBHcPZdHKxwbzwmDI9as9OjA+fhXrWlBN/MYbZm2CyrYgA7VniblwefXDJtLjvKZZUfTb+0A7CRKOxMrvclNgoCMZtgqsEw6vRenbXcpNJw8qL0ctb5UNaY3kUnJo1mU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYWPR01MB10274.jpnprd01.prod.outlook.com (2603:1096:400:1e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 10:56:52 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 10:56:52 +0000
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
Subject: [PATCH v5 4/5] media: v4l2-common: Add kernel-doc for v4l2_fill_pixfmt_mp_aligned()
Date: Wed, 29 Jul 2026 12:55:49 +0200
Message-ID: <20260729105603.1160966-5-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729105603.1160966-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260729105603.1160966-1-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-MS-Office365-Filtering-Correlation-Id: 146c9dae-bc12-4091-0519-08deed6018d0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|38350700014|56012099006|11063799006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 DRgY+dJp7DdMU9flpBhQH0DMld0Q1konLA+syTxnPWCeYEeR5bwxKmxZ573SJcnNCLgK7Np7Y+ixyuREt2PoGBKTgL74kkIsHPNOSH6iZvx9J3Bg88aDrFwmy9SlW2guWYdWJRh9Gta/x1usla5B32Sqi9OFmfTbHgKi0YhSJNRhdxkwvFC1457STk/XqunA6IAchnUrsiF87vXqiGL7rsS4H2rWlLGQI85f4rY6ugy2gM6hnHI8xQG/9pHNNd0/IQGcL96Kq1nWvCQ5uKsMc6MoT32OhozANo4v7uboqZuaeRttnWo5U6y/YvEgzNzUlEtxECbKxE/CGVjLdQhDq7MTvpvsQ+6TEyFHd3HfCwwxuu4VFZUUD1MhE4CS/oNsbweUzJ2VjHJ/lq212mVaaSVHWCZ2UVApl+Qti/I2JmZv4EDn5ny3G17RXPWytcfkJyRN4+fPB68a9oljEQGvkBKtsGK2rkDU5MIIzhvlljv3sDz5uU+zAIHOIqC9ZnVj+ojb2i9cxEk0PjxZvFO2fMxg9jtxNHYLuZTnzLI6W99o4q2gOZRLcBjBRyMR3jUHjr4B2fCFJrcE4B4uiGNeIuGx+zoro4NG/9QXJEQineBU2qFCwPMqRMUJ5Ab4zQzUnE4bp+CC4QES2U4pZECQag1qQGnYmfEQJU1sa9SEk/0rTC8VOo2q9B0CCMJXtilsxaNWVs0UhWipGg5FV9NDzL8BTrPYJcvNxH7/otXOYvY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(38350700014)(56012099006)(11063799006)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ckFlY0lDSWF6OEZXc3FuRWQ4cC9wVWNROXhPK1hMTGdGY1FaZ3FQeTlubks2?=
 =?utf-8?B?WXBLSFpDd2tGdFBNUUdrWnpCczl2QjJmc1lJZnllR2RwaHJTL2RSZEZZN0wy?=
 =?utf-8?B?UUZrdEtkaFRSR1ZEZFR2OGEzd0IzeU9pRTN1NzIzR05yd2sySDg4K01BV29m?=
 =?utf-8?B?TmRwdTVCeEZVUzFTSTd6ZGxuUTFuYTkxamJ5aHl5ZnNMWG1JL2VvTlZiNnk3?=
 =?utf-8?B?RzZkVXlhQXZ5akFmall5SmZMWkhxdzBoUXArQmdRSzBvbWhhOEw0VlFTZVNZ?=
 =?utf-8?B?VkRieVJtUm50WEEwSWF1RXlUOUhsaGJwNnBiODNWOUdXc1duVjFIb2lSd1c1?=
 =?utf-8?B?OWlrdmY5N0hRUGdoS25mekVVWEtBV1M5OXUzd3pycXNSVzNqTWhGQlhXVC9L?=
 =?utf-8?B?ZnhRZFUxc2ZKZHF0d1ZqbjBjUnVmV2EzbTJFeXhYbjBUNEZiMkRxbHZsbTRm?=
 =?utf-8?B?OTg3MzVONXRGYXZia2pOZDZWMFZnSHJkbXVnTjVzN2tBSWVQa3oweG8yNEda?=
 =?utf-8?B?Nyt2UzNVc0lmVjBGVXNSWTY0S3Y0UnNQM2tpMVBXWi9JZXFpb29IandRYk0y?=
 =?utf-8?B?SnhFbEUzc2QzdXRxM1lyVlZWS3JpZ3A2SlVaR3Njc1lEM0ZWemtWNm5CT0NP?=
 =?utf-8?B?QS8rRU1NL3FNQ3lFUDFlOUhiODZXcVNqamg5Zlc5RFBRWXczT3dBcWVKazMw?=
 =?utf-8?B?dW41WEE1cThuWVlWNGhIZjA1YkRseTN4VGxMSTRMMEZoSmVXd25OVW9QUEhl?=
 =?utf-8?B?V2taeGJHaUFCbi84UTkwL0pHVG16ekl1dTJCVFUxQVNWQ3pxZktZM3ZMSkNy?=
 =?utf-8?B?TDlxS3ludG5oNllQRHB4SHBlb1h1QTk5eGQ5anFueFFLSXgyaDJNeGc4V2di?=
 =?utf-8?B?bzYzZWE1eUIyazNTeXErRHpjQ1dJRUQrc2Fpd1RyS1J4ZDJJT1AzcDZTbytB?=
 =?utf-8?B?UHFlQzFXenRZdWd5dEVsK0NsdW5UWkV6TCtIK0NFTHc2Uk5iT1ZodjcrWVYy?=
 =?utf-8?B?RGhCRGdLZ2FhejIvRDhONHltaC9YNFJiMExiMUJPd0dxTHp3NUF5bkxCTEti?=
 =?utf-8?B?ZUtYSUNoMzAvTmFIVVV0OUZVWU5VdEx3RVlWUFp2WGNIYk5Dc2U5Q2duazdK?=
 =?utf-8?B?SURpRlcrc1NnTHFXQW45VFR4RityTEwvSjlGSXdVdEljT1R1V2dyMzBYNDNj?=
 =?utf-8?B?VE1mWis1ZXE1QVpSQ0h1SVFtZ1E1MllqSFZaZE14NWdHbUhrMk5tdEhGc2Jr?=
 =?utf-8?B?V2M5NHFFWkZhOTRhMUZWMTMzS09EeVZHQ2V4MElob29OSFYySmVwd1JlZ2d6?=
 =?utf-8?B?eUYySERiVXU5Q01ud2lGL24rbkd4ZEhwR0RIOThjazVTRUFXdjFZSzZhZXEw?=
 =?utf-8?B?ejZ4NHNSVlhpNjQrdFFTYTZvcWwyUEVKWW5aUFhQZXdmV0lodUFDNFZGdXRw?=
 =?utf-8?B?bFhhb2s0elVMbXpjUGRwNmw3d3h6RnoyZ1FRZU9pbHdtOGNoTG9pY0hmQ1No?=
 =?utf-8?B?Z1FzcGpoZUszTHUvMFRHdmVQcUVCSFZHb09UN0lDbkI4c09MU1cvd0Q2clBY?=
 =?utf-8?B?SGJwTU9HWHdLSjdNRlowbVFZQ25CVDBJRjlPbDRJM01TVy9RdDlnSXlDaTNJ?=
 =?utf-8?B?QmJMTDN2NnduT0ZYUExrM0xpQytEbVVhR3Z2THJUM1NPZUh4THU3L2tEOTRX?=
 =?utf-8?B?dmhBOGFQSDlwZDNEOUNsMjVvRWZaZllMaXBCL0JLZEdsYlN2OTVaYTlVbGtR?=
 =?utf-8?B?OUlhR2NCWENETlQxMkp6S3NmZlh5QXdSdFBnQkR3TVc1V3N2R3pXZ0pVczhH?=
 =?utf-8?B?MWRNRW01dUcwVmFwVzBDV2t2QWV2OHNoa0p6dnFmcVhrUzJ1dDJYcGxSTksw?=
 =?utf-8?B?TTlBTUFLRUlzTUQzaFhxZWNTZHFNV3JhdVB0K0Y4N2xqdy92eENrKzNIdjJW?=
 =?utf-8?B?cHhkYXlrakdqeWkvL0FFMXdKRllLYW9SRnZKTUFFK1hKSnVMVDFwNlo5UU5q?=
 =?utf-8?B?SUhIOFF0ZWUzNC9nOGlSL2p3NVN3bUVHaDRKYXVvZnJDR2NVb2pPVjVQZ2VQ?=
 =?utf-8?B?bmhXdmp0UzlaQmpYZnRKQjRqVFd2VGY4NHdBSVNzSHN4cHJKWW5LbVdqV1Nz?=
 =?utf-8?B?M0daZXNGT3NMUVIyMTBoeVVjcmhVYWJHeXVpUGhHQ3RnRzdKQUg4ekxjbEEx?=
 =?utf-8?B?aGNsODgxdG1QZTViY2dwS0pvZlRkVkFNTm9SMzkwSXRldVY5RmFIeWxIZFJP?=
 =?utf-8?B?a1ZDb1o0SlZuZ295ZW90Z2xGZWNneUpQaVY4NkpiMnlxNlFFUEM5YjRyTDc5?=
 =?utf-8?B?ZkdsemozYVpML1RzMkhlcUV1Z2ltTDFyKzJtZUxWZ3dCM3h2U29NSkYrQ0Qr?=
 =?utf-8?Q?8Hhbmaeu6BcYRRjFy1b0h1HGQZ7YLDqdmQxLi?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146c9dae-bc12-4091-0519-08deed6018d0
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 10:56:52.5261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HP1SflcvbFmrRjCCypkGueYFRTXPXlgUr/4MI2CCbaeVIfRXe62K+MhyVtJDrx/OWHXp7fUb7UeCUDnrC4FLaLeNZQGLSmAdfWQ6NAZaL9qch3uOFl8cPxxg5317kk4H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10274

Replace the bare placeholder comment with a full kernel-doc block
documenting all parameters, the function behaviour for both single
memory plane (mem_planes == 1) and multiple memory plane (mem_planes > 1)
formats, and the return value.

Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - Collected tag.
 - Fixed function documentation.

v2->v3:
 - Moved to PATCH 3/4
 - Fixed documentation as suggested by Sven Püschel

v1->v2:
 - New patch

 include/media/v4l2-common.h | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 4e5c5ffaf651..33f5713734cb 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -591,7 +591,33 @@ static inline int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,
 	return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, height, 1);
 }
 
-/* @stride_alignment is a power of 2 value in bytes */
+/**
+ * v4l2_fill_pixfmt_mp_aligned - Fill in a &struct v4l2_pix_format_mplane with
+ *	stride alignment requirements.
+ *
+ * @pixfmt: pointer to the &struct v4l2_pix_format_mplane to be filled
+ * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
+ * @width: image width in pixels
+ * @height: image height in pixels
+ * @stride_alignment: stride alignment in bytes; must be a power of 2
+ *
+ * Fills all fields of @pixfmt for the given pixel format, dimensions, and
+ * stride alignment.
+ *
+ * For formats stored in a single memory plane (mem_planes == 1), the
+ * behaviour matches v4l2_fill_pixfmt_aligned(): plane_fmt[0].bytesperline
+ * is set to the primary plane stride. The strides of all components are
+ * aligned to the @stride_alignment. To keep the chroma strides consistently
+ * derivable from the luma stride, strides may be aligned to a multiple of
+ * the @stride_alignment instead. plane_fmt[0].sizeimage covers all
+ * component planes.
+ *
+ * For formats with multiple memory planes (mem_planes > 1), each plane's
+ * bytesperline is independently rounded up to @stride_alignment, and each
+ * plane's sizeimage is set to bytesperline multiplied by the plane height.
+ *
+ * Return: 0 on success, -EINVAL if @pixelformat is unknown.
+ */
 int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
 				u32 pixelformat, u32 width, u32 height,
 				u8 stride_alignment);
-- 
2.54.0

