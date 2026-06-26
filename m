Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936B62E11B9;
	Fri, 26 Jun 2026 20:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782504487; cv=none; b=c0fF0o/pZG0IA7Hwb91mQyYUwsO0pZ1T166G4Ubfhf1yYKHf1XuRHTWFVfP2MNWMSHrrmycA2YYjRWEXLpJazqOw9jnfFXgG3GihlGa8PqoXrhzBzY3GAyB+Wswzpkw5qQmC4DlGT5RkLE+zX3dJuojPva7LuZIK7Ir+uwpbfRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782504487; c=relaxed/simple;
	bh=n5wBJELL4mPMXkiw/v6GCINh5c84KkSAm3YOu+Hw3H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNix2xcIHOiKtb7Jkc4PnBER1zrCi/imQgi0HMa6eak3rEGJWI/rnixo/N+cXA6NQy++/EMu8g4urlH6IvK8xgl+irV3aay+frXrGBcuUNz+xTnbeWJmChFKn4glQjq3Huf05vz/oxeQf9vurKD6388phIWfWhI9En0tNjt/D9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XaUHONDB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XaUHONDB"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BA061E6;
	Fri, 26 Jun 2026 22:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782504442;
	bh=n5wBJELL4mPMXkiw/v6GCINh5c84KkSAm3YOu+Hw3H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XaUHONDBqEFiScsHD+a9hNVqqpRMG3OIPj0+LQSFheh9kYlgfbEs3nBK5PVBhsnmr
	 S+i1Es7zeCShAF8Yzh5TU4thqk60L3UK//ab+2obDwvBEUyjpOcoQvwzplDFl425Ij
	 RTnagrbxQZOI6C/WbK7Ftj/e1umW9ndbD5mxbHIQ=
Date: Fri, 26 Jun 2026 23:08:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, jacopo.mondi@ideasonboard.com,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rzg2l-cru: Align bytesperline to hardware DMA
 stride requirement
Message-ID: <20260626200801.GC2371879@killaraus.ideasonboard.com>
References: <20260624104153.798953-1-tommaso.merciai.xr@bp.renesas.com>
 <20260624104153.798953-3-tommaso.merciai.xr@bp.renesas.com>
 <20260624195334.GI851255@killaraus.ideasonboard.com>
 <aj0KdVH2H4AJ1Vdw@tom-desktop>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aj0KdVH2H4AJ1Vdw@tom-desktop>

On Thu, Jun 25, 2026 at 01:01:09PM +0200, Tommaso Merciai wrote:
> On Wed, Jun 24, 2026 at 10:53:34PM +0300, Laurent Pinchart wrote:
> > On Wed, Jun 24, 2026 at 12:41:31PM +0200, Tommaso Merciai wrote:
> > > The RZ/G3E CRU programs the line stride via the AMnIS register, whose
> > > IS field encodes the value in units of 128 bytes. If bytesperline is
> > > not a multiple of 128, the division truncates and the hardware uses a
> > > wrong stride, causing horizontal banding.
> > > 
> > > commit ace92ccef0c9 ("media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()")
> > 
> > s/commit/Commit/
> 
> thanks.
> 
> > > replaced the open-coded aligned calculation with v4l2_fill_pixfmt(),
> > > which sets no alignment, reintroducing the issue.
> > 
> > I wonder how I missed that. Sorry.
> > 
> > > Switch to v4l2_fill_pixfmt_aligned() with RZG2L_CRU_STRIDE_ALIGN when
> > > info->has_stride is set. RZ/G2L has no AMnIS register and keeps using
> > > v4l2_fill_pixfmt() unchanged.
> > > 
> > > Fixes: ace92ccef0c9 ("media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()")
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > index 69346a585f9f..478264f26466 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > @@ -860,7 +860,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
> > >  	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
> > >  			      &pix->height, 240, info->max_height, 0, 0);
> > >  
> > > -	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
> > > +	v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->height,
> > > +				 info->has_stride ? RZG2L_CRU_STRIDE_ALIGN : 1);
> > 
> > The documentation states that, for RGB888, the stride has to be a
> > multiple of 384 (3*128). Shouldn't you take that into account here ?
> > 
> > Also, for semi-planar YUV 4:2:0, the hardware seems to use a stride
> > equal to AMnIS*2, which leaves blank lines after every U/V line. That's
> > something userspace doesn't expect.
> 
> Correct.
> 
> Currently neither RGB888 nor semi-planar YUV 4:2:0 are supported.
> I will handle this once the support for those formats will be added
> if for you is ok.

Ah right I should have checked which formats the driver supports. This
can indeed be addressed later.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > >  	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
> > >  		pix->width, pix->height, pix->bytesperline, pix->sizeimage);

-- 
Regards,

Laurent Pinchart
