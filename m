Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010016.outbound.protection.outlook.com [52.101.228.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087834399F7;
	Wed, 19 Aug 2026 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787135328; cv=fail; b=Gb+sUDYZXKAUvb/UC0fZs56bbyWNX1JdorWWMVwAKk3HRD8P23nL3ELsS7PBMMal57b5vo6zmdmAqp4/HFk0Kks54nHqEPGWshZQSBpYfjsKOviO1AlC1E6qMOU+J09KQMhKTm1eZ8lJjGVGhu4uSxM4lsOyUvHo6zFFgMm6F3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787135328; c=relaxed/simple;
	bh=OU6E/WaWkeCxd+OsVQxPYX0YH2MoBXAcvqy4jd86oz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p1J151H92+7ucNDBATgbEdSqlsJ+q/CPdJQgLTAeRj9N7rcFjw1N4Dz4FMPaM0R+92nsPXMo4VTUWxQ6SToDcCPXZRGGyTgNBBpgzkNFUz/sQt3SfBdB3MMB5NCPWYi16xwOCZ133BcErEX6Gc/MbC7VKZSR1CZM6wtsNs2oGyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gu76+kpd; arc=fail smtp.client-ip=52.101.228.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gu76+kpd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPl1NL/DnWsg2OHcueMq5SKMsbZqjX1H9eWCsLTILWcxcaSWqu8agJa7LExioFT3Qw3u82tmgv+cPWnbcOzQ1q9n5U1vle2UC7lzBTtveLv1+I8Qv+fNaxOqHn5eUD50gxColK1vL+7sIXw53J2egYKYOAIxMe9J8+uPJsyG6ZA6lQZ3K5w6m6MVHIj0bQGtjoQKfb+95AWEviDr7qhA3KF45GHn55k2ra9WcWVbOrNKxuUNwWLF0JcH4kqIYg9SjP5a+nnbYREd5BmfWLJlpVqnR5r5vpgddSm0HdxkAVjuWowS76np1QIsRJqfjtOrxn/c5jBKu3c2qNeoq4YTZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0ByvuvFEGdnPYMiskyMNm/0f6FQU3Pa3deB7ZuqpZ0=;
 b=dOFa9/XsCl3tzGgF/vHgGLrm9crUbOaIq8d6z3maipZglPRl4jX/WVRPpA+n46++wrlgDWJbiAjlVScYLRLtd0TGwxrdF5pLUwi5rVQu+hrrhycpFmeXzGY1I0HZ71zKUxEfDmVP6qeqPF9HyV0r++uttGL/36Cadn9UnlC2AsNSQGySAOxX64IC6zYtXRlwycwqxZDoOv7Vr8Ld25LfWn23nZ+K2EQrOd0pjBUk7dqALpVgZfQ8lW/I+W/xB6SbTU3euZye6saR56PjeyZiPBB2QDR5fYiKPpXmOs1ymCeQvR8qFXjaX0JgfjtPgWkeHhFeXijwNGVpdOjqduQi+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0ByvuvFEGdnPYMiskyMNm/0f6FQU3Pa3deB7ZuqpZ0=;
 b=gu76+kpd8nQC7SJ0EBO+gm41/Iu9jjb/v2sfpqrBCbye54F2so+tIjghIBs8dRTAEgX/voEqvJCEKJR0g4RcTNnUKvqFjCHwb48tVYnekpjb+sBWNMgrYZClc0nElb06dVs8Dh9tGEO/+p02Yxv/LUayYp0DHajCdQvNR1MIeWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS7PR01MB14761.jpnprd01.prod.outlook.com (2603:1096:604:394::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 10:28:43 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 10:28:43 +0000
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
Subject: [PATCH v6 1/5] media: v4l2-common: Convert v4l2_fill_pixfmt_mp() to static inline wrapper
Date: Wed, 19 Aug 2026 12:28:05 +0200
Message-ID: <20260819102812.2592880-2-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 11e8a891-0ef7-42b9-6dbb-08defddca460
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|52116014|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 YmQxdhcvJ2/KIjBdlAnpDS8kH6AMYSJJzUoG4io/3slYxUoxeYoe9tccurGkbWD1wYL4kLQbBPvPlDf/o0v939M9cFyBleorBx46KUW7TtVkDljTWCOaq7Dcsoi7DGbrfRK+SJAcSC5PpcwGMlHeMayJA8oUM1qk6uHELVRUunItR1FEFlJ6tutUL7zAss2ndj7+mjuuLkYHjqHwBmvLpYBdAZ6G7zaOTqPGaVbrl1UljQeau4829YHy8aAbC4yP9OxO9hmdOEZnRKTWp6lUitOVYYMu1/boZnzO3+liRLJM2fs7cHUnwxhxhpykNQ1K5X1/kuX7+3DOIjxSebEQVjOV/gg6A7X/IQyLqluBSxHtqqkaa+sRxWwxaJyljiW89teWJj6oNgOOuZcY7ktD6QmYUGbD7pVR+YGC9IqsY3HQdreG2jmtwYKPgMWd9qBy2fROwtCGDpOO+idInKufS2G64hadx+RfRh/FY1i40EzvsNocFmypwDiabeKn8Y0ZlctR+f1KCLvZxV8vEJlqFWENwORomirnH9ONB7Rl2ZqsZiWlh3Z01SoJqkKbb8ickCTvhGr123m+nLVfQmSVuTpNhLFtcqiuzzkykV39U/KnBbWlp+Pr2O22g372R0adX/4oZM4Urqk96AKrLwUvcfBl01C2C6Tb3JKLxMAgB3NUbWCgr8QKBCnRbc+ZFJWub46VPO//4lpIEKV7LjkQnKq1uzKanURwFKCy04q21FQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(52116014)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?bsBinUM+wK+ZPGgADEE0P6u5h/q88wsbj9t8kz9xrNyzATzWTN8PlyBQHT65?=
 =?us-ascii?Q?tZMMIz+YwRq20R7Fb1fRHw8emppnZ52c7emWI2Sq8GA4F/JrzziBUF39OVLi?=
 =?us-ascii?Q?Q/XezVoF1Sh+z6AcsR0/m2KQIIZSDAGzlHz34a0uX25gWvU4xzVAafq4ZfdI?=
 =?us-ascii?Q?nnuBRo7o6x67C0mU9iEc+3YF5tSW0VcCGflQXgQ+bf4/GmjXfr9nVH37Ewsw?=
 =?us-ascii?Q?kI4ij5JW37LOaXr4vfXp2PV/HJCAokHtkVWmsJhQB7eEHaNFKhkZL57tccbU?=
 =?us-ascii?Q?j8GToPyxDfLJy7TZhU6rtV9Zp7eyIWFxzbeezPJ1SDJxKX/EADdkVwsUDKFf?=
 =?us-ascii?Q?6crPcfBJkspZGAjeoJAQnR8VWujOBDSC0LLud9sLMmyY+3NUAjLxyFAJrh4h?=
 =?us-ascii?Q?NW0qSBMozGfKuyg/x6ztdQ5ZV0/cmNObQgk1n7y6JjxJP76Ke66jd24eQK2E?=
 =?us-ascii?Q?v314himHxMa0eqF03nPryybAkwk5/G7SBJcuZTw0Z0kSP8UmYeyME80dElGt?=
 =?us-ascii?Q?UhcmzrHgk8lkYvQ3mtz2qeC/4Lb8z7GW4Ap8gk/NWKODGvEFzuj6aDGK5ANI?=
 =?us-ascii?Q?L99UwCmlsG8cROhI2OAkBuwQDaAZETMGBRiZSCYk6OCufEJ7G1U4rnLbxIJB?=
 =?us-ascii?Q?C+O84k21JSzhxkrR+2Ko7tYhmR6IplyyyfhFst6uE0jkv2m0Inx47rREuhAy?=
 =?us-ascii?Q?Z6FgcsmjhayD2ymRCKR446tG1om5H72s9Pw+pnt8rHvlHGqX2avUFwViU4W6?=
 =?us-ascii?Q?gMF6hnhC08QxSv13lKsOybSOqA29Hp9JZQt8B1fGHYJwmLz2qdaYQyd8K5eP?=
 =?us-ascii?Q?4TdnZQTubPjOwjuQlktAfWfoAd75MDPaXKqDEGLomEmjdPvZ+q6aFhVSYQpc?=
 =?us-ascii?Q?81A8tsTm14c9o6MjWw/SqjkGIEAGOyeHtoj9QCxU/2qFmLBnahf3vOVj6PU6?=
 =?us-ascii?Q?WrDIZI+u1lbgSFWi8LxCyDEkxYfllN9Yvki/lExrVQHnQqT5x40nXPOX8yhp?=
 =?us-ascii?Q?Up/AZgPF/jj8EywaloIoHs3WEHRCsXkk1u8phERKpemNr4W+yUKu7dVOClf1?=
 =?us-ascii?Q?QP/l2y9xibZEpWLWEPvjAoheHxhs/rDKitf87JE31jqQTeBgAGtvTXrI9GQ9?=
 =?us-ascii?Q?tXTh8CmtZg4QoeP9sWm/95aImGqJ90K1zV7ZqvO7lKATqwGOIPaF21uZ41Nd?=
 =?us-ascii?Q?On/Tcevfok6e4YhZSLChHA++xqKc4fA4FjYDNp59Bt7eWvrZgsqbZiK0pg6O?=
 =?us-ascii?Q?GsKnJ0GmgIhkWj/LT+oNWyCHMWOUB8gDp5CIhdHpovf181gjJVMrxxIDOiw+?=
 =?us-ascii?Q?BXUIqOPL0Yqzqf6AXmq123D2YDsHqlsrrqhP0EWFOJABjKjAVef+1pLhQlmE?=
 =?us-ascii?Q?3IPaBuWQ0shS/bG2oPfaVPlowpGvWWSTExsoORNeSutFjqECh6LYnDLw4IaY?=
 =?us-ascii?Q?WLZhfnNT7JaYvXYIJgcowFO/8h9cjJ/naFwFSReisgwXr8eHtS/ADzZWHgYS?=
 =?us-ascii?Q?74ac0NhXi4+DpLOI2UprxAwN3eFyWWbsU0+3u2VV20dXXGiT4xom7R1t/vCw?=
 =?us-ascii?Q?b4piy0zhKOxrZ+19pw2dVi4NskoFl8EpxppjYmjPB4aMo0LrBg91WjB12Lh8?=
 =?us-ascii?Q?GQz53XPWnHGglN4unq2Op+PChfUmmQenAuvEwC55hgNEMi8ZjXbvWXIKY7Q7?=
 =?us-ascii?Q?yByJxv9/uoi7ROrFBrpZl4uGvJgIRpL5k4/CRJziU8vD1R1GRlJEdMQSmuVS?=
 =?us-ascii?Q?vVh9N4yIyivmccfts23ESULeW8QNw+f9QtJ1suRcTs9NjsZK3e85?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e8a891-0ef7-42b9-6dbb-08defddca460
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 10:28:43.1176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yf0+t9XSivGSxcGvVEpzMwy/qbhVhC3qCIhzwhlqLEcAphw12ukj3e7orFHO507U8LCvjwpGKXgMI16TpaKRaW7vLhc51tJ4KD4oefKbJLcpKN9cONWJKXFl473MCUt1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14761

Convert v4l2_fill_pixfmt_mp() to static inline wrapper: drop the exported
v4l2_fill_pixfmt_mp() function from v4l2-common.c and replace it with
an equivalent static inline in the header that delegates to
v4l2_fill_pixfmt_mp_aligned() with stride_alignment=1.

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

 drivers/media/v4l2-core/v4l2-common.c | 8 --------
 include/media/v4l2-common.h           | 9 +++++++--
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 65db7340ad38..54995ba8c20d 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -537,14 +537,6 @@ int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
 
-int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
-			u32 pixelformat, u32 width, u32 height)
-{
-	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat,
-					   width, height, 1);
-}
-EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
-
 int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 		     u32 width, u32 height)
 {
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index edd416178c33..749fe38c134e 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -556,13 +556,18 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
 				    const struct v4l2_frmsize_stepwise *frmsize);
 int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 		     u32 width, u32 height);
-int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
-			u32 width, u32 height);
+
 /* @stride_alignment is a power of 2 value in bytes */
 int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
 				u32 pixelformat, u32 width, u32 height,
 				u8 stride_alignment);
 
+static inline int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
+				      u32 pixelformat, u32 width, u32 height)
+{
+	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat, width, height, 1);
+}
+
 /**
  * v4l2_get_link_freq - Get link rate from transmitter
  *
-- 
2.54.0

