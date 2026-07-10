Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331DB413240;
	Fri, 10 Jul 2026 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685739; cv=none; b=sEI8o4xpPFHsYQ/F4u3lxHNlCoBgrS3f8VjDv1gS3e0yvQFHbKcvsEK6LHVduARlJysUJxkVrY/7xMZScKn0GkWa1CLZQYqhyeiVCQ37E+SWdUbXsiRv7WsyhVzLha67l3w1a6VjgM/W7h3YEGv5pqsthwp1lSsdymtxMqFHjJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685739; c=relaxed/simple;
	bh=Z/Rs/qraqvHesKDAc0IRdGMSTgEPPxdrv8Fjzo5dznE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1ehtXg76WZX0oieAWJFD35MoNSOu7ZJ0pW2bptb1JUdIPesVdzziEkujImA/k7Pf+y6Pnyic6/zTZw9qVBexkzyV4lVV23Ke5lWAJ8TuUC04GXF5m/Xi2fAlewi/zN2JGAfYz1vPdmU1s4PVBGVNgTEhTmcM52i+cFZwepMu0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hKCn4Ixr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hKCn4Ixr"
Received: from ideasonboard.com (mob-109-113-15-151.net.vodafone.it [109.113.15.151])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F1E0324;
	Fri, 10 Jul 2026 14:14:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783685682;
	bh=Z/Rs/qraqvHesKDAc0IRdGMSTgEPPxdrv8Fjzo5dznE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hKCn4Ixrx3R9hs7Ta2vjZKUiFSFVQVc06RYrNlMKa459/T7YApoUjRvrtgGuOnL9V
	 B6NlhQFmtutKVPev9FlV3EDYQfnFOe19MlJhN+4MCxcX5Ldv3qO+29QVlkwuJ3RlK4
	 fOAVHHHEOFfNafJyEn8GH8EeRU+PWgdwPHoenO1U=
Date: Fri, 10 Jul 2026 14:15:30 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Isaac Scott <isaac.scott@ideasonboard.com>, 
	Paul Cercueil <paul@crapouillou.net>, Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: v4l2-common: Add
 v4l2_fill_pixfmt_aligned() helper
Message-ID: <alDgNTv9M2_aVV7U@zed>
References: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
 <20260708161406.396183-3-tommaso.merciai.xr@bp.renesas.com>
 <ak9pPzjABetdgUiq@zed>
 <210aa2ee-8931-4dd2-a51f-eeb0c205d647@pengutronix.de>
 <alC6DDFZ23q5h33W@zed>
 <00b18307-f982-44bc-bbab-4a640753d8fc@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00b18307-f982-44bc-bbab-4a640753d8fc@pengutronix.de>

Hi Sven

On Fri, Jul 10, 2026 at 01:54:06PM +0200, Sven Püschel wrote:
> Hi Jacopo,
>
> On 7/10/26 11:38 AM, Jacopo Mondi wrote:
> > > This is due to the fact, that while we have a hdiv of 2 we also interleave
> > > the cb and cr parts in a single plane, which results in the stride being the
> > > same number of bytes as for the y plane (and vdiv isn't relevant for the
> > > stride).
> > >
> > > Therefore the stride scaling also respects the bits per plane (bpp) value to
> > > determine the scaling.
> > >
> > > @Tommaso : While the sentence looks ok, the NV12 example is misguided. The
> > I guess the usage of NV12 was as example of a "formats that store
> > multiple component planes in a single memory"
> >
> > NV24/42 works the same, but being 444 it needs the chroma plane stride to
> > be a multiple of the fist plane stride and might prove as a better
> > example ?
> >
> My potential concern is that NV as an example misguides the reader into one
> of the following:
>
> - It's only for formats which interleave cb/cr into one plane (whereas
> YUV420 also gets scaled)
> - NV24 in the example being though of including the NV24M variant (whereas
> latter won't be affected)

>

M variants are not supported by the single-planar APIs
https://docs.kernel.org/userspace-api/media/v4l/pixfmt-yuv-planar.html

Some planar formats allow planes to be placed in independent memory
locations. They are identified by an ‘M’ suffix in their name (such as
in V4L2_PIX_FMT_NV12M). Those formats are intended to be used only in
drivers and applications that support the multi-planar API,

And here we're dealing with single-planar API only if I'm not mistaken


> Maybe smth. like YUV420 but not YUV420M is a better example (could also be
> NV24 but not NV24M)?
>
> Sincerely
>     Sven
>
