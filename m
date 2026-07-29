Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010055.outbound.protection.outlook.com [52.101.228.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F147470EAB;
	Wed, 29 Jul 2026 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322604; cv=fail; b=CekDq8AWSUNnt5T18L5jmLu8L3jLHa6zSdTvsr1FplQBZV9WVmOwpEG0dGGu7nJJn136BM6FXeGlsbu3AXNq2ssjC8NieQIxRbX3i0To/pM4pMwk/roH9BRO/Jh9K7yaWls8umH3OVDUHTdf0XWJYyPfQXrajCj4kfScwRMZgwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322604; c=relaxed/simple;
	bh=uhjVW05KtRhGwmL6y65zm7uRx+i4nbyXWWkQkffECic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gaj5E23vP7mf9wnzuwsGEmPf1MG8yYjY3VLKNqtqWgy+dXPUW2LEJvuN+jPhT0zABPOJg2V5T1IDeyome1mgVEpGXG4ZJaV2GJLSJdKKRWuPJcsXwnbY2LN9nkmpkQS7nELT24zailMZZMrEl4UgtIsHe6ayZxjT4e2rGpnmJuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gZGcvRQ1; arc=fail smtp.client-ip=52.101.228.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gZGcvRQ1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qG+U3NMotmKmxB1OaolVEkoIzqp1NFKDgjbrtHLfy7Pv6kkUGljFIGZG8Gii2ji9GENe+eJTqxIjEHvjaahIirFv1cmPCfLsWJl1gGD3rmHqdj3HFGZa7hh9QLOuj2na/w9sQX0ofBbs8KVPqT5JiWWxS/MELOG2NqAUhIQsxqfCLPbs3WK34kFL61NbjupzWW9oWMwwSsJi2O5j42BXREKwsbfpDIBn/RtdNl8gDgQwcUxgBDFAClrxKA0SCpS5ymTgQZMVloMPyb7/HYMA9LOGoo7T6Rxo7iABHiRbrduLnbJDuU3BCxaKcpFfujSK/B8kl/YPMgTdr/miyuQBsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgG8ZBUWnNPF+Re5OPPFtyVa+FWttVu52CR2x4CrjWM=;
 b=Qpir7iz0o4oRufS7BernXVgoBNfsz8BLYpTjv3IRF9Y5MMSbq6ke5wWgc1+VNKmoNwv+N8lNCeIr4TiM5tBD97EZCrVELSh+Gs8R9qS2CFGYNmoX0V+o4KPp4o/cliagAo+nlDcdbQjf0/rW3P7Z0W2DFa1QoqPEmyOMI7u3D/Z9AIDBlyF4LQrDR7mXa0KdkvtZoFf4dY4iCpb2scyNzmJMIFbiR1WEdVdJteL5ip5h9lcQhcJMOysq/IvnyjmBJElQcanYo4wIN9M4Y9M+SJewYVIJlqMfvnqXCewKhOv4YGnyiDTAQZLFTF+BRqdkoH53CHyyoHPaMmg+6NOW/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgG8ZBUWnNPF+Re5OPPFtyVa+FWttVu52CR2x4CrjWM=;
 b=gZGcvRQ1CUFqwVkRys8+R7CGx6qpnvXVayxTBl5MmlLf0ctbfjc4d5q5/f5qdUyyptefAyGzQroWB4LdgnqCul9NTpi3SB7g4xsu09e9sda0XHHEvTr4Eduqa/pRC3zMOZleYy/YoWt6Z8gkRH1VIk8+cGh9t5yrV7Kl1lOxyJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYWPR01MB10274.jpnprd01.prod.outlook.com (2603:1096:400:1e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 10:56:39 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 10:56:39 +0000
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
Subject: [PATCH v5 2/5] media: v4l2-common: Convert v4l2_fill_pixfmt_mp() to static inline wrapper
Date: Wed, 29 Jul 2026 12:55:47 +0200
Message-ID: <20260729105603.1160966-3-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 225f35c6-27ef-4f9d-eb72-08deed6010d5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|38350700014|56012099006|11063799006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 yh0fpuXEYWcysutol4A7j5m+5F0l/pJa26Hfu4/TvBT7lqpYM4OAHinp6X0a7mFWJKIbYGDC8znMXLhQnifktUo5RG4lfo/3UfJeXRgsvjI8iQpNnq82sLWyaciV2+SUso2nJV5cT7D53SfXcl3/g8XDG99fyjqD2H2jqX6s7792l/9s6COHGNUt4w/MA4pLh4hLBefdgKdb09o4gTp1TgFMPHoX3kCD/oU1sGZo9KIIj4LR38N/cV0JiJAV3ocoEmYQnFnGT8WVLtpeg4tL8wa3cZ+Us53MEuPvWqCKzD+1zF7vdkoMeADCwGFuzW5zECqWYbUYNdGuSMPotKUKBf69tTWU4VPByLr5SAf8LGo/hNWAIi5fPreRl0aP8EKCZ6g0tYhxDib/NZg6tiybbKElWRPE0tgFLfJQIp/mXzl/RqXB22AMzuY7XR32rXSYmgnWeRN90+iq6tBRHB6yhUftq23Fpwnmt+ZFzwVCkTSq+asXO+HU4CIQHa2aPrKLoDHWJ1AWletkOAbysykKc2nzlkj/V/P6zo8WwgDbx0gWtCroNIPo8sdavSPxItlAdDfqEUC/bDIE3dqDMB5mSSf+gKobKVxE2KcsVXvi3drZ9CBTnLA9MLMnOyAFQeGb5t3Yv9if2xuJwgOxHu2dpRiPkIWDgxirLGGWb15jSMscDnOBMXaE0I6WIiAgcg/Hd0eZJm0lNi7BtSOldZXa3o0WoRmU7E+zxZwc18fg2Rw=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(38350700014)(56012099006)(11063799006)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?HCeEhFgrFgSS3OGKnO6fhPA/oD9XR35fByQ9pbMbMCkL04ShtpFre6NL0bYn?=
 =?us-ascii?Q?h1J3ExfXAzG5yQn2IrzgmmN5/UTVBCx8KY8Pf3DlyKjRSB9rBlM1dtTh3Ife?=
 =?us-ascii?Q?6g+ZULamw5radaFif3qy7hDSdJvYl1UK+jG+TzSvlBRJp4D6IEShy+gGbMZj?=
 =?us-ascii?Q?Exw9Y/p1SqpR3JBj2eGBLYYTDeYcTHXyeWc/fJu4MDIvLGyx+lYqT5CsDcEb?=
 =?us-ascii?Q?cxUmb4NNNNisAmsT3WYjmWt1VIGAjdhlPB4/wP38DllUlkwMDFzTyF5F/qEH?=
 =?us-ascii?Q?R6T7h7kHdrmvlUoSbUEBo7qTjJqyNe8KVWw8rl7yJ0nSI8sU9ChMD5yUcw68?=
 =?us-ascii?Q?WkywEM6POqV3ErMPPnQ0WwHDSIk0X1rOPu3b1nfXT8UbQteOIdBL4RwMFQzi?=
 =?us-ascii?Q?3ey+f5nikm1IEf51nrXtaQ7xpCh1gOq5X5rpwH0FKg2dmUHsHiGNs7rmZJ08?=
 =?us-ascii?Q?pipIJTYiyJ1PnUXz4n1SVoYZWIaoqAceT9LEIt1ltOhdDW3lINTXbsO0eLi0?=
 =?us-ascii?Q?G+bGtGMGTIuyS2z7oPvGTVt7sbFpCoF0t+K23axa5gicfQT7CxHO9zssAuEZ?=
 =?us-ascii?Q?oI2JC9qRFXyw5WIA8D2A0pVZHNqsmX+hxJuO6WVx3aqmO0+zHRGmKvd8+ZCl?=
 =?us-ascii?Q?ADV+FKXl0WwCSMz0nDQ67qWOXm3GGAt8g4m1qhN7eEDiZ4qORFfVmo6mTNL0?=
 =?us-ascii?Q?JjglVrNHTxRRBSTNfM/5V/N35rppd7inmF4LGrswfIQGj7vTBm8UAPm60CWv?=
 =?us-ascii?Q?I/ZynE7L6Q8OjOUKcRZXrArwKRZywO0mRmJyVSfnMGc5nDZRWn/1LTjNZZzP?=
 =?us-ascii?Q?BR4qlDJwKe5KONn3+eepfsy/Ubq3CsF4yE84Pu9O5UFXsyE58qhEFuqrEKCZ?=
 =?us-ascii?Q?0xcHZQ/tlCnZ/W0E8pLcu1fvMmv9KAvmf136j4WJFmPpZBjBkwK2DsjJ2f0j?=
 =?us-ascii?Q?1a3tRmxJtMgOANqef1kAPI0Ouf0qlcsUss+6J6yPPT7AvIWQ9T1aN+2Pgg8P?=
 =?us-ascii?Q?QgkRCDj7iYbtXybIWAQy+NwiTYbtRVakZ4sRd+7E2QHawPHnAa0NVAxB8SNq?=
 =?us-ascii?Q?HE6n9BRDuAgNMI0W0yclCT/r/iaX9Ri5ZFOQkDXLSHq7gzNWqAo7ijnNDAUu?=
 =?us-ascii?Q?B39vgWbt9faOcU7CgVdKDU1gE3ZeRon4s8dzX20d6acC9+DLQP9i3Dk9vqwc?=
 =?us-ascii?Q?gl1vLiMWUul6Y0rNXRhwlOdAVMLkJPyGlHFVdJbVJTyNeaJtfDMf5ZvGDmRz?=
 =?us-ascii?Q?v8Ju5/h1EtH2iU1r/TeTzosRwtT3EmVCXPTdtRtDyV3orBJH09bN3OLQ/L1W?=
 =?us-ascii?Q?cuKHX7aaZEzrt5utmtnBj+E/NyyneGjzqCLPmaLgMP/hIN8C+E4d6e+twF0x?=
 =?us-ascii?Q?Wy61E/OuPRotUrfMGdx2IFbI4MlHkDsYFU9PHNwfCUEZK9JeccnY+ATS2Xfq?=
 =?us-ascii?Q?p4xa3aS2m0NCCAVWURPP3JhftTQ3A6vazmWAfhTg2yasDqrP5qJZsnu3OtZd?=
 =?us-ascii?Q?ZX79pOw2cXF4gWM6OTE6cKjEIebu0Pudme/VAISITkUbWy2kEkLP0HkbJFNT?=
 =?us-ascii?Q?F02zS928yQxo8+xVD2WJavXWhRESPQZ8vcKTvXbO8eEth0t4QXMm5sXZfCKt?=
 =?us-ascii?Q?e++2oedUZSKuRtlDMs6bzyY7ZmWBqNpCZlz7UzHI8Apln666/fhFmJC0civO?=
 =?us-ascii?Q?GZ5diSrK/xh5pwARhwm7U3wpgk/JplBvmbwGBXp/J8jbWUf57eicFYK0M2/A?=
 =?us-ascii?Q?i9N5eFwVC0AwpcAcCekCSY7JXlGRovYq3vhmWsjI6TFZCThX0TYf?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 225f35c6-27ef-4f9d-eb72-08deed6010d5
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 10:56:39.1740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLL/3vNKk94LmtwoiWWKWAfuwZRDgYoRjJsnW0fU+freo+QQf0WSWryAGyUxyDowr0CEl1IlXwIZ2bhSYbLADEBfrhBpwzYKuO4kI0X6YqbH1V6Om/q+kzJ2tCrTIWLP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10274

Convert v4l2_fill_pixfmt_mp() to static inline wrapper: drop the exported
v4l2_fill_pixfmt_mp() function from v4l2-common.c and replace it with
an equivalent static inline in the header that delegates to
v4l2_fill_pixfmt_mp_aligned() with stride_alignment=1.

Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - Collected tag.

v2->v3:
 - No changes

v1->v2:
 - New patch

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

