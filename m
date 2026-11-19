Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795109707;
	b=PCOpRW1DZHOlqWwNJxXajlUOIkJSjjLvpLI0zgZVpiIoVdyTIPRGkWkYJ3dqAaIcez3g
	 BRW1tncGdpJHtwgiHh1Qw7ON4zsVo/y6LaSE6XIBL1g7xZQcuPZoKdwios438IH6OCCb9
	 2jZOfGF55u/vJs0oJfUtrc7q8wXyBKwe9Rgr69d0qi3Cx8823b6ZWIsMc8cABoTA2k6p1
	 kvORiHDBbs3X4iNP032OjW0j3QvJsCfujNycjLxGGEueCZ+eMY0eZsxUVqznoLHjz8S97
	 qDQh4fDupy2n3MjDwGZ9qAOZUNJAvqrEM7e/OJa+PuyLPH/ST58SQg7PcCx6RYM0ffg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109707;
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
	bh=heZxNbVGyVko7zakPayPXrALPs41t5I2grbMq63UuY0=;
	b=IDKIO/pPoz1eWiFT9IHeP7POQaMqXy3rnL9b3s9qz5O5Ja+cH95ySRcCIx9QrOMiMaz6
	 aAoWg/CgJ5DOB5OimTA6GTTMzvAdsYHzly5S8GZb8/2NRa/5R9C5ICoua7ng5Xll/KbOn
	 S2M2RBDeyiWcMU/iawiPrCR32rKDIoqdGEuiGYXzDHrUZD09qAgaufx8xXkh7G91KaZQl
	 aGYzCbzs7czx/fOqOHBWiWrpRi8Vb5loTfLuwW3tP9RPItmGpsw91KVEY0/2B0FLfUSwT
	 xbCubM2jHZZHg8qT1hqwM63xjasKARlQIoalewftMFsFtGfeI0AvEoMFmTDzDKYdqVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=RgCoVYEE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.34
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF3B606A331;
	Thu, 19 Nov 2026 17:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF3B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=RgCoVYEE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFB1betAUYNbWfwmktOiTBq2fOVfqh1gn20/Y6uM7MVMnqtNq5Bs1TCSH3hEzNlGYcsLTsXD2H6QzfnZoTr0P8f44E7zVfYP18gfXWbUJVmCdZNfH7dE2+jOglRKv2vpjQZCofHnNBBFUTWaOn6fL30Z3R3YreTPHHvbZzVGhmMblR2lS1oaXdqtuw3upuiDP2dKFY4kljqPwECDtNIyOZ0SYwI39HuVKu2eYIg4/qlpYp4enl+K3siD5Z58v2OMn9wsZklLa8BIuw5urZYthVgGl/kDKuiA1EKTvTggglYWcwQRXjJA9JDKAu4Q8LrGJ0fA4XdB3y7h1eFKxyjLGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heZxNbVGyVko7zakPayPXrALPs41t5I2grbMq63UuY0=;
 b=Gu486QIWzIFeYxm31BWEtW4cl7jGkaHy6jN6yYgyqJU0MJGqGnGaR4fukv4c0mT4CFtQU5UA4gkLiAzRJmUr+VTS4YqcyIj30tYKsNLuBXVoCFjMoFXDuV5QxcCsabkQZxZnXSvXqkWC+/q78Pkn49O1wyjSMc8Wz67HVmfUyIxVcLEdYBz7xN92gSQiLXeN4lJ1FbLDsA5gQq/2ALsxdhBrkAA66BzlbyZIwjwXf4MGiguopr1tm0W8zksyow6QoqL8PSL2tNqGASfZ8XbmaLc990Pz5InjU7VxkTNUOcf9ia+J5UIyWcvKA94/NiWwKQYZi2h+Q0AxDONwW+Qq+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heZxNbVGyVko7zakPayPXrALPs41t5I2grbMq63UuY0=;
 b=RgCoVYEEHgy0dsi+gGGlFRvK0bhKG6issA3lPsjvxVaSq00ciHZtG8DfvjzriP5BOm+HS2XdVtqqHqAWJe+RAfyXBkIQp4VRQyJi/tL8LFhKd/caqxE8J9c+73diAfbPa13g5WZt41S3MAXcfuEhCbodPFI29pVeSeDbS62QDTQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by OS3PR01MB10422.jpnprd01.prod.outlook.com
 (2603:1096:604:1fe::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 17:35:04 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 17:35:03 +0000
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
Subject: [PATCH v2 06/10] media: rzg2l-cru: Move active_slot reset into rzg2l_cru_set_stream()
Date: Thu, 19 Nov 2026 18:34:09 +0100
Message-ID: <20261119173413.341658-7-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: dc882e77-6e20-420c-e759-08df46637206
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|38350700014|56012099006|11063799006|261021121427099003|261009223027099003|10067099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	szZlUubgsgQNWb0kRVf4Oyy+gWwaAL4LoyPhQpujUud8sBc7sIbXxDna+oZlau8/7+3spvX8G7yIdQJiZMhqg9RQaHGYfFFGDHy+JSEb3/SmzaHcUnHSf3aUHSXBtZFw8OWTyzbGzKxq7HXmUQc4iH4KRd7KzVdziTpO3wJ/8XnYIMnPOmlOXrUK2cCiNNsznnRw/Mpz9lsrw1CM8yPXS2WQfYHhb2xahAAUONgHKvPYm2gtyk5kpgAuNYGtIpWR407x0J4ur+L33DHhUayGXTIZcNT0DIKdMvIzeSr5anOwp/T/M1xZ4R2lejEeeNOseTVKF2VcZWR662uVeVsusy/rkhQpauL3azCV2qF2gNsWA7On7/3mBK1HJjhHD8N1GMb/vpgmsx2tsw9R8a1IiR3XbzTLhNL2QG5xD8MGtyGuCCv7qiCGKa8MCwxrSWzMsstlq8rAQUDhn5okRuvVY7udXP6+pq88oppfUirKbtul7uJkdyBTvG9JSEVs2R93WLHwowKachcBW4Ka5qCMRxrpjDMXKKysgZGaM2QXHYI4rDiKIN8kHYzlCNIV2XHKlszjXctDBZOmV+aKyuY8Hxie3yJh2E45qN/YTYOO+NWzdjpGE03B5/BFDAwW1mgSNr1oNfFQeFtz9/CcaDLMsjgQBZBzzqc7OeAfuODYJtK9DGTcccfqpSmLpnZeycjD3XpXZFJz9GN3WKhBDlGFoQ8ZxJqJOmdpxp3TQp+AS34=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(38350700014)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(10067099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D9K3pxpLQWuziNTQAvZDpKPzpgEv0dcHpdLg+mlc3gh6/TJmvhdTXnvRGi2X?=
 =?us-ascii?Q?SHqgvqvkb0k678I51+ulvjDkl1S2l/3UbRPz54kHju2LQgCTS4bDSEgcP4pT?=
 =?us-ascii?Q?nKcZfihtpFAI20h4gTPQRs3oXLdlo/RT1Na9bOSAYTg5iRq/j2WIvLZ0xARw?=
 =?us-ascii?Q?74PpxzGzDgqzZ3lgJtWNVARxyKOsR5oq6A6HPeay/6ynA+qFP27isjTEtF9T?=
 =?us-ascii?Q?Vo+d14Ky9PihMUkAfps2nO35ZCIj1/hrnrpNX29V4rgzfM8R1ubeqiF1BhvR?=
 =?us-ascii?Q?UvLKLs3zZj5Ynfu7PPgRFrtnax+Kf4CiEsmgWMZphuREDZ/EqyFoAclWWWdU?=
 =?us-ascii?Q?6lrQaznGjWW+eKSvY/8bwVYs+KK4xI6dHxx4muoe9fIqRkj4G3zOWfLFBMqT?=
 =?us-ascii?Q?QkEzPvJr+6H3t3H1Kti2gF/du0qqeQPovOM/4fVoZE1oEEBp3/QKry5e5TNO?=
 =?us-ascii?Q?EiGDmTyj2ur3caijIYEhOULL3k9yTv4RnBs8X7Q1RHA6ar3+EgFF1wnQiX05?=
 =?us-ascii?Q?jm3q8LOMA9e8yrugSeXNfLgFO16QHULBx6uMqBMLPo7CK9b0voyJlbWjuk5T?=
 =?us-ascii?Q?KJTnIRu1RnST6XmDnEVcx9r2DEOOHEHLTji8s6wXb5C7Tk3vvOrClTtWT1Tv?=
 =?us-ascii?Q?enBOvG2CzAemSLttg3b6IpncUEl+byY6r4VJF7cbg+7mqMIvGUhWpJ3FXQYY?=
 =?us-ascii?Q?ljcWnPvLpSuHqI1MWhH13JDETo6F3VQTgo1HV2zRtExgTMBKt7WD1NnWhAxu?=
 =?us-ascii?Q?XcAFBO3l+kiCSyPOjWtWRB8qPfMXtDS3VPjZ154vD+whNRaPl2mOwXVra1gk?=
 =?us-ascii?Q?3S84WSwxIIs1z6/ykehmc9Le26pll2nXqXdbP2xPn1tAukS6FwqjG/O1cFAM?=
 =?us-ascii?Q?C5spUHlcXR3bV4pPBw+nTor+dF2mjT2773XvbtKlSqQkFW/iJar+/hFbZ3Hb?=
 =?us-ascii?Q?/ajEoQLdQqIA2lu6KDLyljERt+P5Ssz/sXFzWldcxc2yE3PXZ5fRqqpZRrAK?=
 =?us-ascii?Q?grvQmFs960QXNSDza4v/rbs49/C0Sfph9NJgpfzF2Y5hRvS7S7VqZ4f2XPn8?=
 =?us-ascii?Q?XY02qV9Q1decOk/5aqRSnmdYNGO90uKaiUD9EEI89pakN+NesnB3SexIYevA?=
 =?us-ascii?Q?KSBzHrqzRbgefBAe4NWNfbwZym14yubhVhF6I70mEITIUleVmoanhjjXm3gW?=
 =?us-ascii?Q?zLkwB9q+jOdpK9g26YUM9UrOsFkV0ou1hEfTyN5I2cNdjru+Js3SAZTw43QZ?=
 =?us-ascii?Q?lDFm19V1DhzVU0WpYN2ANrvitPX8jzIxlhZ+MwzkgYVr2eHwxLJcuMe6r0No?=
 =?us-ascii?Q?NY2scZ8sVpvori4PS1LPvlK9b7h3ojjtVHgnIRwsmKTOMW56V+S2DsC+n4X+?=
 =?us-ascii?Q?T8XAyPWU7nl/CK4IoqpRxh5tC0lNpil97l7ogWI+lXmD5tEP46G0hcFtn2qp?=
 =?us-ascii?Q?RQPt/woRGNeoqtmcapuAKaBRvEn+xoq8eoqfetTkPdnOqQRV1Bbey8W0o04l?=
 =?us-ascii?Q?jfKcYSyI3mhWgKGPF7CunbB+vLYt4MGn503kz7NnqQpwMUY/ojGLDWMbf7rP?=
 =?us-ascii?Q?SmIigkTZRKVyx5i65nLqkxfl2dUoL06omGysJS5ZIgxciWOcK8FDdhU37YbS?=
 =?us-ascii?Q?AiU5w38TBMEF/90YP3fD18YfwUDkxbHWTF/iWZIDRX1Xfc51sjX5arc8Y8BF?=
 =?us-ascii?Q?xZtX1jFwhCFxpS3IlhL2uvf3ISxu+OwTTQPAKaTuGuEtYPy3ZboliXwViwOa?=
 =?us-ascii?Q?VphFc8rZgJuV/KIHWd9V0X5CAy5CLEbcTaWQV8WXwxj9ar2r7Uww?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc882e77-6e20-420c-e759-08df46637206
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:35:03.9291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ejUUxoSbbRlwdt/0FTuALUrJ2//0y+zZiGcfjaQasbXPIEnGnPKTiUkMq0JjC9YBxZrOr0Qjv1oC61pfM9KkIeDhHHngAjewWc6lsF+WfkwkchGenjU9sbqahmF8Pphz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10422

active_slot tracks the current DMA slot index and must always be reset
to zero before starting a new stream. Previously callers were responsible
for this reset before each rzg2l_cru_set_stream(cru, 1) invocation.

Move the reset inside rzg2l_cru_set_stream() so the invariant is
enforced in a single place and future callers cannot accidentally omit
it.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Added an empty line after the active_slot reset.
 - Collected tag.

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 4be61b997674..27d3baad8c6e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -558,6 +558,8 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
 		return stream_off_ret;
 	}
 
+	cru->active_slot = 0;
+
 	pipe = media_entity_pipeline(&sd->entity) ? : &cru->vdev.pipe;
 	ret = video_device_pipeline_start(&cru->vdev, pipe);
 	if (ret)
@@ -689,7 +691,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 		goto err_assert_aresetn;
 	}
 
-	cru->active_slot = 0;
 	cru->sequence = 0;
 
 	ret = rzg2l_cru_set_stream(cru, 1);
-- 
2.54.0

