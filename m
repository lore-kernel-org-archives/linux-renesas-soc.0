Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B893644A6;
	Wed, 19 Aug 2026 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152819; cv=none; b=qKdISKwg/ltXI3NXQLqze9vOWROTccggaZXbib+vi6OYfiDb8Hu7p2CesI8Zs1I5P279SegfnMQ5vcvDreOAhUSxdQpGOOTO1Rp19jyOpL3d0SSFkBjIK9Vzy8q7P/uTtZbObD5WiWBkbwXlpksBsdeGYclptfcZqypg4hG2LPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152819; c=relaxed/simple;
	bh=40rmfLJVwRXBVtJkBcnUWrwcmkYkmkpDI+LZNC8KHU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZo+LwMXD+I/9LfxYgDWt42nd6HGJXWSYJL8x5341VWpnKiyVRy0kWl5GtTGsb7V6uOB8TUHhRfdTY51yLgfydK+9uS8PHQRzy48FFOmsZ7DKLSSBui9+XXZkB37GtMywkWBw0zBN5A+ah6rlrZEWveV/zMJ0bIU5EIT6brs1xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MQAE7Ruw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MQAE7Ruw"
Received: from ideasonboard.com (mob-109-113-29-237.net.vodafone.it [109.113.29.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47EF6593;
	Wed, 19 Aug 2026 17:18:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787152734;
	bh=40rmfLJVwRXBVtJkBcnUWrwcmkYkmkpDI+LZNC8KHU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MQAE7RuwGPYf1xm6yLnQrs44xEQb9Ym40/gKoSjBP6jX/Yvs9gdb5UxQNv9sv/T9G
	 IUIBKrxETcBN3qXSB7e4vykhXrf9hj9L1IWdNSHohInkTFs1BcGVrkJW21yZ++0bIH
	 em53Vd4fjjifKp2bObqoEH1S1+pDhRLeJSW/hwls=
Date: Wed, 19 Aug 2026 17:20:12 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Isaac Scott <isaac.scott@ideasonboard.com>, Paul Cercueil <paul@crapouillou.net>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/5] media: rzg2l-cru: Replace has_stride with
 stride_align field
Message-ID: <aoXJk793Kl83qtPI@zed>
References: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com>
 <20260819102812.2592880-6-tommaso.merciai.xr@bp.renesas.com>
 <aoW8O_p_DyG0P5p3@zed>
 <aoXE17gWIN63ZNuc@tom-desktop>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aoXE17gWIN63ZNuc@tom-desktop>

Hi Tommaso

On Wed, Aug 19, 2026 at 04:59:35PM +0200, Tommaso Merciai wrote:
> Hi Jacopo,
> Thanks for your review.
>
> On Wed, Aug 19, 2026 at 04:24:14PM +0200, Jacopo Mondi wrote:
> > Hi Tommaso,
> >    thanks for the update
> >
> > On Wed, Aug 19, 2026 at 12:28:09PM +0200, Tommaso Merciai wrote:
> > > RZG2L_CRU_STRIDE_ALIGN hardcodes an alignment only RZ/G3E and RZ/V2H
> > > need, as only they have an AMnIS register.
> > >
> > > Store the alignment into rzg2l_cru_info instead: 128 on RZ/G3E, 1 on
> > > RZ/G2L, and update the code accordingly.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > > v5->v6:
> > >  - New patch.
> > >
> > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 3 ++-
> > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 2 +-
> > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 7 +++----
> > >  3 files changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > index 3c5fbd857371..a2b833e2bf9a 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > @@ -361,7 +361,7 @@ static const struct rzg2l_cru_info rzg3e_cru_info = {
> > >  	.max_width = 4095,
> > >  	.max_height = 4095,
> > >  	.image_conv = ICnIPMC_C0,
> > > -	.has_stride = true,
> > > +	.stride_align = 128,
> >
> > We could use a #define here
>
>
> Maybe we can use something like:
>
> #define AMnIS_IS_UNIT		128
>
> ?
>
> Not sure. Just to share, I see other drivers using raw values for
> stride_alignment. e.g. rockchip/rga stores this info in it's
> rga_hw struct and initializes it with plain numbers [1][2].
>
>
> What do you think?

I think it's fine, it was just a suggestion ;)

>
> [1] https://elixir.bootlin.com/linux/v7.2/source/drivers/media/platform/rockchip/rga/rga-hw.c#L604
> [2] https://elixir.bootlin.com/linux/v7.2/source/drivers/media/platform/rockchip/rga/rga3-hw.c#L502
>
> Thanks, Tommaso
>
>
> >
> > Apart from that, the patch looks good, thank you!
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > >  	.regs = rzg3e_cru_regs,
> > >  	.irq_handler = rzg3e_cru_irq,
> > >  	.enable_interrupts = rzg3e_cru_enable_interrupts,
> > > @@ -406,6 +406,7 @@ static const struct rzg2l_cru_info rzg2l_cru_info = {
> > >  	.max_width = 2800,
> > >  	.max_height = 4095,
> > >  	.image_conv = ICnMC,
> > > +	.stride_align = 1,
> > >  	.regs = rzg2l_cru_regs,
> > >  	.irq_handler = rzg2l_cru_irq,
> > >  	.enable_interrupts = rzg2l_cru_enable_interrupts,
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > index b426bc7898bf..2c192d370dcb 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > @@ -75,7 +75,7 @@ struct rzg2l_cru_info {
> > >  	unsigned int max_height;
> > >  	u16 image_conv;
> > >  	const u16 *regs;
> > > -	bool has_stride;
> > > +	u8 stride_align;
> > >  	irqreturn_t (*irq_handler)(int irq, void *data);
> > >  	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
> > >  	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > index 27a35ef2a6df..a7b6dce66570 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > @@ -32,7 +32,6 @@
> > >  #define RZG2L_CRU_DEFAULT_COLORSPACE	V4L2_COLORSPACE_SRGB
> > >
> > >  #define RZG2L_CRU_STRIDE_MAX		32640
> > > -#define RZG2L_CRU_STRIDE_ALIGN		128
> > >
> > >  struct rzg2l_cru_buffer {
> > >  	struct vb2_v4l2_buffer vb;
> > > @@ -277,11 +276,11 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> > >  		rzg2l_cru_fill_hw_slot(cru, cru->num_buf - 1);
> > >  	}
> > >
> > > -	if (info->has_stride) {
> > > +	if (info->stride_align > 1) {
> > >  		u32 stride = cru->format.bytesperline;
> > >  		u32 amnis;
> > >
> > > -		stride /= RZG2L_CRU_STRIDE_ALIGN;
> > > +		stride /= info->stride_align;
> > >  		amnis = rzg2l_cru_read(cru, AMnIS) & ~AMnIS_IS_MASK;
> > >  		rzg2l_cru_write(cru, AMnIS, amnis | AMnIS_IS(stride));
> > >  	}
> > > @@ -850,7 +849,7 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
> > >  			      &pix->height, 240, info->max_height, 2, 0);
> > >
> > >  	v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->height,
> > > -				 info->has_stride ? RZG2L_CRU_STRIDE_ALIGN : 1);
> > > +				 info->stride_align);
> > >
> > >  	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
> > >  		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
> > > --
> > > 2.54.0
> > >
