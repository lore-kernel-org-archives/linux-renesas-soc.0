Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795109720;
	b=cK3bv+sgyuvr36KxXF78S8+C8qbbNHP0km/wMkXT98rdLggn9KBzgF/CyOZT5es9AOU5
	 D4J/iIk2T03uoyz1SJmlUoV/JLPVugMqUT+Rk7Y3tfD+JnyYmPz1fZ31UkNgIHDRjevx9
	 QQxL630JV10dTdvXSBoTL9/WkH+RyYxdw8IuxyeRQ5X0u766Fwl0jdUzWJeGTWU6mIJKq
	 g99eb04QEWsrILbcGMJFChd77eqp1oPsrM9vh0+k2GPBlQ22n+GsaEiCgCmPcXjnqeJur
	 L7LUTytHVIvFFppQuPOTpD0Wh73Gp7Qq9azNOlTU23FNAAm8ygJwYBQd0yh01i282Ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109720;
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
	bh=P6Yi+evDmEzSXKkQKxO+ZDFfM7IBt5fM2ibmvhr51HM=;
	b=AUUhrDBo+/WeLYBvUnfmqRvjv0F6QuhqLI0XaFbWGkvyM8JUog6mW/yMvHI0jIkh3hMl
	 BoXHj4qiUcQAxbfTFDSpylYCZ/W8qiCNgES/1MGZ5KYsy0n1hUXYuW//QjROqKb1LvbA5
	 BPOZZ4+bxEWyqFuBkkmw2ofKTwQdR5jIL8JX+u/NJ8CucBuoDnUF5b7GUFVNlzIDkvW3d
	 FNafYZdw6b1ORkvkvO4d8X7dVKWoXC9Omywd4Vr7gFgztV0Bo/ravZ5W8nkVM96B7kRsD
	 JiD7wtENKHdF0h88b7TyrDS/XhDYrS6rBJ5WhOq4JWUcTmW+JaDF6Xr6czP5wFIiNow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Z+3KLz5r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.6
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690F0606A335;
	Thu, 19 Nov 2026 17:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 690F0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Z+3KLz5r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxTmpjpZK+gqM1dnDt1Ud099f5sOjCpY/3WSxBJr8L8aq3sxjS/shdfg27KhpV1JW0AT7sEg4NF9Hr9VC9f4E9HzXQesWnPGeniSuB1/qgUvDH+JejVRunuy2BOn3XDODbqTtt42aIsU4XadsVgmysvGqx6gpktl+IKsrdj9FDDPe7sQb7nnQSTEZGpn9noCz3zFKO5kmbz4vPciKSHPESggIGeXzj1LcjTiqABg0eIF2yTxffYoJQHrOLldrClXa/8apgR/soObHc4+PQI8bwlEM2zBT6zizfE0TIENgncY9Hu5jnWM9jhsbWOMFfDUWC4WiALf/lGPTEqr6GrMUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6Yi+evDmEzSXKkQKxO+ZDFfM7IBt5fM2ibmvhr51HM=;
 b=RsG3t6qzhu38fOp46oetphsLCh5nsKen4qmHIpcYUZP/e3FB7PRcRt2glS4stW3Cvsli59471eQRAjXEkAjNSjn45x8xoqgyJyMpgmhIKwEnz/5Vb9a/0RbcHXEWyU1B6JUmAiPBZ6807c4jY28Be/OBbMc+f+dy5F7kMGmvaPyc0JSUk9uifiC8FAH7eHzzCwA30pFyLTvM4n3BJfGWHYTqdhxClerv5EIlyR7PV9/mkTrdNHaYShYCXKmla0Sx6A0ONpwzbS9QswkWUqc7NArmybuf0592V2S6SXhuRjIhtoBZVpiyeXhT5CaqQdNY8wYgzumovtb4KqzLuhh/Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6Yi+evDmEzSXKkQKxO+ZDFfM7IBt5fM2ibmvhr51HM=;
 b=Z+3KLz5rj0XJMURs7rEunUkpPdmjdCNHp11gQDzFSmH2E6YG7+33v8UTjmdl4ajNshjgvAtoN5geRdo8qsbRabtfUtvwl15tlttSzd8FLKxQgiNEFunvoiGinfXhNE2aRbOvhtqoX72W4Z5OpUysctl0HpdIZ/a22qWHTBv5EyI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by OS3PR01MB10422.jpnprd01.prod.outlook.com
 (2603:1096:604:1fe::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 17:35:16 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 17:35:16 +0000
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
Subject: [PATCH v2 09/10] media: i2c: ov5645: Switch to RUNTIME_PM_OPS() and pm_ptr()
Date: Thu, 19 Nov 2026 18:34:12 +0100
Message-ID: <20261119173413.341658-10-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 493833fe-535c-4df2-5b56-08df4663795a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|38350700014|56012099006|261022113327099003|11063799006|261021121427099003|261021130227099003|261021135927099003|261009223027099003|10067099003|261102123227099003|261026140227099003|261022105027099003|261026130827099003|261022075727099003|261022115727099003|261026121527099003|261028144727099003|261021123027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	nCfrXWd8/PmP3DxmgzUq0UenxLD9chXVGc1ywBJzk2gnxCUyl0Yesk6GGuuB/7HOkqYgmm+DqOgHbt+77c+Xo71IpVUD3J2L9xDzo8t2fo1Pn9guAigfWGJPIXn01NIPeBTNZlfGBYZQEN6rRUzpULkuhGpM217MxA/E2WQyNc19jnCyIznnayTkbrSlr0yBFrghoFKaZIa3lOyBn5mvrQGuWSIhVh7srtz+8tmfNy/kBpkfCRDatrQPTBf0npY/4yQG7G3dKvlP3gI14PXpcsGAAQGXbcBDQJ9RqrkQdVYSlMb8d3n/xk2rhRaIqsdnMAK3Nq4uHC6BYkq4/rzGr2A3HDJrxfT9XFN1GX4JOw/ML8ruSxcmfpGmcxhufe1uxo6m3OEwEw2Z6MmZLGzWHTJVtBDS/AuWDxWYe7DTx6d9ws4vhUR5C7nLE+P0R7M+KuvPqHCe/lUCKQt04cjgPNV+HPEBX51V8arNHrWi/v2UvT8pm6R+8ki7o4NulaLgHa9C9ivE/WIN8rXWOKoofWSWuMJ56BUIJF+AnZh3ju6saAwWnMpaqwhAVc9q++Pdqp0vr+HTES4K5X8d3Yz8pHiSELnSgczLRdaz7NBmBURkevFuDtWcca1uSnipLNRjAuiR19ftzLIhTxSRwssaoXPn1O5RBM3hAUZYH6WCnUqj+rWe40mM215rLRFxEKWC2QV3IYZZOOGbBo/JU1GAMFD5AncWAnH/U5Zcr2ctB8g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(38350700014)(56012099006)(261022113327099003)(11063799006)(261021121427099003)(261021130227099003)(261021135927099003)(261009223027099003)(10067099003)(261102123227099003)(261026140227099003)(261022105027099003)(261026130827099003)(261022075727099003)(261022115727099003)(261026121527099003)(261028144727099003)(261021123027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t9HE0JLlWuAEOkEX0iI9qvRf+R8My80JET71K/cpdZ9ewrg+3HMsXiZx6wWp?=
 =?us-ascii?Q?9d5mCwyq7W1/sbc4SkwTfkMproQSg5yFz49+G4HoK0A+08uqw/Du+hNNuA78?=
 =?us-ascii?Q?4c3B4VY2vi3Qp3NZ1EDlfCbALQKhe9oPMdBnrEcxMPZOplNlon9P5Lz/hYsn?=
 =?us-ascii?Q?N9MchMgtIR9d9cu4p3hg6yWejR6Udmu6NkCwkeVxHcf7NtoifNqAKrWNk7yu?=
 =?us-ascii?Q?ocNpPambqo+AbnFCVRTA51Vbqr7d3/n1Lw/ZTMcxGiVh8d77wWjml1VMsZtL?=
 =?us-ascii?Q?N6Ynlrah2oxQM+IrUyz/K9iV4lNSTNL2/6rV14MtNYUb5Vp3U0X4jHkVTHeN?=
 =?us-ascii?Q?kRMw9hWQRvDpdEuLsFAthkRSZIslGmWf6vz5jS0iGm10m6g6biKsjbRGfVb/?=
 =?us-ascii?Q?Pq4L/uzjyjHqSHRjqg1+v3d+uZjd4YvHbADFW82A7cvW1RANGOoEM3uPSLDx?=
 =?us-ascii?Q?dATLFxMfQ3/a6nMHBy2Ry+GIGydhAZMOHn2gVKpn354PPfMOiSARtuZbom6P?=
 =?us-ascii?Q?js/8C/De1ZA2DT1hnqK5yPc6WVIMPO28+JuguUlZBk8oXnlLi67jWxoW2U3y?=
 =?us-ascii?Q?idDo6hdk2LtCEW3HkzVZDa3UhWEgpMGG0iiWBEqcJlOwBAJDO6Xb5dxTHbig?=
 =?us-ascii?Q?1IwNf89JZV8Z7zh3ONsQrIGgvZcnkqaFviUQ6vgbSv6fcQD+S+A25J4c6+I2?=
 =?us-ascii?Q?lIbZYjKg5i20ZS425Hyj47J9B+1DNok/To/jIj6FG1L30mdz43TvnWryl9H+?=
 =?us-ascii?Q?MbXeOsfDCw7lQtZDzxmLbToEoYX0VNld7gmJzg30YijDZ/E/OatpdQv4rLZn?=
 =?us-ascii?Q?E3YJ3cK/dqvnrkbgbkOlZpVKb8tMKaGb/hDeaUPKoIIGyBgHm2T50creUYdd?=
 =?us-ascii?Q?QMZjC32JSsgxxSIhoJp43S/DTS7xf0E7GdPj5g/A7GEE6uLlJkZ8Ny67lmPl?=
 =?us-ascii?Q?jLWb6viXkpw2z2Nz4ULh0iGQd+7uao6RuI2XsTJDej/2VKsiFDddMyl+YqXe?=
 =?us-ascii?Q?Piv7YRIs0zjejojGikEKtZ67Y+qasYUAov48k6yG7IuDxy5XfFWOMzK/Ea2G?=
 =?us-ascii?Q?YUDO6Cus3kFlAbw6dtKgra/pu826eO742AKD91y5np6y40cxO5taHx/+upQE?=
 =?us-ascii?Q?3qEUBx1SnPX2cwKpBcylM74+fbofdEOixlRSixtGnSPu3v4o7WTvX0wXmx7c?=
 =?us-ascii?Q?kkO9N/7s/BfRhfdn1Ru+guRzBFklrhzlyumlwA/c4W9UzA/RiOIjGmYy6zNa?=
 =?us-ascii?Q?iNAj0e+3x9ER+blQG0Mu0K9ny5M6ByPHk6FNvz9fC3AAYlIT40vxmf2QnQ/l?=
 =?us-ascii?Q?Cr3F1ZbYM1iMOLp88nK5UNi79/PVkADvU4t9Wy5VJu4Q9nhJGEG8PS+kgKS5?=
 =?us-ascii?Q?3We3T8DUD2b6vkdYtVWcuR+25h3DZ6gaqfkBnLHMbrZ1mUtAh5ZV7mDyvL0D?=
 =?us-ascii?Q?+cKXPnn9+0UgrPI+XNI8dOlUBNKxd9aXS4gAzcd6Bl1tKbpeEaykIIkalKTw?=
 =?us-ascii?Q?nmLo5DdHMIhUKhO3UifAC3g1utqN2hArXrEb1kpGWt5Mz28T4H7NcQhzJ8OV?=
 =?us-ascii?Q?IGBoS9vpQ0B079vn6l50N761kyjPX39nbUZCwZhMWqj9bSuW0UHqK5T1/p8o?=
 =?us-ascii?Q?IFxluJOq2d3CBK20CRteLITW6GQWsDmLSVEGA6Q5JkevjLfs9sdoUearzpMd?=
 =?us-ascii?Q?yeUGYuzrfiuznnVMsHJ3MinUjz5dG+Dzj4XtT7ey+u53l2a1izeW6lTf46xb?=
 =?us-ascii?Q?0Cr0HcTFfCgZze/czmGo+NI9sUTIjESykqz2zz1LpP+x1AJTO4vk?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 493833fe-535c-4df2-5b56-08df4663795a
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:35:16.2438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zabBsbh8/26nFzhL5/UtJf5Qg7yaAyJS4hJp3icede3DtAamSKXAzgdva3aEvhxao13dZHNAznbO/RHNnZ/IQT65iw4G/zSyYIg2Xx66hM0xP3fl5ZkYK8oDTL/MbArA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10422

Replace SET_RUNTIME_PM_OPS() with RUNTIME_PM_OPS() and use pm_ptr()
for the power management operations. This brings the driver in line
with current kernel power management APIs and prepares for future
deprecations.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - No changes.

 drivers/media/i2c/ov5645.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 47da5cefb7f9..6a6ebcb8f4f1 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1233,14 +1233,14 @@ static const struct of_device_id ov5645_of_match[] = {
 MODULE_DEVICE_TABLE(of, ov5645_of_match);
 
 static const struct dev_pm_ops ov5645_pm_ops = {
-	SET_RUNTIME_PM_OPS(ov5645_set_power_off, ov5645_set_power_on, NULL)
+	RUNTIME_PM_OPS(ov5645_set_power_off, ov5645_set_power_on, NULL)
 };
 
 static struct i2c_driver ov5645_i2c_driver = {
 	.driver = {
 		.of_match_table = ov5645_of_match,
 		.name  = "ov5645",
-		.pm = &ov5645_pm_ops,
+		.pm = pm_ptr(&ov5645_pm_ops),
 	},
 	.probe = ov5645_probe,
 	.remove = ov5645_remove,
-- 
2.54.0

