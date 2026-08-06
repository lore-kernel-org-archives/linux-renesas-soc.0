Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98042E5B02;
	Thu,  6 Aug 2026 18:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786042113; cv=fail; b=nsGGIKB3O6UoNvmrVsPLNo/hu4UupjIoH9AoqYVeMu3UKVucJjGTX+cbmLQpNvOmAehf2hZIxxRjyVBFgBVPNZcVOT6yVMhISjRoIsv474dMScx4LZDMZNhcvhafyZCzVun1FuV4VRkbL7BnUf5ZtMLHPaZ9M6t9smPC99s77lI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786042113; c=relaxed/simple;
	bh=xNs4A09kU+OsEhVtlyCt5gwnITxpTDblU0tqAv/+zlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rDcJGc/g7wjqD2mL4z+0qzn5o+/RG8d5ui3KntaSlXNbeMLwjjZavN/R78xrPVuFTM2qY+RB3q2Ero43+G14iguqMOMJl0T9Ed3Agw0Mr5IDilomaT1Y6sw0/BzmXkt07X3vaJIdXxqbo1ZaRcDmeYbQuMTF/q7Gt0lFjGnxjrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XfJF9g4j; arc=fail smtp.client-ip=52.101.65.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XfJF9g4j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9cy4m2wnEuLrNOe7auqjBc9LeXNc8XySe6ICLzWR0tca6dWwZmH0xeTofP3tB3smUfbkjQq3Lno/iTEroQ3ADvNSHIFpFsKas3DQYY/cR5JNZIpzZDsFxs5pyyjuRLpoAT6yBhRK7eRMdQ2YSZROWDAuwzVIdn1wFW5uAmWFLoQQZZeK5j6F1CwjjX30nsjOjwdWLS8qAPMDKKBPbItXbq7Z+KWi3XbJhNR40/CwHZJhDcn6LNbjgz6Fr8meuxkSWcA2lNnWf9L5jn1Yb3+yUwyTWfa//xS6m8b3SCaPLQ1ZWV/qy4lBAAWjMUy5et1pJOdoh6fQKQMRKfvQZCP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xY5yfrXDsrwmdkDvjI7kybac2cyZxgvhad8wqji/8FI=;
 b=imVNv3pkmE+OSGRf6p3+ZDeIgBtDt8bwXS/56tUo86vhPzYCHhj4Gh0TtM+wBrHlBqe+40uLFTKAHzmEkJIF2JqB7IfqNi9OJ/NylTQCHOwppZQkyaDOe7Ex/PtN4j9XcT5lS3cxwaOP2jaf9J1gLCM/G7XITG9bFLl+LQuynZpUKisYpVaGqb4QEUDl3HemzPA/UnfAWaNbZN5fV5y3WIWPPebMGra0y5oUH+PO/J+EWCIUWcLNt2qGRFk3/1bLFeSILZALSn2uaLygkbFZEjqVF5RugzlIuCaQLo+1z9mkuLDYy2/YPg0Vj8N56mgVXF0yMQaX867Z3D862fgitg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xY5yfrXDsrwmdkDvjI7kybac2cyZxgvhad8wqji/8FI=;
 b=XfJF9g4jNG4dCpVO6qMGwM1hl+ojRTC0+kqlzeYJQuhTgLnC+6KY25foHb9fjTjwBDG55pUtJsHze4s/D9Wnu+htsYK5dHJ2IJpXsjMj4M8HCovoaYbzYsqZ6E9t3qwMgaoLRjjM7D3lCF53REVAYy6BpOUuz9TjqCCApfqFSPug+PQUyadrDHr7W+YINy1/h8yuPXO8S1iVwpeWHuNd8FxGzyjVTWkMqdUNTiNn5DyEezJnBthSr3a+WvmxCbrd4tOfj299vpDKDO41gq2r+cYKsUxdQvhFirWyQ9Jd9zVjTkrhtHjfLYoyTvVHyYvNWGqKGn46iNHzzQNZNnwc1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9495.eurprd04.prod.outlook.com (2603:10a6:10:32f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 18:48:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 18:48:28 +0000
Date: Thu, 6 Aug 2026 14:48:20 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com, biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: renesas: Don't register devices when ENTDAA times
 out
Message-ID: <anTW9G3Yko4PO5J3@lizhi-Precision-Tower-5810>
References: <20260731070150.2519825-1-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731070150.2519825-1-tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: PH7P220CA0060.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: a0229b09-0777-4d6e-a4ed-08def3eb4da5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6Dx3FZHseec/KRND01qNqaU5Wp5ngQCCvvQTH+Dr/a55P9BqatsZN+VAIk00EIeORf7vaTlrOxhgrLBiStHfikWjhJ8/1Mgcgo9VB22vF4H1pLdWkDV4CTnXtjjt73PhYo813NV+3QT3W74C0j6zeZbRYrCioSF8oNdvB6l0NOiZ3h8z2igOtXLd1k+vsPunMUv3gmP6locNneddscoPD1F+W1ijqx8jtDnjSZC7LPrTYcbjIuVuxqq3ZYz6xO+oQ/xFjhhEay0aRxWE3vi4M/euoIibjsdGX7UzrvLHsoMOgH8k80RzusLEnORlaML7fqT1jIJUUP3UjraXCWIWNlBl3RD3zMQ6b8WITf5mOGY6jJit0lrTNj9fkg+zf2kPypF2dCY7Tz0OlBu/yskITc9NlGURUiJKBPXNH0u37+nydLLW2q3o7tvHTIAGEsLF78HQz3HOqZIGD7dryCTz+bPn+wScuxgQ6BylTbKW+fo5sZpeYZcEG71ItD48MKvkVwvCR9nBXnByuD+BpG9+fVg+yePACh6h2JL29hq3JbBjXAO3hdd++fb568SNq6oOK0KP9WOouOikwCy57o5x75Mflu/cnlhNpDKBnNqP4nNeB2P9j5ser6zwwuYH280cIZ1cHxJvcsxSC20CZscvllVht3L5pLeyHFzZLUU4dzY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k5uBZK+G18V4h63m+strtbFgCZgBoeaPO8HWaYsVYPASxHUci4AJLmFmbOgi?=
 =?us-ascii?Q?/y35/J+nD05CmA2TkyN4JcArZ1NHcMDn+79A9eLxA/J/2wqjMgPXf0q2JZhG?=
 =?us-ascii?Q?viIUW0SAqGeDWpcVywWiOHnyKKrMxYtGqvxmrJ27KvaGJlg+oEBMhbIW7kop?=
 =?us-ascii?Q?2i0SvpscZyNL/QdT9lJKnkT2xHUYHhAIifXkFujq6T0jluIhJJNz40lJdEaS?=
 =?us-ascii?Q?0txYGmyK7Bw1bBpuMhTe62T1ArNcTkBhUY2rIIryBwGha5duAfHbpGki/qHW?=
 =?us-ascii?Q?kiDOLSKRrHavMLdU9Tfeq8ypJAnZwDcdnb51fhEiO7ckTNDUsk1fmoTQLqEY?=
 =?us-ascii?Q?a6sQFKocwHQh7sm/dO5AYVJhFZQROpU+GMJQwxiv4kzEptl82D5tf1g6VxIf?=
 =?us-ascii?Q?DGya2y0EDeiYDfxPl5Y/dlL+LWw9Ah5hwg1gePw8FgGKT5BJwhemnwpGVPpl?=
 =?us-ascii?Q?OWhdYevu+kKfT0n/3mYM7R7l6AzBArjiPjREnsLNsIhbyaez/keuGbGGZwbl?=
 =?us-ascii?Q?binvRk4hgMAn6OIwjYCeyi2zpEYZ9XzRjHZttaaHOU5P4mQCYLJbNYQbmhZj?=
 =?us-ascii?Q?/fp9QxZ5YFv3+8nlR2I0bP2N1OBgrarNceuVEgDHfq9r0JkMVUySGiJYViMK?=
 =?us-ascii?Q?vsM5kgeNCRIhMxIylD/KrtO8qqhof17QkDqJNkxOgmATyGbvHDmU6VUlnQaJ?=
 =?us-ascii?Q?ztat9Ue0oE7aG4bIOx8zDB/yDFb/Sf8a8KkVrKVkUl4sv0Wl9uE61Gf5xOxx?=
 =?us-ascii?Q?SBYK164Q5xmerGjI24qEsy2c6CpeLn41aAI4fQy4Lxjn4Ga8tMZB/GEZeqnx?=
 =?us-ascii?Q?H4P+DftdYX5dBQb1YDr27/B0pAQZnWpcbvIwx/O7Mh8492RcN5Z9fxEkieh+?=
 =?us-ascii?Q?YKn+na5zcpuEEvGnrU29Crif022lW+tM8mWCiucGYLA9t1SXTzAaBVqHhAae?=
 =?us-ascii?Q?NvnakRQMvFhpL4R0lpyXNs8LqOQlRkomPwXLDHoMj3Rlud90hijRq9wG9JGn?=
 =?us-ascii?Q?6BKQgJzpiV0ECpJ1SZRU5VM7ohKBWE6reNa+etfYu9TmORVeAnGxHFcF/QMp?=
 =?us-ascii?Q?wob8CKzw/DiC5t3sN0xXalcLX+SsxPg6CWKYPvyb34DKjvFUjMbGxgtHmaHo?=
 =?us-ascii?Q?Lo75DHCDhq0WPJ1b+gkY261ISJUIhueClJSjM6W9CQazJtbVa+PCjIdJ8Hta?=
 =?us-ascii?Q?giDdzkQbHRApk3KhEZrEcSBFmi3GISmpa9EqMEtZlOOUVnzzSF/kVULCq8JF?=
 =?us-ascii?Q?RcXmJDYmg7QgnUdwmCvjVYc1HdaO9LEQ8xm60gvRWLPhFmuAiWDIWasl/vwm?=
 =?us-ascii?Q?On0+DrE6VbAgrZWYAGqI4V4jgfpaiCKuSb+F78EC3lpcvGDuZLL+10MtMTVp?=
 =?us-ascii?Q?soUYN1Ogue0XHnpFLMuRmBcNvAZqcDsB4iyG9wVqOZgNiA4NRz4oeE27m1RA?=
 =?us-ascii?Q?C/iQVCrY9srte38PamcrLsuvmSMYvEWLv40uVkvgrEix2nU/m+fUJN3+QdhD?=
 =?us-ascii?Q?r2HjIpXJK5wKhEquDgaJlHUl+yUj+YKBGyBmanSqg9rmA1jcylEj3oYshBSf?=
 =?us-ascii?Q?1f1jUnBkK0NGp/5NI4gU3Lh9rQ/OxCdBPYfx+jGj7eNn9/aI3/tJ0Wmqcuno?=
 =?us-ascii?Q?X/TAYmmqybMLBoNXJYSuGxBiOmVVQ1rEx2VNm3Q/YST9NNMjNCBAYZ8le9zL?=
 =?us-ascii?Q?E8kFOJf23ygoQGTkf6tuWYNts16w75q4/BV46q/KWaNOftkYRlfU9dme3fEs?=
 =?us-ascii?Q?dOeAa+zONGMCA8UEEvslThpL2eRkH4C5uQGdlF70MxEY+fBovUru?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0229b09-0777-4d6e-a4ed-08def3eb4da5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 18:48:28.0458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPqZojDPX1Yo1oJ5vSvitc/gnoxDaJ9YPClT/GErEDkibps7+zOS0gjqAlViFT7nGO0Sc0El9GzpeU8S0MhWWiAF8m+Vfz2+aI1QqKeYNr1RJYHBmY6trvq18XgiZZw+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9495

On Fri, Jul 31, 2026 at 09:01:46AM +0200, Tommaso Merciai wrote:
> renesas_i3c_daa() derives the number of newly assigned dynamic addresses
> from cmd->rx_count, which the response ISR sets to the number of address
> slots ENTDAA left unassigned. It starts out as zero, which already means
> "every address was assigned", so a timed out transfer leaves that value
> in place and it gets used as a result.
>
> On a bus with no target connected the ENTDAA times out and the driver
> registers RENESAS_I3C_MAX_DEVS devices that are not there, each costing
> the core two seconds on a GETPID that can only time out:
>
>   i3c i3c-0: Failed to add I3C device at address 9, error -110
>   ...
>   i3c i3c-0: Failed to add I3C device at address 16, error -110
>
> Start from maxdevs instead: no address is assigned before ENTDAA runs,
> and the existing rx_count >= maxdevs check then reports an empty bus.
>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 2b501f31e874..f4d9608978a9 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -685,7 +685,7 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
>
>  	init_completion(&xfer->comp);
>  	cmd = xfer->cmds;
> -	cmd->rx_count = 0;
> +	cmd->rx_count = i3c->maxdevs;
>
>  	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
>  	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
> --
> 2.54.0
>
