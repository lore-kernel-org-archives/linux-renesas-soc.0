Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010044.outbound.protection.outlook.com [52.101.229.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7713F4107;
	Tue, 28 Jul 2026 07:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785224623; cv=fail; b=HB1VGoww+0zbD8g8Jb97y6wgMEw7VTZPoiFMPioATbrn0MtUzXPJiot97O8pr6HO3KxvRs36emRPv3vo/F8KxG6MEBLr6Sg+SICjS58b1lyeWM3b5NS5mYQSA/0CHCf6zT4f6ikpuIKHGmpdnD5GDM8xQ1JCrAZnTBY24dIRbfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785224623; c=relaxed/simple;
	bh=4uu9TsqIIL3ykR4Y+2YjlJypz9cNihsJtTO5oQ0jQP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Mtmav47y/O5npkFJBnvO/P8ijJN6DyS3h8JtoO480TMTcF2vbp04UUTUcTapKYAtCM154Pz0DzQk5MVOArHjLOXYgm7C00hFQmUX1PwZZfkaRn0Iady2cXVEs5INT98+cz/0eJLZcUnKtK0vcQm68GNvzmjSyiepjEMToTPBGWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JK125+Ym; arc=fail smtp.client-ip=52.101.229.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JK125+Ym"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W40m105LEAyfloA5l9GqLjDbk3WCHQFimzqABI9eN7QYQaygj5CRaGwM3vQjR2W5xtu+uaU5sFS4AVdCgcihyLOy7VXD69cxP4JjFsFy3VTIWmp6mX1ml2IWEWIr5SWCnEYCGTxfspdK46rs6d1IV7laYiMtp9SO6s1rIYH4bLWUpN0wF6p0nupMusbFSa0sffgoNfC0NmDE3KCsCcMU+8hxXugMsu8hOIfpHIrqYro84kMU/y0GuYe6KUghLWDeKdZvlaL38CzV2DPLMGCen6711gPK+o4VL5+B6DKn2nWsHPacWV6NvlYYlT4ru8/ts9nXj7QH2xJZaWkolgB0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1R3hkLyJ76bers5vhaHnJRxyd9E9OaJ42Bv9ul9784=;
 b=s4L49/x8gT7Cu4t1tO07PAF54xMa4ZKwItOdR9o8pb6VRdcvikUozvF8GW6jrzwZ+HKKLh78NOcQpVrELFC/Ps4XRMC1GNTnO7whWSs+HKynNJUP1kSD1eLu8sqbrfKx+Uh4pGcLFcFPB50Vh9MsOU3yn3uuVOHaIgePYyOgLCTM8ePOI0XAjMpJvqVlxmBUCQpy3upu9KAZYWdFSpyhYT/hmmdqe+c2RVX2IZ/t5qDpaXebIvh5dgT7HhwYgmIYnRP5hpQlaMtjGjnJk4kXRCLWynCB8+vd4/VR7nSbJkDmryX+pMSbDm4a6EZBsdVdo/ZTRlKYIhJyAzUxugbXLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1R3hkLyJ76bers5vhaHnJRxyd9E9OaJ42Bv9ul9784=;
 b=JK125+YmLs0xwzsKYCmvJhMRrny9SJrJcCo3ROt3D6IrX7uNYf7pEMifL0kGLBTH0qM9Fak9JZMU5p3NgqerRBilDSNttxpYpMiJpyk2OToTAY+m5yTrFZ3ji3M8G3l0I8u5dD65xuzA0CmVc4ruCEmXrOxD7vR9iNJ5/YTijDQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYRPR01MB16127.jpnprd01.prod.outlook.com (2603:1096:405:2eb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 28 Jul
 2026 07:43:37 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 07:43:37 +0000
Date: Tue, 28 Jul 2026 09:43:21 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] media: rzg2l-cru: Use bulk reset API in
 rzg2l_cru_start_streaming_vq()
Message-ID: <amhdmQEK38xg22vD@tom-desktop>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
 <20260616170542.447804-4-tommaso.merciai.xr@bp.renesas.com>
 <5ab83f63a1c5c62cf90f7cb15590c3e4cfc18436.camel@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ab83f63a1c5c62cf90f7cb15590c3e4cfc18436.camel@pengutronix.de>
X-ClientProxiedBy: MI3PEPF00004E9C.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::458) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYRPR01MB16127:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea9d366-52e6-42c4-146e-08deec7bef4d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|23010399003|1800799024|38350700014|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	vJ2BvWnwyIwHy/d1TIJwtA27bIQmQA/Cro2lGHiag6+lKw5QiMQ0ch3n0SSlwKLotlUw5FcLkRjgYvK1zEvZlEBWfVGzMCLv+o2V0ZkUforr4QHahwhgfobOixDT1fIC230s7Q5Lhiz/4WGQRgxdg+W8YekjQbr/zIDqrDM8KRywFs/AlAo0RcUWx63kzVFjTclWQSJH3byFUu7jXsejIbvJ8S+OueBT202zp/Oxva5F036hbTbaTORvHbMzx6dvaFtT8bRV+pszZ5ht4LDxpF5Vq386GLGQWwwWkS1KXkrxf+DN+8SfnHB18SBPnaBH2+jJe+jxA3ri3EswWhKI3nHcjhxiK+SSoPa7uGFf6Gp9tS+cKnIcp11uuSHFBhPPFhevK+ND80afM+xrpsoTLzr66fihjbL9Oeeb1CwSccKpkck0Kbgg2HhN0aICRHGwW4Jp2iNy+NLivziSU6Bcmjynx2p/FntVNabRT9/9L2nnaXtEKbn/unD1cNX836VvjWqG3MlWWH+jd/UhypxxnqsFJKjBSzsrSvfSKSP79Qc5RUHmty1rqnxwlFySazyTIOr2fmNI/e1ugRJWhiwlaoo75szgxqD6cliMwW65xVcmwNUPmdD6fE7yMXndN7XpLK0NNmu6yg1zNA7BEWAPDbe/p3i9hQ4J5lSOgySUnRBbwgh7icI1shalz4Hpga0tbAdT8ileOtvu3qKy4iIGRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(23010399003)(1800799024)(38350700014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z4kfxAVinyubEnL6QhpkX+XNOqDS4ePRltcoUOlm2feDQjt69a0JQJFImKBb?=
 =?us-ascii?Q?elbuB1iAnD5PmgzV9RtKkFbtKBTaUYCWy7YMSd3wWOlQc0jmg4RMk72xo0oF?=
 =?us-ascii?Q?QX0bPLKHsDUqYU31SMpVv6TiJJyE4fx8nRpzwxWwfhbXjhFgcGGB4IJXmQyD?=
 =?us-ascii?Q?AGH++Nl9+SrZamX7QzwXi/nP/GclJg0I36GF4YrDQ8Pd+v7Qc9im0wMEoWrF?=
 =?us-ascii?Q?h9Erx6MS2EvfZlAlNZ84L+APweZmYsVSaQfzZJjB09BggfLG0BCnrxd3Oyoz?=
 =?us-ascii?Q?2FerV86eJ7yBEcmHZ9lDYcOS+F+ZgyXJB6OphId2PhCVI/x7hNjkxEk7y2Rm?=
 =?us-ascii?Q?TWmTcXyCJH8teeA1zbvPEEqKhdtJL6OIf/j55qHxuebpAE3xla8FsjyNAYmC?=
 =?us-ascii?Q?je5+NeP0CTUc2InHbEJ4nGNHR8sWr2Uk3ZWS4RHJWY1LCGL/h/DPD8SCKKdA?=
 =?us-ascii?Q?Cwg0ZSXqYj4HGAttKA+tRMni6sZrZzl2fJQd++b22uAxQZK6iNjucn+QT8xS?=
 =?us-ascii?Q?jEh6ZHBi1KgS+6phvyOykH4VkGNM4rp8CNToijrYcTr7Orb48BbqcAH7ewq6?=
 =?us-ascii?Q?Vv38EgwuhWRonJ7XZsyxyf/BvbamZkbseICWpBDIkv+N+ZW/UI0EjA5NL7+c?=
 =?us-ascii?Q?JuSRNNLCCPiIhOZp1ylN6JbvD1nWIX+xw124YaZ7EFjGhOvlcS1P1ZO+0Gr/?=
 =?us-ascii?Q?Y20aRlkCMgMIRoSv2On4Q7pQDPkjvbDkjUoGTBheaMxQyvgvaXZlEFBlMyAH?=
 =?us-ascii?Q?1gG19AvTCWLOaZFJ8Gf3tusoKXYGgAuoLNwIIDga3pJB6UM61Ee0Jqd/6xzV?=
 =?us-ascii?Q?4VEVyW/1Fvnn3++nr/5xAJOwCfehG/6KwVWFFdB5MgcAQG6S3QXYS+qWVoJQ?=
 =?us-ascii?Q?NMqqzgmXDZmyJQRiZNY4mANsxHwz4qVGJSO4t53+KDyNQZEbfmUGt7wPBrCj?=
 =?us-ascii?Q?7UyPm9NYclPkwCVITqrzP/2x0ChNXFTlsJgQcexyod4kV9/j/u5EifJ/rMyB?=
 =?us-ascii?Q?SgtUK9s2yG7sp+juCIOBlvxj1kRn0RtwZBERbXAB31x/sib/hUfRenaYnliA?=
 =?us-ascii?Q?a7MAZJ1FcSt1SDnQ/eFQ6HUQThqwTiOx+0X343l/GTpF6LW9qOFyp3sHPVK3?=
 =?us-ascii?Q?yZtxuZ29j+un3LfgCnVbtS9yqaqEW6gpFr6nqrqrfEi0fDvmuOdiPTTu7GdY?=
 =?us-ascii?Q?a24M1Hnjkuc1JQUmlddoH1uv7V0xHlFNxDZJ/ticSMWNF2gFTpqdAHfllm9f?=
 =?us-ascii?Q?Hlu/hCP9gB+jp7BBjOQ3PW4Y64MByhN8RM+BWcDN2L/5XTF3g8dZarl0QPUf?=
 =?us-ascii?Q?/dhJtsn0GwxgIXU+dM72B6m9yB9KMkHSMdMHqx6VGbMuETmmYQqQbMUcXAvX?=
 =?us-ascii?Q?+laT4jAWJVyWeY33ETQyVpIrpERWBT6HJ9jvm9z9j1GZdrjrlY9j4iZ5dn15?=
 =?us-ascii?Q?swqy9nBxN3qF7EEBjqhORCnn6yBejbEPj8jbFKOD/bLxE2DdkGD3xoDXmWJz?=
 =?us-ascii?Q?QsZBwwOBQpzxeMtR1wJkkO6vGJtQxw7ROLN/7T8me+xBNSowIDQdIKgCg4tv?=
 =?us-ascii?Q?fl8UPW9Jx9PP3k0t6ZRw6ckHUbylaSDqx2BgSnQIMdM17mrNi1jvkm/pBYKF?=
 =?us-ascii?Q?NiJmMpKgzcwG1nILyo//7VmxcLLkXG5QamAQNTzU4nlsL8pdDkoVx4LTS2iz?=
 =?us-ascii?Q?fcg/vTsaSX8UCyd34DCGxdumI79xsQc5IIDe80GrOyTiJO2ZIIYA+kKwghPG?=
 =?us-ascii?Q?EiyZaR+ABkwk1w9jN6+vFIwnhP3ITh4XdCnIflRJUCiDOuk0pOfo?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea9d366-52e6-42c4-146e-08deec7bef4d
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:43:37.7677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+ZSF5B9GdB89n/fEHkg5r1+3EeyOV7QRM1JAm5JRAkuBljROvSWxnSiwx65DBsgQysvZ16eURFZlm22jVC+RPVdoLGlJa54k0wasJ8DFheivnW81O2ZZVd1zjOsfUe4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16127

Hi Philipp,
Thanks for your review.

On Tue, Jul 28, 2026 at 08:59:07AM +0200, Philipp Zabel wrote:
> On Di, 2026-06-16 at 19:05 +0200, Tommaso Merciai wrote:
> > Replace individual reset_control_deassert() calls for aresetn and presetn
> > with reset_control_bulk_deassert(), and consolidate the error path labels
> > into a single err_assert_resets using reset_control_bulk_assert().
> > 
> > No functional changes intended.
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 23 ++++++++-----------
> >  1 file changed, 9 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 5185a547461d..bf61a74f8f74 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -672,6 +672,10 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
> >  static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
> >  {
> >  	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
> > +	struct reset_control_bulk_data resets[] = {
> > +		{ .rstc = cru->aresetn },
> > +		{ .rstc = cru->presetn },
> > +	};
> 
> Why doesn't this also request the resets in bulk?

presetn -> is shared with csi2 ip
aresetn -> is exclusive

This is why IMHO we can't request the resets in bulk.

Kind Regards,
Tommaso


> 
> regards
> Philipp
