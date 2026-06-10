Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011014.outbound.protection.outlook.com [40.107.74.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1B232720C;
	Wed, 10 Jun 2026 16:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781110095; cv=fail; b=Sux/czuvw/Tssk/QEFsCtVgdUhAy46KOe/tPG3XM2fCWh/d8Ag94pW+KbRQ7Zubi1QWsdmcVmz4B54iefblDV9stx7zo8LlwenBnrNEesc/LoiuFn6Ig4likS11o1Gcftf9hmc5PvZ8vEU1mJAnGfhKMgT7U0y/W/1NmnQAFKIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781110095; c=relaxed/simple;
	bh=xxG/Q+YV0kX4WPNWP0I70BHm0S0yYd3MbQ6+CM2oJJo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GfiuE1SNi6i+CjKrTdQW3e0PVUceHDQtgN/hPh0QUyYbZnmo/YvNlzqFMK3psUPDB7FCbBUOiGs5I6uexHBgeiZ7Dk8/noi5VCSfzBbQVcdSlX+XBnR6CifX9ILI7PBDJ2ArgVC1TfIZULqYHOZxmq5rfrF+s+m1G4DQ3Q8Ry+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=B7yZIPFM; arc=fail smtp.client-ip=40.107.74.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="B7yZIPFM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeeOCTHpxdtRQ2RoeYD5YuflYW2tFxQK74az+mP4At0UxrGdVZ+M102VXkdBMIx/MD0uPlE0oWG/gWTyPiKOBGRfQL8Hqx7dZXyo88X7uSvysX8tu3QmIXGAUhMHpO40Waaha+knZtFxZZDyFTeXvAHtJa1mLClk+tA2ISYhF26pPI3M3aXwmwcljswlbq4rf2z1mlsVDuEFiwoMr+mfqhBC0+WilMN2tycKwaH9CBPtLxFs3z5Qpg7FmgjuPIGnnFXio/bcrYQBgFPLvk8nRDOtJqnnJICLn6sSBOfXGCf0uTTF5HJHul8Z7J6bliFkD5UQjfFkKuuYqVsfUYbyaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLMqUq04ZFc9fgJaDFYLcPnJlL5z0od0C5uL5I4Nlxs=;
 b=OFDHxfGh5UpXkWSIEodNZaRdDPwpRDVcuN7J2ujdt8BTaeLyT424Ub92axcAgdD+fyUBDQMfszDj7je+QK7gR/AiMbVd8tfxO20ppkfRFtocdzW/O90WzLd29tvK0IH/c+QgguSNZTk7lJ0rhnVAos3ofEQbZUXVY3Lep4EjsRg3Qb/SaPV638YBakdDd8KEeD5YAQo+HjjVVL0Ke2VZf1EigPWtcuc/6EkeK+hTCzMI9W08LAUoAuG/Qda+sRfOJr08RsC9mFgtkeUoswKE9h9MByrcTo0OizHBqQTH90B4eZVuo/Y+sj3mnIuXxqNOcLiy798O1cFhVNsI3cvHsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLMqUq04ZFc9fgJaDFYLcPnJlL5z0od0C5uL5I4Nlxs=;
 b=B7yZIPFMttPphBchmfnKl11F5HvSIjyN9R8RLD7+dseKz73VCbehXx5KO3rOE0HXvbWdu/9apOvQTrfB3PGuUSaefuue7/LJKz7uWC8l7fEoi/Xx5u3iRXVS6DR4MfYdjMHq0/q4sPWvaGIxOOgRoRJC/uFpEe0yfAlX7QwS5oU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSZPR01MB8059.jpnprd01.prod.outlook.com (2603:1096:604:166::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.15; Wed, 10 Jun
 2026 16:48:10 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 16:48:10 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: john.madieu.xa@bp.renesas.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	john.madieu@gmail.com,
	biju.das.jz@bp.renesas.com
Subject: [PATCH] ASoC: rsnd: adg: make rsnd_adg_clk_control() idempotent
Date: Wed, 10 Jun 2026 16:47:04 +0000
Message-Id: <20260610164704.2211321-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P192CA0004.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::9) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OSZPR01MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: abcb83fe-9064-4e35-2a7c-08dec7100daa
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|52116014|1800799024|7416014|376014|38350700014|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	6cmwBedeHAM3pXyhiZvpomj5zJiJI/WC3zoTHwWzBB+pIQI0Got6fMvdd4LRVfj/yOWmk8aQ93F4/H+4IAZnroJeXGXmyCp4yYtAIMqquLxVNI/Wt62Vn7Xnlh54IT1aN2snUlu5zQoJ+4ofSWhEW2u3FjJfwhTg6q6pOmIzYgZ3OYb/KnayRuXcZar8haNvBt7iDNiwnawiYTWVhQz3HqCeohtRjgSCHc6MUdCIOy1k0140E7IUapUJMMBlPHXHhnadl8md0IQuqsrtDxq9nVOhKLnsI8m790/v+KK6Sk2726wvpFuUeTGbMJwbT45gyxAyBfUvgRTNzTHEE7we3lLJRh73XiW1+Oa4JWTnx3OKySeWFHgLnQFlubKRIEqlVI4sxFiqXae1lhPrJILVVOsQGVWziH/1MB83+cUXs2s+uofkIChkAJuMRtvzjYBOVLtRuVXglIaFxrY6+I1bokQNlkKLAP/AAgvmZWjYcZtPfkA6b56+3QHUkNUi7Gsxmqn8XKAKbCV9nMIiPryaLIwCQqTaV/vlzP8xfzIlknj37NvPyTLFp1SRZoO8hbws+8UraX9ml6rg/aijleCUj/bbw4qC4DuhTMi4evGKEYwp1U+wnT1ovZpNK1KVkXuigXsnG7NYdoc+oFn4CJVZD7U68hT+CE+RhLou6fucETBN14I1dHI9KqwLg/smHxJh2cNIJg2F1AY1o5nVzXmPdfIiZ9vGXWmkfUSAmJdAl/875KW+NzrBqMPD7l1+mSrB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LEm0uiy547nFePeYlNKzqZJnnshNrcRXho63IBFBSrSPhyl8RH6dbmZWIGIl?=
 =?us-ascii?Q?+mb2UFrpOylxhv0qdwymBzQRKj2AHO7hzlXRC3QZ4A9e/khWfWqyTx3l4Mtu?=
 =?us-ascii?Q?al8NvqL3Xoqr1+t2r1dzjGp440IP69semlLdL/7LxNYfJAqjJAOP09YxGyFn?=
 =?us-ascii?Q?4lnNnMNIRRdml6D1sDnS4m+m8ECBUI9idLaAGj8uoloCFxTC5zCsZJsfEaBH?=
 =?us-ascii?Q?olmljMnPkYXvvRxqb7xn7Lt1enrjiZ/BPSaGE7ap4WQKcw0X6EjDIav9N3cr?=
 =?us-ascii?Q?+C3HLYw8Eq7ANElgta3qkYDt6PY0g5miqhR1WFjP6uSjwf1ei70ATCUkIZPo?=
 =?us-ascii?Q?tzz1LCSBo5LACpAW0OQdPLOyK6cW6fHsvNc8Cp0oO5T4EhHiLLzkabcMPfMC?=
 =?us-ascii?Q?ITzP1JUwm7KwjmjOYrkJlNMN+V1UobuSvJh2Wv3moRlbHtfgL9mDrhm9xUcV?=
 =?us-ascii?Q?clQDoCZyzPUxKOKnyP7FY18lIg5svPlZyj8O8s4OH1sdmdKd1q3GwmD/XMjA?=
 =?us-ascii?Q?iqC6dNkr/qX9BD/aQZbaMW2XFrnKJ7A0UqSt0Ke9Y1en4buDKrR6lYSgQUED?=
 =?us-ascii?Q?MNCAeSqhYxTMJoODq1+TdF/hdsBdi8MQDwC4E2M7FlJwnSUbL13MhoVffM5M?=
 =?us-ascii?Q?kqKfL9tLjFlrkJklJzv4umRVTIcWZn6EW8yCA7ChCa4gU5VUqLud6xP419Bl?=
 =?us-ascii?Q?GybXmxQjjcw9C/edeLcjjgDlWcdttwUPLyWuTDhZJ2HtYfCspT/XHSOnuu3n?=
 =?us-ascii?Q?SKKMIE3TK+oD4Y6DpDwpoelPrQ7CBOetrRNNz0LzCV5YhM6Wr+S2z6JD6UZI?=
 =?us-ascii?Q?35b9xacHE9ApDIQqdlNyPDDNLmkHto2wpyWyr5cbP6E28ob0r4r85Z7bUyPQ?=
 =?us-ascii?Q?vJ3fIOLB5VYvi2/riDfvi98f73v72Fevt5/usXkiRk4TBURHZG6k9doFLN5K?=
 =?us-ascii?Q?Z9zLirf3Zfs/FrZP4sWGml+gPpVQfzyKzF2F1VVeSvVu5vJpXZYDpqjMSHvQ?=
 =?us-ascii?Q?Go5KgT2DF02nppp/AXzkSyLTxwBKxJtyzf5eED1NcPK9RcTl4WUpNJMuNUeU?=
 =?us-ascii?Q?AaH3uClkwWkQXfLT70tG8SqJmk5hWRtNdsnMe88eF6MZ4v+ZPO4MLmSxyEAf?=
 =?us-ascii?Q?eoqdt6GKul1e0iXlwe/BNI3l1S+nj+7pKq7c6ab0jP0gKM0Cxpl66RKj2c67?=
 =?us-ascii?Q?m59l2+iyO6WjAB8r0XNu+xZKfFN7zbcw3gGKF0MXYq58/0Gig8obmx9/6O13?=
 =?us-ascii?Q?P47QRfsQ6/hUasmY1Ea/5bucKrLDWA3UarP6Fzu/gwz6vX4T9mb8BsfPItr2?=
 =?us-ascii?Q?x5YbaCjwhsTjT1PQX/iKYvw1WKOKIy8ss0wxppIW06osQlpsbZPhyzDkNTs/?=
 =?us-ascii?Q?yF81abS2tgJbedVIhjpeMAn5/UBqpOg0suvbhMD4y3PQ3hzPzvjGCvbgLxWr?=
 =?us-ascii?Q?Vzqf84+tBVddGRFIxPhvhBwqRH/BqWxLBzpLU3+jGJl66D0sOaR+/r3J3dpN?=
 =?us-ascii?Q?le0rw17OlJa20I05hDE4WTXUdm5tuf4FqfRpck1ibZ2aGjGzcwLhrcAJwIM8?=
 =?us-ascii?Q?6nqsYvteAiJA+a9AHVMOqT3O1E3MPkLbnQTcIOnlLC2+nO7SUMrpek9Pl4lY?=
 =?us-ascii?Q?02owIeXZjmr0MpnBsRg3j+oVXXjl7e2c1JslOTT2wu62ez4m0g9T/gmhm7Sy?=
 =?us-ascii?Q?Hcq3VUPi7PUCeaRDYHZuTR+ECmOxuU2OXr45CAomacUCe+BB6ojWwR5ISw79?=
 =?us-ascii?Q?FD2mRZSg4FG5vTod0RCcnXE2qEUNiDY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abcb83fe-9064-4e35-2a7c-08dec7100daa
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 16:48:10.0172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHz0zCHAV5JFHEqeGAKpD9M/j6CrIFDaNt542zV3BPAk6ZZi7iP5+/lhglJ09zzCHO8NYnxmIS6d+1VjDlx/P2B5ElkhzJd8ExiOoAqmphk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8059

rsnd_adg_clk_control() is asymmetric on the disable path: the clkin
clocks are guarded by clkin_rate[], but the "adg" clock is disabled
unconditionally. If an enable attempt fails (for example a clkin
failing to turn on during resume), the error path correctly rolls
everything back, but rsnd_resume() ignores the return value, so the
following system suspend calls rsnd_adg_clk_disable() again and
underflows the "adg" clock enable count:

  adg_0_clks1 already disabled
  WARNING: drivers/clk/clk.c:1188 clk_core_disable+0xa4/0xac
  Call trace:
   clk_core_disable+0xa4/0xac (P)
   clk_disable+0x30/0x4c
   rsnd_adg_clk_control+0x9c/0x2cc
   rsnd_suspend+0x20/0x74
   device_suspend+0x140/0x3ec
   dpm_suspend+0x168/0x270

Track the enable state explicitly and bail out of redundant
enable/disable calls, mirroring what is already done for the per-SSI
clock prepare state. A failed enable leaves the state as disabled, so
the next suspend becomes a no-op and the next resume retries cleanly.

Fixes: 47899d53f86f ("ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management")
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 sound/soc/renesas/rcar/adg.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 5479cefb6dbe..53efd1be5139 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -45,6 +45,7 @@ struct rsnd_adg {
 	struct rsnd_mod mod;
 	int clkin_rate[CLKINMAX];
 	bool ssi_clk_prepared;
+	bool clk_enabled;
 	int clkin_size;
 	int clkout_size;
 	u32 ckr;
@@ -463,6 +464,22 @@ int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
 	struct clk *clk;
 	int ret = 0, i;
 
+	/*
+	 * rsnd_adg_clk_enable() and rsnd_adg_clk_disable() can be called
+	 * redundantly, for example when system suspend follows a resume
+	 * whose enable failed. Make this function idempotent so that the
+	 * "adg" clock, which has no clkin_rate[] style guard, is never
+	 * disabled twice.
+	 */
+	if (enable) {
+		if (adg->clk_enabled)
+			return 0;
+	} else {
+		if (!adg->clk_enabled)
+			return 0;
+		adg->clk_enabled = false;
+	}
+
 	if (enable) {
 		ret = clk_prepare_enable(adg->adg);
 		if (ret < 0)
@@ -520,12 +537,22 @@ int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
 	 * rsnd_adg_clk_enable() might return error (_disable() will not).
 	 * We need to rollback in such case
 	 */
-	if (ret < 0)
+	if (ret < 0) {
+		/*
+		 * Mark as enabled so that the rollback below is not
+		 * short-circuited by the idempotency guard. It clears
+		 * the flag again on its way through.
+		 */
+		adg->clk_enabled = true;
 		rsnd_adg_clk_disable(priv);
+		return ret;
+	}
 
 	/* disable adg */
 	if (!enable)
 		clk_disable_unprepare(adg->adg);
+	else
+		adg->clk_enabled = true;
 
 	return ret;
 }
-- 
2.25.1

