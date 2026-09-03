Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397022F8EB0;
	Thu,  3 Sep 2026 01:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398054; cv=fail; b=IxIR8hvEcQ88OuYtdArqSqZqk6tI+Yy17J1PDGh6aG/qwc11BMg47EA5AF1nVVK1d3zg8U1hX91mm9fPgXdvibHWQEZBneQHP/u+7CIUi3G5QtT6YgaBnSKDMXz1SXsemt2rjaVUzbFVDMXFsUalcwCY/gofA2zjcXUsIRI9o2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398054; c=relaxed/simple;
	bh=sqRy3GT23rcIo5Mb7x+zFlmi37mO5E906CoJ0ItqsTo=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YAou1WtQ0i18YoM8wVqPxU2ddMnP59KWALYoNrgMH5wbuecpQ6LI9upEg1+p972PfRQNn/H/a7O0/HPB69SS8xk9ppeL2sDgwJP7atQhQABQe7Vwm1D9mJpvcOFRDUjJe4nLXammXCZ7PqmVWimBRiVVFRbfUAoM0xyoXACcZTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BgkCb2FQ; arc=fail smtp.client-ip=52.101.125.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BgkCb2FQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0ApdXU/VJ8QbKufSMXCsi+Uz4PyAKBUzfJLCh7cwSRI5B0o/nNdE1PZjQ2ReGI/yBYWvy8fs6C8Ckh7Mdg2MSxk8jzTKfowJJR1uwKI9YGGJop3/8B4WLIOK0Y7UgLzzGOX46JA3uCeiK2hKw9RkzxYtoZeMRsLknQ5gVeLa9BuJj6UyN32XqNa2QP3o7seD1m3bi4f7PU50/zFIRIsoouQDfxc0tk+vT8pTin+choRR5Ukez2PWMdg+UaVsAfa8JXU+Tdd8mjQusCfHGAyV/EgtQwPZL1yXM274iUAMHZQacK2xgGrqhBQWCg315moM+ESHhYrYU5tqw/43xv9kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARl+LllUdu3I18NwhKCCACfCXLc5/26azuAK37bVLS8=;
 b=spU/hDS6w0k80N9k9DtkkH5COAAqSsjeMu9BJkk4ZI6PQrdgrgzzCAtrymoiIoX366nbDuuCzEZXC0BSOEsy8eYnhHJek6lBdorZUhts9abyXLmNVLjSgrrGOHBm0wLZS6pQW/A14azNzGI7J2WWo6ixFhGs7B/W3WgLvtfs3Hno7LOTlc2waXLWtfZEZ5m8DWaWMVJWrsC891GjoJlm/PrK3wNqtY6fubAhDN0I/NIXg3EGX9D5qDpoxzjJ2R27850BokrpA/wUCjwERkRwfrx1E5v/YS9YF1UmVdW3wbEVgcihdenUKmSZbIVXpXzJ+kpZkjNdbglWPZzEb+8Vgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARl+LllUdu3I18NwhKCCACfCXLc5/26azuAK37bVLS8=;
 b=BgkCb2FQQK2icjJjpWFY1gAKKTY/NFdOcWsjuN8NjSy5Jl4lMdSjT99PKu+WmhlssdFvrufcCQtPi8JHh41LCrCi5DCspEViFAijiv21afs8I++oFSnB0oLds7ESNQDrSsrsP8x20K+m+f6kPm508nQAAZ8JE3SnBSpWVDf8n3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY4PR01MB17164.jpnprd01.prod.outlook.com
 (2603:1096:405:367::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:14:10 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:14:10 +0000
Message-ID: <87jyp3yw4d.wl-kuninori.morimoto.gx@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Jaroslav Kysela <perex@perex.cz>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/21] ASoC: renesas: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:14:10 +0000
X-ClientProxiedBy: TYCP286CA0060.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::15) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY4PR01MB17164:EE_
X-MS-Office365-Filtering-Correlation-Id: cec84280-dad5-406d-9c23-08df0958a8e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|6133799003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	yJ2yQpSO0jIRPC/Um53SNCs3kGQAAfsuZPACSq2hUaIoNhvgz+DKVnuhHQ/OQCZg4Cd+ulM72fh04fKGZi6Hcn7496hCFhPPvEbMbEOUNu3+4hII1D8L8u2sIilnIIVINTDWpQnBIHmYRS3AMB581Qrl4WJRSRu2YPO4dG8BNtIh6KawIFWsL9Io5dKHY4ePGJtG0nJV9oPwwR9v0I0+kMBlpU+Lis7HhaXj43x7NO4xO06KIeAEn3zgubLnXRqilK9Z0nMZ+Y1JBjU9FlroklLubqdJdbRTagtppmhH8AUoJ47Pf4lCLJeJnb+5+JQOJgNeh3DBpWsiEDVJIejB8z+vmo/OT8jf5CV7LcWas1qmTYNfh1Q5L9ocbI9i2Ci4qi5FRUmSkWo2mR7p/QznYEewjmoQO1bUWVjWs7DsG+FV7/9Kwfgr4y1OG+FR4MTyucRsv6TLKwoBO9Y69eVPujq1vztURMw/EPh4VxEbwWnUiOJIc4h+G/ZCydYVqgvu6NcZ7a8sXHhc5lKm2G4AkfaxRazwvhmj6pXk9VFALwH1jVRCMvSi0zVWALBKqIghuLMHEO1YIAc3KJA7e3hjc05j8ypuoecZGiX89aAwc9euyJ7J044AOTwxaEPr+IxhLviHL1mExozlXtMqZcFq9WBM5i+maP4+l35GogODo+5BQDma5W/WXhDpznKHzkr5PigThJD002xWlMysUX0T8MqyRD3iD53RTekr44v5DNE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xsDJl1ulDyKHeNBwBiCnpihtKKDvBAbMwZzjtlXjTjAopiJ1vj+L8cSTW4fU?=
 =?us-ascii?Q?jLmNlk/KR7w3d8lEBF/GyEBcn95VD6B64aTFYKYo4gj5vnHCaTCbws0XzA1U?=
 =?us-ascii?Q?TSxoYLJgOl8mTXQ8V4u/hHmbvwnMEkg469n1I7mb8kySmpmtSCn0JURTwIYi?=
 =?us-ascii?Q?+dWnlLwWYZfavVs1hoN5/Xg7dlIHvCPuzw1/fZvk4phu/LSSvwOTRHRjIv7y?=
 =?us-ascii?Q?7VcSY/2KgElIXlZpSXUB5dwJsOqkfRAC+VQ5u+VOiSzx3xQdPkINIcwSwtF7?=
 =?us-ascii?Q?us0/q7+QG/fXfDfUygl926InSmhX3qNxG7ZQWxRyglxtJo1Y0StlWmF8QQMC?=
 =?us-ascii?Q?2GX4YhKQrKJlYJh9q+LfY10IGOniR4jryEita5DiWauDzjpIAkqbyV/chPTk?=
 =?us-ascii?Q?R52jvOrENMu2Tj8x7Z8VJtMxeG996NaE3QSSJqelITGdFX8qsuGcIUXUx4rc?=
 =?us-ascii?Q?rJTobR2RBsKKzSj5jFxVZztCdaoFdX9pf2iwJT8FDc35PNHZFcg8k1/3L+jA?=
 =?us-ascii?Q?Ru8IRiqov4FdaNXhkAqf0Bfp2fxqIspByobWO+JbAacjuZ9mpkuqyi7SS1y0?=
 =?us-ascii?Q?dummxwL1U+h5uCEFrENV8iPYsRihzbUuAFSB17iK3IGLdcfdHio37HSnlGBr?=
 =?us-ascii?Q?cqoZk8nsaNFNsi5OD4FNLSWdq63gT7CVBmmi7fDjQO4l0JJnArKjn08WVMe9?=
 =?us-ascii?Q?haCXEgtFWbLMyO//lWO3cG5mkh2V8+B5qzT2NmdNxTjYSF7gyr6SqAYsthZ8?=
 =?us-ascii?Q?HNeT2/Mae7k55E5wIOlGBKIQC4RaHJztJOGpRefgUTZh5H+D0cU3nbWtpJ/c?=
 =?us-ascii?Q?hW5suRQLWhKFss6dOsKOQZDHwTBlDoeqwLWJvw7nF26OU0H1HS7RclV7Nkra?=
 =?us-ascii?Q?c20jLa4TciBCZBs+7B9V4mtrtXq2hpch9RFuAtFqygzrHuLH5IjOKMeKAtpt?=
 =?us-ascii?Q?IpIreomivJ6bO3k7KUUjs3GNkvOdHMc4IgJ61M3yf2NLfbhhZsDZBaqlJSi7?=
 =?us-ascii?Q?R2yWwCgXPhHHq91wV4CMPjWUoVNqCTiJflGfhqmNMeRYu2OCBlJUhiYhZj0O?=
 =?us-ascii?Q?4MU9HME4w11oLpKaLPQI/J3SOf3wJXQuGwFtMMWtCmwWqyD1QcPSC5i6dA0D?=
 =?us-ascii?Q?FBJ8lHZw4g8Xhg6OgtErrgkELBTrR/6bMiT6EhHQ/VvDV9Bn6h6X512yUbSZ?=
 =?us-ascii?Q?ypig5NJVQksW7duSeSWLgqRb7NzwEOzScfWatROjEyYYk9QGjXcg6PdhKSjh?=
 =?us-ascii?Q?Hsc55aV45GoKxxs8q7eYhycdBJhByb1kKQGsClNQ/2SoVVlubm6FSdm1M7QI?=
 =?us-ascii?Q?5lNoukARKg7Kn710BVSAPX+zpSZQbRrqL5A4zQiR7daNPOJ1h7Z7rQ5dK/oG?=
 =?us-ascii?Q?9cWruTDhB0JZ3FCeQuXfDx2WYtcmCACZ9p5VhHCt5SP/0UwaQEOJoLsH/dvP?=
 =?us-ascii?Q?t2Fjw1KKm3rpYHyg4RPZljrGYc0lz+cnrNQe+eorSpnRk2d4vwFWn3F+yz0V?=
 =?us-ascii?Q?Vrix7v524IzZ5/hurzuzZHamlbxlBNOjnbep84EjpOt6vJcKptwVaVJjW9sL?=
 =?us-ascii?Q?H4R6O6pXur/bLXKPvrKnQQuoaW2NQL4fCex5nf7Y5e7VjYaIvd86kZSovIV4?=
 =?us-ascii?Q?s5XcejjNmKsZvGj6PJX6hAxuBSHRHapvaOb0Iv6FerNotGj4BG01dgZeqxZF?=
 =?us-ascii?Q?hWm76rW9bBecUee5zgdoChUd936MbKnXNfF/1ZVO0o1QiLiYswY47oWUN0Xs?=
 =?us-ascii?Q?4y3VkKttX9CmdgqiIwYYEc/vPKM54c/KCSJdzJgntj7EP5at157O?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec84280-dad5-406d-9c23-08df0958a8e2
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:14:10.6406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8PEXAyQw93PjuHFE1VQ/UapZ8yztCOUxrLNTfmVbYlDz8tXxKBB28jZNTujtURSsg9nz3f0UQ+KCJXRHlAlE6rcZu2T3PYPXRDPh0J1FRIKkYSlfdvxjrBk90Jy6szOa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17164

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rz-ssi.c  |  9 +++++++++
 sound/soc/renesas/siu_dai.c |  6 ++++++
 sound/soc/renesas/ssi.c     | 13 +++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 9fe8a639c47c1..b1587f499cb89 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -900,6 +900,13 @@ static int rz_ssi_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 rz_ssi_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rz_ssi_dai_ops = {
 	.probe		= rz_ssi_dai_probe,
 	.startup	= rz_ssi_startup,
@@ -907,6 +914,8 @@ static const struct snd_soc_dai_ops rz_ssi_dai_ops = {
 	.trigger	= rz_ssi_dai_trigger,
 	.set_fmt	= rz_ssi_dai_set_fmt,
 	.hw_params	= rz_ssi_dai_hw_params,
+	.auto_selectable_formats	= &rz_ssi_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
diff --git a/sound/soc/renesas/siu_dai.c b/sound/soc/renesas/siu_dai.c
index 85dee90257105..fff6ef870f0db 100644
--- a/sound/soc/renesas/siu_dai.c
+++ b/sound/soc/renesas/siu_dai.c
@@ -688,12 +688,18 @@ static int siu_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return ret;
 }
 
+static const u64 siu_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops siu_dai_ops = {
 	.startup	= siu_dai_startup,
 	.shutdown	= siu_dai_shutdown,
 	.prepare	= siu_dai_prepare,
 	.set_sysclk	= siu_dai_set_sysclk,
 	.set_fmt	= siu_dai_set_fmt,
+	.auto_selectable_formats	= &siu_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver siu_i2s_dai = {
diff --git a/sound/soc/renesas/ssi.c b/sound/soc/renesas/ssi.c
index 96cf523c22734..f00067bafe8d2 100644
--- a/sound/soc/renesas/ssi.c
+++ b/sound/soc/renesas/ssi.c
@@ -329,6 +329,17 @@ static int ssi_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_U24_3LE |	\
 	 SNDRV_PCM_FMTBIT_S32_LE  | SNDRV_PCM_FMTBIT_U32_LE)
 
+static const u64 ssi_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssi_dai_ops = {
 	.startup	= ssi_startup,
 	.shutdown	= ssi_shutdown,
@@ -337,6 +348,8 @@ static const struct snd_soc_dai_ops ssi_dai_ops = {
 	.set_sysclk	= ssi_set_sysclk,
 	.set_clkdiv	= ssi_set_clkdiv,
 	.set_fmt	= ssi_set_fmt,
+	.auto_selectable_formats	= &ssi_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver sh4_ssi_dai[] = {
-- 
2.53.0

