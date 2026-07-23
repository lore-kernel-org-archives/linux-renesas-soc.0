Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F74D43BDD1;
	Thu, 23 Jul 2026 18:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784830750; cv=fail; b=PgjzJCAtAHweS6LGNIJZlPuh8QS2o/wzibN3Na5eNZlgdXED4cjkJR2FSkKu8weQTlnrjPNf0TOHuhLX/fqE1kXTIfZHbuEBWD49/++c+bun18+l4LvlTANni5oZQU/Fmi5ZlsUu3YwufmMlVEyECFw2RQwVWg1dm5G6sta1fXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784830750; c=relaxed/simple;
	bh=I0FBxaKRoQyCFT/dDSa8xVBQWR+kHmmxp9eRub+xCDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EvPS37xQl8F2lFVCrv4pAuMsgbDlXp03v9avAb83pZekclrk70ii5p39b3tY3nGqZHwWPbJd6txp0ZxPobnOPKBRgRMAR9XoyrPf/mtZw7qC3DjcasjDTUZp//gqVzQ9JCo021knOpRRqLh13UPK4boHKgOWgBmipwmjhAXP5nI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tUdtA4az; arc=fail smtp.client-ip=40.107.130.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tUdtA4az"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdXh6Y8ntHfIsNPf9vez4Vo8t76W6TMXYZY2EmkISZIEwjBg/lzfNKsVe+x9r2MTWXI1Zbv8ZBc8JwFk3BlSdpDntIstSehmDPt3n5IytbqvKZIThAr+kKJtVN8oL2BQtBM/AvxDpBvnt0BTVzc4R1NbUuVmJutGxRlVMcaNtGpnk098Av3gZmRItl0znZWveLi6w9miqrThn4Us8kjw6KdaAb8Q42mxjDiChr+ub7yrGlrreCLFklz1GckhHTkd5yGgOKWTAzpEPk3omaLBK3GPt+bnzsJuD4f2vsTSyiGyNzPjc5aJpvrIgedLHJQYP7rbAVTdYgBqwUGf32LCzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hA3+bTVbPR5h18MH/pcz6clZerKVsoHdGdL9+kYmD+Q=;
 b=b8vI0NrlKIIVhD+T2k4BhNb5gCJ49TD9kEWbpOK9cmE9mLAlm9z1WH7lL7t93KdcSyaIv8KfMgj3cNcSAlbYbklnxhHcqRMKySr3i503jmQJndeMgWbAZ4Gm8NugWfTyZ0qH/YRYa5yOnDnJO9FJlpE2Eqn8wX189DnaeT0tSfDhmjGuWRWeekbarNK2c5Oia4W05ls12d48bn8an5dE/hTmWkrE1vHLLcoen9dO6++WAjCnj8Hh5N/fif/mPO108OVH8C3tQfuXfGH6ENEdxhdng8T5J/SIohTP3Qo+O84uYdjv7AjJkPmV6BXfic/DICEJNEgvJ5dUJR/+Vcr4tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA3+bTVbPR5h18MH/pcz6clZerKVsoHdGdL9+kYmD+Q=;
 b=tUdtA4azuR7CwDyIw/JUz1cIHxPtGtcshX387ELy2mASJnDnbO14O6NVfkzylAdP3SW0CdgAHXKkleCYrZTTaeCAX1d5b+61zXZtqc8dlzWz7luHb3CblTBNnL+hSobVrl/THm+uck4KJBaDc/B9H/QyWcj9VdvtyfSItSZ6O6wu7y3zvkL45UXugFyEzjaiO01/0VqTm+PyHaAho3YCjxdmIohYswCgmDxD2IaTuEINROV6xm9IngFqRpstA/whIUixqeLdLcFRaAwyVgue17PVXpBrAxey5HX1re50Co5KLMaQ2yrBvEsaaMbeYOtQ2dY8ouKETlgGIiMyDHdmNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB9333.eurprd04.prod.outlook.com (2603:10a6:20b:4df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 18:19:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 18:19:00 +0000
Date: Thu, 23 Jul 2026 14:18:52 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2] i3c: renesas: Drop unused structure member 'resuming'
Message-ID: <amJbDGJ5sOzyq6jJ@lizhi-Precision-Tower-5810>
References: <20260721191618.1850795-1-claudiu.beznea+renesas@tuxon.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721191618.1850795-1-claudiu.beznea+renesas@tuxon.dev>
X-ClientProxiedBy: SN7P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f137cc-5d9a-4862-4369-08dee8e6ddea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|1800799024|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WRLsHEu4ifYHnPKFnYE+N24jtYm+OOVNrlC/TEC6/un1Wwe1vhvQ1KjLx374+7JPE4jiImQDTJ4hglFM+u7Aj/pFHSCTqWRqrmS+YRvHCxmClVsnBZ7MJtmThST1DgJUtIpkP/UQGg5r8gN9g7uQWmxqcDjWPJYzpLb561ISCIvMiPYkff6DilQI8LGKrXWsghBeaddAMqqzxCgX4Jg3k8Z4PvA1ZxjOJ2Xgjh7dtd5LyARL/IGa6R+wT8k8vpMOAO6gzTqT4bHjA6n0M0QUud3cvZeZyeCow46H0Khs7nSS1hpY4JIQSs/tJrtstJrwdA/L0IueoqCmxBh3ufm3vlDcZTWCWtGGilhaRz4j799hlBOq/f0giru4LJkU2/AV4iNWN3P1wx6MssWslLEuSWxGyX4wa+cxA8735zKbMDpVjQrZwDsL42qgdE9adQS5d9R59QAUKjj6SKFnlqv9GTG62+/Su/VCudAQWCauDy0MK5n/qcYIRnVeg9TB1CDBrg2/C0AD01AddnrploWFofmM3vXJChQ3VDdwqFWxR43fs5e3pVBREvKb4q9tGrzggOsEUNS7ycntZQYL1/pCfY+Dk7IAJFGFKdEdDXB2morHTwBu4F3ZZJco18p/P/1LwCyVBJpjhBXL58kgvCbZt7hhblQ4OWbb3PIPGZ+3wP8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k1eY1LownstX+PHANpaaCzyEordq3SGBFwOsEBw9Qdmx1a1xmmG7YKh49Hql?=
 =?us-ascii?Q?uYKWGOz3upOizAUFx0vt2f8zMwWv7TwPnsVoBO7bLFdR8PboHL99xFbRit3x?=
 =?us-ascii?Q?Ywqu17UfqpbKwXIH4oN+B6/bLYglqw0WiqDgUNt+VX6IAjSsFL3agguzt7rK?=
 =?us-ascii?Q?Fwmz93+LBhBexjZpD3lGA20N43cgDH3p0PKMtNa7hFUWlWuF4fXIVPOAjm7Z?=
 =?us-ascii?Q?c7VjPemMuk0zgicH1MrHv3CSUFhV5ccR+7nR1tkidy6u+MhEpTqqvSiuofFc?=
 =?us-ascii?Q?vZVbBduguIU0rMRXGXPcg1WTmPrqezN7jpBO0hOzfs+jvEqc7zlpMOPFq33H?=
 =?us-ascii?Q?tRASTivvQggnJV4FEzkhAEJycxTqeqaHgR9YxnyFpUngfDSpbW/A9/a1PdlV?=
 =?us-ascii?Q?6qvCy/kOxrQUgHIbLjJREiEQ90mlS7b8XMpWXqcFoAczGBseevpZEcukfKf4?=
 =?us-ascii?Q?U9ZNv3FfCleUlbgOH4oEQdIgKFdBPZnp9y3rFOWbgkbdPEmbzp/cWd/sQMWP?=
 =?us-ascii?Q?XsKSh93uHRcUa+BtwZNJVEYFP/Pz3mj7d6I0jEqL83f7JmE9/QvtTdAtmoty?=
 =?us-ascii?Q?hjKePwG6GvGwnGqiGhjXS+eWNdVv82uudzErBeyoSsRvZX9tFA80vrOz/sj1?=
 =?us-ascii?Q?Ukk7um/TjwHK473epN/0dcVfjezWpWTXTnbiqg1a5i+G0jPW8fkCJ7wBOy89?=
 =?us-ascii?Q?Ue3Q9tmsv+jzYwpXgNh0sx9lrGZ+3tCY+RL10foC32rT+6rbh9y2qh10xvLe?=
 =?us-ascii?Q?Bmkb4KujdFGwxAGN4gb2zsmKq0RmkFyZSPGIhjPLyPNj3Eitet/JvVUwHTh+?=
 =?us-ascii?Q?oeHgZ+spHmxfIguvOncYHqnwpL77wfftbUGSY/2JO3RojO46zF9DGyDPNhPy?=
 =?us-ascii?Q?oJTKZlGoHjJyjCvwhLDeuRd4ssMAO2lGsWoNdD5g0cFBqCoMKfmt2ynciqZd?=
 =?us-ascii?Q?Pd2EZkReI8IemoNs4dtsNQggDiuOj4yY74IMDxtJiLcklT0fLo7tiIDo7Q4E?=
 =?us-ascii?Q?l2Ev3/4RHS0wyboWBzhu7MCn7XTctdMGzI1fI8lKT16FfRUlOutJCeCYcIO2?=
 =?us-ascii?Q?Gv3W3dVfjQn03IoWxoZgimFf6KwPvj5rs7Fuxv96lNpNBLtsULuP/IA8cQZa?=
 =?us-ascii?Q?XTwPkPBBthgUkyRAs0LE+VRulsDrnGz1TUYy+ArmuriTdJ54Irt3cEG02p1z?=
 =?us-ascii?Q?+zvwCXY027eMOUVYwcrCJ0NN9vMcFUngYmI7JmFMnw8yC69XxmCyc/+7+Jm5?=
 =?us-ascii?Q?+tcB6T+jNKgaSmRYidCP/p5ZSHIGDV+CjQK8OQzP5aCauQKbEz4dv8ApFdjf?=
 =?us-ascii?Q?wyMB0FqxI73ip0nASQQDECmvRPJxgduppSIlxMIKrKvf+EZen4Uon4zrayWp?=
 =?us-ascii?Q?Ff6gcLdSoxUARWZFCHRp6bHKOnvx84z8+DAZiWPpvIiGNnJIX8C4D2nCKEMD?=
 =?us-ascii?Q?sBeudPEaeZ+vyYC/MnSQPQ3P/ntuSDYLHsPLbFoMPK4r/vcRUt8KdMBjRzwx?=
 =?us-ascii?Q?JnJN/G1MTfa6Of+8xurH9WAt8Gfd7aH9xwpb9vE62jL9SzI2cz88JlITT36s?=
 =?us-ascii?Q?40Rs8eXdz7kwWpxbImehz0KluMHUU739WAPFG9pbiMRkanL5GLPTnMdels/E?=
 =?us-ascii?Q?dBaB9zdpKnQ/UUMFS+fuaSLCj0WI6x8xHlr3w5ytvz52FI1KguCRwvcEZlBV?=
 =?us-ascii?Q?5D+6j6Q88itoXRc4oZKKJ/oglTOmpdcsW0O5cIj9sU1xMGsYv6BAton51hdF?=
 =?us-ascii?Q?+xsJLL4227hcbshn/vNnh7bvsJBfmtqtifXjWCjBwaVf0T2wr5wS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f137cc-5d9a-4862-4369-08dee8e6ddea
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 18:18:59.9292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DlIZhUZuIYFOLF978uqyJZT7OXorBmsvcDDXWxO0MYvE/vw9FrIROqMCqoOVOr7vEiYlc1lDe+8x3fdbqKCnGMawCu6JPU7y2q9EZHuWvQ71FZlJmRworHWXdscgMaK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9333

On Tue, Jul 21, 2026 at 10:16:18PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The struct renesas_i3c::resuming is a leftover from a rebase. It is not
> used anywhere within the driver. Drop it.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>  drivers/i3c/master/renesas-i3c.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 2b501f31e874..ff1a243a802e 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -262,7 +262,6 @@ struct renesas_i3c {
>  	u8 addrs[RENESAS_I3C_MAX_DEVS];
>  	unsigned long rate;
>  	enum i3c_internal_state internal_state;
> -	bool resuming;
>  	u32 free_pos;
>  	u32 dyn_addr;
>  	u32 i2c_STDBR;
> --
> 2.43.0
>
