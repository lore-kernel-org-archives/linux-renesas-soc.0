Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010071.outbound.protection.outlook.com [52.101.228.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2ED4772A0;
	Wed, 29 Jul 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322623; cv=fail; b=hXxNxKs3MtheswfsJceUgVqvz643YwuazBjs8Bl596BxuZ67kBnUU/eF0CqshKCKNARic4YckPP3DYIviRnutfdUjNU+vpN/VRB0cplHx+n7HVIx3PNkYtJVg8xNmrKZUMM9g+fIPFxo3ZtsdupaymTudJzqFN9SPTPB2OYP5e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322623; c=relaxed/simple;
	bh=IKqYO8tR81I6UwBYsXjdSYQvcJOUSEdU+KcVxruIRlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KU7BuoUXucYztpv6JUWMV8rz5MBGLGFoDQjTcr1l6oSzqZEZtxUVq1GgfKDwnYvWJPeVKsGD63XIU4Iefh48vBc/ZQS5xaIvQbYt9d3r0NGlP4DxkHiAEdIKClFbmljZyK+rhO8YXxWbloTefdg36kH9+GXQgNOlxtRBhsiuEuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dCrNoBK1; arc=fail smtp.client-ip=52.101.228.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dCrNoBK1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fm/3Gx3NoV3ubaGXn5hNBmAQygrmE7PNTjBzfNWBxOrSbhjotVfRM/1H8jIeRDfghhyjSUkZYx45Es0ZHDlGK4Hul2oL41AibCuz3S3HNSBeMexNzdbPGNDI4Tp0vwCZXJxhqmk8nFwsndn4w/eSPSjYRAEVFYS9P4TVJQTt7hE+Wutr6UoIODe7M3GqFE1udW41kBlRx7VIWr3keoLbnUN19jF3Xr/yz2IO8e8uCyRiO4FBvs7T3xEOQ7A6Vxh6ChcZVrQeST68l1V+xlDD/obD0awayi1jz1GgmTjTamiQkuFYOeCGTFsaAugIyQxrcpRgL/So0UoKX6SIqX4Xlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RezP2EqGBAvCWTdESmexARvrv08dVx6SX4COZqJ/V9Y=;
 b=EfBEwshUfCtck08so5EU8i4uxhhYU+RRa+fnHx/s8dLNGOehlgRNUOwCUHaGZKi9+hisWqp6vPpIYVGxCdppIKw6qiAyh6mcSun57w6cIItxzkTO2aBkUSZPkyIRsbIc7qt03sZPur88S0nPnemsa4YD5GxdrXIcf3AYMIkjYapxc6ADgBX4Nxkh3DsXYCkrqV2th6p7D2C+BtOgO4AUo/1194l3+K3wdVlMks3p219As8bEKxTU/ccObqiLavCk9BriPJNubEwuGxZRUzFQ/MNk8sxMJla0jzWp6suiXzqQuS7X9YWScoo9VRGs345pZfm4jT9VJgUgmxjiDfw9NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RezP2EqGBAvCWTdESmexARvrv08dVx6SX4COZqJ/V9Y=;
 b=dCrNoBK1vXe9M1dVzKVDTka5rbYumsicVagGucbb4MOzZ044qaX6jv+P94S+fstFoN5AiskbL2X8+3YCQ5w20/6z53kvbcR99oCom1xAavD7rWPx/skciWfjFYOj5vXPGtVu5p2DBW/tFoiBYIfJ62VvunrmId2iRLxMxDhkdrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYWPR01MB10274.jpnprd01.prod.outlook.com (2603:1096:400:1e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 10:56:58 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 10:56:58 +0000
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/5] media: rzg2l-cru: Use v4l2_fill_pixfmt_aligned() for stride alignment
Date: Wed, 29 Jul 2026 12:55:50 +0200
Message-ID: <20260729105603.1160966-6-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 06438690-5ff2-4142-dac3-08deed601cab
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|38350700014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 xutDDifGYIaSNU0hBPd9O7EOXF1JexJMlk4sYSxvjbPZOCxy9mAoCz9D67psZ+QukV7/d9Ih9a/EoZgpdYNpO2cpZpTvsj5Z4OPnSo9FiZW7RMFseMKlU7erYZkHwjtJidTMAQGzQzRn5v7+t0jCuLYMlA/I/OAI4iXS8tOzVxfrtPUbdbWlCfn/04iNSIRHSSTPGlGH4WQv9tfHx8airrBNUIPTQmfc+NPdKHckBPMgSobB2lY8K35ody9X8IwcCHu04o+RC4/+qws9vmK3vV5txQe4miYcpJMJQSJH/CA1sIj98IqRyGXBqeZuapkEtXV/tXbTtos1rjFFtKLGZaFN1gerS5Hbp2Z+2njCN/UDiFDd0LuSxOOgeQFFfR72rp+rmIVC874j2bcblhT1fqJVbuSecPYuAlb9uK8g56I/eztbXPVl3WntAx2WYhxB67r6tMUT8BIf6XUiSSl2XDQjMYxG4GBZ9GCZM9hPvhwr3ncVA1o6poA59D3mIovJnfB21BPA4jBTuplKicPaSV15LDHhpfQX4ITNFfYFQVKMTFkd1ycwFfQT5isyZOs+ehQ+5B5d9rsVI1uk2bAjLgWsJHddCdMdrtf33qLAqtNas0IhItt2eBBXf4iS4v1mk+0sryrWUwWn08HWMD9v5FusWrrKv7rdWq+58UVmMkn7W49rDUVBSy2fKr5oz6Yo/Sq+Lgp6LNGqswTpPhlrzXGHLLzJ3v2PfF2Y8g/6CwA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(38350700014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?6lyo6IU39SLOnm7i0nNQHMxOn+c+jTCt88ok+y0Tw/7SRGBFF1OhJMn6cCMz?=
 =?us-ascii?Q?07+7CQ/R3R71hVBESXqwfKq9gKcw6dTP+dvgiwRwIKglxtjqb2wL7BBwmm3o?=
 =?us-ascii?Q?gfhE1siRmfxTg53seynK/djAj0KrWteRloJib0dCWkzYt9Vj/6T8Rh6aWqBR?=
 =?us-ascii?Q?fN86HR7u6Cvgx2e2HIJXolDhH3RRnkPqosRzVc+WryzvLOjF0t1Fbd8Iaam/?=
 =?us-ascii?Q?4qZvj6Cdt9mjSa25ipPBXvnE4lHj5zz6UYyBrSnuB8OkmaXE+Q5SdaDoJSaP?=
 =?us-ascii?Q?B1OT1ASTvFfWmrf+UlR7goBBjqK56ZZRxXEuMO1IybumG4XZvYrX6DB8KYhM?=
 =?us-ascii?Q?3/arzyG3oyx3vyPrBpGxD81pS89k5skuot7/7G8cUxourmrKHM7wI61F7DOo?=
 =?us-ascii?Q?S3j2Iqr2Tx4+MiRIQBt8+pqOR5xJ7Uay608eS+3ip7yBSz4tg6NAkAsIR/Sa?=
 =?us-ascii?Q?nsfcdv9s/E0INt86BEhX/zRyeQ74wHW4HyEicPXkIgw1byng+/t/6Zgp6Ycf?=
 =?us-ascii?Q?3Jrp0TYeknKqAX0yyCkPoZiOagmxlMFqAzFB696oqTa1jSk35af3kHqbAGxL?=
 =?us-ascii?Q?MQg+obUDXIYyFkMDY3/h1ej2g4SGEcGzfYsSBRrKr421zJXiTWHcCXyLPApg?=
 =?us-ascii?Q?66Q0cO9t2mJXprpnMcjQkqkU3XpWVOODnzunPwYZKhCM+ZN8K0AzT7177w3W?=
 =?us-ascii?Q?go4EL0zzZLuRs3PPstCDQB6POWFY/pHvZDWS+CmEx6xgUbP50rmiPzIztIsD?=
 =?us-ascii?Q?p3Vyn4oSi/gXM+3pET3Ay2k5TvA0TfUuiKV1jWdlhnE4xfpvxfdX1cWT/W5n?=
 =?us-ascii?Q?bQCS4HUe332+oErBDZpVAZP3/O/U/wPyFmlVuOl6N/N5vhO+OdzQ2gVFXYC2?=
 =?us-ascii?Q?Hyn2qBUIAVEqPRRaavqidpnotpLrKlAQvgM46A6hyr5xwbZYFS5KJvrWvqPa?=
 =?us-ascii?Q?kbatZJX+OA409mdBkoT6wmUr+tF4Z3ujCoaCJnn1fJcUrZsYjl9wPFlJYa2d?=
 =?us-ascii?Q?dN5SggFbiny5yt+ByIr0R0W2jbtWQ5oY8Qo8RZEz5/6gdC/5pGqsCriGeZbV?=
 =?us-ascii?Q?VTarSRYNUXXAi4Tvr0vzMlB0EmHDBDDPy31IJCKBOHruO9gHFaCaPO31p1mg?=
 =?us-ascii?Q?sW7JaSuRTjwkH1mx7hwzevIz64KJtFhTgMAUQp4onXJ0+vdBF7XvXJSPDu5m?=
 =?us-ascii?Q?u9VEwPzGpghBglwaYkeKGrjgiC3MeC+ig18yJL5F1vYbqWPZcA1951lZGLQV?=
 =?us-ascii?Q?0W704ngWFaWanXIbpKWUXjkHk8AbtPANonVXJDOVIfz+WxwlGmj1VnGHeOL3?=
 =?us-ascii?Q?tpgxNIxSvWzKyBOkVFAoM8u4dskKu+8aJ0cMH4i8D2KzLGHDAQBsA8xyq9um?=
 =?us-ascii?Q?gKFuBfLldk5UbAsQI68W6AsYStige8znUUeWiBgCiPB01PfONf/cd9yORAFh?=
 =?us-ascii?Q?caUHNCYQjD4R/FsNkYE9EerQsrjeBOzHcrdg0RODSAHt2O36lZloVjjx3oip?=
 =?us-ascii?Q?fSsR5R5Mg78FFy9FqMaysR9b7/zUx+V6oFq5eW0xVCPlhe0alNZcri/GxjOi?=
 =?us-ascii?Q?78hbpsCV8Ux06ycoTz3sNBG/xs8DmV3Im+rPe0q+yUSxQpH6RrKxNPkMbSay?=
 =?us-ascii?Q?R/EQl2AJYGFrGlXqXpNDceup5OuIvatRSJ9XjD4KweTf6SMB/fXz+8g8fAez?=
 =?us-ascii?Q?tafTCHk/Rv80QeFMy937+9iScgcr/mcmyqU8pG5P7Gz9M4B8aBdOVaUjXDj4?=
 =?us-ascii?Q?LhJvlBpiAeL09HofmOIoO7zrFcnGUHSe1extLqTEvrZ2Kds8VB+Q?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06438690-5ff2-4142-dac3-08deed601cab
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 10:56:58.8002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yB6Xz19MQ6aCJIRp7F9pfERQ8faP+d/mYEEEpCbZxZkvq0qMZhAoo2mAOPVOaqi4XB5CNoAk/6V4IBAqBf6rjAFX5w4gV3NKPBLvCa1VQuQVkeXNkt+GDEya5eprPE+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10274

Replace the open-coded bytesperline/sizeimage rounding with the newly
added v4l2_fill_pixfmt_aligned().

No functional change intended.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
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

