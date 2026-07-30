Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E024E39281B;
	Thu, 30 Jul 2026 17:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431308; cv=none; b=naHhmmhm8brni7cYMVGEOskdYZ0LfphnCeDqF3A19Mlxvtr54TW+TKhAhYLAaoUVW4VxNTXrU5rrt15LNZWtFFR/Zq3/13CaicivJl8tuuSfMUXNsnNBZt5v91g1fxb2uH1zlxUrfkHd8n2WA5l4/TlwbzaDsRGof6TgFAvvBxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431308; c=relaxed/simple;
	bh=q0AUSucNj3cgCmLjizYpmRtB0+PA7UhySmchuvrVXNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMDWqsIohpzt/TXaaVH5GtTsZEVfi4UOCIvBqhIOpMrDyQYJD7E6zIwOqyZJTmyflaTpV2yhsncyG/PCnGCCHmzUuQutpSJcnS6KkFS7CM2n97P9nICQUfIUHRhkE6R4kGJcVl0+23HT2iJvlTSLvf5mipAkAMV20WkDSJVKByo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=x7JSRTbT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fzhLxtf3; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="x7JSRTbT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fzhLxtf3"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ECF12140012A;
	Thu, 30 Jul 2026 13:08:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 30 Jul 2026 13:08:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1785431304;
	 x=1785517704; bh=zc3b2edOCfUvBSGL9BMVaGh9Pgf7Ye9brnz1PxcXwZs=; b=
	x7JSRTbT2Sximq4BB1XCcb24B+cDBUNjY4ty7p5TeuoqIvPYP1Vg7sbLFvempbXr
	ZSV8TajIuLBHsAGSnImPo8cgbGaFH45e0fkDR1GjwdDLISI5AdZZLXQsVhdKRVHy
	6GXVJUOu/sTaRKfgbBVeOt8S0OcC5ZH8BJ+wTYkPl/R7S9ua2PUjrtr7eyL3cjz2
	rfwhKW7vvJDaWVo5lwmQ9sNQ2LEggWoNOWuTptfv6HwELmjZ2ispfvrMZoZy0/S9
	Bc5+srRg8fe4v0MkYPz0mMGzvJFu0zkFmFZghq0uQ7ZQlB0u8RW/sSdTP7l32GPw
	rYUL2RBCPlLQP3IkkwvDhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785431304; x=
	1785517704; bh=zc3b2edOCfUvBSGL9BMVaGh9Pgf7Ye9brnz1PxcXwZs=; b=f
	zhLxtf329uMQroohib4lxTY/SwHS8x+RV7tmxu6ne58kzU5sW4qy8GBU/l/5B/DN
	qx5VERf3u6OkxCr58iLRSiCQOygWY49y1DdSCLrXhpC8LMeRnzcKWFlSrwbnCCDi
	nsoc7SABGixD4jSJiG9bekJE0v3OUdN/tQDRA+ZdZXeqOJe8222wfKfK8SekoPcI
	LegMU3LqfBEyYTtXmfn1/u62QFhZuGALipOxPLL28PDiwcx5+bIrKUZTDZ2ZsI9P
	fGFFxs+NEwj2AvEeHPt/gg2KSzCga8CLtLChz2VvTvipK0y54zmud4aoZ2YzdIgk
	kbNRUqeUW4mgjKtesGBJQ==
X-ME-Sender: <xms:CIVragqJYsDYTEnO8ABmh7SkEkGyxOxcX2WHAcKgRg7zctGn3axPCA>
    <xme:CIVrasrMTUuFPHs8IIl7Ys3N3zPsSBhMZQgcHphCaUvFeiLx2WCFXHm6NJ9e0FEfM
    1yTvt7wAmNB2gzN-bKAMD0bLRTq1CCtGHiuDC6Ay52y5z0ek16X2p8>
X-ME-Received: <xmr:CIVragAXFoAj4iu_GXV1BIb-clFKzY8ps7H2Fs2FCErfNbrkZ2KjnmiS-FIESGoMh42cFcT5Y_UWbtOrL58jlS-Xzq1RvnM>
X-ME-Proxy-Cause: dmFkZTF1OsB1F1dXiflZEK/tD3RdPGR5QXNAAIBh6q1Bzy8O+iWLPrZNmlQNbQAONPHW+r
    zCng6QoVqp0p3k0YC9kr0V3T1twgI+EFEmthh60+2BMF1715bxRuTbmVOrnrh1mEb4cdHU
    0OEydEckDW5rCtPUOfleDR9hQgQGSIYtOTBznJ/bZvvyup+quzK/UCJHEnVRfC3/X6V470
    HSeXpksSVqm3g+wbG5UpvAR2MhjfT6YmIvr0SVugY8tyT0CV/3AYuVXrm5A4TZfKoAU1bg
    aQOCDHhLeF9JFGs6sXrFVh8FtcCWA+zjYEZsfQTwNHkmHU+xzUnJPBXjbcij2UkmEEXTUE
    O2I7Yl7F/TM7ReOKb1KA2VZ+uwInKuv8ZmEHRxD+H+jjmMKpDUAQdG6PqP3AYV4kBIjqCe
    OckCGTltH4bxFnSJrR4wzPVc9gsClE4rMTOo80alyoSj8Nz9NlrWXeMo38nsOzIlcILU1Y
    Jyhgc8cdAUXvWQWiFklXUKLx0KpFr1guICY/Z0bSna6d47ZO+aVUW0ZRMuqewhSzgnHXkv
    BhnGSNKBlhyEzYzhEpn0QQC+hcYCjsyyHZC4T2THLCEaNeSeeMuzwsW7T1o+ZLjLEjnjWE
    NJ2x5Iyw2VmD1apWCWBIc1V+q3B6Ns+mCMyfA43H0CmsE/gO+90Pmw2KZVsw
X-ME-Proxy: <xmx:CIVraqvbg1jUzfqRglSkX6wJmw_w7p4LoiC9yVQrz9CzXbIpwIapIw>
    <xmx:CIVravLrnnw2gorrDWS-URzlT8M1yiLfHMLGpX1nu4w96G6DvdCPng>
    <xmx:CIVrahZoNpmjYELVVdxLtEGCoGxr6osr-F8G9x-m9qSAytsUdesMFQ>
    <xmx:CIVrahBZRB3tlkFnwWgDzgaWiahDSiI7Wsq8QMLmSyZvlllWYtGHjA>
    <xmx:CIVrav67EKfG9w0kgFp53VMzhUNPPlL-M8Nh3jp2-3VAumZI5n-LzPkr>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 13:08:24 -0400 (EDT)
Date: Thu, 30 Jul 2026 19:08:21 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v10 12/13] media: rppx1: ga: Add support for gamma out
 correction
Message-ID: <20260730170821.GA2921345@ragnatech.se>
References: <20260611204148.1423192-1-niklas.soderlund+renesas@ragnatech.se>
 <20260611204148.1423192-13-niklas.soderlund+renesas@ragnatech.se>
 <amjM5n2eYqnrpJfb@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amjM5n2eYqnrpJfb@valkosipuli.retiisi.eu>

Hej Sakari,

On 2026-07-28 18:38:14 +0300, Sakari Ailus wrote:
> Hejssan,
> 
> On Thu, Jun 11, 2026 at 10:41:47PM +0200, Niklas Söderlund wrote:
> > +/**
> > + * struct rppx1_ga_params - Gamma Out Correction configuration
> > + *
> > + * The Gamma Out Correction module is available on the Human Vision Output
> > + * Pipe (HV) and the Machine Vision Output Pipe (MV). Userspace selects
> > + * which pipe to operate by setting the @header.type field to
> > + * RPPX1_PARAMS_BLOCK_TYPE_GA_HV or RPPX1_PARAMS_BLOCK_TYPE_GA_MV.
> > + *
> > + * The module allows to apply a @gamma_y gamma correction curve to RGB data
> > + * represented as a table of 16 entries. The 16 input sampling points can be
> > + * equidistant or segmented using a logarithmic scale according to the value of
> > + * @mode.
> > + *
> > + * The gamma curve values are 12 bits on the HV output pipe and 24 bits on the
> > + * MV output pipe. Userspace is expected to provide the curve values with a
> > + * bit-depth matching the one of pipe in use.
> > + *
> > + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_GA_HV or
> > + *	    type = RPPX1_PARAMS_BLOCK_TYPE_GA_MV)
> > + * @mode: gamma curve input segmentation mode (see rppx1_ga_seg_mode)
> > + * @gamma_y: gamma out curve y-axis values
> > + */
> > +struct rppx1_ga_params {
> > +	struct v4l2_isp_params_block_header header;
> > +	__u8 mode;
> 
> Please use reserved fields to avoid holes in structs!

Tack.

Jacopo have had a look at this and addressed it. I will soon send out a 
new versions witch takes his work into account.

> 
> > +	__u32 gamma_y[RPPX1_GA_MAX_SAMPLES];
> > +};
> > +
> >  /**
> >   * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
> >   *
> > @@ -516,7 +565,9 @@ struct rppx1_lsc_params {
> >  	sizeof(struct rppx1_bls_params)				+	\
> >  	sizeof(struct rppx1_ccor_params)			+	\
> >  	sizeof(struct rppx1_lsc_params)				+	\
> > -	sizeof(struct rppx1_lsc_params))
> > +	sizeof(struct rppx1_lsc_params)				+	\
> > +	sizeof(struct rppx1_ga_params)				+	\
> > +	sizeof(struct rppx1_ga_params))
> >  
> >  /* ---------------------------------------------------------------------------
> >   * Statistics Structures
> 
> -- 
> Regards,
> 
> Sakari Ailus

-- 
Kind Regards,
Niklas Söderlund
