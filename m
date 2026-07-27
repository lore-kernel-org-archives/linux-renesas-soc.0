Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC0F36EAB0;
	Mon, 27 Jul 2026 15:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785166921; cv=fail; b=sC/Xc2u2cU8qxpvGrkEZ3c5gybUULbjtZ9pAuL4m7KnBDl1FskqvX0/7pstSI+o0wrkMl38btAdO4JPFdS+ra8VY71LLNwq6x2+vciMBCTqjjLRdjljCKtf3DbyMVnNItdoIKVYHU6jJFlHC84+IhxKj/HMENmS7kDybFkbMkOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785166921; c=relaxed/simple;
	bh=ZnvlhI/yat5T+LTIpk9y8KKI7QWbQ/+t/P7DmxKfyEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p4PliZwSNcIFDNOzdupGfmwsJOJ3hEdhhK0keKETp7v9J+XwfXgJvD081Xmmaz3NGpup6jx9OxRwztNOlsUnaNfnMf76KfiOrM+soTJbZEApSC4jEMJRV/V5tEBvBZZD15uNloHOEp+hWnOR8b9IL/mqSeSsCLDJOuJjGwfSYnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=q2Vn87MU; arc=fail smtp.client-ip=52.101.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="q2Vn87MU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CS5VLl4KpKaCn8BmlQSaXCnFMtZMf4SdqYd/KUEUxyDCNs7DCZ6ANhHa+MG1Io317Xk3f8Z9bLKIGK+TErRzU/EsZRog76GfcFYUXfB+HF2M6Jf2xtmENUWOzwoqgD6mqVKFl5BTaPj14zhE/cULPdA4DJ7bckI6Vaky6uTkK3UcklmQGf7XRaDy7dmY0FQuMeb2zOF3Fw5f8WnAb44E01biye7fHo0E0+eb9bMwj7Me4vTSQ3o2mcxvQTsqK4Ks1xr32UHdaBQQUq4W6eU7Ih+rY9cTHIHNx0kdznUdu4WLImFTYEdx++uHmYX9m0t4qi4HyWsvA0bUunqxxywmDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbDAGF83SQ6pDy/GQLhFcAbsB7WAPtbYNkthGq0gKPY=;
 b=m7um1UMFUdLedcKWm75h9gnMY00JM9vqj3t2ihhHB/xaDrddGQCiH1XN5lK7shFI4arIEEd7yF3ZiNtz98MMxvyPmofTQmgBddcwcnf27D3B/ULZdx5B5gRKGq5JdYzDLPRIowbubAP8N8oqETw7PTswXSZmYodPu78nbN+ngvpGRueP4bki5I37SeDBVLH2NE9aZtemi3F/tcVZu+e1paBUGbvZ6JN1k2kZ2meaIBsAYfuj/m6FDxh7EeAA+GHYQ9M/7gJGAJ7SjvXcdD7YjILDnsVHV9kWVFLvXMh736ZUeRf1tKoDDLMcVXO0l645h+IFHCqLdLLYdYqPWBsPSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbDAGF83SQ6pDy/GQLhFcAbsB7WAPtbYNkthGq0gKPY=;
 b=q2Vn87MU/+FKwCncvk03bCQjMoYNgRC4MqpYTZ45WF/mPLjIwQ3D2ipeoI95AN+o2XbTxrXlKcOuh3sAwOPd6Ez2wSHUPA3yokFRt4I7rDzhqMexesIyNRL2Arp3/N4BSQZDa1qT0SiPdHhDoDzvx/wFbqFmmdLemz8qez1Sups=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYYPR01MB8231.jpnprd01.prod.outlook.com (2603:1096:400:fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 15:41:56 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 15:41:56 +0000
Date: Mon, 27 Jul 2026 17:41:42 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] media: rzg2l-cru: csi2: Add device_link from CSI-2
 to sensor
Message-ID: <amd7-AqdfO33dpnu@tom-desktop>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
 <20260616170542.447804-3-tommaso.merciai.xr@bp.renesas.com>
 <amcpMBZTD20M9cMZ@zed>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amcpMBZTD20M9cMZ@zed>
X-ClientProxiedBy: FR0P281CA0234.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::18) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYYPR01MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd21fbe-dfe5-407c-eec2-08deebf59686
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|23010399003|1800799024|38350700014|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	wVn7kU68Ea1m80c+LdYJXg7NzgYV+D9D6yZL/DxapHtOD7m8Zj5GaV55SkNzlnhFcaog7v3jht7+gVAYvBsNJERGT0gsOoBlr9w1l86cmDZVDMB5a2fxiTvq/SV4cF1bVHE+6Nfv7mwujpdEd3vplksScuNoplL58ypBn8hUwmYmZFhBIWKpWCwTeHaK6jH8WYnn8hj30R2vtqpGEBJyxyrzTeoS7KKB8mpZ0v9oezQjiQapq4wGVSoDTFkxebDjzTPh5QtG1+E4SiBECjmR8zB9PD4+L/rRkKzjC/wgSB/qlgK8NLcWu8C2OC7PWzg3FKWgbvvOkV0JMIn/R+tky5JdI62eOsJ8dArKqGa/yZc3KKrqpIxk1flB6hZdt5UUHGD/3DxgU8MFrzlHrSr0NX4Aoyb8ndn81dzgy/v0zAkvkJdvx6FUxmWtUF+VoyDCaw9u/4do/5ivl8WGfQxE7RKMcQewRoHDWkp8pRiEugIJdXlQhOEIxScj+1Sglta7CirdGqlvtYhZ1wIDATt1l8pqNha4x8zkjCMhoipnkQz9wx15XYDKeDhMPukkJ48u01aFzm1eBx9QKAcJGUnNgVPh/p2amt1xYSn/yl5uYHhg9gcXgmC4Q6+6aO8rOMlSeZ//YQCPq6rX2uR2ar+KuyPWdPdWGvsYUBo613e1/lAQwIxeMaBT93TkyUBexWds5CEl9jqoIQw9ehQr6X5Rtj0XNdyQmfjMD01zcWvCo64=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(23010399003)(1800799024)(38350700014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/+jfARqAaU8wf7eUnmmb9/1OiaILpP0rBEmPeunEd7idOuTQFHuFmEGJaxQX?=
 =?us-ascii?Q?byENPTpGlUtK4zrsxVX5M27c9e+zC9luAmY1k0JS1P5qmHqTtb9hA+QkiFSk?=
 =?us-ascii?Q?w5NG4VK4117VGrEp1iA80XE7qHzLN7gOWxNg2hbOlXnjP5UKu9mWoLhwtrnj?=
 =?us-ascii?Q?+if+lvYPP7CMOvCqQ40Vdl5H7qaYyDkeRX4U7eYIuNzLCzK0hmOKGQTwnFpK?=
 =?us-ascii?Q?6E5uktCQpOXNv29AHKpfU2T2haqcUJo/BradqC5K3cDeOGiLBe+Vpcl+RkQr?=
 =?us-ascii?Q?0Thin91gZ03hqBd2Znc65PJukD/lZL+3oKohlmbRSC5srV42aRGCYHu/UAj3?=
 =?us-ascii?Q?2rxKhOEWxksJpUjCINYu8tz14uqSemUwKDBroCsp6JRAOU4lhyDH2QpW9eX6?=
 =?us-ascii?Q?RDLtaYtJTSmo7gAFnI2VuvIgVmnURL4pzWhKErFgRIQpdj0yf7VWpHzeVhnj?=
 =?us-ascii?Q?N8JJwdgMY3LbeD/ulxrSmn1nSxpdYKULMd6jO0LTNbqGbXKKsyWharCWZox0?=
 =?us-ascii?Q?fqKFPirLsNXhRxLyYeB9JWhYijl9ji30PrnDgV/y0WRh0JraZBnIFKMr25v9?=
 =?us-ascii?Q?ETyqpQAo4wNfzxg3KoXMeNlSOjWTTWR3TqdNa5eC+n3NSez6DFpRP7aZN1AJ?=
 =?us-ascii?Q?9l8y+hmdQjDcQrRWlhKXnJd/IvlPo9SU8gLbxAtyudmK/Oj6aZwck5mIfxUv?=
 =?us-ascii?Q?yu3CdgoHcUWogF3Hxr46HbVfPaq/0DY7aVaHe54xpSNcD6wkvJbFkPzlBFib?=
 =?us-ascii?Q?SNi0TxEgKHSnyRgUBhAuQHCvdYnXapvpdS0TJgUCN1Wc4qd7v2oo8g/FrK16?=
 =?us-ascii?Q?I87bmR6/9TU52x64Um1HZ34gvsd1eN/AhhItIPNVLEzfi92taWTOwtAiq2gG?=
 =?us-ascii?Q?mewFv8qk8/HGpdqnicR9f0aR77ws1OlV4uzaJPDdQ4+ZMXspHK6Q7VCNXtug?=
 =?us-ascii?Q?/U5l9uqsz/3++xy8HVFKu4nbEsnfUtO0Qql0o7YpPxo5GvPglgzsvAYLT2Wc?=
 =?us-ascii?Q?mj9+DfwQnBIY0fxGWDUIJU/b9Z+mijhIPhqym/nm9riMw0Whd0F2KvKIuaxH?=
 =?us-ascii?Q?PPlOGXBOh9uecaGN5gQUsvKQ5Vnx84DWyqS4sZKgqcp8gpQpyBRFqTwqXt5L?=
 =?us-ascii?Q?yfZ3gYJpofaKiYOfFLj8HQ/8+kt/kwO5rrsYc8x3Gi704qMJPkmy/DM+0Pl2?=
 =?us-ascii?Q?DgbPjjsdcQuQJsZqbqeU95ILM/TmIxpnq7iz0bsUDQQ/EnR/Ikcwg8TbOFu8?=
 =?us-ascii?Q?QX/PqMjblOCzgk6hLvJJUwQcPkZ2aXsQVqahYSjv3hoJX7M5mzUUjp1Feusf?=
 =?us-ascii?Q?887BAOuqg+byJCLuhqKRlbxKf70ZewAbis5McI/iIunsxnu9XvV2/sFKVpPB?=
 =?us-ascii?Q?BISCQDNtG+As8at6gl9CvguG5XA5p8PTvWqjn4CcE87I74CEPfh2potoo6ag?=
 =?us-ascii?Q?mvzXXRdpG0g+XZ5REHZlmZ8bauW9NI0T31pdl9qj3VVVQKzKFL5tQ4l6Vy0d?=
 =?us-ascii?Q?F4tSYmju5AmkxXMWIEVIwXO4P7Gv/dWQR1Q4FlB0UPnt9v1M6jPoY4YTDwQf?=
 =?us-ascii?Q?FwG7g7hahGTZZxhFD+1/xNOF5QLOIhh/ZtK5UF+YTfy3kMOKhtUS9HexrvBh?=
 =?us-ascii?Q?NqGwZRe/MBqbOr8TkGn3g43YNDoHarqCs23TAOwY5xvcALHzWOpju3aqzWmT?=
 =?us-ascii?Q?2b+OcBynldByUXCXgwDeKzLN9LnBcYx5dyfUrfMgzkuN2JSwT02z62yMllCH?=
 =?us-ascii?Q?vhamCbGq5HJo3BHcuEjatoDBxpW3bylVXfglO4nial9yz3V888xh?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd21fbe-dfe5-407c-eec2-08deebf59686
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 15:41:56.1233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0ZEtK9AzUslegA0ToxXzYfsFn88iY33rN8rgAsoZPO+DLcxp3Nb6DsTGkpDY+LJLfvxWBOX2ZNGP7QpR+fkmX6Llj2Q4ojZsnTrnu3l9DNhpGc2k+O8w0tqwOko05d0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8231

Hi Jacopo,
Thanks for your review.

On Mon, Jul 27, 2026 at 11:48:59AM +0200, Jacopo Mondi wrote:
> Hi Tommaso
> 
> On Tue, Jun 16, 2026 at 07:05:32PM +0200, Tommaso Merciai wrote:
> > The CSI-2 receiver depends on its remote sensor being powered and
> > configured before it can receive data. Without an explicit device_link
> > the PM core has no knowledge of this dependency and may suspend the
> > sensor while CSI-2 is still active, or resume CSI-2 before the sensor
> > is ready.
> >
> > Add a DL_FLAG_STATELESS device_link from the CSI-2 device to the sensor
> > device when the sensor subdev binds. This instructs the PM core to
> > suspend CSI-2 before the sensor and to resume the sensor before CSI-2.
> > The link is deleted on unbind.
> >
> > Move csi2->remote_source assignment to the end of the function.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 24 +++++++++++++++----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > index 6dc4b53607b4..3a4bc4ef72fc 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > @@ -773,15 +773,28 @@ static int rzg2l_csi2_notify_bound(struct v4l2_async_notifier *notifier,
> >  				   struct v4l2_async_connection *asd)
> >  {
> >  	struct rzg2l_csi2 *csi2 = notifier_to_csi2(notifier);
> > +	int ret;
> >
> > -	csi2->remote_source = subdev;
> > +	if (!device_link_add(csi2->dev, subdev->dev, DL_FLAG_STATELESS)) {
> 
> As cru-csi2 supports runtime suspend/resume, should you also add
> DL_FLAG_PM_RUNTIME ?

You are correct, as this driver supports runtime suspend/resume it
makes sense to also add DL_FLAG_PM_RUNTIME. Thanks for checking.
Will fix in v2.

Kind Regards,
Tommaso

> 
> > +		dev_err(csi2->dev, "Failed to create device link to sensor %s\n",
> > +			subdev->name);
> > +		return -EINVAL;
> > +	}
> >
> >  	dev_dbg(csi2->dev, "Bound subdev: %s pad\n", subdev->name);
> >
> > -	return media_create_pad_link(&subdev->entity, RZG2L_CSI2_SINK,
> > -				     &csi2->subdev.entity, 0,
> > -				     MEDIA_LNK_FL_ENABLED |
> > -				     MEDIA_LNK_FL_IMMUTABLE);
> > +	ret = media_create_pad_link(&subdev->entity, RZG2L_CSI2_SINK,
> > +				    &csi2->subdev.entity, 0,
> > +				    MEDIA_LNK_FL_ENABLED |
> > +				    MEDIA_LNK_FL_IMMUTABLE);
> > +	if (ret) {
> > +		device_link_remove(csi2->dev, subdev->dev);
> > +		return ret;
> > +	}
> > +
> > +	csi2->remote_source = subdev;
> > +
> > +	return 0;
> >  }
> >
> >  static void rzg2l_csi2_notify_unbind(struct v4l2_async_notifier *notifier,
> > @@ -790,6 +803,7 @@ static void rzg2l_csi2_notify_unbind(struct v4l2_async_notifier *notifier,
> >  {
> >  	struct rzg2l_csi2 *csi2 = notifier_to_csi2(notifier);
> >
> > +	device_link_remove(csi2->dev, subdev->dev);
> >  	csi2->remote_source = NULL;
> >
> >  	dev_dbg(csi2->dev, "Unbind subdev %s\n", subdev->name);
> > --
> > 2.54.0
> >
