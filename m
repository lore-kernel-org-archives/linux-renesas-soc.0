Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795109699;
	b=gB5T2SUWpnoxasjah23UmJXVaIMuaVY6MWAkgFTt044WwQGz0pUTJiDUKPccNrtCsZL6
	 utQxGrNuSU4d0F49wwl3jAOoyI4SxvCJlVVnNix+2PU5+jlEPDXMBbFRPt1OxqyfYjf3j
	 walkfLsLtziZQei4JQO0xi1MSxMEudWv3ZnUYsV+uEMyE3S72vWxiXqolKPsfA2T7EY4v
	 jolMLajfEgcKcVhYy1maZLSwZ9iEHP+FZRirsMiCzlm8EzST+0vlSboFTfZSoS1tokEzK
	 xff3J5PUs56clJSpTvq++VZ9r+EUIgLd6yxQy/O/MFpeE55AzczrdBMWf8JSzeWnnDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109699;
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
	bh=RFkXmAEF4Kf+Q9zMuVYTrJTQkOZs2MkKJxrBfmqAePI=;
	b=hBbrZjHyKF2cummwLbqHiC0bJriaQo2GXKPxH0FTwoY3oZW0u/E/o0PRaD4BLdsZ+DGe
	 Kndh5PC7eByYHJ9JYvLz/N4sSjlVGUyq20Bd92exL5osMyzVo59E0x/l96coBKXL74tVl
	 eSY/NXrW8z7GOjr2iuGFMqMVhb7RzHH01DaDwfFWPrV36Wr4qqaYMr2AhOpiKLveCSNs5
	 pMptfVwdfHLoAjxMXoF54jjuJMVG8ACA0QYgQ8mHInG+uxBtPWdKvXZ6VeCUkjymmBzoi
	 WeiAMjZGDZ6xmVY2gqYpJfyhSXlzBDxLgZ5i8qs1SYvfVfMWV//99s548G31ukl26Hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=grJnu3d8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.39
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010039.outbound.protection.outlook.com [52.101.228.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D53F606A331;
	Thu, 19 Nov 2026 17:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D53F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=grJnu3d8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6/L/i8x0HurgBJWIhls+oGXsB092DBdJmdtr4ve/UI62xno9RL++9dtr+g5cqDUSOCojObzuhW5/JU5VxAe6YUUPMMbgBX5YjxYB/n7BMnEbRqqCTDc20e4JdUPtPhSEqaJCrpO0mr7wXWXlm5Bdvq/JJ5lYdKiK9ieKbhj1/Sqvwl2Sno4eIusXn8iJKSU8dNb9DSmSgKooe3/Oyy2R5qaJ/AUwy9amsS0QJReTjL1llkIbXAGYFoYqa6O3HKnKacW18kqsHBRhr9NNL0f7oHhdcAcqsYa+4Eby063Ry9ujtDsa2D8TViwzXqikiVVXXjCnCuX98GCOrSd4je8Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFkXmAEF4Kf+Q9zMuVYTrJTQkOZs2MkKJxrBfmqAePI=;
 b=ypLbjgStVMT4dmzMuTe+cavgACxrpvXM74MnmfOSuARlcCIGlS7y87yfEpkF0uLw1SAAsICWu8RLJdFg9ARXr4AoietRMVFdD+bCAf2dgoWEYaZlaYuist/VPnkRA0yPZ1KJ+YxvFEJrhuycTlyI960Z/hd3R310L2cY7VAcEYJVQ3nVw3hvXfG79q7LBSCKbT4N22O/8v2ZyWq9DvxevAR5LjUjVlUoXAWYt/buCEZ+ucY0dMunHow285vPuXFsi9818+BYimwm5AR1fX1kgdhzik7W601z+BG5OueUQTcPP03a9ICF5pVdfwUGrJLWuhTUHkx8ArMPA1+id1mxtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFkXmAEF4Kf+Q9zMuVYTrJTQkOZs2MkKJxrBfmqAePI=;
 b=grJnu3d8lbN5OHvtub/xQssfcV3xyfVc6egTyC28rD93MB8ACfk85UBonKa/OCkF5kodoab16zX7SRfuLVqUE57jFqsDdOBl3B3/4KVoD4aPelv4YwKWKTni2+g9fCZLZmXR/xYwI9tR3OPLnGe69vhFOJLVlS9AdaogmKVgp0k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by OS3PR01MB10422.jpnprd01.prod.outlook.com
 (2603:1096:604:1fe::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 17:34:55 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 17:34:55 +0000
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
Subject: [PATCH v2 04/10] media: rzg2l-cru: Add runtime PM callbacks
Date: Thu, 19 Nov 2026 18:34:07 +0100
Message-ID: <20261119173413.341658-5-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 30a103c9-f6f4-481f-2af4-08df46636d23
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|38350700014|56012099006|11063799006|261021121427099003|261009223027099003|10067099003|261102123227099003|261026140227099003|261022105027099003|261022075727099003|261022115727099003|261028144727099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fmGoXvnEHSI58AHbRGrZC51fNmydCPB9HF0sBNlfVszRz2FUJlZVwwMMGS9cQNT+AmUWF8Ef3uF8xFBytJwapEcjugt/75q8Pp0hRGINMk9OTQzNKIpv98dj2e1ed/spYwe/Dodh3qLvVVkGPZNmv1kT6w5pb7L7OKFgbBUWn7r0ldPlu32Ne/w1w6WdeQ+7A8lBkDVHcUGRrDmt5pYJ3fkPBjmwx6siiH76jfB0qQjyVypnlJrHqL080qIQXeuWYJWYN9U0RkfnTwhqq4MipCEmWuphrgiFDlQnIOL5Ve38tjTtwtWcYf1Xn3sIzAcYGgO61YTYuTio/reB+vO5Ye7xemTtXL2rqdBSplHTxERzfs3hYzugRepBDTTvF57idVrRvbup5onPIaLN3oNkQ3kr4D6CkRdvAsvwcp7s/vCgEMHyzigY1d86Q6tgA9pb681WzgpYYnRiA04iNdGfpgiufv6CrFqu2KGZb3fOn4gZzJl6WPu9Fji3NKeLbtGwXMjKBTaMg75dQvGvqyRv5xCo7Rs0pNPqqviGDj1i2HES9/uJDzvvhCsa05cleycRze1tJU42oZb7r7V08KnnUe/ttYo+JLkThWb+VgkN7bZE/xBfPcIGFe3Gl32sa3nlvCdMBaC5nW/AJBlRvbD5evltJUtfBTjUQVm9HPuDjtM15qUwMTbzmoPa58DY/6BxS2hM4FfZSbnVhKE0F7DSa6vWUiNXdSnxtJCoUOejAs0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(38350700014)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(10067099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(261022115727099003)(261028144727099003)(261021123027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c0amigDpCBApPo8DTDZdqTGAMNX6amy1afw/AC660KiPXo/687iFLfPGRNyv?=
 =?us-ascii?Q?CWJvVxm0TQjhyW0RGkk1D+SxHmJS7UxHvA/2gVG5zASZcO68qTXsXcmU1p9f?=
 =?us-ascii?Q?jV4jwhppTveJCNU5Z5isV/Jmf+4UZI5Wa3A7eezTvPJNNfeYogUeNfyzsYia?=
 =?us-ascii?Q?YRsE/sr/BqhcyFTxbGY73YnkkWaVXtV/hRgaj2HR1Okrg1dkerfYDpt2cwc+?=
 =?us-ascii?Q?CiRKERiPe0O+QlpAGlYo/3+8E/wSGRGQXXMe1qD+X0/2o1iKrVjb6GN0xjY/?=
 =?us-ascii?Q?EJWb98VIH07FetepBY9KspbrSgNX4y/IGdJm2PX2xCMGBGFdvJK2tEm3qANj?=
 =?us-ascii?Q?GhriNZfGZ2L3/1C/3Ob3RcKJmtwO8YFT0oJfEjx4O+WJy0qwQpF5L6z/evtS?=
 =?us-ascii?Q?7wsL4UbIa18A3uEGzxHLSq3pbS+YzSLeXhZxck6KcCXwBgOuqNJmS6h97K8y?=
 =?us-ascii?Q?PO3KaywwmI8tyw+V0wFuJm37MTx3mXfRxS4DuaMu+5zlyr7KT0MNgy7sYc78?=
 =?us-ascii?Q?KxACcgOApQ3J6c2g5i+HYRMx18DLP6CFSCDN1sMRbAzXeK9UMoooAMEzGT/w?=
 =?us-ascii?Q?DBpC8hCZ1uybRbtgwGxdHbjJCnfviK14eIOD38fslBYoaFRMo5qBc2EA0yJm?=
 =?us-ascii?Q?JTgW9A47X3iyYebEQqooif9fnHCxCQN7R8yuw3daMv+3UJe9vVT/OajSyY3E?=
 =?us-ascii?Q?/8V+QXx9iG6OXwMBVqdy0eOHeicNgzlfK1OO0MGeeFa9OEc7JMP9BDr+8FKh?=
 =?us-ascii?Q?J3/5NbcPothSPoPS3lZ/ag8U+/Q1tyucaYYv3dnrsNM655WOK5Q0s8SFVpVA?=
 =?us-ascii?Q?7VcZH1/hQhr/tLRj/WpOsGGXMpZGmPXs/BPW34sCXnnmhzU4a7UBJcf9Uybe?=
 =?us-ascii?Q?qG+u8T1GMsn1h0i3//uz6XhcrFkdXWS1+MX7y30YptyuolM7VH8VdlljZ6YE?=
 =?us-ascii?Q?Axz+aBdNc5AZar0xLYbxgkrY9yL90cXmUjBP3r/UvEOcyktucgCizsfs2dMl?=
 =?us-ascii?Q?RyLj0JXoRxE6OU8OvHlwaL7LblWjl3AVnBVYxxlifehFdUs08Zwp5JmI9GLv?=
 =?us-ascii?Q?+m5Mt/0I8IRDPXPubrvs3FKGQEGyV3wkLk450DZTVP+QKci3+RhOW6S4qkYi?=
 =?us-ascii?Q?y2kCDtxSo3Dbw/ljghks/bmp+Jpt7dlh2nM139F5aVLeHAYvCBKGgYeftSiy?=
 =?us-ascii?Q?kc/zu53gyihY01f1HBAYYzxb5OtjHlf+u6BpBNTQKe/9ZCF3zawY0Z8Vf/Fn?=
 =?us-ascii?Q?j5Dcvsp7wi60Z+IaKrCwrArWzz+SvPVGd/Ng8XiQgLsg8X/WPfI0sQlOe8uI?=
 =?us-ascii?Q?iBNJNlYhj2PeeH4isBuQzGgG0omz4b13Xx1Sr99gkC3iVMBxSBl6CRrYtQWZ?=
 =?us-ascii?Q?fRoESYgH4U+Yb7sZCtkScApF0OGvB7bWuOz4liEc95Uvg+plSu7lGmOkckJk?=
 =?us-ascii?Q?EZh7x7++dbnEmQgbbjN7BnjqWXPfk+4sI71Vjef7e3pSmvgs3j30CrPS2b5v?=
 =?us-ascii?Q?o9ePVF4xWvjePjxl2ZZ5ZSDEjuTXElQB47+sUIpGDB6I5hMfQptb4TWt6Ktv?=
 =?us-ascii?Q?rBI6a7Jnirz68VvRsi9KVFM0nJQ9MRtjr9qBs0/FsPXeefzyxF8oN77hfk0f?=
 =?us-ascii?Q?zwquK9++EhvggEh7Xp2FwTRRjKrM6MPQl7LM2J3mb5ODLBOxF9dhD22Uaep8?=
 =?us-ascii?Q?37W1h+GVwRhS7yI9Urr17a9zHgIva1Cpy3ds97zKrgL2OG8GZVwb5Kcd4ngs?=
 =?us-ascii?Q?bThEEHe/QU+OjYPu9gQihT38BgJlwrC3XIoUO9IiRGt5szgnwDpo?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a103c9-f6f4-481f-2af4-08df46636d23
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:34:55.7299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZp9Eb2wx6VDfOFghN1lhJJP2VyTMqAPjx+95TJvRb68XiBI+6iMzq7jDpgbxhe2MyOTuJFXBqz5pheAdleYAgEwmmucbb2Jz3zo9Qs8ABdckkGw658OWSgo2NxvK/8H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10422

Move the video clock and presetn handling from start/stop_streaming
into runtime PM callbacks, so that it can be reused for system sleep.

Keep releasing aresetn in rzg2l_cru_start_streaming_vq(), as it is
asserted by the stop flow in rzg2l_cru_stop_image_processing() and must
be released at every stream start.

The hardware manual releases ARESETN and PRESETN in the same step so
releasing presetn first is fine.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch.

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 34 +++++++++++++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 24 ++-----------
 2 files changed, 37 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3bfdf0818936..4de3ae8a9ec9 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -236,6 +236,39 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
 	return 0;
 }
 
+static int rzg2l_cru_pm_runtime_suspend(struct device *dev)
+{
+	struct rzg2l_cru_dev *cru = dev_get_drvdata(dev);
+
+	reset_control_assert(cru->presetn);
+	clk_disable_unprepare(cru->vclk);
+
+	return 0;
+}
+
+static int rzg2l_cru_pm_runtime_resume(struct device *dev)
+{
+	struct rzg2l_cru_dev *cru = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(cru->vclk);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(cru->presetn);
+	if (ret) {
+		dev_err(dev, "failed to deassert presetn\n");
+		clk_disable_unprepare(cru->vclk);
+	}
+
+	return ret;
+}
+
+static const struct dev_pm_ops rzg2l_cru_pm_ops = {
+	RUNTIME_PM_OPS(rzg2l_cru_pm_runtime_suspend,
+		       rzg2l_cru_pm_runtime_resume, NULL)
+};
+
 static int rzg2l_cru_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -428,6 +461,7 @@ static struct platform_driver rzg2l_cru_driver = {
 	.driver = {
 		.name = "rzg2l-cru",
 		.of_match_table = rzg2l_cru_of_id_table,
+		.pm = pm_ptr(&rzg2l_cru_pm_ops),
 	},
 	.probe = rzg2l_cru_probe,
 	.remove = rzg2l_cru_remove,
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index a7b6dce66570..be8e5abf2151 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -677,22 +677,11 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(cru->vclk);
-	if (ret)
-		goto err_pm_put;
-
 	/* Release reset state */
 	ret = reset_control_deassert(cru->aresetn);
 	if (ret) {
 		dev_err(cru->dev, "failed to deassert aresetn\n");
-		goto err_vclk_disable;
-	}
-
-	ret = reset_control_deassert(cru->presetn);
-	if (ret) {
-		reset_control_assert(cru->aresetn);
-		dev_err(cru->dev, "failed to deassert presetn\n");
-		goto assert_aresetn;
+		goto err_pm_put;
 	}
 
 	/* Allocate scratch buffer */
@@ -702,7 +691,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 		rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_QUEUED);
 		dev_err(cru->dev, "Failed to allocate scratch buffer\n");
 		ret = -ENOMEM;
-		goto assert_presetn;
+		goto err_assert_aresetn;
 	}
 
 	cru->active_slot = 0;
@@ -721,15 +710,10 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 	if (ret)
 		dma_free_coherent(cru->dev, cru->format.sizeimage, cru->scratch,
 				  cru->scratch_phys);
-assert_presetn:
-	reset_control_assert(cru->presetn);
 
-assert_aresetn:
+err_assert_aresetn:
 	reset_control_assert(cru->aresetn);
 
-err_vclk_disable:
-	clk_disable_unprepare(cru->vclk);
-
 err_pm_put:
 	pm_runtime_put_sync(cru->dev);
 
@@ -748,8 +732,6 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
 
 	rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_ERROR);
 
-	reset_control_assert(cru->presetn);
-	clk_disable_unprepare(cru->vclk);
 	pm_runtime_put_sync(cru->dev);
 }
 
-- 
2.54.0

