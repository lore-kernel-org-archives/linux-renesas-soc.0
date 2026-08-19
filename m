Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011063.outbound.protection.outlook.com [40.107.74.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FF644C4E1;
	Wed, 19 Aug 2026 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787135340; cv=fail; b=MqbJ9hd1+3rDamR6/bdMey5zv6fmAGLumreFhy1vA3pAP6FsyJIUBvsZqLuBk/BDdJGhKi7R8uhyn166SrAQN1zQVnfjnBU0HS7p8ru+uWHwniDVGS4bbpgFLsA5kI5MC6+8qI41tYaTccT2QewsZ77DZVKxOaoteX/av6N44Zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787135340; c=relaxed/simple;
	bh=L1Feb4Riat42RO1WDg62wo2iQbuK7OqzwkC4y1+NaHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m+X4tFis5iANxsij6crTc2jx413Ce5d8OtxP1c6RSqnouw9/v7sonTy0a/ryHwFa/xKEG7MmrvJLInlSg303en3NeppQtobOejFV7aOzSF0bgQ8TpTn+/MaBtjgJo4NTioG8wsQdpCLAC1DfMMjLVsh2agKFuSi7Qno+qIX9iMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qplMQL7C; arc=fail smtp.client-ip=40.107.74.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qplMQL7C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZW3+gLhZqsTvTHq2YXizCha7sjguV1FdJZEqUJtsY9scx7P2gqIvhN6GvjC4S6ekG/x0tVba0jQPvarWPW/7JEZ1i7jP1Aq89bX8BXGaDraz65sU0CFn9MSEg8/irnSyOAo3uEwS9aFZxWOz4X+VC+c3SHnWBuXNdzFbFzKMF1i2paczsB9B0M3nc+E25G/CEBSN86ho9r4gii6ql7WE1ThL49cfoN99jHnAvqjtMXt6fm763+yWvGC23Z8RRMcE3BS5Mr2aKxYpFbDqz4QNeFLLGaM6leEJcHv+7H9de2B6Ny0Hi1Hakntvz8PGwGvoTPSzRzf/T3HN7lGdmG0vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hr7He+Tb2eeKbo+kgyYuAIWnslGT/U+uoADOzddjOv8=;
 b=uvVbGCBTuEmVllwypMphdLriKS5xULGxH+tW3kHXeXWL6JDeOv2kzpLgTO2Tdkf9j6rh6+pKZYWxkOgpNdCOSwa2yBULGwpL/5ZGX7+l2ja0aYFb6b7yQbxupI36BQd5/R4UcvGTFXl40HBGSRXRN3cqM9wdFqRv40UG0pFRo3tAZJxgDBJVykTp8RHfSaXIPx9uYq1jyOWfbHTry+kpNPGc8RjpJEMc4CF0BIi9Ph0zgoGPBPKVLiHbnbwo6j2K0fJf/FkPUBYjK7/qe+4pdthzjw1xCMRB6AHFeLWqPiGpCuLllzcxbX44LE5O8DA4H4LVCd54H8rotivBA+BvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hr7He+Tb2eeKbo+kgyYuAIWnslGT/U+uoADOzddjOv8=;
 b=qplMQL7CP+LwxurSO0dfnFWT9UvPnQ1zJYBnJxdYOD4mNEGRgkiN0kKZb6k+1hEjw8cHynvNos35nYjIVIia1QnWuGuGokaGTYv3luTZHL/u4hxLLZyGhup7QN/GJIot26H1BAInpYosdat550sah0bEfwldj6Xt127DrKAg5Vk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS7PR01MB14761.jpnprd01.prod.outlook.com (2603:1096:604:394::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 10:28:56 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 10:28:56 +0000
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
Subject: [PATCH v6 3/5] media: v4l2-common: Add kernel-doc for v4l2_fill_pixfmt_mp_aligned()
Date: Wed, 19 Aug 2026 12:28:07 +0200
Message-ID: <20260819102812.2592880-4-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-MS-Office365-Filtering-Correlation-Id: 3cef00c0-ff1a-4a45-8a29-08defddcac2a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|52116014|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 ucFNh24COuM0CBBRHBKoONhcPZBazunK+nYaIg65NHi0N1sP/KzBCmxrCViLp7maq74sBi3H6uZp5IxVkuk3CJsyurB3VGZ7dnFpDJdD+NM39CLP7HDdP5K3R8JrkepX/AX9JgSBLp9NjI+oyLcinmcaIapUYcrdk42IpRy3+lqM/m+4AV23rMMNqk2eSCQ5AN+dXh9h1nCkrdF/DOGZguyQ0wWgor5OhD5UB5/FaYY3SDREZvy2gBJSIAfS10qRnc0STTownfPMw+nwEnF9wJzKJElgQ+B9V9XPqA77nfkSVt4TbGG6ciJyzW0/4BLA2g4Iwz8+1zNNnMBflKAqYZFrqiDJE5wKn7fV2U4uuIIoU6hArTLFUEkWjOn8k0hbPYK/aBLedonJjKoKNTU3/pssUxDy7Mha8jM9Dav+RGdIM6HnaYPYCcRvdAqTDcqPa6oUWHPa6h7SgsZOw6mm9rGtM8CEg8QWsDrr69kZLy+LJjkvSmNx8EmtkvFILWDcsNs1Dyq7AWdNVErgYySyYDc8rC3iMVb0OKBP/EA0U/eAruIy01eF7k6IUlE0ZV8CKakfDx1ptC+93b5XtaH0h33eow5OBtCkUKaX4R8Vex4TwgJy2ttEw+ToHxxTN8gOVCYz2hC7irKsPkWrXWW/B06LuFUPhxVK0nrbw0Uf8QFKRs2iItywFdMF0bSYKVdz8/IfnJqGvrF82RpNjpUEA10HU2YyEKfrV70loPlZQEk=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(52116014)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?a0ZPYnh2QXlZK2IrUlBvTWZDSUppMFpCOFdlN3phK0lTbFdpZnZYZWVYTVJq?=
 =?utf-8?B?RmlDYVdObHZPM21LUHF4cUtUUEEwbmoyWjFtdDlTUXJHdzZnMWU3SkFBQ0FU?=
 =?utf-8?B?cHo5VHI5VHllT1k5ZFhOc0JXanBNMUlXZWR4cHduN1IzVWxNb2dDcGpVb0k1?=
 =?utf-8?B?eForamV6RjJEcUdLdmtqTU03dWpCOTM5WlFEbVNSQ3RJcFhxWXRZRk9aK1dV?=
 =?utf-8?B?TXVHRDdMZ3NxMERGaWppeEU3YXhEenM1dUlmUndSVitIRlJXNEJmamJaaG4x?=
 =?utf-8?B?Z0M0WGN6OGtEYmU5a0V3cnArRWYyOXB3MnZXTEFiTTBObGt6dnBxNFlJNlJq?=
 =?utf-8?B?MUJaMjVadVhnbm5DMUVnK0o4aVV0M3NOalAyUGNRWEFMSVN4aktpQ1RyVGdR?=
 =?utf-8?B?THZ2eE1pUjAycVJVelRMTlQ0WXdQcVFEMkRKNkhhTnNKamVCTE1ubnQveHFP?=
 =?utf-8?B?c1diM05FandzYU0wWmZuNDlTOXYwTktMVjRQUEtpMy8zdk8vWmhFd25iMUFE?=
 =?utf-8?B?SFJteEFMLzZ5WEdseFkvV2hUblFOejZnTmN5SXYzMjdjV3dqa2QyN05qZ0Zh?=
 =?utf-8?B?K055T0NrQU1qdXVscE8zTWNBL0ZtMUs5WXpGcXhseUVlWGYwVGliTlNZSy96?=
 =?utf-8?B?TjBHSi9RUGd1RUJGaEhvZ3o4dzFoMmF1SjEwZTB1Rnk4enlnUkQ0SlZGd1hG?=
 =?utf-8?B?WGEwa1FES0hGbDllVVh2dFJwTmdNSXRidWlad2VxQmoyVjFiZFdwMEd1WEdE?=
 =?utf-8?B?WkNEUU5JcHpLZDlsN0JsK01Yc3VrTDQxelJWd3YzcmVtODZITitWdUpRUDlW?=
 =?utf-8?B?emg2WUYrVEZnUjZVRDBLVGRzZUUyMDFOcU9QSzNLcEovampaSE5BN1VHS2M0?=
 =?utf-8?B?djJrRFc0R1hSbEl2K1Z0Uy90WXd1QkUvcy90M0RrOFAyV21JclFGTWpvUnJj?=
 =?utf-8?B?b0pDY3JlaGxha040Z0UrMm5ENW9XSCtOSXRxbVBSSWpzMysxRGc5Y0N1RlVR?=
 =?utf-8?B?NjFMZXFWY3hBeHJoY1V1Z2xFZ3NrMGVVK1FLeDlmSEVLMlRxWElERnVwbk8x?=
 =?utf-8?B?VE9qR1dnb2xHTmU0UFl5TGZGS0pzcXFqMDM1ekRsNGxUM0pqTnNNRVFrdWlp?=
 =?utf-8?B?SmxuQnl5djB2cjhiSGY2cElHRkxvWTEzUE9OVE9LODNVSWJnS2VLc1JKTG54?=
 =?utf-8?B?bnpCdUVVdkw4VDhjbEZidGVkeisrcjV1RVAyYzIvMnZ2SHQxYU9Za1c4Qkpw?=
 =?utf-8?B?WitBWlV6dm8zcmllN3l4bTVBeVlscXVMQVFhUTBSV2hOc2hnZGU4T3BVOVUx?=
 =?utf-8?B?Z1U3TFF4cmVhYUxSR0NPRURhaUphdExvNXlkMWRBK0ZsSmVDZnFJOVNRMExv?=
 =?utf-8?B?ekk0blhldnZ1bmVQT29ENldjYjE1bU9pTXNlc3ErVGxGM3QyQjNtU2djYnZJ?=
 =?utf-8?B?VVUxMlJ5ek04bGxVMU54TWRjQjRjajcwSjhaY1hQOUpYc09XMGN3bkc4MXNJ?=
 =?utf-8?B?SzhONG1sWG9YU0VCWXU4bU14V1VwWVB4Zml6ZXJtNWMyR1c4TGdURjNqcTdh?=
 =?utf-8?B?VjVSVTUyV3B1SFBaNjI5a3lGbmJsclg0Y3RtZVNMRXoyaHlNSjJiY2JrWTJu?=
 =?utf-8?B?aWwxZytZakFvS0lIdC9KMlV6NkI3UHNGUGMwSHFCOWFxSjd5a2pLOThtVFRh?=
 =?utf-8?B?SWc2OUJ2amFnZlRmQWhXVWVDU1IzUzRGbElpUWhJdFhQOFBrSUxQWlR2M0N6?=
 =?utf-8?B?YmRaZXdjSm8vQjZHbWZhT0pMQUdQcGNydEI2YkIwaFBEWTRMcFNhc0pHVDNv?=
 =?utf-8?B?K2lDUThVSk15V25VZ25Hait3RXdJeVVENnJxMmVuWjY5S2N2UXJuVDQ5ajBS?=
 =?utf-8?B?YjA1ZnJ2bWlXOTN2N0Z5RFkrYTRSV2ZucHlhNnk0T3V3MEp3elMxUXo5V01T?=
 =?utf-8?B?R2RSMDZxNWhjb0MvZ2x5K01IRm1JWjNodUtwc0k2Z2N4b0NyZDFXNmdjZnhI?=
 =?utf-8?B?MUZvZDR4eU9rMXZpZG9TaEtzQlpPM1IxbXZVTnhOYVFWWFBVbHRVM1BSTkg4?=
 =?utf-8?B?S2tiM0kxazhuZFE1cUo0YXV2ZWxpMWVzdVJ5Rkc2TGxwSFNIUXFoSUplVXIv?=
 =?utf-8?B?dFNhbU5wSkxaS0dpTjdISWpzbnRIcXEwT0dLNHhDeENRR3R5UFpRUFMwNThZ?=
 =?utf-8?B?NWkxZVFlQzIzSEFSQkd5djFRS2pYWmNqYy9vM2VpTUMwUml0Ujdxb0djT0tK?=
 =?utf-8?B?aGloZ292bmRvZm5FV2cxYjF4STRXNG5BcllVbDZBZGtzTnZxa2E2dmxibDQ3?=
 =?utf-8?B?Z1pjcG1sc0p1V1ZKWk5KSEZaUEVoR0E4SXpTeWtYMEdsNE1xTkhsdHNWMlBs?=
 =?utf-8?Q?wswxAP+F14CPVhAEBrA/hbA9RhRSqhrKSK3aS?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cef00c0-ff1a-4a45-8a29-08defddcac2a
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 10:28:55.9554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vf7HlLVBTBRb9g+qSnjA3/0QVNNRjOTC3z7a23wMNQJgLnyA/kQ+pOuszzI1330c2D1nt3QX2q9VGfEpS7NZtLspDN7XkVO3t2VNiXlBo6w+4UDg/CSe6vMa9VSprVKZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14761

Replace the bare placeholder comment with a full kernel-doc block
documenting all parameters, the function behaviour for both single
memory plane (mem_planes == 1) and multiple memory plane (mem_planes > 1)
formats, and the return value.

Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes.

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

