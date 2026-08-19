Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010070.outbound.protection.outlook.com [52.101.229.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D460D480DFF;
	Wed, 19 Aug 2026 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154776; cv=fail; b=fEeMRgr0Qxjw1WC5LPrefFY+t47tE+jiqQCQu24auES2o67McSMdYPKMx0vUZWeqEgI8IUv0W8hS09LFEB5exhQTZa3Nx91WRjKH3JpDISmIS5JlQFli0FK79wV/w1R3M3lVgC3lWwKrbf4xgYH1vZHmsEFwpHr6LqGOoQT0lcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154776; c=relaxed/simple;
	bh=9uYK9GcTjCPvYUsC5RNl7nT4T66HZ7GmoxvLyZ6fB0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NbpIIL0h19LB1IBfvVsDnJKojjIcr3R1DAKxRre+nv75H/WNHcO/5HbJQwH4pkNdI39w70ZDD7qAUPwdn5aPbR7uc6uBvmVH3TrCLLcnxVeZjsv9mYtpLh8gPjwABx1n+xUxIFBeuK/CgH6tyTokLrBUcJh1LVVLJ2htwEjrrkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EvMBJG3P; arc=fail smtp.client-ip=52.101.229.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EvMBJG3P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D65OwN8gPSJ3IpQNvMpoOpbm7r6lT/UmZayr1VUw+1h3MDyTGt+dpcN1OdbrCyJxQ3/RYI5QYCjgXl1oWb6sL2lnw4Xos5gVKgymukuiWm/yAAey4C+9FAszHxznt198MQAgU+P56KZoWGSdTOpfarfOHPZ3GstKoRJYLyxL+0h5jpyxhlGkV1rUgulNKV0ss4mrLTlzpSgJ3uMZakq8oCjpyaqcWWX9M7D8IW2XUs0nYrittUrRk+cFDTmBe1RQsLctLuaJrFhWjK4eNaAk4cuJk1xXJvDPGediatbnM2Ga70a6qqlOyLBlXxXfQOERH/mPkfNRnOWe33Dg6WPkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWHQiBUdQUwFVG9QzbP1YBH4OE3weeczzlUU8YgPl6M=;
 b=RRoiOVWNq6Y64yojzPhAcmNa6Ii6mTFmkCdklwFxWAZDmCQmjV5UTwzAJGW0BE0cuhzsN7rvRjcFQhaXimuy0PmOJFwBv7En+wvbHCzINwpPCFfR2dIQOQcaCNkTjRIauEwBteFCAk0N6/qcILgZc6GguKzqdvi8wWV0QaJJ1w3MirkPOE5fxWeaUYP0CSoyoad4BAkrugqzHzfurc1qMisiroAOb6OW+uptJog7igc6AwqO8aBGkiJYBBCHoe+aga9n0nj5eaxrFPtGt7JcL7uN8ncLwdWRAFd36mdmRV0RXBZF8ZfNHkZDO7z+pAJO3Q9IPyP4privKUTJk7Sq6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWHQiBUdQUwFVG9QzbP1YBH4OE3weeczzlUU8YgPl6M=;
 b=EvMBJG3Py4xWneC0/2ipemTaV/4NsP+vUErLkjpe9j+zB9bkyrY25NEcQcsQE8Uksxu+dNk6V7s6ZR9p2P5zUe+Jple8/BHGcTidVM9U8P3E5zRiZhs2fms5w7onbrpsYSDFNxDRE7BfxNjw2Wn4c9hg4B4lZy8goX07qDdvKro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY7PR01MB17991.jpnprd01.prod.outlook.com (2603:1096:405:39f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 15:52:52 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 15:52:51 +0000
Date: Wed, 19 Aug 2026 17:52:33 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sven =?iso-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/5] media: rzg2l-cru: Replace has_stride with
 stride_align field
Message-ID: <aoXRQdnYj6B2C6jo@tom-desktop>
References: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com>
 <20260819102812.2592880-6-tommaso.merciai.xr@bp.renesas.com>
 <aoW8O_p_DyG0P5p3@zed>
 <aoXE17gWIN63ZNuc@tom-desktop>
 <aoXJk793Kl83qtPI@zed>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoXJk793Kl83qtPI@zed>
X-ClientProxiedBy: FR5P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::13) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY7PR01MB17991:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d9df138-1e23-430d-23eb-08defe09ece7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|23010399003|52116014|1800799024|7416014|376014|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 uIEGLTpb2+EibH/IilihIMVNDdH6duLi0xsz34Hpw5COefNzByXt6M7cAAX/r+NdmJoy8YIAq/mj+/uWls6aEnJJvTocnVgcG/qSvgdEVezopG/P+7ByVIGuuXGyzvA/GI4o74hByDaR1JSbnZPHu1eT6A3zFE65qcxIDP3X+60Nhwj5eVaQ4hEPP3KAfYSoi4ZDp/JjdOYY2c9ewGQW7hzWXt4pgPGLB9d/A7Sg00vH3dU8KzsbdNRFoDWSdWr8blKsQdWza/hT6V03TqJzXhmoO5PNy1htx5FetJfpDzXWvObaSMzfmYwLrFm93oqZMCUPsj6G6EuawwLCWeRR1Ft47pYKuaMAzNRNLCzEZj+sUBW07uc1u79bi0Znq0UvdsmppnoPJ4dkVbeTbf2DX4bfJBhi/XTtt9I2AlA0kJzcUDB8lfJqMNDXZTZJQV7usn2Cw6uzLGpNewADH0I0EevExwNCgyOyBMO3BAoSan3pnty40V8QgyyrKYxt8rCP5pRE63pr235XIUrWwRwbwLHrLQ4OV1cu/7tw0DKBjxF5tb5p0U11WVNCMRXYVdURfMcpyVKljN8HYhGTR+mxdaDJ9xepql+8QMVcU1u7R3WOVagjhEj8ec/cTDvvdTzxsefYcHH0cXjxtAfhJkOO+tkfQ1T49ePDTp7/Ys4EpVU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(1800799024)(7416014)(376014)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?4RgTex/g9DyFzZmP30Mlg/u/jnUk583p6RLVEfjn8bkQeEiPmeE2kuvn9klk?=
 =?us-ascii?Q?ZJaJqfp0Bo5mjD9UCl09hvdgkRZY/7DpDTvzWxCmcCn204M+ZxrB5bVxOWvk?=
 =?us-ascii?Q?48g1xBV6HOFRE4QMr4KtMvpYrEajePZjbpumzi77Xms/VHEzHwYvfarcoZ2o?=
 =?us-ascii?Q?ptEAFHseKOtjI++KaWLDt7TTyMSxzXgxcFXIPPbbEOwG1O/fI9H8gwjkgrtY?=
 =?us-ascii?Q?zpwer2mb9vNg9J4MuL8+VrdL2xeTSDLV9qW6WNASXJNk6J1rbs1YKyOkJvR3?=
 =?us-ascii?Q?GF5Clt7wcuk/CKvfjBFCowK02GVmSBzkRgqHfl1IQknlwA2haHBs98fyAaps?=
 =?us-ascii?Q?aqw84Orxc+RMQEKiQhRbGhqP8q6l9IvxsYsUT9HzOzYET1GnQ66KJYdyZqHV?=
 =?us-ascii?Q?bL9yYCwc1tFeO5Mc9kB5g3gwKz18X3NRk/X6vity6pVV7uYGc92fd74BGCNd?=
 =?us-ascii?Q?kRA6wlEFqohRDGwrTsricOsqXCwd5hgRMhJ44je0hD6OlGDqs1kIgS/a+Zit?=
 =?us-ascii?Q?Rp1h5yQ949MuOOZ1U108gAIBj3GyhNrHEzMi3H5WrZrTLexP+b0i6l8gpgfh?=
 =?us-ascii?Q?lJ+SHlD6NCuXOyXQzf8evnwkZgVsFFVMyXE13EE1HKZ41bkFrnZ0jdt/WqsK?=
 =?us-ascii?Q?smn80V/xTkl8E6U4LKfsK44GTQk4Qc0orwVSxBpussjSTPFXLKebu5+9OJ+9?=
 =?us-ascii?Q?0IJWBfECBJcNUxjdrL76+BMJOR3bRtdhISAXa/xD2rU4ve1CpttaEJcHbYER?=
 =?us-ascii?Q?i0AJQrFGDTeKL4KqhKrngbLXC5GQ297ZdtO9cQ0moWSFcD2gYeGlBr9RIBTw?=
 =?us-ascii?Q?TFPKjWc07VJyoJjQwfQiUGLMPIAWXqUlqODZcx/xNvyZ4fNMBOwstsLv5+fr?=
 =?us-ascii?Q?XcTmv0vnLiaubN5mz63LF1Bhh4yw5HACTzl2uHujiGP49RTy3y3A4a2UzTdp?=
 =?us-ascii?Q?dLOlyveSUf/I50NBPDDXY/WB3vsckZDlM5Pn1PPv8ZpYcVAAehTr5ar923ND?=
 =?us-ascii?Q?BmIqtJW/Rzy7777iW4pnrEeefzlRs/xJ/Hz5eNjjyehhWHBdXFNI+bO6yFUT?=
 =?us-ascii?Q?qgQl3coZ/m6eJxbH6UhTrw+cn9b50PnKk8qTk0vKRBmgXa715UMSdBi0Hwhh?=
 =?us-ascii?Q?EydxlX2m6qPa15bBXqObLUr3G64HsnLBAvJHFaV8KGh3WHPniNw7u5ZB/dk0?=
 =?us-ascii?Q?x/YSA7dmk0EiOAoKffRkBujM+fmbb1chpFVQB3vMoh7SQAvU554QH6uV3Fb0?=
 =?us-ascii?Q?e5A8Xjq+TN2XmyJBtvh6H/l3PXIA+o5R9hia9viRSR/ZW4GgRkELP08m1/lu?=
 =?us-ascii?Q?ROk24qJIClqaL9J6LjYQI1kZuOZGhUq/EbjInmCenjvDbSIjMY8DvZR0QVID?=
 =?us-ascii?Q?rPTL5xJUXdOWbVrX0pTLpmo2bDJaSPUcO2hw5vojnX29rHKFICYTz+w+TfA8?=
 =?us-ascii?Q?wuXgLsXgrsGHsJA5EzsKilkwNcPa3AToOjNTDqnlHlNvF/jLukghh2fIQabf?=
 =?us-ascii?Q?YZNJwzg7QfB0nn0eH7d7OoJv7cTh70bZP0AVHwywrmQArzL0Un48r+0PiODo?=
 =?us-ascii?Q?AU/5BL41MCKDOqMb8wC3EupWZezMRuZwEIpGfuchw403PBAIJiHRYzVgXSak?=
 =?us-ascii?Q?mKQCsL2STg4juAQyvKXXFAdMWAm0VCSMs96jePy/LMBwUoks+8SgRscNBdls?=
 =?us-ascii?Q?/xtzzdF7YjzJGiOqq7zje+jgqMzgQqhrTc0W1KpdjAq7Jzin/eZel9kz0Nro?=
 =?us-ascii?Q?xvOBg7zS0EmpioIuTs77Gr3jSpLU3t/WW5JzWQbgtyA+AtphPS8A?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9df138-1e23-430d-23eb-08defe09ece7
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 15:52:51.8982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEuR0aKdGorA0rsDhbyoROY8nd7fasS0T7k6QpM05jvapv6v4/zNvIC4IjpIHk16BFzfrGdMfqI007XVRyQwwX2gMPoTzrdJwlupnnMmrNd+Ja/pur0Spwu1GA8EWK7e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17991

On Wed, Aug 19, 2026 at 05:20:12PM +0200, Jacopo Mondi wrote:
> Hi Tommaso
> 
> On Wed, Aug 19, 2026 at 04:59:35PM +0200, Tommaso Merciai wrote:
> > Hi Jacopo,
> > Thanks for your review.
> >
> > On Wed, Aug 19, 2026 at 04:24:14PM +0200, Jacopo Mondi wrote:
> > > Hi Tommaso,
> > >    thanks for the update
> > >
> > > On Wed, Aug 19, 2026 at 12:28:09PM +0200, Tommaso Merciai wrote:
> > > > RZG2L_CRU_STRIDE_ALIGN hardcodes an alignment only RZ/G3E and RZ/V2H
> > > > need, as only they have an AMnIS register.
> > > >
> > > > Store the alignment into rzg2l_cru_info instead: 128 on RZ/G3E, 1 on
> > > > RZ/G2L, and update the code accordingly.
> > > >
> > > > No functional change intended.
> > > >
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > ---
> > > > v5->v6:
> > > >  - New patch.
> > > >
> > > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 3 ++-
> > > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 2 +-
> > > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 7 +++----
> > > >  3 files changed, 6 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > index 3c5fbd857371..a2b833e2bf9a 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > @@ -361,7 +361,7 @@ static const struct rzg2l_cru_info rzg3e_cru_info = {
> > > >  	.max_width = 4095,
> > > >  	.max_height = 4095,
> > > >  	.image_conv = ICnIPMC_C0,
> > > > -	.has_stride = true,
> > > > +	.stride_align = 128,
> > >
> > > We could use a #define here
> >
> >
> > Maybe we can use something like:
> >
> > #define AMnIS_IS_UNIT		128
> >
> > ?
> >
> > Not sure. Just to share, I see other drivers using raw values for
> > stride_alignment. e.g. rockchip/rga stores this info in it's
> > rga_hw struct and initializes it with plain numbers [1][2].
> >
> >
> > What do you think?
> 
> I think it's fine, it was just a suggestion ;)

Thanks! :)
I'll keep the raw value then.

Kind regards,
Tommaso

> 
> >
> > [1] https://elixir.bootlin.com/linux/v7.2/source/drivers/media/platform/rockchip/rga/rga-hw.c#L604
> > [2] https://elixir.bootlin.com/linux/v7.2/source/drivers/media/platform/rockchip/rga/rga3-hw.c#L502
> >
> > Thanks, Tommaso
> >
> >
> > >
> > > Apart from that, the patch looks good, thank you!
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > >
> > > >  	.regs = rzg3e_cru_regs,
> > > >  	.irq_handler = rzg3e_cru_irq,
> > > >  	.enable_interrupts = rzg3e_cru_enable_interrupts,
> > > > @@ -406,6 +406,7 @@ static const struct rzg2l_cru_info rzg2l_cru_info = {
> > > >  	.max_width = 2800,
> > > >  	.max_height = 4095,
> > > >  	.image_conv = ICnMC,
> > > > +	.stride_align = 1,
> > > >  	.regs = rzg2l_cru_regs,
> > > >  	.irq_handler = rzg2l_cru_irq,
> > > >  	.enable_interrupts = rzg2l_cru_enable_interrupts,
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > index b426bc7898bf..2c192d370dcb 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > @@ -75,7 +75,7 @@ struct rzg2l_cru_info {
> > > >  	unsigned int max_height;
> > > >  	u16 image_conv;
> > > >  	const u16 *regs;
> > > > -	bool has_stride;
> > > > +	u8 stride_align;
> > > >  	irqreturn_t (*irq_handler)(int irq, void *data);
> > > >  	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
> > > >  	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > index 27a35ef2a6df..a7b6dce66570 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > @@ -32,7 +32,6 @@
> > > >  #define RZG2L_CRU_DEFAULT_COLORSPACE	V4L2_COLORSPACE_SRGB
> > > >
> > > >  #define RZG2L_CRU_STRIDE_MAX		32640
> > > > -#define RZG2L_CRU_STRIDE_ALIGN		128
> > > >
> > > >  struct rzg2l_cru_buffer {
> > > >  	struct vb2_v4l2_buffer vb;
> > > > @@ -277,11 +276,11 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> > > >  		rzg2l_cru_fill_hw_slot(cru, cru->num_buf - 1);
> > > >  	}
> > > >
> > > > -	if (info->has_stride) {
> > > > +	if (info->stride_align > 1) {
> > > >  		u32 stride = cru->format.bytesperline;
> > > >  		u32 amnis;
> > > >
> > > > -		stride /= RZG2L_CRU_STRIDE_ALIGN;
> > > > +		stride /= info->stride_align;
> > > >  		amnis = rzg2l_cru_read(cru, AMnIS) & ~AMnIS_IS_MASK;
> > > >  		rzg2l_cru_write(cru, AMnIS, amnis | AMnIS_IS(stride));
> > > >  	}
> > > > @@ -850,7 +849,7 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
> > > >  			      &pix->height, 240, info->max_height, 2, 0);
> > > >
> > > >  	v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->height,
> > > > -				 info->has_stride ? RZG2L_CRU_STRIDE_ALIGN : 1);
> > > > +				 info->stride_align);
> > > >
> > > >  	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
> > > >  		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
> > > > --
> > > > 2.54.0
> > > >
