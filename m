Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13222236E8;
	Wed, 19 Aug 2026 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151597; cv=fail; b=Mz8GLXnfgCgnYlli7W6BFv0pTngVMcfHNJHOKDlv2jhe5siU+RJAEpDwsnqJH3Rc2bvUEPqhtIFtOR0qF3V0YKIWOlyvfvLVDVZZaHt+68kJuGCjDn6BAW8Xyf4Sd6sVnYEVxS5XPN2OGe+wUXf96LuQ22uFuBVE7WLIdNsAooY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151597; c=relaxed/simple;
	bh=HZS3lT//VyEvz8ya9yJjXW/Q2mjYlxfwx3L/KWSWEUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DFFKmXtW+FmvmkiKRJMW+l79wMb46ziWIjaLKd4FLYFzGptYpbuyGG8pR/AqvUBkrYtI54i15i440wSPX76+kvo/UhklFMrzhQttGFYpdJHebelFF8gfk9u0EXN9F853miTbExC2zOTAaomgL0uK+EFOgYOtiR9Jc9EDARFqV3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=epX9kfbJ; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="epX9kfbJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kw+CXC+gbdZygQyhxPPYrOJOp0pAQirCJ9vztNp054PE4yCbjJjuMdXuLsOzUVFtuuMfhvGiw9Qkz65Ol9ql1jclwr+i1GCG8zqanOTpxTHrKRbN2AheWQ/+fYnF+XWWta0WfcvKjeu9uMq122OqWd5JYs6FwaicujpMNju5YU7EXk2UO1ZNEQncZJ43DBYY3D+/TybRwoLl7+ry0Hf6WrvlmYp90jmUix1q4e9D3HuT6v3ptsGG4LoYyV3QHOSoAzoTfDrrjVC2Nuv4Lc+YDzIaXCtmVc4N1eJKyBpqRB8SDsl08FM0e1VduffZHaUaepks1YsuXqSKltaxKFeV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKu0ivvT8YOPGVnZgcs3B/QOjfrrPY3D4OFmTRYTank=;
 b=e6Ys62ha8r9rnIBlE7+BFPfYca4VwnAqkaMMUSJ2KOC6okFHxqXzEtDPmeTRfnRBn7axCUiWSGOCcanPHa0+gGgQC4coA42UYs0tEhfPxrRbOCgBsuUty3O8VfwWBEuboO5s0jQjQILWoe5wBFl60O5G3oLy++0AVAIoHUHDIW5oAPbJWP2IE5vD4uFcGRvilXTfBH3BlANZj4VVPKFQNpKu5khk7E1vXtpXXfFAtR/HJB0Osndb24wJydKt8mW8zml4ntZo2hpfOPNHz+LV589n9PPBrZW3B9/sZ1/SrjOgjbR+O48wC5erXPoewyEDSQrevBra7z/WY76MQI+X6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKu0ivvT8YOPGVnZgcs3B/QOjfrrPY3D4OFmTRYTank=;
 b=epX9kfbJwxj38fIl/QU/W1awKRszY1sUPEyITToI03I/xktri8vLTBc08xbOEGPDYzltkxH7LZt/ZGLgDRK8oDA6Bve3wbVu8gBTApYEUfTTDvIETiSRTbdBaizfITCqmDD2KafM6PdGT6c/9B0DodOHGMMO/9ucqBDkfwaJweo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYWPR01MB10243.jpnprd01.prod.outlook.com (2603:1096:400:1d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 14:59:51 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 14:59:51 +0000
Date: Wed, 19 Aug 2026 16:59:35 +0200
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
Message-ID: <aoXE17gWIN63ZNuc@tom-desktop>
References: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com>
 <20260819102812.2592880-6-tommaso.merciai.xr@bp.renesas.com>
 <aoW8O_p_DyG0P5p3@zed>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoW8O_p_DyG0P5p3@zed>
X-ClientProxiedBy: FR4P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::19) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYWPR01MB10243:EE_
X-MS-Office365-Filtering-Correlation-Id: c132a8cb-b623-4e27-989c-08defe028505
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|376014|52116014|7416014|366016|1800799024|10067099003|56012099006|11063799006|4143699003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 P3PrvUVR0Lf+dsqkZFNZhquBsKU4nxD01oTg8UgbYx3z4exH9aEHewY0PwSkaG2JXxUC0woBoJRNXt91B8B9mL4l2pdD2+lHdpah6KB8dXub22PbVdAqh9dzq10eiyxvm6brNFmIqA0gpLgb9QLVepMxS+6A//EAgZpJTfj7hRb6XTBtsbb+R8H7LyBEjd1GCnG5KO2DPW6g5AStMdaEXEh8Kuf68po3uXPN5zvvBwKnnAfvYQwKZ0aG4tj6Dx0cTMC6iIb7sV+NrNE3nswUXXQJbiHOdQDei14xCW3xXDFxsopNg/EeDdqBZ79ZHN8P7t+x8h6xwtF85hO97cH83uXkvsoe8r+vLbuJpmr0Gi7t+i4NBbWSFE7DJ9zLVV3jZ5WJ2oL90iHsVDLn2XOjKpsPIuQk5hBxAznWe7eO/yum0VaETEFJ8PFUEfyo3tzNR6rUpdr3ZCRgm2fWCB/EVNZemda3WieV0M3LDNaj31VTw1i6Zabvnt2QmZg64qzAbJj9uBB1SDdNJrGSe4kEJoMpVY8t8CP7XeEXWHcWYOAiysmFOjHZE25d0QDuccr6g/A1ZPQPhTI28ydQY135PDQ3DGfRlfrEeXQGlJSv34NISwKRHpiiKLDGJ40IDEYdWa4/Y0l2XfuCCsjlv/+WPfHesBnAFz5tQDjm24kzvUQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(7416014)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?HJ4I9U10eCX2wp6EUP3wZpl3G2487S7X5fihwoSsYZ/arG745VRndFPZIhOd?=
 =?us-ascii?Q?adjQatuUkitZkehcMS/0uPyktXlVhhVOkmiStaJH7+jNpbyYoO/czzJFUL1r?=
 =?us-ascii?Q?m85xGixZDie48Udj3S7+7AINOHNvPmC0ZjcPdTKcuIh4z29W9kryVMn+l8du?=
 =?us-ascii?Q?lSwKQdm5Ehn/UmJLy/3gLKRUhyWlXljM5Bl3lA/gNIkFa0/DjGW5TEUu71B5?=
 =?us-ascii?Q?BtBZfx9gSWK/DCoBaO6fzQt8YKH7UafD57V0sENpXJDdm0boY2i5aJ/ZXyKK?=
 =?us-ascii?Q?sKf41g8luO7wiAXbIEvMHozXvoqjVSzWnvpknDLb7wzz8DbR3akgYEfcKC7s?=
 =?us-ascii?Q?Od7zamNGB/9WMckO1yXYLcfdfGWwmAcdKQALaw2SW0wzARQ/6zfMT64zXkoP?=
 =?us-ascii?Q?Py/1MmSRGU5YxqvOMZzizGwOFXsmL2/h6bbMnYCsE/EB3XCtR+VDV9XP2r1M?=
 =?us-ascii?Q?OY4enbKvpPgk0PQMr7FQO+h7UtqjME/qOanZEwenPY5hwhqad9VZcJneMJuu?=
 =?us-ascii?Q?zUXnL+sPdF1soBPjULzieMCAx9RQJcFROpu3AlM3kEXfzqyqwmpDF9STHC1Y?=
 =?us-ascii?Q?0LgcAfkV5gFgrNurQuRpSY8DS85C827k/5o0rHXbWBzKo7srxC0X6cCaNv+3?=
 =?us-ascii?Q?k2gT6Q3dNGlRQr6X1Sn4w6NActFVRpU59hn3D5EbKN09xlOG1i4h3cSV0EpG?=
 =?us-ascii?Q?0KHdT1bKXLmuZ8FlCh9wwcXT9CcufXDomfk/p20Ajb/WeTg1Euk+VjJWFDIR?=
 =?us-ascii?Q?L/Uducr9N5LovRcLm0+oWbyz8meZnQfkvRJ/t/tOe1HShdOg+qoBI9KVOQyc?=
 =?us-ascii?Q?wJ+vITX+GwzzKWaIp1s2gCP/wwgs5zlu6IcYjqkR4bjQsKgIRWDxB5daWr/L?=
 =?us-ascii?Q?aT9n6vqwyNMWd5cy4QaYolvAlYNqjEqKb+znU8TqEBTBD5JtGHDBRKRLOiVZ?=
 =?us-ascii?Q?Ug4IzP5ZjnRMVzr7f0nv0AODB8JlhSWmbdbCy8+2V+yo8b/KL86/PqG7hlkI?=
 =?us-ascii?Q?Q8gN9w8bArBAm9+lp6grvINBpUE9Tf349aC53grpnoxOAJ5JWY29W3Oyptbc?=
 =?us-ascii?Q?3PsdgnxRji/Cy+qrmDl1GCiV8FvKO3uI0NwWCSA0qg1wElkQxyT6s/EXgQ57?=
 =?us-ascii?Q?VEwVjpgheGKe2HDy10QEKodyvgGRlMo3TRpXUt/MiYcvsXOW5lR+MKO6ONZ6?=
 =?us-ascii?Q?aLjdvUn4/gez3+2uxCl/nDEh+18T8v3A0BmkmnGkH+3iA0Q3JJ1zBJB3FP9E?=
 =?us-ascii?Q?q9jtQPI07E4ezSX9OLrDYw1JWvj6aHsoEkWp+MX2sdR+aJeKcHYjTWDLWAry?=
 =?us-ascii?Q?ZikTSCvgBNXHSW0P/SKF3xKZUxS7HjlSnbqnhID1E5oEgWyZp3nqbPgP4tJF?=
 =?us-ascii?Q?SZk1SPV9zo/amy8TC+9BRGc1NiqqTu6sJfi8u6W056NPFy2xBsZKogmqr+3I?=
 =?us-ascii?Q?jYYcgp59NjpWdpIwBreq6GvCfMbNbfduVTlmiPViPTRgQB/zEIdu2tSVVNd8?=
 =?us-ascii?Q?sjwDbgQMQftBhmb4PyoN9ZBAv14CfAWUYmH0kSEN2tDo2BChfd81bAowGKpI?=
 =?us-ascii?Q?ElsYg2g57CUDH37IxI3Lh5czJQkj+E0gvlqLf3cKRsT44WhQXWnh44Z4xmtC?=
 =?us-ascii?Q?eI/TX+j16wm77+THLWRX+GhLnYBfHzJkFX8+0E+fUJD723pjcFDlZnETRFOc?=
 =?us-ascii?Q?yDcjuTQmekGsCSbPxC05d5mpDtwL1YThRt+8itL/jsRIpk10TtBWy4pfHU3b?=
 =?us-ascii?Q?yOEYtZofBdYOQJ8DIfGZT2DwKOljSgkysgN8WP4joLxA7jqk7Jnb?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c132a8cb-b623-4e27-989c-08defe028505
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 14:59:51.1756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7iip9e8v7WOPwolmZ5fGk4xbcF8RiLsHQN22gS3dsWLLCp6zksnTfg3Y7DG7kQDHZX1QYpd7iSEtJFntOGb3wkCN/IjGUMvYX55QADJSr944M9dQqReDdpev07jbmHhw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10243

Hi Jacopo,
Thanks for your review.

On Wed, Aug 19, 2026 at 04:24:14PM +0200, Jacopo Mondi wrote:
> Hi Tommaso,
>    thanks for the update
> 
> On Wed, Aug 19, 2026 at 12:28:09PM +0200, Tommaso Merciai wrote:
> > RZG2L_CRU_STRIDE_ALIGN hardcodes an alignment only RZ/G3E and RZ/V2H
> > need, as only they have an AMnIS register.
> >
> > Store the alignment into rzg2l_cru_info instead: 128 on RZ/G3E, 1 on
> > RZ/G2L, and update the code accordingly.
> >
> > No functional change intended.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v5->v6:
> >  - New patch.
> >
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 3 ++-
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 2 +-
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 7 +++----
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > index 3c5fbd857371..a2b833e2bf9a 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > @@ -361,7 +361,7 @@ static const struct rzg2l_cru_info rzg3e_cru_info = {
> >  	.max_width = 4095,
> >  	.max_height = 4095,
> >  	.image_conv = ICnIPMC_C0,
> > -	.has_stride = true,
> > +	.stride_align = 128,
> 
> We could use a #define here


Maybe we can use something like:

#define AMnIS_IS_UNIT		128

?

Not sure. Just to share, I see other drivers using raw values for
stride_alignment. e.g. rockchip/rga stores this info in it's
rga_hw struct and initializes it with plain numbers [1][2].


What do you think?

[1] https://elixir.bootlin.com/linux/v7.2/source/drivers/media/platform/rockchip/rga/rga-hw.c#L604
[2] https://elixir.bootlin.com/linux/v7.2/source/drivers/media/platform/rockchip/rga/rga3-hw.c#L502

Thanks, Tommaso


> 
> Apart from that, the patch looks good, thank you!
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> >  	.regs = rzg3e_cru_regs,
> >  	.irq_handler = rzg3e_cru_irq,
> >  	.enable_interrupts = rzg3e_cru_enable_interrupts,
> > @@ -406,6 +406,7 @@ static const struct rzg2l_cru_info rzg2l_cru_info = {
> >  	.max_width = 2800,
> >  	.max_height = 4095,
> >  	.image_conv = ICnMC,
> > +	.stride_align = 1,
> >  	.regs = rzg2l_cru_regs,
> >  	.irq_handler = rzg2l_cru_irq,
> >  	.enable_interrupts = rzg2l_cru_enable_interrupts,
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index b426bc7898bf..2c192d370dcb 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -75,7 +75,7 @@ struct rzg2l_cru_info {
> >  	unsigned int max_height;
> >  	u16 image_conv;
> >  	const u16 *regs;
> > -	bool has_stride;
> > +	u8 stride_align;
> >  	irqreturn_t (*irq_handler)(int irq, void *data);
> >  	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
> >  	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 27a35ef2a6df..a7b6dce66570 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -32,7 +32,6 @@
> >  #define RZG2L_CRU_DEFAULT_COLORSPACE	V4L2_COLORSPACE_SRGB
> >
> >  #define RZG2L_CRU_STRIDE_MAX		32640
> > -#define RZG2L_CRU_STRIDE_ALIGN		128
> >
> >  struct rzg2l_cru_buffer {
> >  	struct vb2_v4l2_buffer vb;
> > @@ -277,11 +276,11 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> >  		rzg2l_cru_fill_hw_slot(cru, cru->num_buf - 1);
> >  	}
> >
> > -	if (info->has_stride) {
> > +	if (info->stride_align > 1) {
> >  		u32 stride = cru->format.bytesperline;
> >  		u32 amnis;
> >
> > -		stride /= RZG2L_CRU_STRIDE_ALIGN;
> > +		stride /= info->stride_align;
> >  		amnis = rzg2l_cru_read(cru, AMnIS) & ~AMnIS_IS_MASK;
> >  		rzg2l_cru_write(cru, AMnIS, amnis | AMnIS_IS(stride));
> >  	}
> > @@ -850,7 +849,7 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
> >  			      &pix->height, 240, info->max_height, 2, 0);
> >
> >  	v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->height,
> > -				 info->has_stride ? RZG2L_CRU_STRIDE_ALIGN : 1);
> > +				 info->stride_align);
> >
> >  	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
> >  		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
> > --
> > 2.54.0
> >
