Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9A3328B4B;
	Mon, 27 Jul 2026 15:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165446; cv=fail; b=MFU0c1x1vax/ZNfWaawfmGXl+tci8zKI0xfu7qjpmBKlxDFlJCoZb31AQ4mMOjgwBCikS3Q9htQtZAKB24IaNw5BmwEkWHoFRu15RUUPdBDV/poj8EGYOHYqxuPkgqjKSGx0nYxhjX80lLUbU+5gzrXRKHHG29cf1bXF5sHly7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165446; c=relaxed/simple;
	bh=LXSYuEI9E76fuMOplufKw5jLrBCqaRVF85/jLpfDvuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ghCWESz+4pKnfSCxv58G8L88WwQa1ouokCDhmiUtSyKI2lwgJrdVd/Kfa4A9gV0OPPMnBb9jR7t4esqXt7HGTeGchfDu9G7/J0jKBNBgJ8vwnS7CXe5VtKjLwCqLA1oErUwBtn2QibBwOXS45CkIF8anuyrqkNDbUnAgJ2fn+bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AXKcOELm; arc=fail smtp.client-ip=52.101.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AXKcOELm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tllSU+XQDmALJl1J/ZG7hQ8pvaybJ9yfwJ8fa0CNAVtr1WPw7G2J4CKBAXyrxA4pQrb7IgJoVyRAodFNd2k+axAUlGr6p+xChod6gVLEjcqlVXWzG5EkmRkBwncRQ/eYD9NL0g5e+rZ+AQRpPhtzNkoj6PJ7tE4OFmF8TuYSMgIokHHcv4iJKkWyaYExcfMtLTftIKkiIqULipKPGlhl0+3FMCXpUtJoazdhBRwCVnMQ49+es2Lip/9v+JC/iDQ2mb9c3y9TtZAS0RCqPwRo6mxzWrAtM+uQTtzwY5BaInzNNP8EYEO7nmgY8H+mCoIz3sk8Xv9P5E7VHkJfT2dG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtGnqILvt40attjXn8TYnKdlLJoYI8fIrhhunHUc6rg=;
 b=G66bX592btxVq5teTnZIQlE5jqtjhRBpY3/F5VHB+ozkAUdo30eq8bXlkLMyHxw+HngtgmMHMubGzJc0eFlaepXwwbSdp+OAnJSKq+/K9kWqtYGWepTb/5HblKnSkIHJbs4ium2ttTd70nqZa3llmkk1mlNMuqYp8Zde+kbca9xjzy5+FbqQWpz4+SdKVFSDlNDcKSMWJDXapgJRWQ3RB3PDOQ7A+AgKqcnmvg0501yJ49dPKhq3nh5adsZxyiOj5Co4+2BEtz8CXczG8Nowxj7FxNyOgO3Q5/g9eV//omO32DSsMtkn+mcgDEHTL3Qb0qCz3faS4kPMjGep2WK7qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtGnqILvt40attjXn8TYnKdlLJoYI8fIrhhunHUc6rg=;
 b=AXKcOELmxrEAF7EVDtVAJzj2wNhMznZCKphBHpD+g4ULqEmH3qRZ8x02IEIOOE1WnC1rvhlL0+t4wHKIIY8EWOMxLVlX8qPrPv+aiBct26yPc8aAp1HsVhu3uP6Et5DfDAnYPi3RZizRA8BX8XW3L22vaqbQiLKK9AI8znlWZus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OSCPR01MB12589.jpnprd01.prod.outlook.com (2603:1096:604:33c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 15:17:21 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 15:17:21 +0000
Date: Mon, 27 Jul 2026 17:17:11 +0200
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
Message-ID: <amd2d5pf5YzIvFSX@tom-desktop>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
 <20260616170542.447804-2-tommaso.merciai.xr@bp.renesas.com>
 <amcplAwJQbx2Tjuy@zed>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amcplAwJQbx2Tjuy@zed>
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OSCPR01MB12589:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d340431-5c79-47f8-97e1-08deebf227c0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|52116014|376014|11063799006|4143699003|10067099003|56012099006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	iu9Ka0zlOlOv+KYJc2iLZEuI+uDiNE/eYyEKPyR4ehOJAoDd2iS4g9e9sP5u8/Z+WpIJDbTzBByCVzMFtBAb1HRB2ECDVqqLyM9/yy5uDhNzul5W8Yci5eit5VC8119ob4/iHUEmF78t+BQxFxY6uNQmsSW4zWdqtUR47MUaistwHkJMrVsbRLsPVl6FXx3TfLzD2uktxpdrpC0prv76bKWX5YuApLxT6EnsKdEY/EH4wxv+X5kVxzos4VVnTlU0xedF9OSj8nZ23xcQbeWlZSQ90te0UyQhNKGBpUJBWawG3oct5uKDcZ8YIaTiyeFek0QLgTLQtilxs3YNXDQmez/xOktsZb59pAUVPKfAGKNFWEDv6eoLrLq2sd3fpIj4xw0st5IlfT+Ez1FMw+NzNYkIqYyBHJujSK2Uv7Qv+7Ls/3vi3B/4cfY9YCGgTxi9t9olZr4LB2ELKEh32qt3h1bHgRQ62T3Allj7TjTcrPMhyKDWWJQlcH4o9vJCNY+4bIESIaxTEQBy7OmUAu0Y8sXYlQs3/C0Eb4ZejtEQqspx6F3kGxejh1m+w3TaYXQXi7VhImJH0SsWp4kzGaEPotf42JIfAd88JbI9PGKbEjEnZS6sJ+jrpiG7vEEGXS25RaBoo1yO3PH2sDY/4DpUk3PWVojkGTJ9jHL4hIIDSHIEs4lTLE+L5ymq5S2Llyi+fdZ7YUFVogbLuScxXksXDB4xgJPAkWR0RvM8BGjNiao=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(52116014)(376014)(11063799006)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ODAXKjLshBsnD+a1VZhGDekD0hX7510sBFTtZ14Q7rFrzUlQDQItvVm15xds?=
 =?us-ascii?Q?RlSTLalk9u5pTjeag908gvL0naprHOLpgDbLuTo+Ik3YOEwa7JhfTOYwetfZ?=
 =?us-ascii?Q?5FcMqnRC1YXmAlQGvTd5BcvJn3HX4L02Vrbxfwkc+ox268ZdKp/qngajqV3E?=
 =?us-ascii?Q?ZKMUXiKh6qJJ5SVrIdrD6L44iZFzrOK692VBzAnsNfYYF6bWnf+XxvFajQVI?=
 =?us-ascii?Q?TjlNDIvdsBhGMRw+jskemHvkrcJSWpRm39N9xKfBbkwjDWib6HKU2YK8qn+W?=
 =?us-ascii?Q?9mICqlKA1msZNbRbcoCuU9flp5ufoXuqyAYMid+H9igcQkD2VcE+UPNdX7Qm?=
 =?us-ascii?Q?5VBiy/+n0+xdT09ulRnjl3lG806zUR43d0Jm99dUiCx5N72b4xJWiO2a/A2h?=
 =?us-ascii?Q?WJ/+EzsdujLnrlc4c53AU0SlHIRm+96j+pQZn8MVjsBJFTLCGiWMXurW4i7U?=
 =?us-ascii?Q?EKCG6ZhOiSFWcnF4q4NUP0jCxkRMpd1ZBE4AbNefJZZaCSzVmqDUMwP3TQYT?=
 =?us-ascii?Q?DsHLfE89z/NRDBln9PhI9nsnbQr1RLwMQsrCFfByID8zG7jHA7+tpCR8LtPu?=
 =?us-ascii?Q?JEtnx9w7l2sy8aP862EeG148c3HbIE40leYQixibeZUqUoH0DZdYNb7tB79N?=
 =?us-ascii?Q?Sw8+oALXvB8na/N1WK1UDnkcU8lsGZCQu1/RybM8Hr0H/z7vIN/zpq+f0ZZt?=
 =?us-ascii?Q?ONb9QGWPPG6vDHMbvGV3cPNDIzhMoRv3jOQzPKTPMF1SqKyrVcaEM55djeQ/?=
 =?us-ascii?Q?wvGUMhFcbMHj47MQnLOVbAcsY4xCTcKqSB+9Ts0t6pLjbdAHTdmTiW4bylpf?=
 =?us-ascii?Q?t2PduECRTflwN5eulG0601EWPDp90ob323tvl1KG9pWVfVA3v31dQzNgWtYK?=
 =?us-ascii?Q?scSz08hW3T0JpJR6V69Au6rP8pZvH7le82y2bdyXAMLwzDwyNb1uQyNhCIBm?=
 =?us-ascii?Q?xjLheDK9s1YH7paQ44NbdnzcuRlUWPgAHwbgywrxAi0ueSdpZDpbHZiwInH1?=
 =?us-ascii?Q?CDY+qhw7B/9OyyAO6rOalAQ2LgalxKUgv+Ajw6n/IpJ9kVOcuDpIHQdCMw5G?=
 =?us-ascii?Q?I11Op2g4bo4MeXxHhKGycP7K0prifjRFPDE2p5yXRTbfPcA/9OUoMd8tkaQJ?=
 =?us-ascii?Q?25VopMuAi62zzM/1/DfUgVt86NwIhpr+Qe70yHSZni13qGuFl32CmfSFN/p1?=
 =?us-ascii?Q?lrsWduhpeNVLO4UCcKOR+FAdJo+JERJ4yCLoORl2oQIaFH5edhLhu79j4U7b?=
 =?us-ascii?Q?78v8AannH0ukQw1y4oqySI1msLFaxbj5WQxSQDHlpKtHItTcjrbasgjqlgpr?=
 =?us-ascii?Q?lREgzy4dbtAONDxaLc1KecgqCZeYtjw2hmmn2HS9bWU5zw0uk6PE6zb7HNaQ?=
 =?us-ascii?Q?RClQmAXsZF2XwJ10Qp6G51Vtma9tBNGBNsPD3KVBx6R7/7wqfqSz6lisfpMF?=
 =?us-ascii?Q?wC+THcxMrW+A4v9wtLn5TbW6kbKY7457dPiS6RolxbdjDVYsrZUnf7dzZ1Tg?=
 =?us-ascii?Q?1QiI/NEum6PjzVfMszkRaUQ19cPzUD7jxZ1IJVFk3wX7sYedpDzUZWsjiYKX?=
 =?us-ascii?Q?C5iS8j8F/bSxj6mWmgtgdwXFgvaJWyG4MC9Lyk1YnB9vKEpJQgIauEvtLJk4?=
 =?us-ascii?Q?AmNszJzyRNv8jsYKJyBEn5v5RZe58r0W05GjmOoDAzQ80k/WVZ+sGAcTo9Qt?=
 =?us-ascii?Q?IA43CIW3ECCspOinwMjXaMyUh2feM6Zp9ztmb6fVH3MS231nlQAzXeKvRvEQ?=
 =?us-ascii?Q?95+86FLi8LTFvMZlZFzeMuD5IBJ0349315sWQbFNAudBbPh8cizG?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d340431-5c79-47f8-97e1-08deebf227c0
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 15:17:21.5480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5si67qjuzT/xXEVj3hs9AUk7I7EG5okvQw0wYzwGXkWVeSWM/g6SXsiVT5Tjd/gs4hQ8QMdumDOl/ONaXia9POKf3xq9NBGkNklcb01NMBrmpoNHIbIkj0/wLQ33iT6G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12589

Hi Jacopo,

On Mon, Jul 27, 2026 at 11:50:32AM +0200, Jacopo Mondi wrote:
> Hi Tommaso
>  one more thing
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
> 
> What is the mutex protecting here ?
> 
> (yes, unrelated to this patch, I know, just wondering if you should
> take the occasion to remove the guards from bind/unbind)


Good catch, I agree it looks redundant.

Looks like v4l2_async_nf_register() -> __v4l2_async_nf_register() already
takes mutex_lock(&list_lock) around the calls to .bound()/.complete(), and
v4l2_async_nf_unregister() does the same around .unbind(). So .bound(),
.unbind() and .complete() can never run concurrently with each other.

I think you are correct, we can drop the mdev_lock calls in bound()/unbind().


Kind Regards,
Tommaso

> 
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
