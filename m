Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795109710;
	b=ZAzREOq6oOtL2fNDuqdKy7oe+6FdLINSB1RfCI2zWvBgoCf8mg6acfF0s3eVZQJMt3Qc
	 Zxch4IxoM10NlBUjr4k897RMlTikt9me+JfaLBuzrxFaHSgyyDx+VyrCKAoGyJkqCJQVE
	 6ngothhBH+fpc38bOIJ00P6RHo47HEiHpnfjkJdlFMrC8JHeumtGuboVx+rkaN7hAzm83
	 goZqYdNvJzAnm2cVZ7F9OP81jLEFngjz8ANEO/cL2dORYySsT81ei/yax8l+C4b33H5IL
	 XOR+RKRS6JlHf3HCUouuc+vUOLVm7PCa4ngLwwrQK7DfIOje5btWsFzNG+ByKJ58f/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109710;
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
	bh=ykiQFK4yMR+YuuXGmQFyhckYsPeDd+2zHcSuPzqo0oU=;
	b=jzn6mRimRqZQeA1bxWNt13LmzgLkdYFOE4A9SzXhhNsRfqfGiCXqYlKQ0KmWcm37eotJ
	 ybYtH90priJuwIMHAE+c7LzZQI4KtceL4bLju4d0ANOOACroWzpTVzOUUxNeskbPIObHh
	 6KybX1T2ugltwXpGKs7KWjmSdzWt08MN3kFYeXEUrF3EJmGyipiw1+vuQDTBoQ1gCC/Za
	 ujVSgyWZaPOOwOeYBgL6lJ46g8sn2bPxTJTiztfjcIuIrPDYeigAwys82p5jI85l69sgS
	 RIrDImW+yUtl4Zsx2ll+fbjVislRgkOzkL0KIVCKopZKIYDe7ls3hLm96cb4SU6b0Ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=nfoJO5ex;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.13
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4C9606A334;
	Thu, 19 Nov 2026 17:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F4C9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=nfoJO5ex
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVIBOlaYutj9tY0LLb3EqmW0IvncVdfApdApMkUsCxs9ELSyu1eY2FMo5EqfWMFZ43kncCQDX6a7wCIirQpBGT+7nPHNv9bKX6ZGC46m/zFSKRqMky3oJYU60gk87fhZm9TpgDQFBA0r8YowVTLO1Q1UdddZJPkE7e1M2OvfyzJU11zNkh7iPvXQtA/yRvR1rHpLXG50dAILrsMjMn9M/fZwOb69t94T3pUrH7zMNQ5k2CoXgVYJr3DEstIzSyCzM6HpFR/aGQ+TUaEMhHd6qtazjY1q9l5fYtZvYyMlyVlNSqcKAP0SB6IW+pbHuMnFKV7OY62uv+Q+I1eN0owxSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykiQFK4yMR+YuuXGmQFyhckYsPeDd+2zHcSuPzqo0oU=;
 b=CiGO245YbOB3JlUA2zcGVimwKvH0PSGZvdOeJsSMfnsiiiatdwrXck1kwezekVG0nVrJmhN2umd8eTjhe9fTvgm60Y1AVczmJE8kVa+k3hftbTOFM1qehDZbUsxVRpJMWtaV2NqpcMTj3hQFrTK3YKiIm4mWKiTEbGZq/R0odHmLeY9B/Akh15GkEvycgfISgBbacq+qL6D+xvfjXRJ6VM9qYrIaZ58OpUBB1l+BCb0RRbOFZZhsxoR73jM1x1HE0OXItfpK0qmej/83ZqJX1d9/GCQxcU3+btkyFRxtRnnixPqMq+6TL+8uqyH6tWxJC6NpKGCrmdLv8IRH4ZXMlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykiQFK4yMR+YuuXGmQFyhckYsPeDd+2zHcSuPzqo0oU=;
 b=nfoJO5exztbFNZUEqT+gXM+jFpKfg+8fUNgyBjPpiIYk2Hf3fGHeC6dgDuMD9lun/8B7YzGhkQ9TeljTpojIP/3S0mUspuG3FukZp/oVPRPJl8rTDlkJ25S6OdaMVui/3MjSrfPGJFDY9tpQsbxZYoehvVlpBa/MWQ8U9YK3Ly8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by OS3PR01MB10422.jpnprd01.prod.outlook.com
 (2603:1096:604:1fe::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 17:35:08 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 17:35:08 +0000
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
Subject: [PATCH v2 07/10] media: rzg2l-cru: Add suspend/resume support
Date: Thu, 19 Nov 2026 18:34:10 +0100
Message-ID: <20261119173413.341658-8-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: f5f0b23d-f96f-4fa8-cf30-08df46637474
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|38350700014|56012099006|11063799006|261021121427099003|261009223027099003|10067099003|261102130727099003|261102123227099003|261026140227099003|261022105027099003|261022075727099003|261022115727099003|261026121527099003|261028144727099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YAgxeOhV76rhsC16Z2gy20pQG8DMx12xxhmzD9CazpdKKT9AWR9JKKii8t7Bu5162O4hcucmSIHXVljWLTF8Buq99uLYTvBohpOuMoGKmN5nMAvG6Ld62ov3hC/jqV4LlM0XKwWKRxcCnkdvrkt7xoNdub6iuqYDRP6Rwo5X5qSKVh21bFGLvur1Zzn40TTs6pARO74scfysNqW68kN/lJjlbpk2wYk+WRA6qLfwyleBpaxQRiT5zxAiuVnhr0gV6NbdpJs5sbcA097tkNu53i1OBEGsBdBNNgAZYz8BkwM1IbvWDNxRkXzInKvxJLspxiMOpmGDAqghMzeVTYZwZe3oFqpN+fdTWGXSwYSC5KyuPtMtWsxSPzkwjrQDYfhtKhVBmVb2r4LN9H7SrBXXJ5PObXiCaJfGPGIoiaKUHXb2W32ocYE8TjoXZz0/Or5MJDl6jaG1e2vSSjBWmEzH9lA2fsk0LID9lWWM+yZKoPVBR4ZfYDJ4ahQWpwABos43UECCKiPRgXFVDKEV1HTgfS2RShg9D4Vu7aZQxWrNHeH8PwcWc44hQoLiEZyaFCozGeEDmump9jAyrpTGgP6D75rnAOLXLwhJ+dVdXblJVyQvA8GHKy/R5WhFOItjy/W1HciwijAaMFVYSqCRMjObcr6RIb56kU+RIOHXMr88XfUxS6GB5D/3xiAA5IQwv12YhfmVnvZBvT9rKEBm9yJzn/daJPAXpGZgUGI7EHRUyvE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(38350700014)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(10067099003)(261102130727099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(261022115727099003)(261026121527099003)(261028144727099003)(261021123027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i+WZ3FKwUi0Edu4mg0lna+ZPx3Mo7jLU3osCRQ8Ggy+06SNxzjkfL6h48mHu?=
 =?us-ascii?Q?VEe/JHil9r2TZXrNirfkt9w6oydS7fk2PNxbyNl2O4FrfLGiLT7TYqhziPJB?=
 =?us-ascii?Q?D9R38MBj/4vZy6w/6XG8DvOZpH3QypyeR8Q2ChF6jskTr0muP6oGGj7sBH77?=
 =?us-ascii?Q?tnQ6fwWD8w7RbSZKxPQllZ9w2DKINXcyxED6O9VJCwyoy19yz85lcgUuxybA?=
 =?us-ascii?Q?qoZLHmCvMpj/dioOx5aaGGMgXlpR1SeDQLJpqD7aS0sLJZS8QECE74+W5dvF?=
 =?us-ascii?Q?4tpEwdwzXZZkNE1FQleceFjJ4d/QDUYQvK6oKSD8x75O+BByIShKE2LgSNFO?=
 =?us-ascii?Q?T3tZVieLnLDo81Fsk0OslUgm6oiMcmU3+roO00vEAn8HDeOlU1pxvsO8N2g9?=
 =?us-ascii?Q?Id2vsmAIVzw2bENVeEFT/adFuYUNhdVIr2Y0sEGMMAfpK6Xgfmltzr41eFGf?=
 =?us-ascii?Q?sxQR1jvQuePkdLmKYNHlThXwCKJFNMpo2NG9xnXGTDbWCHA6FIyPCZQ1k/J+?=
 =?us-ascii?Q?WKmCJabJn9a2X0fyy1gRyaaDMIjhYW/lDwjWp9FFvZnA707hzTLAg2pM0DsI?=
 =?us-ascii?Q?C3jGf+Unrb3hhlMYc4VGTesLt25vMd+KZzY+MsW5ZCSy5GOdgQx2ZiJwVLW0?=
 =?us-ascii?Q?nTQuKb1W8/efj6EEPAOIIOvyHvHqTOI99dryAfs1JL+eG9QziL4UyfxtMsKy?=
 =?us-ascii?Q?urN8OwhfY6nQ0mUveeVB80pfXg8FOB1IX4t8pllmydAeb51+R1x3CQXurjjD?=
 =?us-ascii?Q?mzah4iOrPZe3HxfVl5d3opJFumvYGVZkcJDWoGJLzKP1KNqIMxhDPtUBXCXK?=
 =?us-ascii?Q?Il4qoy+GgXAVRZTzwqOCnpV6BfASsyfz4KsgAG4mCCsWuBsYoEZMjTjxQYFT?=
 =?us-ascii?Q?qAKh6qplR5ABmhIVW/vyn2MO4h994Xkj7zcwBI7ZHJhbIsQO/bOyyKnBWRAe?=
 =?us-ascii?Q?v/YMXKqpeT5c1OK9TA3THhsmdr3a7kZGnzS2Yn611N/+Jg/8jELZAhoKLFKE?=
 =?us-ascii?Q?kX/TLKRMfMC5SkTa/vaMwvb6bTbSmagTkV284VpXGB0jic/p2tkEoMN455tN?=
 =?us-ascii?Q?416RPK1q6Qi9OvLXXxiJ6uB5PdbGifBX9lddC7awbcCH6zXk8Wo5DYhDrqg0?=
 =?us-ascii?Q?cg2xzsfTOOFSS+zGdGKi968LC2lxN0iSERWjPhHM9fnbz+/mqC63z2T/hcj+?=
 =?us-ascii?Q?8ufo+UY+dm2MPpB/5rq9vcDh9hK/2bgwwDcHOO5/qu1nVM/EPcf+R2emZ/wJ?=
 =?us-ascii?Q?ypjexfj8egeMjCu7lgHGnJRQUwPah7txs0fLZH0+KSdMrBnecBMPS2cLliTZ?=
 =?us-ascii?Q?D2ZvcZeYLMoDsN72xs5IdOPSkjsmBoZKVm8edpLnUpMPgLkTGWdNQQF+j5Xn?=
 =?us-ascii?Q?onPT02w0NhwhgOrIbI4RgrFXUPbvaf5cmKK/Ko92yf7VLzmDSbvPbNsdolV+?=
 =?us-ascii?Q?FNVaMUiNoKNS/JXlSugXkFnWxzBvJDuzZowX0XopWAOfqTVyraqxNKyk/bsp?=
 =?us-ascii?Q?8/TGAfTlqKHYc9+kWal09JLA6cQb+ztZMvy5VvCWatniRLJ7HxRFTm0S16B6?=
 =?us-ascii?Q?qt1gYJlyZGyo5G68v7t9s7f3xVh9knT3VGrsFvdLAc7KjDHOWPS2dbLMpt3l?=
 =?us-ascii?Q?MG3P1NHHQjqsdKCKiR5Nb6tcvhfHUGq6hZN5YeKILxJErorMHm66sNf7RuCq?=
 =?us-ascii?Q?wgG4rn3Cr9azS+Cbk/fCIJVgkWzQahPkbKmuLABqBfhvLXEjrSy99CsGM7UK?=
 =?us-ascii?Q?omK4z/we+N/thREtfH6wXgI+r2J/c+WpvqHWZHW+MVSpbcmW4Rr1?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f0b23d-f96f-4fa8-cf30-08df46637474
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:35:08.0328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZRyTD+daOxgvV/rm5q+s80hbYbeI3ib548HNiXDYzprbahJ+kZNdiw8R8/5OR3peTMshU7zPD5mJtFLcOGSIAHijyQy4xUYGQX5rU5Q4gnZp/ZXxy9waKf+BOTRGOr9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10422

The CRU has no system sleep hooks, leaving the device in an undefined
state across suspend/resume.

On suspend, stop the pipeline, requeue any buffers held by the hardware
back to the software queue, and assert the resets. On resume, deassert
the resets and restart streaming.

Add a bool running field to track pipeline state. stop_streaming uses it
to skip rzg2l_cru_set_stream() when the pipeline was already stopped by
a failed resume, avoiding a double-stop. Export rzg2l_cru_set_stream()
and add rzg2l_cru_requeue_active_buffers() for use by the PM callbacks.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Used pm_runtime_force_{suspend,resume}() to also handle the video
   clock.
 - Took cru->lock in rzg2l_cru_pm_{suspend,resume}() to serialize the
   access to cru->running with start/stop_streaming.
 - Requeued the active buffers to the head of buf_list, starting from
   the active slot, to preserve the capture order.
 - Used guard(spinlock_irq)/guard(spinlock) in
   rzg2l_cru_requeue_active_buffers().
 - In rzg2l_cru_pm_suspend() if rzg2l_cru_set_stream(cru, 0)
   fails, only warn, as the pipeline is stopped anyway.
 - Added doc "running" field in struct rzg2l_cru_dev.

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 52 +++++++++++++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  7 +++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 27 +++++++++-
 3 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 4de3ae8a9ec9..451b5cbe4cb7 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -264,9 +264,61 @@ static int rzg2l_cru_pm_runtime_resume(struct device *dev)
 	return ret;
 }
 
+static int rzg2l_cru_pm_suspend(struct device *dev)
+{
+	struct rzg2l_cru_dev *cru = dev_get_drvdata(dev);
+	int ret;
+
+	guard(mutex)(&cru->lock);
+
+	if (cru->running) {
+		ret = rzg2l_cru_set_stream(cru, 0);
+		if (ret)
+			dev_warn(dev, "Failed to stop streaming: %d\n", ret);
+
+		rzg2l_cru_requeue_active_buffers(cru);
+	}
+
+	return pm_runtime_force_suspend(dev);
+}
+
+static int rzg2l_cru_pm_resume(struct device *dev)
+{
+	struct rzg2l_cru_dev *cru = dev_get_drvdata(dev);
+	int ret;
+
+	guard(mutex)(&cru->lock);
+
+	ret = pm_runtime_force_resume(dev);
+	if (!cru->running)
+		return ret;
+	if (ret)
+		goto err_running;
+
+	ret = reset_control_deassert(cru->aresetn);
+	if (ret)
+		goto err_running;
+
+	ret = rzg2l_cru_set_stream(cru, 1);
+	if (ret)
+		goto err_assert_aresetn;
+
+	return 0;
+
+err_assert_aresetn:
+	reset_control_assert(cru->aresetn);
+err_running:
+	dev_err(dev, "Failed to restart streaming: %d\n", ret);
+	cru->running = false;
+	vb2_queue_error(&cru->queue);
+
+	return ret;
+}
+
 static const struct dev_pm_ops rzg2l_cru_pm_ops = {
 	RUNTIME_PM_OPS(rzg2l_cru_pm_runtime_suspend,
 		       rzg2l_cru_pm_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rzg2l_cru_pm_suspend, rzg2l_cru_pm_resume)
 };
 
 static int rzg2l_cru_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 0bab2cb12a61..5fdfaefd2efd 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -120,6 +120,8 @@ struct rzg2l_cru_info {
  * @buf_list:		list of queued buffers
  * @sequence:		V4L2 buffers sequence number
  *
+ * @running:		Keeps track of if the CRU is running
+ *
  * @format:		active V4L2 pixel format
  */
 struct rzg2l_cru_dev {
@@ -159,12 +161,17 @@ struct rzg2l_cru_dev {
 	struct list_head buf_list;
 	unsigned int sequence;
 
+	bool running;
+
 	struct v4l2_pix_format format;
 };
 
 int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru);
 
+int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on);
+void rzg2l_cru_requeue_active_buffers(struct rzg2l_cru_dev *cru);
+
 int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 27d3baad8c6e..a9afb41c862e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -154,6 +154,25 @@ static void rzg2l_cru_return_buffers(struct rzg2l_cru_dev *cru,
 	}
 }
 
+void rzg2l_cru_requeue_active_buffers(struct rzg2l_cru_dev *cru)
+{
+	unsigned int slot;
+
+	guard(spinlock_irq)(&cru->hw_lock);
+	guard(spinlock)(&cru->qlock);
+
+	/* Requeue all active buffers in the opposite order */
+	slot = cru->active_slot;
+	do {
+		slot = (slot + cru->num_buf - 1) % cru->num_buf;
+		if (!cru->queue_buf[slot])
+			continue;
+
+		list_add(to_buf_list(cru->queue_buf[slot]), &cru->buf_list);
+		cru->queue_buf[slot] = NULL;
+	} while (slot != cru->active_slot);
+}
+
 static int rzg2l_cru_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 				 unsigned int *nplanes, unsigned int sizes[],
 				 struct device *alloc_devs[])
@@ -527,7 +546,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	return 0;
 }
 
-static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
+int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
 {
 	struct media_pipeline *pipe;
 	struct v4l2_subdev *sd;
@@ -699,6 +718,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 		goto out;
 	}
 
+	cru->running = true;
 	dev_dbg(cru->dev, "Starting to capture\n");
 	return 0;
 
@@ -720,7 +740,10 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
 {
 	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
 
-	rzg2l_cru_set_stream(cru, 0);
+	if (cru->running) {
+		rzg2l_cru_set_stream(cru, 0);
+		cru->running = false;
+	}
 
 	/* Free scratch buffer */
 	dma_free_coherent(cru->dev, cru->format.sizeimage,
-- 
2.54.0

