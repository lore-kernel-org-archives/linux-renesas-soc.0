Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795109703;
	b=XCt1BiL4L5injlp4VZ1XOGtvn9o8fhmPUmIEXiEA0+pHSMxx8HYKV3gn7vdVmrOm9Qol
	 248XwVxQdKJkBoS0P0r0oYQY7ofegCvCC5nGu7jSwNLN3r8nUmREW3IQbj813/Hp/zhJh
	 BhnRGDSPsrz/y0GNsNeurXx5vGBZS/FOAN6o6oLxPwgrBk8ly69reuVt/oheA8VeR6Jsq
	 NFzmavWKMi0Tm0KjuQkv1TuuKbclMaRIVi76AnwH8SBco4TS1S7rDgzthR1a/RLer997e
	 R+kmfB7OsXFOKhcoIzQfKCk4GPyZYOPs/Llm6HeDSGcdBGCNiiSqPLGGuAXATQlhvzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109703;
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
	bh=Dnd755qxOVINS0i08aq8WrDKb6I9aIep0p+CiTU9yfM=;
	b=ZqncrvdolvMy3LCOdh9VqXEpDrI3NUnAoM1gKmdMaf5cOKILzCB+FO7khXUUF9P9pZ+m
	 BmDKTLyRA0IshYfEZZIW352WibqQVC9BjU8Xwkz4Iy0q4Rb+3qFK5kKP0AhMclAw+Ghli
	 ZN2HYISCvAi6vjhkE9eTw0fsBPmafATIqS6AR/3tBuWhfeE0aE1dsrYN62ZLNANB9yP8c
	 zKM2F1a9LJM8fbkFbHLexHdCt7vfqVsQt/OC0Qzje7Qy553vzDGMkOKF461PUvPKxMabt
	 iqgj1RpgpVl4r1bp5rmS4sQRpC+s+wUSEBjJkVmRUUVeKc2qbPavrpcV/YAtoPWXbHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=KrocSFyd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.4
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011004.outbound.protection.outlook.com [40.107.74.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAA7606A334;
	Thu, 19 Nov 2026 17:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CAA7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=KrocSFyd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNpGdnpAwjjoNaMmdm8JWTKZohuh7BSecNSQs/7vQMy6OlKGjR6E1klSMNoH+h1gxS54E8dFf1VmLynlb6TCjxB3Nh7t3176yL9oG37ftynNbNew15lWK3f73itmnBvpx0KR4edmIrvs29jHVrbEXnbGl6l35W79unfcu5urYiBgkIS0dzT1QyHr9CNT7SnPS24JiwW1HQrRgj3wdIIaDh/eY08iKYMqkskkuFZxrfmw9GpX3USbT0dSiFN7QpLOrWb5ndSDWVGJ4l68pBSQnlpZmZVxYSdScFYJ0mXeeSfOT9vNeJR1u5+knniwZ+RhWRlm6fSNGL1LTPmz4IK3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dnd755qxOVINS0i08aq8WrDKb6I9aIep0p+CiTU9yfM=;
 b=PGU8JUZSlRvahftm0o9B6vg8MfGik/2ivt8TJf8Ben8gywFLiZng0EIcUO8E/swLy2Z2GY3vVb91zyIBQXIadmvLaOJgdTJjKYbeMazHk3/UtLSb+5mJc26hesVSdZSBg1USmmandql0yzyWLivEj11KvTxq/odApM4NZeOlmVn5bYSnJCYfH1DRHDnCcsomSO0uNwVSmiIVIBwmAj+gzkY0KF2zapsorfaz50iB1BSITpDFPBilO0tjG22q1f+K2kvOzuPtlX7LGiDH6no1Sw+Rde+73PcvO0A7Nsfo8kxVCf14nSyDzHKi6eeCPb0V7scTFabAdF4YyyML6c1D6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dnd755qxOVINS0i08aq8WrDKb6I9aIep0p+CiTU9yfM=;
 b=KrocSFydy0y3JWrSYobiz3lT9Q/8DbAvIx81hbFSrsbqnGHSvgmDQIQlxYEG4MdZmIKbMTCtKWHtkxi6msPcANp2lLsRnvATALjQegi0PqlLKC6YzdwwC9gLOGAW/+Ehjb8ORdV0s6qgERppZYowWj2iVSGu3SRM1OAw+oaTCTw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by OS3PR01MB10422.jpnprd01.prod.outlook.com
 (2603:1096:604:1fe::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 17:34:59 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 17:34:59 +0000
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
Subject: [PATCH v2 05/10] media: rzg2l-cru: Drop stop streaming function
Date: Thu, 19 Nov 2026 18:34:08 +0100
Message-ID: <20261119173413.341658-6-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5d8b8f09-a25a-4327-020d-08df46636f8d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|38350700014|56012099006|11063799006|261021121427099003|261009223027099003|10067099003|261102123227099003|261026140227099003|261022105027099003|261022075727099003|261022115727099003|261028144727099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	g46Fzy+N3lg6+ljHBb3fP7VcJx/9XBWeXHOg25y9GSd8sfsDUEjzvyOgi/sjuF9L+f38a/aVUXpLW1ZETb2zerA4dnIKmdhFIfTLxJcGUwTTEluYGj+iuAmST4+3kyuSopDhYOPLi8B0XzwCGdUagwrOXdzZcN+gbP66BLcvUI6luHkbjGNcuF5NiiUNO8LtuwGWFnxSxsDehkdfyRDzWJUCSm0Uxu7oAwMhzh1Gr3GmUQB40bXdxP++wr/RJJWKROYWVDNZ1N35oj1haHtA1/Y9ek92Oqt/N9WTF6OJWj3HEEmQOH4Ri7M4RBEnX7KXyeBOyMvaVz11AkT3Ee+si8szhBqBs6v07Xh3MSaJE8PDVwDqbDP+OUXp2w7hDyoHXNWkb20wH2mm8zEGFDqxi2g1kwemHivAesViTEim38FYtl8A1cYrUTuhMJ1cEWTf/Q7k1aMSyA7X+OJOXHcGWzpJJDiit5mbZymHZ/NWDBsre3STu/wvSd7PNrQ0IP7vDQzT+V5bVdVcEOv9904y79Mrtv213Gwc62tNU9XCsdaEC7gp3E52fILr2/8tJD1dbW0httiZldKZf2URD5AkzzrGHd9x/wNhpLZmtxT890xg5U1LL9+Y/3wgExCABspeUVHwxqyGRse4JetaxOcPoxrnf/TD6uKckDM1Wh6T/wvgWKFH3Lte32aMsBYF2vtqfIr+oDomR9bCBAwPeHGEC9OO2uaShbEf2tcVTADnKnA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(38350700014)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(10067099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(261022115727099003)(261028144727099003)(261021123027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uEWA/We9A2FaTz10KoPzzad/orH5fs4Z+E/8S7ExNEc0AOVH7FH0cd7VkBfN?=
 =?us-ascii?Q?jJhiKAPLAZUt6AAogWLvp7Y4p5zmThXPCBD8sJx1/Bf/+XVbMMDMJW9uN/0u?=
 =?us-ascii?Q?q8njBxjRv/k4HJ20qUisi4CKKW9KMhpAcB2AEBeok6fKYEBDjWjA5NpUUxBa?=
 =?us-ascii?Q?SqLN6TxG7QF5VCRmbIfifH6Iao900fJbJzVhRRtqCHFHizOQdJXwHRXEG/RR?=
 =?us-ascii?Q?jN2UgL9185kQmv4rEFq5om4qj2FMNExjGBSNNHW+jgvMKwufhF5N4ZvqRLHm?=
 =?us-ascii?Q?AxvrAaEvPqjyJaP6IMF45uLBF78fqsjvdxG3917QaNXHLfx4x9GNqaKM/+LW?=
 =?us-ascii?Q?C2fUEr2ZslNRuYzmY7R8rsSUWNpbkhyl2xy4lbHp+MCFMPeLOTmPoxrn+4EM?=
 =?us-ascii?Q?HBx0WFsNXIbMX1VTYmGWQWA2MzDrbeLJLU+grIZ9DVKHok8p4WFem49B9hjE?=
 =?us-ascii?Q?YDek+9gGvLPSE3Ym0dKMLwM19C+3wL+pJnUfwgBVfYhl4zLpgg3sGF0UaKng?=
 =?us-ascii?Q?xDtJU7Dx59/Zv81GSHgLXP3XerPOgf/+UDIyP69uT3ATdMi46D0i7/ZNb/Rz?=
 =?us-ascii?Q?i0L5YHhMfrZ7A0SLoSc7JXP7DbPgAJmRuhv8A0gGI7ZyVfJCpGlIYm9qsWwi?=
 =?us-ascii?Q?tCTM1sXkYp1dCi12If7EwuV/eHhHYbmC42yiVht/lkVg94HtwTvaJtoL8rJi?=
 =?us-ascii?Q?imzVL+0Pg8FGwrqCbltLcZvqLEgaIfzXvjhrzX7IEnk4bZeUepm1SqaiRqDD?=
 =?us-ascii?Q?ZexOj2+iY6JBx1vBhOQF6gXYkt3ZNkcev9luBkluHkxH5me0JVQ1vIa1rAb4?=
 =?us-ascii?Q?HdBoJy1JR4ofYrQ1tiUXdA8cYaPpTe675tsiXB0GRUq7mnNyUlibIioqzqZF?=
 =?us-ascii?Q?PhcnO61oobmclDBOMnnfJIaRuWfThH6noet0ZLPGM3QJ3Isx6nPaCi1T5wzL?=
 =?us-ascii?Q?lH0uDGMnaUsPI4YzfjPJX6vfmySmdvpu5ctIPn8F/GRMAZ8zJff/1yFVIhDR?=
 =?us-ascii?Q?7tu2ZBzYWX8bukt7GlEJyEMC44YmLqV6A7vXwV273ttgoVn8AmZ/cDbFhY8u?=
 =?us-ascii?Q?PU9CoWwsZawaj8pCGHtL61G7Pko00Vlt5lcHq4s8nPi7sf5qpYV8s7HL/0qD?=
 =?us-ascii?Q?dn1a2XoQbSYT0zeYnXj527Rcs0LEgDEfpYoQZxx8N1zKhEFCf/bGMB9UrBAd?=
 =?us-ascii?Q?KuXS1KdZegYZvaVqEemJUxW4neahnLlMaBI8i0fWajI39l07o+apDH0WCRjH?=
 =?us-ascii?Q?42nn8tN0xa17jkMNhWA3pFn3/JvyM8oLPeY4xw4T6YcPW3/Rj4jEFBpOuMrA?=
 =?us-ascii?Q?6xP9kgi8Yn+g21jzn+HZuELQe4c59x4fZDWRx3vm8WZ7dwV2TWdrKRmnq3ct?=
 =?us-ascii?Q?N6ktBc9hTDXdM5onhT7rxmQua5ZIYswx3YAVBD4YBuE1yhheD1uXPxo70P6X?=
 =?us-ascii?Q?w1tLBKMgzg89TU7NsF+E32rA/IbGhZMFuAx5l9ypDALxPtz5mG6fKFQ3Xe0n?=
 =?us-ascii?Q?rrKNNtIiXvvy0ww3ul5k1AxuQXpErCp0tX1SzqiXTvLXkLRlfyDUhJLRsUlL?=
 =?us-ascii?Q?O+DOTNRSldlH/kJXO7NEQsxCrz+m+29BgQ1rM+lqcS3B7rkZcqDUSQzwGZhv?=
 =?us-ascii?Q?YyzP8FTyPa6bdgXn2zqFcuEiXth4ibL+rEROY7EJz1pteS4IFMWIQo2U6T0v?=
 =?us-ascii?Q?pEtghhmPstBJNkZRb2ui6v7WaHuuWiWsWvLQHvEDuMyhCGUk9SA/pvAykuHd?=
 =?us-ascii?Q?o7+tP9fN9yYSa+Gr41BN03svwBuau6c4w+4lSCr+bRjDm9Ctpi6e?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8b8f09-a25a-4327-020d-08df46636f8d
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:34:59.8344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQ/TsmyLXfhNUIjMVtaCZLIbDF9D9dPSDmqQbDADs1HJpzQfH47BZoVOXMPPenkL+v0EyFtuWJFpv9JEW2MgDSF5mEMLCyNJHUKFvSC8gUwV4so+BU/xDoQpnYRYZcMg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10422

Drop rzg2l_cru_stop_streaming() function and replace that with the
direct call to rzg2l_cru_set_stream(cru, 0).

This is a refactoring with no functional changes.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected tag.

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index be8e5abf2151..4be61b997674 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -582,11 +582,6 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
 	return ret;
 }
 
-static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
-{
-	rzg2l_cru_set_stream(cru, 0);
-}
-
 irqreturn_t rzg2l_cru_irq(int irq, void *data)
 {
 	struct rzg2l_cru_dev *cru = data;
@@ -724,7 +719,7 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
 {
 	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
 
-	rzg2l_cru_stop_streaming(cru);
+	rzg2l_cru_set_stream(cru, 0);
 
 	/* Free scratch buffer */
 	dma_free_coherent(cru->dev, cru->format.sizeimage,
-- 
2.54.0

