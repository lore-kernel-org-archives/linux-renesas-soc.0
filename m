Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6CB3F4848;
	Thu,  9 Jul 2026 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590711; cv=none; b=OzsiCTsBF7auR//d/TUr8kqScyg4ChYe+dJjRd6HNt7c5tlbuotxutecYJDbcG1+PfDmIjcXn06v9vIj/Fgsh2AEaLH36AJis111AEvRFUS16hz1C1uHdCeTnnstYuXLYgJu4IYn60i/lxo0QiMZZhQ2NkJc+7/2Yioqlgsr4PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590711; c=relaxed/simple;
	bh=WLOZYEqB4XXMAjcU8b/9vOWy7d8dxljAsHHkN21G8oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvJgZyoIym05B9yqUJbhtiKVPoeORD8MhhcC5Kj6USAEO4bXJTTDHChBSuGxL1GhbKJdusKqJyIrSU+1zXmblyVGwuSyRi9UROxwIe56YBOzDdRWX1SuU0BhAB50kV9vvbMXEYnoXGWGO9G7nO/0OUI+nGnXdC2aCRrru+UlwhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RyI0a4xD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RyI0a4xD"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B107F448;
	Thu,  9 Jul 2026 11:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783590655;
	bh=WLOZYEqB4XXMAjcU8b/9vOWy7d8dxljAsHHkN21G8oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RyI0a4xDLmzGnS4En+6DZvHcBPfoZIhv5uC367x/TSfAC9LMXfflnCo+Ba0XE1oKd
	 wMy+a1jDKSlcAa3kLeZvFMxRT1gA5d5S09Z4yq0mIk5HplgdzMTy86sWmpSnIK0Zmn
	 u58/dJ+0iOjrb6f0m6h5g0MSkIdUldRqiEqkAonY=
Date: Thu, 9 Jul 2026 11:51:43 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Isaac Scott <isaac.scott@ideasonboard.com>, 
	Paul Cercueil <paul@crapouillou.net>, Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] media: v4l2-common: Add kernel-doc for
 v4l2_fill_pixfmt_mp_aligned()
Message-ID: <ak9r850ftuu830At@zed>
References: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
 <20260708161406.396183-4-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260708161406.396183-4-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso

On Wed, Jul 08, 2026 at 06:14:04PM +0200, Tommaso Merciai wrote:
> Replace the bare placeholder comment with a full kernel-doc block
> documenting all parameters, the function behaviour for both single
> memory plane (mem_planes == 1) and multiple memory plane (mem_planes > 1)
> formats, and the return value.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v2->v3:
>  - Moved to PATCH 3/4
>  - Fixed documentation as suggested by Sven Püschel
>
> v1->v2:
>  - New patch
>
>  include/media/v4l2-common.h | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index be4dd9762196..f2b0c336ac81 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -591,7 +591,33 @@ static inline int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,
>  	return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, height, 1);
>  }
>
> -/* @stride_alignment is a power of 2 value in bytes */
> +/**
> + * v4l2_fill_pixfmt_mp_aligned - Fill in a &struct v4l2_pix_format_mplane with
> + *	stride alignment requirements.
> + *
> + * @pixfmt: pointer to the &struct v4l2_pix_format_mplane to be filled
> + * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
> + * @width: image width in pixels
> + * @height: image height in pixels
> + * @stride_alignment: stride alignment in bytes; must be a power of 2
> + *
> + * Fills all fields of @pixfmt for the given pixel format, dimensions, and
> + * stride alignment.
> + *
> + * For formats stored in a single memory plane (mem_planes == 1), the
> + * behaviour matches v4l2_fill_pixfmt_aligned(): plane_fmt[0].bytesperline
> + * is set to the primary plane stride. The strides of all components are
> + * aligned to the @stride_alignment. To keep the chroma strides consistently
> + * derivable from the luma stride, strides may be aligned to a multiple of
> + * the @stride_alignment instead. plane_fmt[0].sizeimage covers all


I guess this

"To keep the chroma strides consistently derivable from the luma
stride, strides may be aligned to a multiple of the @stride_alignment
instead."

comes from teh v4l2_format_plane_stride() implementation.

I admit is not 100% clear to me why the chroma strides is multiplied
and to which format this applies. But this is not on this patch...

> + * component planes.
> + *
> + * For formats with multiple memory planes (mem_planes > 1), each plane's
> + * bytesperline is independently rounded up to @stride_alignment, and

and each plane's sizeimage is ..

> + * sizeimage is set to bytesperline multiplied by the plane height.
> + *
> + * Return: 0 on success, -EINVAL if @pixelformat is unknown.
> + */

Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Thanks
  j

>  int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
>  				u32 pixelformat, u32 width, u32 height,
>  				u8 stride_alignment);
> --
> 2.54.0
>
>
