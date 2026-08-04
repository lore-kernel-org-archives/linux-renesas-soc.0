Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598CD31355B;
	Tue,  4 Aug 2026 08:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833491; cv=none; b=iSe4QevK5U+mL/MNgmoplna2I/qSqAkhCi50PEOWQEavEWWPCD9DJ02qkDKtL2R/t9RxSZhUSXfCOx1bVxEIgWyub8o93S5bC4ShPanR4u7+TAjplcMlxMSDM6uoGd7Jux1ZVWj5V1DuH9OeTRHc5cXRVVR+WdYfg17shTgxzgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833491; c=relaxed/simple;
	bh=va8CjpTOy3HgA1PpwHbTPIDwGz4topH79dZtyO+QiYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfBs3PaZfhwfvtoIpA4eZsAQpKvDXeXuSJLhHWfdYLOrSIdl/ncexipdZ9pqHIh86N3hgHl4ze3V9bOnfNfp+uU/CPhWjpRopF9GINN0Ow/1CGtQ5zFjEDx114lBh7EsJUXCHSybRYIph3b7GusaCsvDeGZ5CcE9VY1bNmnsOcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=DU4E2JB3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D8LcisU+; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="DU4E2JB3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D8LcisU+"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 156031D00165;
	Tue,  4 Aug 2026 04:51:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 04 Aug 2026 04:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785833487;
	 x=1785919887; bh=5Q69Gz9TI7+952M3VbP600X7ndLmR9JmvY3lqrKEmVo=; b=
	DU4E2JB339XwzqM+u3gM/CqHzAqfhKgcKJFBcnHjEsSEMKjax2cjHnnbm4xchC0C
	AOlIAocrIdK4xD4E7ZdC9n09t/gMkLIRjLYAtA+YYHpL8wH3X/+wvYhrMR9oTywD
	eAeGbztAmuPe5DdoanPK3zqkBA6ZrTVJ61DAPrW9odsd+PKrqu9NlYZtDdhyvdfQ
	n/0ZxvaV1cZ5i0vCsur8M9Xp67YG3RvnqCGfBxSiwmZxQ2xPbB7AkPUMVQ39jd06
	4bjuT46Xax3e5NIPBdasiBevcmqyzXb3ziX5+4Hg6XBnJpJq7/6d9oIjT5AOAIeG
	aqWT6gx8PieFbgO8gOz3zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785833487; x=
	1785919887; bh=5Q69Gz9TI7+952M3VbP600X7ndLmR9JmvY3lqrKEmVo=; b=D
	8LcisU+7Wb3e3dJ13YiOb2tlojCQj2QqyylMPfy730uQQrDYccexiqMaY4TUibTy
	laSaNQlFitY7XQwE12z3LREZeEssiPzKMEq+g8sFuAMa1UQ61z1t3B5wWB2XrWDg
	4H0H7NnRWQCeZub/tu247t6DxKiv6on3ZvbRi7s2naBPXKDx+kOHJTB66lhr0gdM
	W8bCao+8Tm+bbDx37KrPFKLj/osk4ERXEcxEVwJHfSgZ7YQU4znnk7q/HHMUNvwl
	KsB8SuCa1OeDglIGFPuPy9Di3PAg/gjVav82qBvnFxka+JXlD5VYzUvkIacerZIY
	mUjC+UB5f8N3mty5JFu9g==
X-ME-Sender: <xms:D6hxapLcZ8WdvKS_0wXPKHqDVO5r0TK9q_pxjBTn8hBj_NjvbDBkFQ>
    <xme:D6hxatUmbhIBMkt917eSkhigMBlWPsb1UQSxIiKD4Eto5U0CI5v1lfrCx6_oearb_
    3RxUSDvKpBXcdrRzb_5ygnk8EBlZCpdOEjWrnKaza01yLi5z9NirWYg>
X-ME-Received: <xmr:D6hxatSooNtD4mjIYobnrVVT9ZTrjIjsivEicduJir-FOFYL0QbdxCPaC1xHjB5vItW0pNuPoSCWQY8wGrYVuFh7yynOJ8Y>
X-ME-Proxy-Cause: dmFkZTELmEkETjdma4aOjsoFfNKBrnce7fmGLe5z/boizL7hYPONqwDZEffhcUZw9alYTd
    G9M/QDUB+fnIGOJ/zYHwhBOUSilu3PoYJbylJ/25qyX0Kh32TrLZDk5wxBVPNjjubOXjaG
    xkcsAZgvvd/5EFCAFllsdP6cqbb1F0BInxSKu2PPoASYBRq5YPFttHiIOwaQxx9rxH32q2
    Z+j/+Uwr465jMOhSztvB2FeuVlQv9UPF2vAYZBQZUXexxWnxg+X4TFc6//ycVuZMqcnA3z
    ZygianzWtGlpwJ1IosBo7FBz28K0LlN55GbqmYSNOLikMUZlYtsplu91H+9qIGrJNKsTE+
    dJ3bNlwEYYL+4Fec496U4prOfuXjL6TvcAYsRERCgUjSFvDcd3axHtRpzrJEAFBUjzNBp4
    ZNM6wTOWfQDPp7hPXlGstADicOUK50qWj5/SGjypP1xwDDXQYfFjYuLlAufRuB4IcwOqPo
    loZ9XjGBcRdopY/Xzovv4em43XAhjwQ/6On2D4KY112JwCIWUauYcd044c3f4dBf4LqZ41
    /e5qzJu9mtRVK36tBKil2Z02bYpldVep8ag57+3bJK6QheIT7UC+l5fAbKfYPzexPOBx6D
    WgWB57j+bxSFnhi8D8mPAwX4NbMilc0/H+60XlqbPHw5parkB4FEO60kZCrQ
X-ME-Proxy: <xmx:D6hxalDg_rgOwf5YosCWU5BbP2IoIHvEdIf90oXrfz7fT25cwukLeg>
    <xmx:D6hxasKlG-N8hvFtIVS5hnioRPLPlMBNSWbBdae5IaJFq6-1HMFx5w>
    <xmx:D6hxaoCybotLTEwAjZDRqIxAnU014Dpgo1QHOgxwEOUqKdwqiRtwdg>
    <xmx:D6hxapsbTDApiTLQ8UAB9d6_w11vwxWpI30yC-hFN63aX2yo0Mqbnw>
    <xmx:D6hxajITricAKy4io3Q0nn4UqQItOOE8PN062FE2xZT81VH78zhZz1F7>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 04:51:26 -0400 (EDT)
Date: Tue, 4 Aug 2026 10:51:24 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: rcar-isp: Fix VSPX reference leaks
Message-ID: <20260804085124.GB346309@ragnatech.se>
References: <20260803090553.4082161-1-lilinmao@kylinos.cn>
 <anCZxVjPo_zfFcEq@zed>
 <aa2c46b4-4fc9-416f-8855-ae6ba61eeb8b@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa2c46b4-4fc9-416f-8855-ae6ba61eeb8b@kylinos.cn>

Hello Linmao,

Thanks for your work.

On 2026-08-04 10:05:03 +0800, Linmao Li wrote:
> Hi Jacopo,
> 
> 在 2026/8/3 21:43, Jacopo Mondi 写道:
> > Hello Linmao Li
> > 
> > On Mon, Aug 03, 2026 at 05:05:52PM +0800, Linmao Li wrote:
> > > of_parse_phandle() and of_find_device_by_node() both acquire references,
> > > but the ISPCORE probe never releases them. The device node reference is
> > > leaked immediately, and the VSPX device reference is leaked on probe
> > > failures and on driver removal.
> > > 
> > > Drop the node reference once the platform device has been looked up and
> > > release the device reference with a devm action.
> > > 
> > > Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
> > > Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> > > ---
> > >   drivers/media/platform/renesas/rcar-isp/core.c | 13 +++++++++++++
> > >   1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
> > > index f3dc52c136120..8dafffdd8de68 100644
> > > --- a/drivers/media/platform/renesas/rcar-isp/core.c
> > > +++ b/drivers/media/platform/renesas/rcar-isp/core.c
> > > @@ -781,6 +781,13 @@ int risp_core_registered(struct rcar_isp_core *core, struct v4l2_subdev *sd)
> > >   	return 0;
> > >   }
> > > 
> > > +static void risp_core_put_device(void *data)
> > > +{
> > > +	struct device *dev = data;
> > > +
> > > +	put_device(dev);
> > > +}
> > > +
> > >   static int risp_core_probe_resources(struct rcar_isp_core *core,
> > >   				     struct platform_device *pdev)
> > >   {
> > > @@ -820,9 +827,15 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
> > >   		return -ENODEV;
> > > 
> > >   	vspx = of_find_device_by_node(of_vspx);
> > > +	of_node_put(of_vspx);
> > I was about to suggest to declared of_vspx as:
> > 
> > 	struct device_node *of_vspx = __free(device_node) = NULL;
> > 
> > But maybe it is not necessary since there's a single call place for
> > of_node_put().
> Agreed. The node is only used to look up the platform device and its
> reference is dropped immediately afterwards, so I kept the explicit
> of_node_put() to make the lifetime obvious.
> > 
> > 
> > >   	if (!vspx)
> > >   		return -ENODEV;
> > > 
> > > +	ret = devm_add_action_or_reset(&pdev->dev, risp_core_put_device,
> > > +				       &vspx->dev);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > For my education: what are the drawbacks of using
> > devm_add_action_or_reset() instead of releasing core->vspx on probe
> > failures and _remove() ?
> Explicit cleanup would work as well. I used a devm action to avoid
> duplicating the put_device() across the probe error paths and the
> remove path.
> 
> After the VSPX reference has been acquired, risp_core_probe_resources()
> can still fail in vsp1_isp_init(), clk_prepare_enable() or
> rppx1_create(). risp_core_probe() clears core->base on those failures,
> so risp_core_remove() returns early without performing any cleanup. An
> explicit implementation would therefore need a common error path in
> addition to the put_device() in remove.
> 
> The drawbacks of the devm action are the additional devres allocation
> and the less explicit release ordering. There is also a longer
> reference lifetime in the optional-ISPCORE case: if rppx1_create()
> fails with -ENODEV, the parent driver treats the ISP core as absent and
> continues probing successfully, so the action is not unwound and the
> VSPX reference is retained until the parent device is removed. This is
> harmless, but explicit cleanup would release it earlier.
> 
> The action is registered after the reset, clock and IRQ devres, so its
> put_device() runs before those are released due to the LIFO ordering.
> There is no dependency between them.
> 
> I chose devm to keep the cleanup centralized, but I can switch to an
> explicit error path if you prefer.

I thin I would prefers an explicit error path. Specially as you point 
out, the driver can work with or without an ISPCORE and having the error 
path explicit will make things more robust IMHO.

> 
> Thanks,
> Linmao
> > 
> > Thanks
> >    j
> > 
> > >   	/* Attach to VSP-X */
> > >   	core->vspx.dev = &vspx->dev;
> > > 
> > > 
> > > base-commit: 31152f5b0f8719f92063b8c6196cd5e34106c73d
> > > --
> > > 2.25.1
> > > 
> > > 

-- 
Kind Regards,
Niklas Söderlund
