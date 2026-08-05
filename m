Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013002.outbound.protection.outlook.com [52.101.83.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6163D75AD;
	Wed,  5 Aug 2026 20:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785961708; cv=fail; b=u0tIdfv6eQKElRNC8m4rjm2klMOYHuPX+vBGnamY5IqwpunPd34FO3QjW3nZNnsFCbISObSNCwANbbiGZ2bChVWKafibhNrEEMWKjEpXcTyfJgZ3StVEcAFpCm9iTae4HyYBONSAR2yLhFgSwPzFU2S0M2/azioD79xOkSiv20Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785961708; c=relaxed/simple;
	bh=5I7np4tFED+usBTJsvjrpJ04IVZAyJwtomF4ytsnbQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F7EL+ga1KMZkpaac5ho4AUciCi8UjsbNL785xc5hr+Vk+wevuvX3Vc5gJ375t4T2AYbYYcm/8vYTDxJjXlSZLXXJKvQ6FZ5jLl4ur51HzWjWwmDlKyzGo2/0EqXTrbdnBqusurUL8+d5Xcq85/G2P9cWtj6oyMt1oXMABiQwkXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NqDoZOrs; arc=fail smtp.client-ip=52.101.83.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NqDoZOrs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpLsm8RvyFOQ0uPS3SrmGA+L62kzC4yjBmebrkp1VPLNmT80qdmMaKW/1H0WbePMbsJdJ9qBzE0+I7beJBjIA+fEX4nIXjzsExA6Oo6RDAgzRjT4cyy2tTP8NLqLZfxOEBqrhUCS46MlTwszcn4ZD4WJDlk8RrJCDeeexH3ynxrkqPzvz8vL/z1M2QAwhPc0+YDPAiyL8PeiKeL9cFXsDgpR43rUGZoVfjxClPvpU1OXuqpfMi1of+1ZIk2j+py2zcpPWkSKw/XSZNN2FW3GskKVNW7rAfPXI7Z7SbZ0RBefWvwOhZTkolKtKDcXZPEc/NPU2Kb9LOZ9F84gMvXOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stUgiC85gqrbUb8lQasfeGNZ+RUvTLd6O99g0AJOsM4=;
 b=p8mxqr9+XL7RQCSixXnrBlNDGf3zMKpaqEUBmumVBdamqIv6K7MNSLcqNr7UMc7SkeRy95bTeda28lfp/uVHblZjSg6mr8Z7j9JyVRw1XvDcRishGQbplfCEPCLuwdenNkn0rgWMWwqGlGM/pxtGPJ0z5uf2Yb1bg2bJHGGuWMQBv0AHKnVUXZmejphjcaQTjVxYeTxYX2od0Ev9CTxHOf86HogIwsLouE5wAGnQiPQQruEuQV4kgJGzxs90bBhm2zPOwsHUhSTXARDBvzY72QC8At9wq4wmTiNoznblY/DSQTbUpCLgerhNF74YBAY3hZjBPY3jRl91j8GVpak73Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stUgiC85gqrbUb8lQasfeGNZ+RUvTLd6O99g0AJOsM4=;
 b=NqDoZOrsT7CVkFN0uIdghR9bbXGidC3Z5VLqK+hcupExJ1lHKHdO0HnSa9HKXI5bYm6iStNmH5m2CWPNQYNemFr50xJih4YbBQkEJSsOPTxqXFMJFtqsjCq2MdvNKVmIG1NSHVdwD/u7kzfkn0J92WuoJZi/jdNhiOm7Op7Gb1/adsuzamSYhyi04G8pb557cu6o/Eb9QjGjZ1HRfB79bT54kAb/vRnGeCBHeavhG79asoWmJAAD4ttj136WEknLYsrxxJd7hw5xUxKDfyRRwA2Uop2M+zf+xR4gzVdrTxJDNq6vWkr0n35oY102MsIxPVl3KSwGwq+P2RiPgAPHWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB10052.eurprd04.prod.outlook.com (2603:10a6:800:1db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 20:28:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 20:28:23 +0000
Date: Wed, 5 Aug 2026 16:28:15 -0400
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
Message-ID: <anOc3-M-ItT4mcPg@lizhi-Precision-Tower-5810>
References: <20260731070150.2519825-1-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731070150.2519825-1-tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: PH7P220CA0146.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB10052:EE_
X-MS-Office365-Filtering-Correlation-Id: e8409ee3-0dbd-4825-b10c-08def33018b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|366016|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	O2cMHr4p1ITWXqof9lV4VO3C3/4fMBcxQXCuO+jDShRDZrypQJdtfW9yJauXuK8r/BAuUu+k8l+SeAMWbXzAAVGlxdgTXx73mXWKykZX5plHGTSxOW6Xe4KNWuPcQ3BQFe7uYj7STXVVZEI6fp3cPcsHl2HerzYI/iL2jwjj1o8kxokvBQ8yWpOiNsRYgAlShc0ttV8mpK2ugbooMjm8nHPohV9HpD/a6IRndbcF+U4EQ07fV2/TQV7nqgBrCLOqqURolnWukGGxzdzoFUjYZxGe4914o79Lmv5ppnAWaMf7rtkHhjaoBj3b7REueDtOJzF2etT/1HSWrHQohdliqjkp6MdMcYxppp/4Glr9RCeTqyAvyyrGan29tBiQW+biGDLplxjEScmVx+RGOdgzrzo1ogTnYHc/2iYfK5hxIl/F0r2ACJ7ZSdlYuUPqGAsa/s6GI4zo7Aon9UnCfSE04WP/X/Kfq1gApxa8Y46X9SmeRgGPszSl+esWmZkLKZ/a7GbbnHZy9wK+QwS/DHUDf8bTWrMsBLWlirlmNGlDlyZbUpgCZTBqzExwTYtaxGaG28egfPu7xuZb37gV8KUmma/vXvULZ/TJGGnNWEZ/+Hvt63shl/qmxBiBxbIMbwdX8CjMnHhUNqAEaovPnSyPfipXTvzNQp8a+niugHxxaIE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vzMCpZcZ4/ODUXmMIGvjz+0KHFIVpMUBuANVxh7tykRQCILbPntPRXbn41pR?=
 =?us-ascii?Q?BcIARK9zAzFqX38m4FQL4GEcPcDFJGNvgSU3v+8zW0na15bn24sZ0htEDRkD?=
 =?us-ascii?Q?1lu0REyaRA4Lf+gZxsdmMvAvmuO49n9w7MKYZR0z5vOWuXSckVMQc6+byAS8?=
 =?us-ascii?Q?Ym8RgvNSHhzZxbqrVzbJKXtIBnVkPOXf3hQTqSXbNx6Q2O3iEaZdCtWIeOyn?=
 =?us-ascii?Q?i1YYCMdMNpZPVfkZ0XoPCTRq2iLnocEzMa2c23DQY9QsbVv4UQRIngIvJ10t?=
 =?us-ascii?Q?0BK6lvOw6fnCquKXpHQ51Wo+++PDcDqbkbM4NuhkRPaIK/Jn0nKVXfzWCGce?=
 =?us-ascii?Q?LCdFOThDKiLZujQp0fyS5eEWYHh0wjP7e23vIoclyZCFVFCIy0OTfGsRWpC+?=
 =?us-ascii?Q?+9bbQG7pBqqewz2EmjvpteUyO9wojT8qUUsS+KoHddXlDm6Fv75WdvMw3PAG?=
 =?us-ascii?Q?pZZ/MeZRw1XqSOp0hy67pSKSukI9Lbt3nD16ZxeOyMlV6g5dBlqx/ZMu9zuS?=
 =?us-ascii?Q?/Fnjmaue58JoyJGvCg13LCd9BImTIHr6+h1s67fgsHvDbhoM0MzbEGYxj+XL?=
 =?us-ascii?Q?DXmQbxs8Fx/Tpha4KhLdtASflZYOpn2ZXKbeuw/5Ceo4Acds4evAY8LJYOw+?=
 =?us-ascii?Q?dsXQSVVjcSfjlg3B0v44woZROhreOduQoP4SO2Ire9WVbXXo4mh+Q8pI3KHQ?=
 =?us-ascii?Q?W+hawmdE/7htXoXmOU6b9trwk0NniSnNMRRZN5wajWXlTPhNY+ME77KzKbNv?=
 =?us-ascii?Q?uvGO5MEUedw4YLT6rsZ2uwTcHw399tbb2W/U3oZ6pmSiE6o2ZYNsbH588z46?=
 =?us-ascii?Q?bWRc92IW7949QyKaJv4Tm6TxdHCOupmlwDkKfsbWjaXWWHvMaVKFNo0YmO/f?=
 =?us-ascii?Q?zduUvzEFsP6z24W9t9nllncvlUIgSTg/2Mdzd8s2+tzlf9i5HZOr61D5j2by?=
 =?us-ascii?Q?Pq7I3uMTjGSr6k9fefPtWoYt6I3wIg054q8DWwDZnUp+gyIR2FDVsOAPKavy?=
 =?us-ascii?Q?vY5ds7IJYt+MgGukTdUcfsxo5lHGAzdxDalD/gvCY9qQ/NacRmTMXA/Vz4BA?=
 =?us-ascii?Q?7G5nqHeq2vhrMktRHIBW/CT/NmgG2Pd7yKOHd3vgArm+qdHb4aiVk0VFL1tr?=
 =?us-ascii?Q?NuoNTAV/uSTso+rg0lMT9yado4NgOjBri7NRnbiono4h+0EvmfC9NHbVl4oQ?=
 =?us-ascii?Q?TtrBw4jr8DsYV/DHdqWNEvAzw66QGzSsZ9/f3P40jljkWTbjw/9ifwZuN8SO?=
 =?us-ascii?Q?U1+fBBplDz2JLSET8ZcM5PTF96OAS6UX2ozEi6+gfiUOYgXQDgIBDJ7TFkfR?=
 =?us-ascii?Q?WM84H5EePZ1twPI0dvDrIp8mvY1hXVHNJexb0d/Jkqx+AbiGLVPQb3p/rF4r?=
 =?us-ascii?Q?Qed/h1EedWZy67typ9tZcqx8gGakrAFKyRSB2M6pEbCrfWi5Qm7wPBh1CK3p?=
 =?us-ascii?Q?B7NejjzJdZ2kI6Kkn4KNjEMH0Xq7wkyhXhDTtnYEysKXtl3Mq79StUG5F4qv?=
 =?us-ascii?Q?lF4k74AqHFGEnY0ZzvrXifjt4uoD5kVQ8IeHmXHB5YYBvc9WAmgTaxfoQmdU?=
 =?us-ascii?Q?4NirgzJ3YhwYHbTJ/+GUcMUMuertIVL95JPppOUorczwswSv6GkurDRl4iCf?=
 =?us-ascii?Q?zjuQYdGQJnulVAjxKpH1vnY1Uay73T+563VYmmXIDnRF62ukRs5W8oqVsUS9?=
 =?us-ascii?Q?qlpceStIYMuncZqfbBbtgVPpSubF8fEScEDzQ7OApUJNUQNFwCHbM1EeR50B?=
 =?us-ascii?Q?m+roa635+Jwy5nuwozIrDVGGAJvQY45DYOkkEFpEB6HCv09SnImS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8409ee3-0dbd-4825-b10c-08def33018b0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 20:28:23.3264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mq2H4QF2QOIfcRYyt1wU3T++kBDYbU7ZZ6kMpv25i6Ik+sQjkjUjW+c77u4JjO0G6X7f2n4zioBPlmd19qb/jkX51+BPOMjIjsThoJTEYvJGqtCE6zCpaYgUsrw2wOgp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10052

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

Does https://lore.kernel.org/linux-i3c/alUZ_N9VdxkhcpqM@lizhi-Precision-Tower-5810/

fix the same problem?

Frank

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
