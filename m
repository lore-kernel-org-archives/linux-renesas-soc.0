Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5CA3CBE79;
	Mon, 27 Jul 2026 19:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785180751; cv=fail; b=upEcnFPPjctscnTqJHY8GYrRSd6V645sSzadYqV8/32CLq6uZaZJMsVNgcjT/wYYiqtCEZZKX5BFbTogbYG7dFcAJhGH0e/afDzPNGGnxTj5XOWLUnp+K6WyvJ42YjsgTcdHbGy3G63fijlimlVe0f8JvVMB3y05GMloMPPFjOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785180751; c=relaxed/simple;
	bh=SkcOkXqRfTU5v8ieSPTyveCwrEvlAutciJB7PHEf4SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RAvAgTQEqCpMktWab5/sxscXUinbpP6lEsmwS7P6gN8+dPq2KS8Evp3rzeFIjeHlfz4S2/Vnj2IBlKhQKathk1I1CKQAkqG2mU1F8mTjIvZi1CFbLOEpGka6VOimH2IL0oBWv/DrCEbl7mK6qYxDKqqBsxoDIa3gK2qBaXqu6hY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=swM8aehd; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="swM8aehd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/BGCkt6YMABDi0Z+3V84Avo8QF95ME63q92Mb44C8ao68+NkHNIUwGRsZK520nvzpuRqoF4TTLJ//07A6WOuzVBtzJEFCgTqqP7uR6A63li9tTbGKcvliwN83YnEWCfzSlGAXJ1ggzx001r1FMuR3exFeq1vNTeLgPniUEcXZ+L39NW88UlWvau92R8V3abyWGDhS0Zte1x3gp7bvG3XitoeO2aHyK9tbEwTwQXTq0JvuPnG9eNJx9c4fW51qZVpDfCt+MZREKnMtXB1sIVMdDXcQW0nv4AqmQaPxDO6dwcRSLXtEOBwVjbinvOSB506mMFNiAqnwTk1AV9XSC1tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPc6m3fcfffNfwTcrmt0ShA7qoINIEvlyjJZxre+FIs=;
 b=J2NtkWSibhTzN0klT/dIykiUx9nI7u6OcGEh+AX+cYiTzeT3wJPR9oEOWfYdTaRbRMhDPOCHIlKIrq8euSYA2tRbVa5ABL8rJCvTg+58HMXo97ox25S5qamUi914Jjr0rnU07CdbjDzg72YsJXp2t9oKWcoJI2M8HimY3qjjdN8OXaj59XEhzQot4BArEMYAR42BDnaLM2uSiehFPw2FexiJti/qHcfgS6t34rNDNP7Ne8kCW8uVBsIj7AkLOmbz6kKKy7NvZKWHKAuLKYxU/LdXFTRqrM2eCWpBNSmt+vvQDPVfjJyZ5Q9w7VQU+yMWK3W8NjaDOqDTTbbrG1jMbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPc6m3fcfffNfwTcrmt0ShA7qoINIEvlyjJZxre+FIs=;
 b=swM8aehd0E3oFJL6ewiiIOEiiM6QQJ9d0hMKjyXSBHH20YWQburHtVkVHPTK+G/Tzcyab9NiElhWhNB0L01MqKEB6gTTDLNPvtTiK0t5VVGuWGrnaCiAi5sbgyA/PXIhLPZI3crSVYtD18GEjdSgLGiQHLbais/9L46bswwqTos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB7411.jpnprd01.prod.outlook.com (2603:1096:400:f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 19:32:26 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 19:32:26 +0000
Date: Mon, 27 Jul 2026 21:32:15 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] media: rzg2l-cru: Use bulk reset API in
 rzg2l_cru_start_streaming_vq()
Message-ID: <ameyP13Gv-Mr3grj@tom-desktop>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
 <20260616170542.447804-4-tommaso.merciai.xr@bp.renesas.com>
 <amcqq4dJxdpdbnzc@zed>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amcqq4dJxdpdbnzc@zed>
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: c17bf875-2600-4fea-0941-08deec15ca23
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	e7szZ7Vpp/n8clw4GmvNmFBqIJi8eUYgan3KQpepv2o8PlAfw2UD4aeZ7uGEnjDj8TyCAViHbYtMC0YM8JpN02Ne6ISRcXgZLsFrBaMyw09RAm1OcSwichQYpZynM+1pZ2+1WI2MDWr04bofyWxS7xaD0BLmbiqDW0kWOWxaWO36ORFnH3iVoWbQyq9B9mLSPeWwxc+Wy3ajMV67HC+4gGdjehgECVVPiIDawpq54I/KBjdbTT6npSQJw1+fB8Wh4krpbScLj5tCBLvNe7dwA0mSkPFdaY3r3VQV7UxrkfKyfokR4pgR36y6y8Yc+wHZ2bUxkHFDit2ziwNG6DXiPew216oejUsx0NcV4k/edjYmlnyLH3KWPUObvaVNpnD6xZ2TL/m5bxaVJB5k6Z2QX4EhxBSXy34XHSkFARx02A1WAzFHz48ENI3+bMv1M9p0UkqLBPuvstEya137/Xl71FvWWWqvtCjMimkMYDctsO+jixqX/6+hc26vuCJP0msGC/+6pkQ8UHusHPOhVLB4sr4z0qUKdn1LJMKBG8mpFP8nlDNdqCOrVzdIFM+k2YYUZJo/pBubMdl6ttJoeXqb67HNJF8gccdU1ftci3HryPL+enlFTTzIbHQ2cdbj2mGJMof1g/zN8/wj/ECW97ixdd6f0jd2Ax8yzMIWebqbQgTNwjDwJpFKjmCLcNh3qP5DJV24SMFqsenjLy74vKzQsIju9HjGF9eU55/aje10hZA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bLqO09glBGq3TRkaRTwZjlrGU95QdR7zHmHZIWDSfs8hcfBxz7B4Iw+5QEPB?=
 =?us-ascii?Q?C7IbrU1oymxs/WP0W4LmwFy3A4yFi3raBz7wOlFJU3KfHeZEm/TAv8uyqyx+?=
 =?us-ascii?Q?4NnfyAdv8bj8z33byiw6N10xwovwnrUyCXg3VL7a0zhLin0IdhPLNBTpUZLH?=
 =?us-ascii?Q?NDlB787Uqp6YWU7QGCJ3yM8YY/7ezqtuzlG/TAqafeQkQdk9Ars6tSDsdozd?=
 =?us-ascii?Q?09BBQZmOo0fE9jt6cPmsF53Zxe3PYZ3R2lFpXz7oec/Giedk5/+yhn/V1VwH?=
 =?us-ascii?Q?090nYEZu/SX3uByENCw4Z/aRLeyNfRZWu6ugQtMuQoxYkFt+dsQa3GKunfd2?=
 =?us-ascii?Q?HXZsvEMGEkdjFaZjJbV0Tk6oA7e4fwEwB2c/5/RQO2vRnMY+deCITae2sQG1?=
 =?us-ascii?Q?JdVTJIJfe5dC68L2RzQj1zT8D7BiPLNJs6p6KX+hbfJoUjAvXBAi8HmoGDxo?=
 =?us-ascii?Q?jqO+9/qLJh2TQRR83Q084g4wCpVL2+YKs9dPEOw9S2hb7Hv8hqwUVqyIQzk7?=
 =?us-ascii?Q?S1aNknbdcrNfqXhN5T5OKt387TQJNJkCkwrlRiALZ6FrimeTTUbmdljOWbTs?=
 =?us-ascii?Q?LGHGPY9YRXpMe+OFrLC+oHmSCrqt8KSVFefzqVTgqaSQb8h263J+jPrk5EvR?=
 =?us-ascii?Q?THVRmKnBVizL1+wATyurmwQ05/1R5ORTuEeHqf5eWt4SJlBjVvwApCIy4eRp?=
 =?us-ascii?Q?FXLPan+5MtK+JIrGN8jC4ulnRxQFtiKjgmACmzNcGSgRl9VSIz+UpYyU4J6e?=
 =?us-ascii?Q?4ryXjOc/aLv7u/gDhAf06UmDziWR7siEzp9IY5zBF7/h7xELN8od9dQQ+ixT?=
 =?us-ascii?Q?85DuwaUnvYZctY7iEdPQ6sejkMe/anOMQSBV1KWAWt6GGd8TXbV6lYGe1bn6?=
 =?us-ascii?Q?5ut8hzmffcmg89+hf+YLXxXfHy77AKUGeD2t6t1je7QDTzhtFpqIfl4EmQxR?=
 =?us-ascii?Q?SyeicdexnNb/PJjVPT56pt73/SkJ75l0+uSRMgOik+xoeW5+/ZUNNWQu1ZJN?=
 =?us-ascii?Q?O4WFF2Q1W7LfJI+RRtW/GrpL75KYRhjxz7guOvWtRyVnPOOYDVcvZ6ZfD+m+?=
 =?us-ascii?Q?SZua8LfLVoQ2cSFu71rHi4EqV6XlM6Ymx3f4x4zV9QIJnLihmsY9JUUYiQpM?=
 =?us-ascii?Q?7t2fBcIMsw0eTEmkSvjvV46l4LRIE9nW1dX3hD2ZfyEMa3ZfzwX7xLkb/Ud0?=
 =?us-ascii?Q?LTvLxUfHJ8l6MAXC7yXjkiPlxXQz/+EwA8ANvVb5li9+zdY4yHF1TINiYOHx?=
 =?us-ascii?Q?gXZVVDjkQIGKPjaF9s5K1rdcuT21OuiqccVlGSGUUGk6wl8GKCd6p9mFD0GD?=
 =?us-ascii?Q?41y+2OWSrfhpa66TnIkGWUYaD4HLoTBIZePHsQHEpU/+3GPjr5k9PTWO4L3X?=
 =?us-ascii?Q?vt1SeBLRggrfz2FQ76hsgsIhceGwBvrorLawRMyVhX9PsnI3y4xFIbuR6xJ8?=
 =?us-ascii?Q?DMdMEktc+1QMwOmubPFJklWehF91j2j+/90ByUaThHLC5ZHyh9cXd2ddHlUU?=
 =?us-ascii?Q?KX5Qfe3+SSFA46f9ptoIdaanQSDj5vRJGklD22XYanJ7x3FOog6J1Umpqlyv?=
 =?us-ascii?Q?ispdcJnhiMtpya7wtwmGcRXLGPxPTJkwgal5gKybxCz/HLgQoUbobgB2o75A?=
 =?us-ascii?Q?2JTcTpc14DxolaL88+LJeybdbf7yAviTKcFW20qt53sEZaqS9Dfhw7oC9REa?=
 =?us-ascii?Q?DZiihqvtIJ1F/ceYpPzWq20oSqfcqzCAqSuCOG9HcNP3KuouLOYI6fLPNOE0?=
 =?us-ascii?Q?WoR5rVj4ERROlxnMrYzrrUJSwK55sPjG4Xf/doxdFRfGZV8xuBZG?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c17bf875-2600-4fea-0941-08deec15ca23
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 19:32:26.4406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVRiaYeYBg10U+qFdWb6ic0anSlHNqYlqQKEHJF4LBAlzDudsvVI9+H/Giux8Eb3E2zQl4a7ANk436wD6U2rSTQh2m+PWs2RukdPRs2ZchR40NCwCMDPB2xFXxbie/oH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7411

Hi Jacopo,
Thanks for your review.

On Mon, Jul 27, 2026 at 11:55:17AM +0200, Jacopo Mondi wrote:
> Hi Tommaso
> 
> On Tue, Jun 16, 2026 at 07:05:33PM +0200, Tommaso Merciai wrote:
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
> >  	int ret;
> >
> >  	ret = pm_runtime_resume_and_get(cru->dev);
> > @@ -683,19 +687,12 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
> >  		goto err_pm_put;
> >
> >  	/* Release reset state */
> > -	ret = reset_control_deassert(cru->aresetn);
> > +	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
> >  	if (ret) {
> > -		dev_err(cru->dev, "failed to deassert aresetn\n");
> > +		dev_err(cru->dev, "failed to deassert resets\n");
> >  		goto err_vclk_disable;
> >  	}
> >
> > -	ret = reset_control_deassert(cru->presetn);
> > -	if (ret) {
> > -		reset_control_assert(cru->aresetn);
> > -		dev_err(cru->dev, "failed to deassert presetn\n");
> > -		goto assert_aresetn;
> > -	}
> > -
> 
> Is there any ordering requirement in the reset signal de-assertion ?

Even if there is no constraint on de-assertion ordering, I think you
are right: using reset_control_bulk_deassert() the de-assertion order
is changed.

reset_control_bulk_deassert() deasserts the last element of the array
first.

Good catch!
I will fix that in v2.


> 
> >  	/* Allocate scratch buffer */
> >  	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
> >  					  &cru->scratch_phys, GFP_KERNEL);
> > @@ -703,7 +700,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
> >  		rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_QUEUED);
> >  		dev_err(cru->dev, "Failed to allocate scratch buffer\n");
> >  		ret = -ENOMEM;
> > -		goto assert_presetn;
> > +		goto err_assert_resets;
> >  	}
> >
> >  	cru->active_slot = 0;
> > @@ -722,11 +719,9 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
> >  	if (ret)
> >  		dma_free_coherent(cru->dev, cru->format.sizeimage, cru->scratch,
> >  				  cru->scratch_phys);
> > -assert_presetn:
> > -	reset_control_assert(cru->presetn);
> >
> > -assert_aresetn:
> > -	reset_control_assert(cru->aresetn);
> > +err_assert_resets:
> > +	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
> >
> 
> Do you happen to know why rzg2l_cru_stop_streaming_vq() only assert
> 'presetn' and not 'aresetn' ?

We have:

rzg2l_cru_stop_streaming_vq()
  rzg2l_cru_set_stream(cru, 0)
    sd = remote pad subdev (= "ip" subdev)
    v4l2_subdev_call(sd, video, s_stream, 0)
      rzg2l_cru_ip_s_stream(sd, enable=0)  rzg2l-ip.c:191
        v4l2_subdev_call(cru->ip.remote, video, s_stream, 0)
        v4l2_subdev_call(cru->ip.remote, video, post_streamoff)
        rzg2l_cru_stop_image_processing(cru)
          reset_control_assert(cru->aresetn)  <-- ARESETN

  reset_control_assert(cru->presetn)          <-- PRESETN

Then both resets are asserted during rzg2l_cru_stop_streaming_vq().
Please correct me if I'm wrong.

Kind Regards,
Tommaso


> 
> >  err_vclk_disable:
> >  	clk_disable_unprepare(cru->vclk);
> > --
> > 2.54.0
> >
