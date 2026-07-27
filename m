Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F923F8EB9;
	Mon, 27 Jul 2026 15:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164547; cv=fail; b=fhFFpt/e5aBqsi+wMfoMAtpYAJ6BBmTk8DbD5RUP99e/+tAha5O3DqxB9UoOyh0NbneOZh/NOb+wC81dcVMpEUDoMsavlzzkvth7voNu0iVA8V6PvzX4Ev+NbrMKooRq8SnUrypKJVRGIADoP9Xou2qykIc+1cr6IKJk4VG7jeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164547; c=relaxed/simple;
	bh=02Gsu51lKxbdp/yboX6f0dhwTPxWx96FpeKtlpsYeM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tkZSbYGPOJjzS0F2HCHEYP64/Q78UnEHtSoozh7dp61yBIiijslgO97jxAij3aLuBkN8BgQUKTEVykyoNGO4SBPlJZkK1WHvpEg4mpC6UOZbbNUknTJrjA/vAeIWNVBjnuyWBg2mq33I5FVmBDT6m4dud4o/+okG5wQfPd8AVlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=U+58h9d+; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="U+58h9d+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+/bjKqpJJ/3i0XtU2cU5CifPna3nsggS1SHFs2dAEqcpSqkePJd3XsMBNIVCs4CdVBEgXqM4M7dRpdp/yHzgqVMlTQ80HazsseynmwX0TCQ6x9nZDA7r89YdS0qHRkRhs8P0bJweb5IqS0JmLYBxi2qb8E0lE6EFvFFLBfAS8dRK30snYU0O3C1vfD1m/Ma3tUa/lpwCFFVXPDfURZIIyR0yAJM8VcnMDn07wPd4cwPGA3dKOZ3Cr5GHNTTEos2plie5Kwr+fLpgQPwTGGzcTzx1I6XoCIyOnFkAQfMGkEQG/tVy5XaX5ZUAY+ff/abaDUKg59+E/Rh7vOc8Zfg1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5T78vLHTw2Npn0q8LBrsd4q5/T6bMpf6R2eEFpgpx4Q=;
 b=iPCog7Du+yUthqQolZaxBu0T7+PweRQYjimnpWR/qDNXGzDw1WF8e/ikMCBTsZXy0jva+VA2hatn/FXOZ51u7OrJZw6/ZilvBGa8VE05vYg+lYpIF9hVZN1J8H/0o4NIopDJpR3FCaQGbCBiOctzcCGG9lSRciEhXgjpWdpJZGnzEjgzMDVKrwVitgoYsJCLQKZtvnx7L1xBarssV2JULcOrBGKhPDz/bgaCQ/uDV56pkcWdnizuca3TBfO+u+S0fYLM6c9p8Fy4ypGbprgabeV4iisaQac1Qh262X9ONTd6HPJMDaDXdS5Xsh05pnGxsc+KM9PNrwDrk5wlYdIHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5T78vLHTw2Npn0q8LBrsd4q5/T6bMpf6R2eEFpgpx4Q=;
 b=U+58h9d+0fFqUu98/4kXffcG/ewSGGCYsmlci2w3X7R0h7+0lI0CtEVqcEAU5M4GmVMZdeLz+F7Hk7hR3AK5gUfb4ZmakTKLyHVtCnbqwmsAe5G5kl5DQVkJs1dGyVmvD1tEOHO6nRPOyAS5ljW0SrUH8K44X4/F11GnZvE+u5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY7PR01MB17763.jpnprd01.prod.outlook.com (2603:1096:405:38c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 15:02:22 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 15:02:22 +0000
Date: Mon, 27 Jul 2026 17:02:06 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] media: rzg2l-cru: Add device_link from CRU to CSI-2
Message-ID: <amdy7npBAxLBx0gd@tom-desktop>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
 <20260616170542.447804-2-tommaso.merciai.xr@bp.renesas.com>
 <amcn1m-RFmVdeCsE@zed>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amcn1m-RFmVdeCsE@zed>
X-ClientProxiedBy: FR0P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::16) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY7PR01MB17763:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d72b69f-2072-4b35-3589-08deebf00faf
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|23010399003|1800799024|38350700014|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	bEceWsSElr23pQR6u/x/GLkPPl0SML7o98KfibgI6RvHeOb5OcTmpyiiMojdMPEse2oiRGAsD7IDFqZdrDzK5ksXMYmGSX1o4yVDanYfmOOP0UU265PbIxCD9BXW6r+39igsA+Og+Xe7br5OEFP7+/a9FofsFdVIijnBTuLxN7o6i1gNtVBUy9+uQyO8TI/ZNxyuzR1StQFCPQTaK/akPWwjhqhI+Iiva52HEBNyvvCTTPDgCltDn18xhm9hn0HKGewG1e2cEiho+YP4Tb9V4sO2zBu43H0JKRvvl4hTD70rpK1Qeu7VdCvOCx6aCVg4fyti8l23jqbx7Fr8PhkgtNEbuLtnNYDNrjJ182MxEZj6kdcXFmdKridv+pGeiaZFVU3w9SrdDN+LSNuuJY9ZlCy50bO5GkhFutZjG2fGC98c+2kjK17zhvlg0OiGc4cSmGFiO4IqAXA5viME3M4zdNIM0qZ8EUId71EjM8eU4NYHP6q3OOx2xGWwDhMfSYPnGETkDSq2qCLYgoxIsWyG6vyBrDEK7V4MaEusr3a0MyD3StTzMOge1t5mKdpnNz7TnUvhXS9Nc8nE8B163LsgJe2uP2zVMg6EGEVvkjFjOrz5GWetgiM+i1QqoZMbn6Pn8a0TI8KKi8U3DWRnktQSmiW3wfkaZ8nxpI2P6tS/LX5NQL3IlctScD6ygsSi6x/Dl20R9awLnhv17qR0lRHJ5VEg1gTj3JGJLBYBHGb3Pnw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(23010399003)(1800799024)(38350700014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fzGcXvXBKFxvAru83Ej/o47s2aw5f2s1Dd7N6r980yLdb/ShZE0NP4d+PrKT?=
 =?us-ascii?Q?KQBU+LaC06yRV/3IHV6SJ6K+Q1xRTCESU4cGGYPGmhyMK8x3fQcNor6dXdzK?=
 =?us-ascii?Q?hpMJSzjCqLjPLxEiLaL2i+iSdsB9JbqwvXignReuSYX0cT+qzolZpmy4UpP6?=
 =?us-ascii?Q?WTRXkpEkiSxSgOu+wHqGkQaC4hkXSJd0pUlB+9V1UwDciLxmhd+YOUIcBzjI?=
 =?us-ascii?Q?Uva7e95sTNHxlS9YQQ2zqUurpjdONWCfLxLrkPoIH9vgUWupkMdtsC0HrPp5?=
 =?us-ascii?Q?aacYrgZerByd9DL/X4Wzx8C1ZIMj4lv56nYcs3Wp2XsaaM0+NNrY6BevBnDS?=
 =?us-ascii?Q?nEPYEaoaY2r1g3uR7VVmBJz4hMIJjsBk2TidcmYzdo3tRe3xHu12Bg/HuV0l?=
 =?us-ascii?Q?cNSJpSvWXzmsvWVAWUxBh9qn/LN+yX5gMmKzQW1GXc0G9DTwQHYrzSjXKqhd?=
 =?us-ascii?Q?idCQ2v87/1peIeeSaxYHuMysnp1yyPGTF5/7IJT5kIvVbT3jnjUSPnn1p8Br?=
 =?us-ascii?Q?9S+vD1vR+u0nhTtzMYZ9q2zO7Qz7DrGKrQnna6VvYXUhgxOcgrLXjhplg6Cm?=
 =?us-ascii?Q?t663OE3Qc3wI+nDrNdpABjDL1+GHfuim52Cik22NVpSMTqFR/6fqI8tNU/i6?=
 =?us-ascii?Q?kBp9K69MEJGrxwRy2SSTXYyh2zCYVlRj7TFIti8PHWBmztfYbV8Ob7a9VWLx?=
 =?us-ascii?Q?OR94ka4zq/8gUk5UkM8gWnvEU3kggp7hMzook67E+tQpU95MynxCGZtHH5Jq?=
 =?us-ascii?Q?ghLR/gQquQ6pEU1Y0EJCkTFC5+4RFqAHjwA09NO3FG4n8Gk11Tkvug+C4Hjm?=
 =?us-ascii?Q?3AsscdZhl1WEAqd+mmTMvAFtPLcfnbGXI/j+XO+/tNeriXt91DhSq6mPdr8A?=
 =?us-ascii?Q?al9HPcbDKTJPfCwVeGf9yJ8VZC2kE2YqGB4TezY9TuLQW3pOXZkUB17yW2nh?=
 =?us-ascii?Q?PZq5Kgmu/6+VLTdU3hKUqVzAfNEGDgT7c0SJytuWW6qgRmyFbsfeohHmj05g?=
 =?us-ascii?Q?iPCjp6haIToD7vXE9bJtlHXdHGykW2RnLNMbKOTeFC23bP9dW3Q7Yi2mMhpM?=
 =?us-ascii?Q?Vkj2SbBOl+eKGm2KuJB0eaCtWWDbrboYWAIhqycSjt5pseuSZZHyzXeUdfzP?=
 =?us-ascii?Q?sEA9soN1YGQRxa3lJ1Au1AYDZUy2Wj9HE6xhYzrs5BGptTPnyTnKQBfCxZUr?=
 =?us-ascii?Q?mt2NFCNiIrbmzn0xDMJuruZop6jXiFUIPm7GBVJUP21wEX4fimR2vQEYoUwP?=
 =?us-ascii?Q?pz08kRd3sciOT9CG5EvO2WdsIOuLAnMwAwFWIjsODnOLbf25x4io1NdoM0P6?=
 =?us-ascii?Q?gD5z9L/nob4LXC+oK1HSgSbunwE2Ffv4Sd+9u8zDzhUFcpKQvP/1+d9pXTpr?=
 =?us-ascii?Q?mks7/KZFUxXaQIauglJ6MMNa1uKRJrZVNC0rmn50olh+uQ9/1erLK4xnKk3+?=
 =?us-ascii?Q?TVYfs2t3RZ4TZF9sivhKl4aOLHqNYDAWt/J7DJcAe6xdFlx5Ad/WyqBDWHAw?=
 =?us-ascii?Q?PDj9x8wWQv/yfdZJs49dDX9A9bWJJkaEsqDs92Mjoe+W3E1Ge/yGQyVfUe/J?=
 =?us-ascii?Q?9uywYhS8GTx0xrh3yeMOvz00ISUekJWwDmLtH7dE2+iXCqCahLc69nlOkR9u?=
 =?us-ascii?Q?vb0gU91St+AdeGX3GAxrTTVdaqzYtrtKb+AZTGxXj9azZgYPti/3/t9pSXKw?=
 =?us-ascii?Q?yDUaRqc40wLkcP0mGpnWn7sC2lrctQx/Ej1fvjo8UvbkgN1x3pKGkVgpZ+zc?=
 =?us-ascii?Q?5Qji3gCWs1xTDA926M3jaGVY94xdzUOveI3KCKSAGZTdMzWTuicS?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d72b69f-2072-4b35-3589-08deebf00faf
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 15:02:22.1904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g54Dk6+bIhFNAONUssWJ5vdFKpk+vwuyoUTEtKXSiuhj46gViauADqbfF0NHIX4NjgmCtgCdH8Pc+4qlVb+opTyXxyBoQYekSEo4cyhDW/Xf65kJp4b4Hp8Y2Ef473gj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17763

Hi Jacopo,
Thanks for your review.

On Mon, Jul 27, 2026 at 11:45:50AM +0200, Jacopo Mondi wrote:
> Hi Tommaso
> 
> On Tue, Jun 16, 2026 at 07:05:31PM +0200, Tommaso Merciai wrote:
> > The CRU device depends on CSI-2 to operate. Without an explicit
> > device_link the PM core has no knowledge of this dependency and may
> > suspend CSI-2 while CRU is still active, or resume CRU before CSI-2
> > is ready.
> >
> > Add a DL_FLAG_STATELESS device_link from the CRU to CSI-2 when the
> > CSI-2 subdev binds. This instructs the PM core to suspend CRU before
> > CSI-2 and to resume CSI-2 before CRU. The link is deleted on unbind.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > index 3c5fbd857371..1b12d91eaec9 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > @@ -101,6 +101,7 @@ static void rzg2l_cru_group_notify_unbind(struct v4l2_async_notifier *notifier,
> >  	mutex_lock(&cru->mdev_lock);
> >
> >  	if (cru->csi.asd == asd) {
> > +		device_link_remove(cru->dev, subdev->dev);
> >  		cru->csi.subdev = NULL;
> >  		dev_dbg(cru->dev, "Unbind CSI-2 %s\n", subdev->name);
> >  	}
> > @@ -118,6 +119,12 @@ static int rzg2l_cru_group_notify_bound(struct v4l2_async_notifier *notifier,
> >
> >  	if (cru->csi.asd == asd) {
> >  		cru->csi.subdev = subdev;
> > +		if (!device_link_add(cru->dev, subdev->dev, DL_FLAG_STATELESS)) {
> 
> So, cru-core and cru-csi2 are two different drivers, guarded by two
> different config symbols, both live in drivers/media/platforms/renesas/rzg2l-cru/
> 
> I guess it doesn't make much sense to have one without the other, but
> the build system allows that. That might be the reason why you used
> STATELESS here, but since this call happens at _bound() time, doesn't
> it mean we're sure the supplier driver is there and has probed
> correctly already ?

Exactly at this point we are sure that the supplier driver is there and
has probed correctly.

DL_FLAG_STATELESS here is to get the right suspend/resume ordering
side effect.

> 
> I guess you don't want DL_FLAG_PM_RUNTIME as this series is for system
> suspend/resume, right ?

You are correct. I'm testing continuos stream over suspend/resume using
RZ/G3E SMARC EVK with OV5645 camera connected to CSI and CRU enabled.

echo deep > /sys/power/mem_sleep
echo mem > /sys/power/state

Kind Regards,
Tommaso

> 
> > +			dev_err(cru->dev, "Failed to create device link to CSI-2 %s\n",
> > +				subdev->name);
> > +			mutex_unlock(&cru->mdev_lock);
> > +			return -EINVAL;
> > +		}
> >  		dev_dbg(cru->dev, "Bound CSI-2 %s\n", subdev->name);
> >  	}
> >
> > --
> > 2.54.0
> >
