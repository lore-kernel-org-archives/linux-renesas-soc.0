Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013005.outbound.protection.outlook.com [40.107.162.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E11031E828;
	Tue, 21 Jul 2026 16:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784652212; cv=fail; b=iDMMn8iLDjFVqcXwTmDLqpNpu61abC8Bct4sLjy/nLEX+baRhRbyTPkMCgmaUx0oWWdAX/WznXnYeAwWr9JqSxy2aYZ+j8Do2xPtFvRrXvURkK4SS/ZrnMcguBbixoV5K2Bh4H+PagH5R9+0Ucc5IcSX0pisP4K6ZHegWowtj2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784652212; c=relaxed/simple;
	bh=UOtVXtxFMtSq3h96oOYjbjZBUzatzqxqHmhOIBg+pzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PcfxAV/Z5ZT6SvWOZzD3dWyr9sX4JilgiN/CbFenaF1Fb6aHkEBoEK1idfEOmvWTD52KcNjim8DYGUHIUViYNL13WW1QGaBmkihuTh0uXLAZkF6XDhDR3X/EEMryEB2vj+zkRW53ecCgS8dymaq1IXqB18mbaT7vMiIJ6A4T2W0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ca8MX1Qv; arc=fail smtp.client-ip=40.107.162.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ca8MX1Qv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFS9Wgxvp1w+S9uel7a1hsmK3zMCBLRmZY4Ndh7JKWi7sTzPXfX+Pn5kUFn9JK1h9W3Oi0c7R9GQHALljLmekKKj27x7VGaD2dHdqFPqOE38XqDzF7T9CwaLUeSEejZQinhZQ27u9yW+PxIF6lM9kvENhBYQ02tVO3Au6KH7nlqgVDEzSI0wKPM4VojWq6/IwuNORSVJVdFKFXD3Yvq36Yu4sYtbeneDRK8N1T++OPF0+9jGWyk5O2lExWifsS1VU2gc1vK8p3KDPFka0vieQih+wr8jVQZXeiHVa5biO8BL4Ima8tZbDzyrWTxEN1Ip8Q8kAe9Bl+Bg8xVUt1sH+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ihovp+XEVAuuJ8vtOtz/YWlDZlMfaCJRo1ny2W7J04=;
 b=wrd+X+d7SER5LAsLHwt7v1b2Ge/WaqPDrjoJ1g7SUv+l9cutJc3sIhCNbD/aKupB4zlBy05d28ZATOgUHC4+hGqBRm3WtZVl+1AN+fY72ja2QIKTzmcwLbXoPG4Nwd6AtsbYeN8Y4qvs44b/Do4AqUxl9V4/JiT/vpBMJfczsCEMDW2LZjF3jabEfx/fpnpY1xeLV3lwvoKApCa+Tna5oBA3VWGXNoydpNLQSDCGxkXcIsyvCzsLlDvgpoxDqqKTGIiWF7sJ1comnS9YCRpCJBMPjVKlc2C3MmV33ymgUhIbdzc1DJiEa+cDYIpDH7AKX/Du9yUQtYP01nEzyLzImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ihovp+XEVAuuJ8vtOtz/YWlDZlMfaCJRo1ny2W7J04=;
 b=ca8MX1QvikNA3SBYMxlXa1m01BLfBi2z6D0XfTtznWyrg1UbkY2YKjFWrSH8+z2aAeNoEL0W8tBvPok3S9y3/yme61UBaRjWeX1Pdvy7d4KiPxFNt/qYsuNY7pIOQXMvQFvVOPqW68kC6YOq/yTTR5xI7Pnmgch1o/ri7V7gBVtYE7xTSnOrNTubuh5UPanrN2489Z1jfPWQWX6WVeKzcLbncFGKG137ou6Npixi7wVnyHPXWEdRRd1KGlRp4oIGad7ubOYIYWvAjctfQCTR84SJws5D2Ybhd9qdayjpMN/ZpV0kI0nQAFwdwZF4lFKYrEZrLreZJgUEjyqXBXJZNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11852.eurprd04.prod.outlook.com (2603:10a6:150:2dc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 16:43:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 16:43:27 +0000
Date: Tue, 21 Jul 2026 12:43:19 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH] i3c: renesas: Drop unused structure member
Message-ID: <al-hpyAf7x2pI2hz@lizhi-Precision-Tower-5810>
References: <20260721140928.1618736-1-claudiu.beznea+renesas@tuxon.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721140928.1618736-1-claudiu.beznea+renesas@tuxon.dev>
X-ClientProxiedBy: SA0PR11CA0038.namprd11.prod.outlook.com
 (2603:10b6:806:d0::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11852:EE_
X-MS-Office365-Filtering-Correlation-Id: ed87459f-7e92-4c2f-3e27-08dee7473011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|19092799006|1800799024|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DTIysr7WzQJhrfFYm/mmUsQ+ts0Su3CDZq1gJMt71Hs5gyhKBvtCOjKITxcGWpYpSYpZ/2gnxV6guCJnFF72dd+WeZWQq0KHUmkyCAe6fTG7ZjFCFMWt/HPTzY8jSSGz8hu2qmfg5TyHMaC1BN49HT7/jYfxQ8/1OMv2orAzzFHD+lX4sEaCl2i6j9oYLXYBUC+B/T9FpvLyG0p9XjBZXLtZ72U+THNwAGbOYH+fvxS1OvjuJNCLIZIVRxlAtJ7YHbfyFTtuIysZgOsS+Z9/zCnnW3PVNgWK8gySQwCDfVqzAzM3vjx9IEtpu8ImmEHru5zbt0gZ2JwlCA6UGU1yWddZ12L8DlyNilVcOwNVrMRoeLfTtVEz2ZaHpXfcY0lOPsNlRfHHJXpIweyeBYdhecBDB9qUUqLJBt3LXxSoNHQApotAnTm9+32jXBCzBUns8P2oH4dwHXz+4EkCWdLKrDvgOTq7CCAwRnEhD5BfBgu+OOMF0vD7oN9Nq2ahHiD3X4MORo5DY0duk90qVSzxRXPL0gemz92NRqRqrrBaWv3bi21ZFMBsZ+rj5NTLgT6iKDEruwQQdBY/vtTBUFgcL/y9mp6l5cc6fl1RAKGWWddUSItXvTIpbAiCMj1oNOG0As6PvSzh3Q9VRr5n528nbAKLoRUC/KQEXRiHmUIbnZQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(19092799006)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8qiDUyGHGJ8jSVNwAHLA6R3wpHOlPdPtCwV5Po280hunllUkPypSQGQn0x0Z?=
 =?us-ascii?Q?ot8cNziM/cNfL55VTuqTTDOv2GJtE0jWKm29fLcoRbqet43wGTVLG4I2nmfH?=
 =?us-ascii?Q?RMePtvebQI9KiO8jfo9puQuJW7LaG8rUDTSOwbAnxFrcditRntmMn6sN9ghp?=
 =?us-ascii?Q?KAtaDrWMKd+z/Q2zwok8T+4vUIp1kXBbZ01UTpbQeWZfya0Ein2iTy1jP8mA?=
 =?us-ascii?Q?rxrtzenK/JDWyecqBLrYKCPpUjI6ChAVOZn2hcdK12gm/1uNX89VyAEys6uv?=
 =?us-ascii?Q?FMV4OVJFVAfiAhPmYoVzDprbiNOUjhGrXqLddZu/OWp0wspVjj4ufCR35ztt?=
 =?us-ascii?Q?xsB7nevhlOwO9BeXPfRPxO3vAewQ3B/dQTuVtLGfHssDurklGWTRwv12pvAi?=
 =?us-ascii?Q?Xrbjy9oxH6cEGVznVpTsHoFPlYaJffulS4YRd3RxGBhGaBKQ5HZPJXsPlOBw?=
 =?us-ascii?Q?tadwcWELtTP+i8y+I9dnguAbugGH/DPZLis/B3QnGOC8Oe99cDOjUi/WMCaP?=
 =?us-ascii?Q?QOsrdsrIoz7VjKi98NmxaGbQpSf3B68vYioP5j5ieCydA8BSslt+DXccJCTR?=
 =?us-ascii?Q?vwNWwjOKUNGI4Tdr5V/PN/NgRJHkwKKcLtYkdfYd8bJYTz5GOuPTSVxmua3o?=
 =?us-ascii?Q?KmMLBRQIhE50kcW3o3Sm1eHR5Z1lCuh5Ut/YrcZuIb3U5ngHqEg9Szx1bEMu?=
 =?us-ascii?Q?a03u5v0KbeaOuCh3HTQXllS94r0dW2E//0AFtzFd6ON8Rw307FZaG/qbT/yj?=
 =?us-ascii?Q?W4o0KOPgt4rNc8ESI57sEwMLT/Gb19HIhatW67IxWfc6ClE4KlgtO7DB34zc?=
 =?us-ascii?Q?kYitBny/Pp6kpqqoj2NGdK9ICboqPrHsmZtI4SuJS627QN18qRfTwl9uh3J/?=
 =?us-ascii?Q?q5LPI/dW4qxHagomVylQNCZWaUbxNvGW1BMOk6Vs5lKECJmsuCPAckVrSk36?=
 =?us-ascii?Q?NAki2VA/QvO/7tkmDQq3m+tDtcjyrrUurDRcGV5Q5keZVyTkKR330nqScgrH?=
 =?us-ascii?Q?U+PTJQwnEp3wppVFGIkWKwdQ/PHYZcSK4zUuulqB4SJv2NoZiImesFAh9T47?=
 =?us-ascii?Q?pI3CRVjWwifF5i/KtjbLZ5WsxXsM6R8TR+wgAbkiCooF+KyZrnChvJlzlSoV?=
 =?us-ascii?Q?jbsayVkWoT3awCvzlbjUQUbtdPuFvmUh53alnokz/qYbywRRGKhckV1rDmJQ?=
 =?us-ascii?Q?0Kv8VENEwdRr9kW3uwyGqv05bWmcGLySIa/Asyu4lIYoaYumWOGaig7XfeY7?=
 =?us-ascii?Q?pyGawiWp/E0rHjayuru+zFdhBlMGd6UtOkGVErca74WEWdzT6tJ5AifFmFeF?=
 =?us-ascii?Q?waQppNrHq3wQLIHskfjEUfqmZMUzzDCTDWxrFsXQwHGSlgpAddkkPoz5gVyL?=
 =?us-ascii?Q?DlG1PgiCbSPbXYG3A8yKB6AhYlzPiaRXyM0ijLsLVPV+G59QmuiYHOFEmjw0?=
 =?us-ascii?Q?ROBe/1OyP5H+cyKHVP4Vo2dj0pxK+RgZg/esFQj//r8LQ4FBNEazs37/Cc0H?=
 =?us-ascii?Q?SAevWsiISqsGaLmMwyoy8eBIxAutIWbLfmSYWA2xc78uCMSgUPpkpXqKuqD/?=
 =?us-ascii?Q?BsFnCPC8tksEky/i8dz0mN+utqEn/ZdaDv5NT98nEBYlJgluBg+K8h1Onisf?=
 =?us-ascii?Q?Or6En95ArSF+yVxACX0LyobxtqV+Fi1BR9eYvX11dYt2IeHUt92EPPtV4ZBq?=
 =?us-ascii?Q?hYePBNgVrcwU0kKgY9/MArz9AC80a9TPhDiAb4Z8uyAxi43zCXCaEmspJot7?=
 =?us-ascii?Q?/Cft+35wn2rzCwa23J/KJntVDv4aSCVS49nTseovILa9zFIYrDEd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed87459f-7e92-4c2f-3e27-08dee7473011
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 16:43:27.0411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/4b8WHGh16CgQNBix638TqqVzTKI9j/QAZHoubsXSkC8YOWuaOCfkhayGaW1XFd1L7t56/nrkPLOoGWy4Ip7MSTcOZRVDqJ8moLUbjypAtLxz18Rvsz5R9XdTDo7SaX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11852

On Tue, Jul 21, 2026 at 05:09:28PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

subject:

i3c: renesas: Drop unused structure member 'resuming'

Frank
>
> The struct renesas_i3c::resuming is a leftover from a rebase. It is not
> used anywhere within the driver. Drop it.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
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
