Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010056.outbound.protection.outlook.com [52.101.229.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ED144C65C;
	Wed, 19 Aug 2026 10:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787135346; cv=fail; b=hf5iTnbAH+SQ4UMmcrTCMZbdgXyOherVeol073bV8hggDS6F9cT9EGfXX4Guu1pZZl2nVavb8uWfrt0yy1D29B/oUkI4J6JniUcrDpsIik4ylmAwc5KMiOFJDsCjQbBq/8u/YN0t4JkdlnAW6vaZfDF7q6g9zYGgOaC/5+C/dcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787135346; c=relaxed/simple;
	bh=+83yXVFP3ncARByVepgPl4JWkuE4ABwjIKxK7yn+63Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fkOllB7ELHiGQMiBl5VRGAA+wfBTF5vCgdlq3zIvDdrhDuhwIiycWKSSp7VrWewF1njrWPb8a0eIBFAQOkwgXnZv1FnuNK3n1xG9XDrufC4Z1TeBgbjwGl63T2U0bIGb4jPiWXs1YRYIpGjRBrLAWIQRaGvvGSYVURDwQEGVJIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fYn0ykdu; arc=fail smtp.client-ip=52.101.229.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fYn0ykdu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UU+dwkhhkxvua4XAVg4ATH2lx9MeJzV/pZo0hQcN58cBRvBiZ4n3ZEz5qOS1yh4DJ9O5lK41Dr8mCoBEFZMOarDATL4zSj7yYPl7bB2q7JrDvz7T8m2IdE26QTT0sX3kOv5yfipkphv7+tsjhS/aWosCPJzMdaWUToTSYKNc0I3f7XSrldJd7yBL47msNI0vlbjaUDEGPuhOdF30eBzUfKkeakbuU4uFafX3RpZZ3dicavEZnOs1eDOV+myc6wnrAWkL9HoT0d0QPVQ+IVsqvOD8S14OvWGRSZUkMhOZ36Ttx04Cu9uxfjSjNN+b63B7LDwY9dyyzQ603xsaHA3sNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uqizveu0QMPUynPSGdpmmgwQpaEEDsfQ2otBAD5S58E=;
 b=jWJYElAv+ifAL8jcVelB5w7Ju/9KqzFL0+WknzVjvqeYM6CwTUltHort9+0Nuu2IfRgYM0AJbR1ubydPNr5MKj6RoTFGKE6DUGLoI63utI2iVjdL96m3NMp71jKW/dDOmt8FHhX9LSowTf/hI9X+Vj+xNcQI54RkvTe13xS0S55GdcZWbhtgc5F+GvAOSjZgibHeZcbDACpW36Jv2ZKGhvTZOCLRRQdiRck2AhSvjfTGtI3BN0ExuOgCOhrKpolx6e4UDrNKjIVBvA/o0Ef/+1AqwbdRD3dpawRDWpZGIedXe9XXWWfeOMCofzRANOND+hhxvXegXsgRyfIGRpdrfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uqizveu0QMPUynPSGdpmmgwQpaEEDsfQ2otBAD5S58E=;
 b=fYn0ykduCbkhnEdd43s6YLNiXfz5NPSUNknPtPB77WeZB25DAiR5AWjwoUnJ8sYNzXlnCHW1IO5XEv+JlETSycuLfdsjrjOcTxcLQb5Gkd7Sqbm8LoQQXz/nv27rPnfJPB1s/QiyNlo8QzrTHZUywBP7bkwD1egSb2SOTZ8lFrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS7PR01MB14761.jpnprd01.prod.outlook.com (2603:1096:604:394::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 10:29:02 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 10:29:02 +0000
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
Subject: [PATCH v6 4/5] media: rzg2l-cru: Use v4l2_fill_pixfmt_aligned() for stride alignment
Date: Wed, 19 Aug 2026 12:28:08 +0200
Message-ID: <20260819102812.2592880-5-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8aabac41-a45e-4208-560e-08defddcafe5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|52116014|18002099003|22082099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 M/GQVa7VOKEwSMou/bkjx23fvHFMK85cilpu7iAMSwepOmRyOy/ZFazkjuOkOey0iYQ/mz6sccAoEvovgSs272IXj92OHtCzX2aFhUoLqTMp6rZ6VY4AnX7NIRUJOErCnQ/b5J265BY2416fQEvZ2d+K3PQN0RNUwNdBvNr9mtXeKKv5+9aP10RZ4r2KgG4ajebyzybr898fhFbUIDWMcAQtPPtePpv7O04A3yUXhAK+pkGlUwOWL4Ph0oCbcywGUwU3UyPEDq5VYYqSSpiO6o6JYOq9mLdpfRxUbGVZrRTCE0CC3+jQcHVOS/H5LomcRAbm3EIFFmZGkKXym37CxZxKVdCFwUCiUyqGSkptR7eQTmR/iPxJq4y2eXemoJHmeupKDi8TxrHqzlxUxIcpvbNyVGMtsd5M8TFQuvL/RWhVnZI3PeC7nat0uqc8/hjN99DXiw6mci0oxzifInp+iNRxWHmav5pU3ys+FwmmxufPQTkfC2jrohfK2txPg9lNdowsEfiXvPHhRIXjnv85YCL+lzBfLPaUcxlq1BIIuzPZT8d50gj1E0UHM+89qRV9E5UAaAbHDUD2V7B5JOU2tKriYFL6MFvYTAc2SaDbFOg+TVCD5SXaiqWF8ihcZl9SR7mP1pqTBawD6Tgas3oaVoSISrAwjJ8OFnrT9iMYEteSAKhqWO7jt2pLwiOvoPjun4GSfEQ8l3w3k7Qqxv/IF06TT99AU2ze6/voYP6KvAI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(52116014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?jKFbZ2UvHvYb1X9+CZpEn0POoBF4wu/J4OxB9+/+p3bFqNVD1Bi/M+nHZU5N?=
 =?us-ascii?Q?+rC1+100hd8vjhyk8agDYeusSfKprwXwKKAEszyfdH0YsyxSDf/XLxbWk9QR?=
 =?us-ascii?Q?lADt/iYTkkJqXi3UtaHINcLMBtiysGpasActr9affqeMKaTbTn4cpIX6QCyw?=
 =?us-ascii?Q?l0faZpzmxLXF7DUMhcxeUoEXPOCJjIdy6llWpY6W1Fvoq6UnT2ASDbgvXcfS?=
 =?us-ascii?Q?hRNz/kHVtElwIZNzAxKmw7KOf9qR6SG67Q2Vu3lv7E5zTsQyinXCZQS9px1/?=
 =?us-ascii?Q?p/HhXCzhdDBUkLM0uKVJOeRhVOdCV/Ml82DWj9yriIQ3RQPPLh0uNdb6p6Kt?=
 =?us-ascii?Q?Mf/S1En4RsIFFVCuvX66Md6+sqceEvo6Uop9wQJpWAWHU1ubZ7C2o6XZGqHX?=
 =?us-ascii?Q?m1EIju21lPb8zB11MeKyJ5ut9Q9lS9YBj8gshzzeHij6DgjqmaHxDypAvdqC?=
 =?us-ascii?Q?BCkIJcizUqmKQdHVcaEH1iYtpja0ThPXRo57ajmyIrkwylCjU0ZE68TI1t/d?=
 =?us-ascii?Q?8m4w6ixaxiwpaS3ut7ATRdFprMqzYQRkpLu/307kqsN9463E7oqP1Ru3VG46?=
 =?us-ascii?Q?c9zj49p+cuEsyVhgWwQ085gExZgb6e3S7ey2Co2AokNATNFhGDB4UtKOCqhw?=
 =?us-ascii?Q?LYCyKfPTd3bJcAMH46RTx34/n4zTD2Vxk3PJ3ESamvk3c6HKKPx7c0uxmAul?=
 =?us-ascii?Q?s2kR7EEc/yPQoWl1GbxYbzENI+5T9fMEw2DAAp+aOqOvu3FnmmbEnUBRq3Zt?=
 =?us-ascii?Q?nW5ASHqCPj8mGZG70gR/srkR5kAGO/XnZLj5Onoy91usfZJ9Ssz8vlfLq7hU?=
 =?us-ascii?Q?o3ePuKi2LIfZJcweioo+nfWYvIU3qaBoniywwSfNkV3d0LtZx/KEnR8wYeiK?=
 =?us-ascii?Q?Cp6BmDM3PQuOf6LixJp3ltQHpfy0IGmOGVMlfE2yUrvZO5O2iVqDyJdUJPiA?=
 =?us-ascii?Q?uEVXJJTAkNAfdSLwa/V9KImW2p0PHjggPbD7A0bkieJuZe6sKftOmglvp3pb?=
 =?us-ascii?Q?2WHUVPtxaJ0408X4LOmIi8rXPoojhImSZjCbhs4zJr558XBRKfJmy07DO044?=
 =?us-ascii?Q?3cNBCNu9suZxZMQps4fsURZHfjJ3i4IEHgKvStXF1n6r1nRjpEl7heFIye6h?=
 =?us-ascii?Q?O1GMKqZ7LglhObPd9B/rejPitpK7jeCAcu2tVWIKc/gpbCs7jUWoxWSzU7Yw?=
 =?us-ascii?Q?TW0rpdtbwVfvuBNB/SqFWp3C7118beCov/5FmxUgnZmeNqmNgZNj7nPRYMYL?=
 =?us-ascii?Q?kKybhf5c3K30ULVB66lXIc9y+yF38JLpn/0L+eKHwgv7TeY1jv/HvhRyGpdj?=
 =?us-ascii?Q?GrRrogYBnSEPIZfa50k+ba5YpKrsrNHVHM1GmeANrcbrkqPYZK4hVEjO9uMu?=
 =?us-ascii?Q?Kg9MUXyaOyqYfUCS5f3jKoAZMD1A0bSG2mZIaX9mPcORt68SnnS6Z3y7acTq?=
 =?us-ascii?Q?ifCn9QqzREz9mrAtfZOOdw7OWTr8RttayBy54P4MiYkXdxd/7rWa6eskPotP?=
 =?us-ascii?Q?2L18SkLxtIeJAXP2gnlCpAwwrszbDGDRLE16IIXC+QRSD8cZ9rpx5QWfbVmN?=
 =?us-ascii?Q?bfr0WkhrtNm3gc6cFdwhynbu43NLEozS6EyUXfOgBPuX1f2O93fN5CG7uaMr?=
 =?us-ascii?Q?s6KixDokvskDmufsZqvSSyBm19P+AHAr+SL4M05iwyfxoW1N7ruXE8Nv5Wor?=
 =?us-ascii?Q?mzkKtc7cLx9GFy2fmHxE2qPeqG9fGpHWDuvEVsiuV7Wm4Sin9ogusxzBP94r?=
 =?us-ascii?Q?0wF36kibb5h+VljeKdmnz5eSEO69iT6C67PxCEl3w7bYF4XZHmRn?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aabac41-a45e-4208-560e-08defddcafe5
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 10:29:01.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrvNDRY32iIUxyX7nrp7DgCIBBDVg9/Je64i1sJrLwe/0MB33rbzRelxP2EePCY/fP4PjxfW6oLPB3UOGutRvXih9mvIMiKhiADbKZzmtLXhRd/oHk7EUnofhtcvyGpn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14761

Replace the open-coded bytesperline/sizeimage rounding with the newly
added v4l2_fill_pixfmt_aligned().

No functional change intended.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - Collected tag.

v4->v5:
 - Split the fix so it no longer depends on v4l2_fill_pixfmt_aligned()
   and moved it first in the series, so it can be backported to stable
   on its own (This the old v4 PATCH 4/4).

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 91eda5034248..27a35ef2a6df 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -849,12 +849,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
 			      &pix->height, 240, info->max_height, 2, 0);
 
-	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
-
-	if (info->has_stride) {
-		pix->bytesperline = ALIGN(pix->bytesperline, RZG2L_CRU_STRIDE_ALIGN);
-		pix->sizeimage = pix->bytesperline * pix->height;
-	}
+	v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->height,
+				 info->has_stride ? RZG2L_CRU_STRIDE_ALIGN : 1);
 
 	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
 		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
-- 
2.54.0

