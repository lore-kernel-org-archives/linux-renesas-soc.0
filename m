Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011036.outbound.protection.outlook.com [40.107.74.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8270E3CFF73;
	Mon, 27 Jul 2026 19:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785180896; cv=fail; b=LbhEUyJu4kEzdsiVg1VbnoCbYVfXn3YcU3vp4QnG+3l9YGHLLa9HiZd+C5pAfV/oJ2BEN+hbiYnIlgLSYUmxFn6XFadR5R8bc/G4AB68TSojhE1ku+CV7+fPbxIysP2KlyCOHJ6VXXif9B98/olPauwVDwmeIQeZlGyBw/fC4QM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785180896; c=relaxed/simple;
	bh=8jcumlqUtDwo2anwjjQ8gMkGPLPfIsTVABkIcLXYpZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XED837+Ox66Hhw+hlj1cE/BLgIcrQVoJk3jX9gwZ2JoEFxM7G7vlSppoWhFyGtP6U16S3d9IV55SSCNDCNnB1l8TZ4Ds5a0WIVw9MYC/yBUA/VfQ+vr+SRhhoTQk7XMLKlkGWRA1M6oLZZa9iDu51rZj8eJvKXsoTaZaYScXEFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=k9lv3EYC; arc=fail smtp.client-ip=40.107.74.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="k9lv3EYC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xy8fwgozKlfIYIwAky7YUo8fR/BtdpnN1bDd0D7k4ZixuTvm0c1BUle5BbR2Owa8fkJ7lI00BjqLZVoovKKfg79auPDQEQPX98JFqoeeEkDw/7wffnAaA+Z2LSdqcrTZqnnXQ3pXbyWy/H/iF8jQPcMtSo//GGJhp0ciqoCPQYdxYsGh2cRzPlX6e8cLJiGyUhE5An1AV1bocJXkrz+xCyegSfZE/y7Bp5nEL4jNjpTtoASgVrN9PpvEp13bykneoWtfP3jMmsnRBlGgd73ziInGF0avq+YB5WR39v0w6UHQIPI/sGxOnn4TQNmXBNgK74RsJYryS9r5gz5HxNWV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CL1e+D8EuXhvtvmtI1+Yf+pf+cT07cwGJ43buxmBXPQ=;
 b=Y+f4V1/dRXBErI19cCQlCKLv112y7yKo6OUmHe9QiOlySDrdqP9/SjSXtbhS4qbiyYmd21xTzoTfvQ1gYK2UdVhR9+MPMVXyjtmO3GGPMHSFqra5SludCs22mIBdbTmtU+BQNfuRe2shCb/JX3mGxk5IZs+Ry0OmPztA9LgtTeA4Ml6830upWyJM+RT4wtiR/QWm2eeYqPjoz8DO6kA7ulGcShXsgZeNJfTXAFEmo/opDsY6qRaqF/UpCkCJVHqUfWJDzQC7UV7G7NmmJ4oVLSbv+Fbg37EJE3UsfkTK5oon9gXNJy9kN/k7FpyWeg5fBLIpJM4CLhTCk/O4FHkdtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CL1e+D8EuXhvtvmtI1+Yf+pf+cT07cwGJ43buxmBXPQ=;
 b=k9lv3EYCcIEPJ3KdSr2z/5JTXbxgciPniPZAUQ1C3uvqpz0bilMcW7KBcxIRKX98ukoySVVAE4QgLtnVcuJa4zJ/T/kb6LMQIMBK122BoyOMTa/S2NUvBa7IgxQO9hPD5XRfytDfrqlDpSmFR7VzFtJlQ3zuIBac3DLT+fWQ/R4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB7411.jpnprd01.prod.outlook.com (2603:1096:400:f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 19:34:52 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 19:34:52 +0000
Date: Mon, 27 Jul 2026 21:34:41 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] media: rzg2l-cru: Move active_slot reset into
 rzg2l_cru_set_stream()
Message-ID: <amey0f0rZAY96k3H@tom-desktop>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
 <20260616170542.447804-6-tommaso.merciai.xr@bp.renesas.com>
 <amcrr7__3gNxZzxW@zed>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amcrr7__3gNxZzxW@zed>
X-ClientProxiedBy: FR0P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::12) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: 401332de-25a9-415c-6862-08deec1620d7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	6fxPk/6+vUR/gBhtkV+uSh7kchUDzCYHB6mtbzV0mHojWS/+zNco0MD2h08ExcUoLb3vwYKAupKgrhWAKg7pU9SpoAKDjsmSnS4oBj/DRGZxN51E6fbffOm+d0vxbKEjwfSWEFSCNST/YktRHUDMYjpYj70XsOQNcFTt5tgNHfyZ8fEcEFzv4ZhxvgrUncWNVgxooaNYYB/NtkSsTB7HekL9D24YmgTmNkYALRtINvTjhpHkfFlkA9pJaCfW62PJycWZTF5KRwd6X8ArdUV4XSY7x6impTpiqfCuEamzhz7p0HaowQv6zVZraqs4/bGkxaJBKQpUsjo+YWyI/ptSnmAjCM0y2quK9GqpTX7zQpiCSFBZNboVZfaLKsUGfhLMmnGfRmNfOL5cjjUkAUaoguao475bD+tVqWZPyoc4hFwk+mXEnv8TTf7xpRBjIzHmionoJr3ykiz1+7FwwJvSOJK7PjnQI1b/dXLOKZvBCnJqQtbTuC19IGNO3FliU3D//wO8s16lpWWkurCYkYOi3awzXGZTPF+KyBg8LKF8LnFZVCdxu+G1MCDu+Dzt4YNrxzTGWXSyxlFXLdDoVu4KpUijEHfY80xDi3mKpbLtB06ZCgSzncQcCaJDohp4sXty+bmmFTHhhytC+z8cZZYBHd74IRvC29UjeddPPOviavQcboR04fOe7oer5aIs1GrLNv0VT8HQyF7LikJ7hW7i/Ap/ydjnr75XO0AT6PjvHVo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sa1EiMlR2l74UlHRXK2pSc72f73QstUT7yOv0/a2+D/ptoUO4Ia1V3+LlWnl?=
 =?us-ascii?Q?IQQnQ9oBDkNMQ0+dpcZ1ktdXB923v8E5KZnYArMwSpp3Pwh9t6+25vDl2Fmz?=
 =?us-ascii?Q?Gd1Q0c99WH3Zqz4qKpsp/vv81YfsuLBvyNq5daeLVzndrtuDXvifsjJgJtXG?=
 =?us-ascii?Q?s7/Rl4iR038nmq3gCneoc+jTsQS97ETxnz7Co5qXGg3VqF6J2xM/u/qzFwNw?=
 =?us-ascii?Q?cTfhexEPDOgBkrb0SMgALjRlsKn6jz42OZFv9CdkXGHjbAsYbcDfeidHyiRP?=
 =?us-ascii?Q?kfZ1BEysYF28HSpYLwZGYEtKFKaRNMBal+qY0WVURH1Q9y+d5Madx+fkGMV1?=
 =?us-ascii?Q?aOOrK5pcFMQ0xfHv1DJyc6dKNJfNfd/V0w8xnVXJCrYPy7ZMAAt/iZaCKUoK?=
 =?us-ascii?Q?RK07eGwEWRQw5oVLl9ScgPVcsRuF9/QrbMxGtfdfEQSEMGKrqoqgvSDlkBVS?=
 =?us-ascii?Q?2vZjU1x+Lr3eecwMFBt7izVmx1VRPE7R1SuM1OWIDFpKu5AQL9qIeBhPHFw5?=
 =?us-ascii?Q?JUIjTx5e6KWhfoSCDp4arj4BabiI0S2RTT/xgc7rUFfJQTQXnUariRUKvvd2?=
 =?us-ascii?Q?S3YUvT12Iy5eut+DDo2SEPJZOUVGcR7/EEPRD3HfgPJ/+SpcpKSZSKjSuIVz?=
 =?us-ascii?Q?2ZIop8HXd9V2Q9FUnbot7/nrVWBk7fSU32WsTJDQZOG8PUDW0W1Ybb+DcqwJ?=
 =?us-ascii?Q?FT0VpiezIw8WjMofnv4dAfusRvHTI5OQiXOF0zrXT/zTpNNxmSycG/YFs+6r?=
 =?us-ascii?Q?IHM2g641WWtRs9u3E+piEuUffC5sv83UVV6IDwXmbZMKeBnd5uTP0kXY5C1B?=
 =?us-ascii?Q?5soatqLGLY0R7TLPUSpFW5To5KS5ehek9bvyutLlg5S1Oas7C0SJjTqVoYzO?=
 =?us-ascii?Q?F649EFpbXzr1CfF2QCSlnmFo11muB1HRF1IOdFGAKLdTJ3157WGsBD0RYrpR?=
 =?us-ascii?Q?l/Fu/eSOrAiW9dE30dsLy+D7lEN0+MPrtzwQcfkNNBdKSe5Z41yDfv2M2EXo?=
 =?us-ascii?Q?lzxHMPR6x4PCgsMBpRzS2s7War5foSf4vb3YJlRTqywivEVWbeCJhpK1xJfg?=
 =?us-ascii?Q?1EKIVpEH1h+7fO9qHvziCJueWiiNi25W2st353D7Y9cb5KVsWkvYNUkh7KQQ?=
 =?us-ascii?Q?e/spjtjU+JChFbV2n3WBUhasboUJ2jTIXMb3YQu0bUN6KIO/E7lRD/JQQEZA?=
 =?us-ascii?Q?WZgQW9L9fYR6HmU5M3tTYTp0oxbdufsHw7gkCEyBgz2GA68lkhUIQhjkhKBA?=
 =?us-ascii?Q?Jn2W727JuXDTlFMFEX+2K5546HnZDlWc9Vrevy0BrTU46z5aU94r/jLkhL7d?=
 =?us-ascii?Q?AfjGge1yuhEmi0clDHcV/H60TYCYHBcoDxdehRgWXa4UURKdXQcAAAE0INdh?=
 =?us-ascii?Q?bbgRn1/tyadyoEikAoiLv+RmsdEQThhZID6LubQPT+lHo3gZksB+lFIuINz8?=
 =?us-ascii?Q?u0+8C3Y0rJgPy19lVPVkT8AIHsz3ZyxX8cx1glDd32u+MoKO5pFz4wTAXHzu?=
 =?us-ascii?Q?zCcYyVm5Nio4Q1e7nS30ve0mUECyM+OMzXgZPpizFtYv5cGsoc45jQzBPtgG?=
 =?us-ascii?Q?p0V0ncZDclT9YDf4lwqh2M5/vSjfTJEkEx8CMUy0ECFNrt85iVvjiKgy6ppa?=
 =?us-ascii?Q?O9c1pil46lWe50gs0qkMg3KBSfDm4pSizVxIZc+a8uNOR7fCM5yM+71/jtM9?=
 =?us-ascii?Q?xn34HAyCQAPHYw1YB5dcWO1qxSjz6JlJz78C4ldWIRZIhL5xohzMyypV/qYM?=
 =?us-ascii?Q?kxGa+h9f8gkLYWf61gZJnOW8xgq/uhphVtIODtbbc/tl9kQu7CAh?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401332de-25a9-415c-6862-08deec1620d7
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 19:34:52.0829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KazvtR+m0hoXBiV2V9NFwh0/ite66z/y93vkCOnneCeBqoCgctmBA7qnJPoJrcuTeUK73D+rXIRvhnja4sOkml9sos35YynDTaZscWdM3q3h+kdbRxXYLkujbDWY0vHj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7411

Hi Jacopo,
Thanks for your review.

On Mon, Jul 27, 2026 at 12:11:43PM +0200, Jacopo Mondi wrote:
> Hi Tommaso
> 
> On Tue, Jun 16, 2026 at 07:05:35PM +0200, Tommaso Merciai wrote:
> > active_slot tracks the current DMA slot index and must always be reset
> > to zero before starting a new stream. Previously callers were responsible
> > for this reset before each rzg2l_cru_set_stream(cru, 1) invocation.
> >
> > Move the reset inside rzg2l_cru_set_stream() so the invariant is
> > enforced in a single place and future callers cannot accidentally omit
> > it.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index e283d9b69342..71d9c671f739 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -559,6 +559,7 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
> >  		return stream_off_ret;
> >  	}
> >
> > +	cru->active_slot = 0;
> 
> Maybe one emtpy line here ?

Ok, will fix in v2.

Kind Regards,
Tommaso

> 
> >  	pipe = media_entity_pipeline(&sd->entity) ? : &cru->vdev.pipe;
> >  	ret = video_device_pipeline_start(&cru->vdev, pipe);
> >  	if (ret)
> > @@ -698,7 +699,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
> >  		goto err_assert_resets;
> >  	}
> >
> > -	cru->active_slot = 0;
> >  	cru->sequence = 0;
> 
> I think it's fine de-coupling the two. The end result shouldn't be any
> different after this change.
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> >
> >  	ret = rzg2l_cru_set_stream(cru, 1);
> > --
> > 2.54.0
> >
