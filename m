Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013009.outbound.protection.outlook.com [52.101.72.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B78C3B634E;
	Wed, 15 Jul 2026 16:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134139; cv=fail; b=B8iniuqdPfKSztjHfBTdnu8dH+s3MVlQJPRLj0a85WeTWWFmoHxl3J8aoYEz3AiLHSLEsLT6OgK45G/fYOTXF2v+eRjIampcluJERnFu/STIMhPF0bSCrHSck9ZfBYVZCrrxOpqMV0ObHvhZZP9BE899a+wq44vGjQ0es879F/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134139; c=relaxed/simple;
	bh=5flc/Lr4IFjB2sREGj86ilPHqgB5azC8tDZT2ObdvvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tr37m/h+EsPO13eCtZKkaWdgtMWQFf4m25011ul0bxyhPG7fGlZsSsZ2popVn50vE89UXyg3dt012hDHfuWeY+FaF8MG8QFeRY7/heZEgbIZUAfqBSahG5XzOW0QjuSiFdGQMAF3K82KadaQP9IvrAlEEvUEscSM34SKMHLceVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cTSwxSTp; arc=fail smtp.client-ip=52.101.72.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cTSwxSTp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vD5rgtsasFETruBpRGT6pQzA5rxX48TCP1c35yHZMffEtGNcqs2eBbaUfm/dP0EX2QpkfK9MvZ8c6Y3I/Vuy50kTActDks2iFssAvlLDTDf36TIqq0udfyB6kGAk/2PjhmUYgbpXOAHR+iMSm8ZtpFSuN0ta1f4fkeKAKX8ajtvE9XJH6EoIVKxYz+6lXCYYKbapmmNVklu+4OAJUrwu0y0cVHMuwUQ4hEc3s5WAkA8rkek59fahpNmnXNgC5/QLlX4xcUS+4VrnkI9JAXk/ZDraReELCTp2u+xNtOdvQTy5hQoiAGBmxCJa1zGF09Ohtm1IprF/A0Q7kvi38gFXvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgkflE/hXjOeqtMwl3gtmzWsRxWZXU5voZpMXE1RgIk=;
 b=UzKHzB8cWGMQSC2Zh5EuIKXAZgsbmGkwFukugob5ILRRAqAYm+9IzSLFdqjW/RYK5bMgJ813EGOpMosCd4B+JHH2YKrXzE5P9HhS/d0uTLW3DSP9/8BjrQ7A53cvn6NYTan8RweK4/9ini9YkdInT2IX2SN1S7pYLj3l1zeerXwZhxIMiH090lvA5Z2FWBEhMsPTHb8dsAvPMjsN/qnBvjRDWc1nSg8O26T6FJ/5oRKehKMA9LFy9sD2UKVwYPwfS1do0/3AzxG1p7F7cwvMQwZQ8eZOhG0fIn/QpQI6NyUTbmDSTAJAJwxAQYXf2i7JpPluLq0nKONjakX/bXfBuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgkflE/hXjOeqtMwl3gtmzWsRxWZXU5voZpMXE1RgIk=;
 b=cTSwxSTpR84DwAZgv+GgUXYeCiFpY6/NsSDFJyY6K7OpBcswUzbC1U8MFm1Vk70dVprAAAvUvSi/hjguNwKa+aUvBJHw3VLl9y+zQgoMoVnyJQiHeRnGDPUmWbDbZYYfGiB2Y5U/uhoSM+aZ8WDFpYBkgwASvuO2dzSjTyqVVCNnuBqhhhQRdNwCQusMa1VjZ6fnzUiK7C+6snL+LjpEtRofyVPXfmcomqI/UBp0oszxtDuHBzsrc/XEbS5QS5AIMbVyFq4q3/bBl12CcopaeMc1W5E33sGROLTDWFp5Vf0IsbFbScHHw/pSitHgK5yFXVYeaQ3UJDZkYgRIjPPQJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10322.eurprd04.prod.outlook.com (2603:10a6:102:446::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 16:48:55 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 16:48:55 +0000
Date: Wed, 15 Jul 2026 12:48:48 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	p.zabel@pengutronix.de, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 10/17] i3c: renesas: Return immediately if there is no
 transfer
Message-ID: <ale58FTuW7NWoI3I@lizhi-Precision-Tower-5810>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
 <20260713130545.568657-11-claudiu.beznea+renesas@tuxon.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713130545.568657-11-claudiu.beznea+renesas@tuxon.dev>
X-ClientProxiedBy: SA0PR12CA0018.namprd12.prod.outlook.com
 (2603:10b6:806:6f::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10322:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f587457-c836-4a45-3892-08dee290f524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|19092799006|18002099003|22082099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	w18KUSZqD8l8+ZOLRWIr1p1HTq36QpO1YPodK1GgmuUUdBpdKgfoajoWjepmnGzSqH+qsMFpDJXInyTPqBjtKZr4prfTbfMvYD/oUcdqibDNp3BNvAnEsa1Rqnx6T4HF9HNyWywAfdTgo6C3I+orxxSI+lcTfkR79hMSmAUs9LGz0fSoVu92Pv+jHeUkveb0PvXUeD37J5p+oj7vS37lr6HBEDXv55dIQtYGT+MOMUN5xRlCzT1Ps1x8/F3N/uW9ZBpIU3ohNgv7iG5NvMRbIMUn5fSOQmAwQZdi0UxcVWj1KIpDYYJRFIbMNZAbgIbWWx10LK5Klf0R+6NirfoFzAT8oaxkacjWDGIwGBohHkHh3AnxahtKjG4NUNgIItAdzusBmnZQrC7GXEs3mcUUhB3znuTxdqKCMqc72vDWhjPa+rF7QRRlxsbaYBk46VjcU8vl7lIhm//GaQMDWWZ5yGDNwKk+Ka2iCmLNzgLRqmOi0NOETgcZ2N70OUlm++lmZtTUI8Bbw2E6sgLu0htiDfAaPb3l+8SDp9KhiOMkYW8h8D0fUm+MlCVwhQ4RpVa+bp4VK/zYWc7PR1CSylFDq8mdjOz9ymIVbOVkI1q2Q/72jW0USgGqO8z5jh4m8j6Ba9IiPkQ6MUpDALe8uPT8nQ5TmrcYCq9xLzICCK+Eo2A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(19092799006)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CJlWcc+E6bvg1yO8pcDGOlgMtYefURsiAdGKobReMhwQZQhZqPhlhBaGisvl?=
 =?us-ascii?Q?zvOyI7+MflYZQnFfCXcc5BBGd3tTupIUQtogPGPNPsTAOrpfTWPqQCp8ULXD?=
 =?us-ascii?Q?JUr8GJWVtIn690r3KmgEt4w1ja8aOryaFggWGUuFYu2WzlYzhFEWL1S5+A73?=
 =?us-ascii?Q?k1P2gYK45/EACczgaaKkUg+tBcWSZOzXjhLI80LLrNYch46GfjnMiIcfIwc5?=
 =?us-ascii?Q?pDWd+Sx8qsIpYWDv68y6lqsGNX1ChKEFiJDZcVX4CCMqY1P6aDTny4Ysrd2I?=
 =?us-ascii?Q?BCQV4qOc2IDRDlwpQjwm12nXuionbCCet+bfvpmqHnJCKIyVcXHxXgUKc0qA?=
 =?us-ascii?Q?zSaXIX9mmgaVBtF0Ssq/DXcECew2Md9CQXRgsACK6M2tcEYO+1gEo1dBxAD2?=
 =?us-ascii?Q?f8OXefCh+2fW7E4LFtKb1S8aBWGFbVLSwvD+qUH7HeeuSXeHhQsxkLa4+o0H?=
 =?us-ascii?Q?1sNguAbnMOmtZKzg/KrkYXyrlvbCyvb7FbzsdNiqXEJ0ZCa4Z03Q6+v2TlHx?=
 =?us-ascii?Q?8CKkO+4WDv8PQXh0ldO0LT0GdTy6OFrVjyZVnAe0pUXAJh9+flSwQQKhsz+B?=
 =?us-ascii?Q?ti0KodhL9HfJAdSYl6rR6wjsn6vqvDr78Yci2x/Ex0RPk3xYoxLG9tEdeu5D?=
 =?us-ascii?Q?HXv38Orb7bH4BqY/JvGMXg3qpuOxdrd9+iRpu3W4+kbMg34o/LpqfNvR/s+1?=
 =?us-ascii?Q?cpxd4RqHeT/+dqTTGyhrmIMD8PqxE49x89BipDykjQZRnfAxwYHyMuyfEna7?=
 =?us-ascii?Q?e4sRPliuU+AmUq+d0sBcvyu1G1CDid0gnsFR5TxifDhyqmzGz+ZNUhyzyXGt?=
 =?us-ascii?Q?EvjDTeqW0Qxs9Sznwqk7TEB6z07lBlCbpCNRgTJLPf1BGW5ZxGMoyRDLHKQH?=
 =?us-ascii?Q?JkmDYoliTaFFFha9JCC36pZ1RRJOs1X8b7lmLhVZYlUB5q6eOiR+FWwoogS4?=
 =?us-ascii?Q?qNNI1jn+0ZtfQbFXCBqtxVL+hU7Q3+Kz8cMsVptReeWZBubID9KcZy6uoJie?=
 =?us-ascii?Q?0paI/2bypgN9O9v4nW1NXmMe/7lJyK7T3q23ChNaRKxWd22IA43oam95UESX?=
 =?us-ascii?Q?cPOVqf1+hSdEwNuPCQvNN8IsrYzLZt1hVD3BGcgeTlBmE14D+dTbEKnXOObu?=
 =?us-ascii?Q?8TmkddC2x2Y1u7b3GQmNftjOP6CnNZ5UrhOj+rdiBqAZkX1nbGCtZ67T3QDM?=
 =?us-ascii?Q?s5wYEeyrd836fbXONwa8WRe5y1t1WuB2Llo8Cb2EL19NQk6lPceHsh7y6k8A?=
 =?us-ascii?Q?ypOYsKSgPiFrNr9+LetZ9qdTH+7xVtrdkfeNKlPRLy1LXKvxa/taY8GPX5BV?=
 =?us-ascii?Q?5RoCMZntpU2fNf2bj4SXfI2ki57vP3TBvo6jrbnIIrftkFiTgYwF7pedrVBF?=
 =?us-ascii?Q?Iq8r6D4v9WyImkMDZcQwQOrmkfRBElIlUKj6Hf8+2iBjuMadxERYzUQ3O6BV?=
 =?us-ascii?Q?5LLuDHnnqa3CbJtQPHhhm1IAeQtGp1YQMfD6Uf1h1krGfhvHfsWIaR0d4HfU?=
 =?us-ascii?Q?pwrrl2dSXogU5/GkNK8Pniw7Pnv2VVzaofYlqWSXCNa2e2U5oNRXF846qZ+d?=
 =?us-ascii?Q?WuafWPZ3hd8JDA/qwOjhc2lGVh0PuImAtQN2jG46eozrQki5wlT4I5ZGU/ss?=
 =?us-ascii?Q?e/bpt2iyBabMyNRZssz3vaFtsWQdhst4msDKJIvyl8JpYJntw9V83Mm//Ox8?=
 =?us-ascii?Q?HwahKCGVhHy3SvJomEiYI9JYoep/MqBDUpjkaiBvr+MVDAZTp3z96GNv4UNu?=
 =?us-ascii?Q?CALlmzKcnCGf823qemBWKlsr245IJzZOo+TsSz4f2VPP10fhh8W5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f587457-c836-4a45-3892-08dee290f524
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 16:48:55.2019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beD2iWZhlJMaq6Xxs52bkNbo798sAHrv5WBO7Ko63TSASAjRUCD+Q+gzutAfv3k4dbHTb7tkpEJQYYUbjlqUq+475kiI0MI2IShDScKu4wV6/Bmvoqtcm8AayTuXl8J0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10322

On Mon, Jul 13, 2026 at 04:05:38PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> There is no need to allocate a transfer structure when i2c_nxfers is zero.
> Return immediately instead of unnecessarily allocating memory.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Changes in v5:
> - none
>
> Changes in v4:
> - none
>
> Changes in v3:
> - none
>
> Changes in v2:
> - updated patch title
>
>  drivers/i3c/master/renesas-i3c.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 915090d0ad37..9a3613220034 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -957,13 +957,13 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
>  	u8 start_bit = CNDCTL_STCND;
>  	int i;
>
> +	if (!i2c_nxfers)
> +		return 0;
> +
>  	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
>  	if (!xfer)
>  		return -ENOMEM;
>
> -	if (!i2c_nxfers)
> -		return 0;
> -
>  	renesas_i3c_bus_enable(m, false);
>
>  	init_completion(&xfer->comp);
> --
> 2.43.0
>
