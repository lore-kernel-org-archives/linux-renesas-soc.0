Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011063.outbound.protection.outlook.com [52.101.125.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569693EAC75;
	Thu,  6 Aug 2026 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008673; cv=fail; b=t6OBqhNN/FydaDuv6ZIRQfQO8d0H6CYceBBvI5OObldzcIBO/5cHCVFFyKLBzcL8i+NalGykdx5VTeOD3wUfvXsnsT6NSQtCNfhU7gQlPlnyy9TyD4QvWzS9kfXdgJ9vnS8Hogy+Ci5nHA9RnnLhUuARy3XL3Z7nvCNNUtM9hMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008673; c=relaxed/simple;
	bh=FoVnFKOyPeicEzN5dvYWoh9ri0rGkrbnpUs+oao3Ans=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kO+8ferx1i+WERZUpdH6Eltybab2EbkY36xr7OiK7oBW2qcQfp0B7OJqklQm8JXxm15ziA+E/CF8vfAvWdZz9ES6wE9sYE8CWpuPYBg4QXNmGyYf1jkUwHAxaJXYmAGjh+Utj+icOmfGauSxL91kMhb2N5VRcvDsphnEfDir8QI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OzclBUZr; arc=fail smtp.client-ip=52.101.125.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OzclBUZr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdEw8ARJYUVOP3dmSBA6VYR5wISjd6hEp4z5SISZzcNstjb5gw6UA91HAnziWrg5Y4svt9hHfC2TLZ0AczcW6qxxHPM/UleeE65RF//OQPnzcIJWXYWVXyDQsi5S3mNGjM3n4eTD1381wVNCBkRrHynerO6+ze3HNd/qS5ukmiZYSSssCXX4e1Vt4KGbdHXu1qf2h/i23KtERIyopQjUDVw5n/f3VG+w9na6XHa7HBQnBCyaLXdQjyU/c6Qdrj/3CXSGHNG9bZPJroAfx4sMaPvuE9SzNVk/wsQis4vLQZ7Kj9sfZYrPE2L9leHHd/EGpPT3s/V3iRKRm7dlp8ca5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOKUnUDvEUsO023aSbdNPQ0z5VXsEQazmX7ZTnajP6I=;
 b=WSXPhCtCtixbT9a2O/+QGsNLMUirb3+1purl1ZHF4U9MHe34vcwk6OsfCWyW4/GMXdIW00VniRAbEJ8VHof6WW8IlzkgpaiDRVV1T/KqtqxaM/Urb7zLJj0tKCUDv0XeM0+T3IOm86Ais11QmR9L6tfQuPTvDGWrtudWsHB2lB4//gV1LagqQL2dEQlvXoie9bm8h5mLgOTB0GQQtcSuW6aCYNxzd06quj1sZEWhlYUZSEfcOgQwpZMfBQXmaFpWskQOy3Q/lxiHjOOZYNMXNp7YqZcvs22zX+5NCkpA3+4QbqG8chSZCs7Y7r+t59wXpdKKS6ShVNBaXUclxxe0cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOKUnUDvEUsO023aSbdNPQ0z5VXsEQazmX7ZTnajP6I=;
 b=OzclBUZriZ41ar+4JTIljVQfv82wfzzdiMUHGOX1NhmxctAvczgDxBJTbxGFSCfUtQ4x1SaH5+Gepp/J69pWrdveIzqydmWbSXH/RFmLDkGLb5Y7kisIZGP6cedvEf/y9sEhyliv5LPgOf+Tcff+turNoVKMXitzE+DkfhV7b50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYYPR01MB14133.jpnprd01.prod.outlook.com (2603:1096:405:19f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 09:31:07 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 09:31:07 +0000
Date: Thu, 6 Aug 2026 11:30:53 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com, biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: renesas: Don't register devices when ENTDAA times
 out
Message-ID: <anRUTcyZ0EZuctiR@tom-desktop>
References: <20260731070150.2519825-1-tommaso.merciai.xr@bp.renesas.com>
 <anOc3-M-ItT4mcPg@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anOc3-M-ItT4mcPg@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: FR4P281CA0383.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::6) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYYPR01MB14133:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a55567f-0ef2-449a-fa22-08def39d711a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|13003099007|38350700014|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5eDR6UAx7QKDA+t2bh54jyg87RAVYVarZajHYyJ3dry6UO+KA9+k4JQ1nkVlefJB7nH/QYJgFIuUHe1SjgxavvnWLg8fJpXHyFVAgEDGCLPdOEFwq6iMVZ0G9q1bP6xVBOBjp9BS0TAgw2HRGeZZt4kwm5wF1pBqs/IoGfMwbeaoG1P4O0JkUtEkmLCiI1qFF9P78Y0RIrWxQfXVc837LtcOcPjxhBbgxopADRRZHsghOB/LB1dcbm4Ic/rOBDt/aZElXy+b3CVCBxl7GcryXE+dLtJMkMXaBN50VA20vDQdSDgES1AyofeWqYbEMLu/5w6Hhxy8Urh+3gyLxT/2xPnzWgBoaeNKiZkglmBv965f3oHtvIaRHDiQWwHabcv8AHWrHiMVwVf/wWTFvajld7C+e4TP1HwcV1Q2ok0aQk/j8BygAFXGZAVV3sT8b3R52hn6ysj4mOpCEkrcxBHtMB/shmGRQfXWTOsMjmf0BTrZI/OalAU9sf/w52SRGEFC6oZIFHKgYx8bT3S5Ot6NWX9SsKdroRejbMiXOypvXFRAeQzNTiM6QxlvDfx13v7jzTN7ML5P2LnPXt07biAH+5Ko2ud7nupt7SYsGPpONus+shTdTnxqKVruG0CnMNHTmEhe//FikZXsKqzri97VPfkp1Jxj59HZeFXqcpI80kFw18IoRV51vHg1peYJx4KzDaLrcxHOz9V6uzUmaCJVHwRsMW6wT19GfhYF1BLUBa0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(13003099007)(38350700014)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+D63pCwAEPgewHR9KLx3FNmyLc74cAUaXK66Xxs2S1RX7hZBebUT6Xs2ukde?=
 =?us-ascii?Q?p6nX21tIIOgygDKPjeFr5RYBX4uBEVJFy2QO6F0KPvk2xRad7/gK8Rl0qLJy?=
 =?us-ascii?Q?B5X5tIzo0Oze7GjxZnm81yNm08sOk4MS4WMOW1j49ucKKMmb7L9rtSPWNG9x?=
 =?us-ascii?Q?ff5kOx4XCIZoUDN1Tqi4sCgymHXLadL8l3vaOrb2HM25QlxvpZL6hxWYo9fl?=
 =?us-ascii?Q?z/pD3dU/4q5NLi6IZk4+Mj1t2KjlyHUVSVI+5B0UraBjmiw7TpqRFgsTxdT7?=
 =?us-ascii?Q?02Xnmv7829qo24LVa1ZJ/CjXZCoPaLHRyWMNKwtt9TL//LEIm0S3tKMT8Lv8?=
 =?us-ascii?Q?Rb9JadRxmMcJs4zOOWZvJchr/7nyY+R6V3vfClLDoTF2fR5csqgR2XPrcKbv?=
 =?us-ascii?Q?LCAmBw17WD3PEfVtFBEnR7+XQ2Gfwn1piH203Ze10K3RHH69JPWsSuUIuF2x?=
 =?us-ascii?Q?2xXerqqU6IC4Tw5akncX9mjKq6TSDJf6RNFjWt8XnUs+/drrA9UQyvnIB+y9?=
 =?us-ascii?Q?B4IGxw/eWMdfABn5+Qx1zsEf6CU7UvJwdUc05hyttTtzL4T9niE2YFnKPy0U?=
 =?us-ascii?Q?exRZe1UbH5srghneBfUwjCcrIHq7jAKAuaBJ5Ahn68FiGR2hZRffTgaNiPUj?=
 =?us-ascii?Q?amCZZXwa0FMdauOf6CQ1+Vmy9Aln3OUjcA53KAwKGfba4HePwGea768rw6O+?=
 =?us-ascii?Q?kGE9WoX4ksi3+PeZjL5oDhEKtPnUVBIvb2ljAwcGm4+ZIfwk5cq6SDAi80fw?=
 =?us-ascii?Q?/Ol+M2V/qcelgvpBV7fum/zM0FZuj7sdIxroo28s8MVBPshGJOwf7MTknsks?=
 =?us-ascii?Q?MgujexquPu1wEqqOyfiLC6be5WtbhfzcAL+M0FzyWFKR4gjLi6PeWLu6S+16?=
 =?us-ascii?Q?8kgH2kLVinWLgAtXy3PtzEIJY5Dpv9hSghK/A0CAtjKiPQunnj7dXqcSxc4x?=
 =?us-ascii?Q?+RX7TBWgOD/H5T9GmshpgkY0KSdUU15SYDufxMaIPTA4GmFGECY7GqJ5meDG?=
 =?us-ascii?Q?8y0jxawQOHENurffAT5zJP4OZXmL+rKzq15z2KJV4oIHUEE+OpUXlE3IQOHs?=
 =?us-ascii?Q?ViUKFtFoJVpSC8pLodCkptzFnQjaiCSz3tQwEt2gplEHJvwSf+EDi+snbN12?=
 =?us-ascii?Q?yQkt8Jf6RAJKaES16SCVs0As/w0afJN/g1PQJrw39cw8zpy+p+ewQ4cBm1ii?=
 =?us-ascii?Q?/Uo/owQgNM/WhKxTLTgi4fqnsjF3goF498v3HvA9T2en2OmN6xfgq9szlB+p?=
 =?us-ascii?Q?9yyPzCmj+CJOvkURojQaEy4iP947NC4qUpjfo3x7J72M1cNJQTlceqDUaL5j?=
 =?us-ascii?Q?yVEV9G7TI9Z9On7+/AUCCc1dDoQJ49aVL1qv5U1AWDOqQ9Pm9y+nL0DL6js1?=
 =?us-ascii?Q?ZAtIH7b3Kg6Jwg9ZsJFzFlkKzo/w46vNB/yiPHJNGv4lS1tRgIxhzIOrlJPb?=
 =?us-ascii?Q?Umchbg+D4wTUjJsK1nMwxvNEbfeXREvBCYQAhsr/yawTNLGiYwhMOIJYMtkW?=
 =?us-ascii?Q?6IJvXoKuM+2VPh/qocYQrOScNE9G648SMHW2N5Flk9vRXMhrLHI8SJHwxdPz?=
 =?us-ascii?Q?HJk/0n/H2gQZNM7iTu+O3XEwV1Ajp/dVAuLUsCsi/Ex/pJ9D/B8PCk4GeVfR?=
 =?us-ascii?Q?2cAG6dl4iaZOZhtSVaO/UZ8PMTvdVdUK9dtR2BpAa1KOHJ3Yo0oLjYE4Whbs?=
 =?us-ascii?Q?xUP8/7B1oftrKFeViV8Y8Es+vXAtG6A9NRweJW9X16h2pe1A12xu/boN/Je/?=
 =?us-ascii?Q?IyBgSrj7XgLdo7lq/ynJmXuOpK88gJrrAcfD8zlpSw1CrTgWHBaP?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a55567f-0ef2-449a-fa22-08def39d711a
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 09:31:06.9733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWrgnq40OmGTEnppACo2nN8yxHoJHVYKge2zRUc8KOtjZ3Y7Xy5HSrJFlMIv+RHJpC/E2rBajsY6SpBYr/l4kpoor5QqH+xBQ7ve8yVksV1K1LHOTIiXOWjy9iuKSM1a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14133

Hi Frank,
Thanks for your review.

On Wed, Aug 05, 2026 at 04:28:15PM -0400, Frank Li wrote:
> On Fri, Jul 31, 2026 at 09:01:46AM +0200, Tommaso Merciai wrote:
> > renesas_i3c_daa() derives the number of newly assigned dynamic addresses
> > from cmd->rx_count, which the response ISR sets to the number of address
> > slots ENTDAA left unassigned. It starts out as zero, which already means
> > "every address was assigned", so a timed out transfer leaves that value
> > in place and it gets used as a result.
> >
> > On a bus with no target connected the ENTDAA times out and the driver
> > registers RENESAS_I3C_MAX_DEVS devices that are not there, each costing
> > the core two seconds on a GETPID that can only time out:
> >
> >   i3c i3c-0: Failed to add I3C device at address 9, error -110
> >   ...
> >   i3c i3c-0: Failed to add I3C device at address 16, error -110
> >
> > Start from maxdevs instead: no address is assigned before ENTDAA runs,
> > and the existing rx_count >= maxdevs check then reports an empty bus.
> >
> > Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> 
> Does https://lore.kernel.org/linux-i3c/alUZ_N9VdxkhcpqM@lizhi-Precision-Tower-5810/
> 
> fix the same problem?

[1] cover the case when ENTDAA completes and reports
rx_count == data_len == maxdevs,. 
This is what an empty bus looks like in the response descriptor.

This patch cover the case when ENTDAA never completes.
renesas_i3c_resp_isr() never run then cmd->rx_count = 0

then we will have:

	GENMASK(maxdevs - 0 - 1, 0)
	GENMASK(8 - 0 - 1, 0) = 0xff

This marks every free slot as newly assigned.

IMHO I think we are seeing the same issues but having different
causes.

[1] https://lore.kernel.org/linux-i3c/alUZ_N9VdxkhcpqM@lizhi-Precision-Tower-5810/

Kind regards,
Tommaso

> 
> Frank
> 
> >  drivers/i3c/master/renesas-i3c.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> > index 2b501f31e874..f4d9608978a9 100644
> > --- a/drivers/i3c/master/renesas-i3c.c
> > +++ b/drivers/i3c/master/renesas-i3c.c
> > @@ -685,7 +685,7 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
> >
> >  	init_completion(&xfer->comp);
> >  	cmd = xfer->cmds;
> > -	cmd->rx_count = 0;
> > +	cmd->rx_count = i3c->maxdevs;
> >
> >  	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
> >  	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
> > --
> > 2.54.0
> >
