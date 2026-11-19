Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795109715;
	b=lLAxpc+9txJVihrAYVpklUAMNsag+hY3khBhSHnUOnBQflIGHjwd65tf4pIf65XSED/q
	 13XvTnrLd4razJ/bW193sUAGhvPNI3N1R/h+BUw+82fXRGLzzi3iR1w+yoi0zfxJbawzl
	 5+XtAz5IYgO/PT4zV0uKshRlXl1q8AonwGk4Iepmm+vb2HSukX0wC8sZISqSll9Tl6tD7
	 joZsosVdKIJ7WtftFyqnSMO4FHlSBe86XzJlusnVk/dOHJOqxvS+yrqPU70ntFzcG5Onn
	 RYC02tQLh6c4j4MeSzJuS7FlNYP8SQNXsKHwz3RN5hp4uTO2P3HlEEEkPgn+oCZu4IQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109715;
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
	bh=xNoW/RsLdFgdWANuk1G3J/rJ5vMx48wecZnq/4UKodo=;
	b=wQnzdRYdiHeaYYcTYPwsTk/bzG21TR//duHgWZo/PTbriCawJsrmHJugP5dMZxvaiKQq
	 tdnn4dlUbfpoqT/2f64TDz6x6FPOgdcBpsTfSBvcUfkQcbY/zSicagaIF1HxQX0N5ZG71
	 BoSwtxs8OPpDfYpk+21dWCQ1JGFxFbSHrXKI+j14SnWKXbgAz/qxpCfcFC6EhidhYLv1D
	 NgARhNEnrQYErRwqNyCNTe+eSOe5kz0nDc48Jk6HiBZcH2skrle5ZlxmsxZ7du6yviPjA
	 RMjgPT5NbwxB3K8g31oowWyY/u2FLPpPVlpNOamQ9/BMvkiHCXlzORHfxn7zM8qhfLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=dIvV1Jvn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.6
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B03606A331;
	Thu, 19 Nov 2026 17:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2B03606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=dIvV1Jvn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBgOWz60b8YAD5r/7saeA1wagRF/SEIQBXui7ks95k9Ly1oRyicZ0v+OhyL/OSRaseA0i2v8UtiAkRiq09XNtnkO45mdkm4G5B5QP298T2qoGOd9I2wcGr8AKBfaCmQYnwSsEKZtET382YzRt2RKI2m+WDX/9Yfle9bO/j6/S5jK1dvePdZntRHUYm0U9MoZprHIL7DmwAZl4sagWrvJRZnlfW8iRQ1HboOjzBHxu1PXxfLe/IMXbBVftt32XWtyJwAkHfSNfBTBoY3eTiXyM+kCjujWcLA0dlDcFAWr2ijNAinqhWr/atwh8ToNam06LxL5l+mAwaHE+7cQWR8QuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNoW/RsLdFgdWANuk1G3J/rJ5vMx48wecZnq/4UKodo=;
 b=msK8Hbhl1hghFnexd32Gj2qgOUevSQUJ+LHQ4hjYjkVnL95a1uRgZXZgjgTrdCwQz96kIploEpUua5kenF8uYX98INrH6QCXHBjE9Ao5miqW1hYqlOAEbVgc+dQrRgbNE327YnCXUnNt/Pn9ma0uPqm1rLAqJrqHdt9dqPzEIv3qBpqbhTnB7YwvasHHf7vTAHxK/q9hUKKMYk+dEKIilfSbVbXYRS6+aAZXJW8guMwsYce2MpeuMILM3XPHRGvar0+79lqLOWrKGk7UrHvtcigq4+EtHRFLBHWlrAHKZJg1zZxg1L/nGx7rWl8a6jQ5UWwBrRhFhQ7gKHsszBVrDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNoW/RsLdFgdWANuk1G3J/rJ5vMx48wecZnq/4UKodo=;
 b=dIvV1Jvn9QP/28m0DuMoFHoILj1KHnbvsO4vSdl29izsHk68goGBqrrErAmHTCeJ9kBPq4pIBxGBWdqKuTC4Zot60qs/wfG+AZlDF/1h0Tl7GbnBh5li0be8YI72/ld+dE8CLPW0MdUfK301SnSEoiyLM97ab4gS+fQyBNDkKCY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by OS3PR01MB10422.jpnprd01.prod.outlook.com
 (2603:1096:604:1fe::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 17:35:12 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 17:35:12 +0000
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
Subject: [PATCH v2 08/10] media: rzg2l-cru: csi2: Add system sleep PM support
Date: Thu, 19 Nov 2026 18:34:11 +0100
Message-ID: <20261119173413.341658-9-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: f59c479f-fe40-4c3d-4957-08df466376e9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|38350700014|56012099006|11063799006|261021121427099003|261009223027099003|10067099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Je8dvq6UjThTmVomW4Bscn71LkJ6MKdpMmV0BYDofix+WbvwguQMr8HqyzswIkZWvSg1OWyMGU7ui5c9c+3kt3dFZvLU5oXxCD9jWB/HfeB4lYuewHsxM7+4gX9b/r2GAZ0p+er4CH2z+75rUUKUY3f7Whex/SKdDOVZyE1NszpXdPtelz+P1GDPAq9SwqTmDCibGWd1kqu/TwTkezp1B0I9kmT9qWKqQmGI9CSqrKCWhlP3FV8ZmYY5DDEVME3xBDLoUcuNEI1Bhze4VPYCEDyhFeY5oez3IEbgJ8xLsqVeVmmBy4RdIM/tmO8jnxYJTk+B7+37mLFkJ/23GDGHBch9O285T6XHgfT51zXpujhny8e4y8PhqAR30ldG3Z7X5CmGRxnRQoTVBgnorvJ3zH/Od7W5NLgCQEI4FTDym0/SfcD7eDzk4yb4YIWVhDjijSAtltzBHTRSBoHVQTkF7r1RG8FXvj/XhgUvxdcuOwiyFlyJ8QaworjzWtxHybGsQGXx7e+3A7wiUNRSgYj4lDyyO95+OuU9N7E5RkrwnVcSLVckp+QhBy8FLER1+Zr1x1aYxhOrcdMpetQpXthnITOd1Mn/cWKVBe2H+u/+ixgSlY6XYBidbXfn97Uiu6zzRc/tF9O0sgbQGp3H9Q5DceDUcImK2JQ6+Qr8n0SoBK73Rcrq6KNWR4lO/PltHlMZ0pB1Mdo/kuGnbVQoStNiFE76UlMu3S5NvXeDZ8vIkZQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(38350700014)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(10067099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IJYWg+Y3jO1hQolLL3Z/1W8Xlj/tA81Dni/BUk7xDBLx1xW1QWIdJUyhrLFK?=
 =?us-ascii?Q?zWoKHghT6fRotlnCcJh8O3xF7v62qlIUpgFSRELpQ5bVngf8HD0rZh5FV9N+?=
 =?us-ascii?Q?qbpOjF67/LgHcQSKqd2rz6XXUZmR8AOJda/vW/JosAtZEucUf/35iwq6vsLy?=
 =?us-ascii?Q?Pqq4MN2n/3iHo6AyCvbRJFREggDIpZzIcT0JV2I9FNYv5I+G7Q6qsYrKrP+d?=
 =?us-ascii?Q?D7FMzRaxDfIIer4hzxOf8zI7JcdSDrobqHTHk3LwFQDPQE1GU3nhcjzeEup4?=
 =?us-ascii?Q?6VvyfEggmwgpo2bBp0zqfU8x21NtTGeAYsJhCxO8BgAi5qqr39dICDfP6Ki1?=
 =?us-ascii?Q?x7IjyWuhi3dQS0reCl0KhDMQ6VIbpbJbzMVbujatdIcKr2XFDiJMp5g1nIbu?=
 =?us-ascii?Q?vVRcYj+nCcodopLC0LfSdfZKMvHoV+alpH0A0pdeGUjZTsi6n38zjwPIocJq?=
 =?us-ascii?Q?EN3spGFo46vSkzcoMv6hteeH6Dldf2WmzmIlCTSbVfXh8SmZ679r1ivjNutJ?=
 =?us-ascii?Q?ZrC5LgdeueLDJnvVtAVnBV0c8Yz+nHB4cScJx+nf7Mq2GXNSwFCUvOFnXH2c?=
 =?us-ascii?Q?+LaDxDD1xi2A62uZPDOj6AAbcdkFTc4H1OVAhK+O9xa+StazXojS58dG8MNw?=
 =?us-ascii?Q?zY8fXK53Pps7GOC9Olza9i7b/yCzwC9Cl5jDgWtGX7lEUDOqAzY2a0qMAOj5?=
 =?us-ascii?Q?m/Axnbg3ewIW66Cl6Hbd0cQDPrAO0mntQGqNpyKiGSOzvrCqyhmLd1ykTel5?=
 =?us-ascii?Q?N9hwMBpO/BXXIoI8S66eHJbFtlleIMzDR0AH8N6ruhyIYsFCMk7+cO3/zhu+?=
 =?us-ascii?Q?gT8aJmGjrPsJQPmdCoQH6E7kkA06lE1eEFaGnA9iphmBKJNWdlCWeDh3qV/M?=
 =?us-ascii?Q?zAKh8bu3gxger0ui+ydB6hOknoRUkbSH9g1fDFNKFN7YnW7MBDF4kJEzxwFY?=
 =?us-ascii?Q?VDzcsFqpmzPlI944fWlF3u/UcyWyWHDtgm12cYxIip4x+ikOokvp0l9qr6KV?=
 =?us-ascii?Q?Cxh7rz5J79sf+DLWIduCPURj/O7LxJJYgN4uiAeKPnxVhcvFXE88fNl0av9S?=
 =?us-ascii?Q?cnpBk0N+rE40vj+/bbJwPp2j1jGzvuiTbbtR++CM52RZZeoHgteJvIXhLqRM?=
 =?us-ascii?Q?T2b9iov7UVBfERWmICudq+efd/9CUXbFdfc51P5tX6MxySjhGN4QL3ZrS/Ig?=
 =?us-ascii?Q?oEV+jVNIxarnOH5u+dnetTh3Ma154oKJ0dUdVSyxWyagpGYcIceJKy+v42nD?=
 =?us-ascii?Q?6LSYE4u+j60CYR9Gx/it5X1VVC7xUkmebe5ms4A3Z5tPTVfPClkdRx5hsoM1?=
 =?us-ascii?Q?5bTNMVjVvw8LqeNfy2aMehIV/t41YXRNaH1f3rFiB164sXvWGQbzb3jLOsor?=
 =?us-ascii?Q?kJ3IJtShHToSvrucvI5IBASvCdILaTPK2CumluWlMIDzxHt97uSQSSDgmO+Y?=
 =?us-ascii?Q?aSLYNOr94p7hNEDxEHBCCtaLh/JQmRBCyBq+qTmf8z/d+zX/kurlgXmF0qqE?=
 =?us-ascii?Q?29qlvZPxVGowJV522KMR6RxqMQj+RRVzGwjSrHBpzYaHLY3UrnYqmSVWYY0a?=
 =?us-ascii?Q?9yLi3cqZ3twaFlSGictzTMOmBZclOCby1Wm+6nE/gZ2nZwgEywAZJ4HancxH?=
 =?us-ascii?Q?3su1dSb4aLxKyw9TErYrYF+t9ElYeidP9lQdSJ2y361+cvybsvh59limL65J?=
 =?us-ascii?Q?ny3SOQx1G92IqbCsKLrfacDzamWlFLMJXJpaGBzHxWBCZjKtAS6IGwbanKOv?=
 =?us-ascii?Q?OxlptHvxcxuL3gZ1cU2FvzTB+7bqd9phZOaOgtYXxb6Zx3vd0sZu?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59c479f-fe40-4c3d-4957-08df466376e9
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:35:12.1414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxRVvMTy/Nr4l8n3BoybpL+GtH+cX5ht21IuUf6wvzL6ER/dg7g5jDo4mSSo2c712OlT5szg4Bpl6O/rwytX+dXTgvwbvmg5jQ6qBVVn9po+cD2vgS9/Jhl9UXfIaFNo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10422

The rzg2l-csi2 driver has runtime PM callbacks but no system sleep
hooks, leaving the device in an undefined state across system
suspend/resume.

Wire up SYSTEM_SLEEP_PM_OPS with pm_runtime_force_suspend/resume to
reuse the existing runtime PM callbacks for system sleep.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Added missing space after comma in commit body.

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 860e989e8706..032178ef7c11 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -1044,6 +1044,7 @@ static int rzg2l_csi2_pm_runtime_resume(struct device *dev)
 static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
 	RUNTIME_PM_OPS(rzg2l_csi2_pm_runtime_suspend,
 		       rzg2l_csi2_pm_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static const struct of_device_id rzg2l_csi2_of_table[] = {
-- 
2.54.0

