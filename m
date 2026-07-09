Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516242D8773;
	Thu,  9 Jul 2026 09:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589087; cv=none; b=pM+BB70KmAqibvLBxXEb5ZF0ZuDQcwiics1mcrF0IKvt6WmgWLuiYgrliE6UsqHhfMcJiZUDaXV6hbV4U9ZntlOdoGEdE3ZV3YUAnDNQySI9IOXAR7AfEeV5TWrgVTIGDUcwcvSp5B/e8EA7m8hEEkwwpHDb5dzn/8fz0GiClns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589087; c=relaxed/simple;
	bh=tj9CZgoogIJoXfl5hvZpFrBq8F9OGHWTwOHP7wc1KTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjOlG5CkOSqgCyZLuc/5Ax2RNy5D625kUzbiUftCLDKoP4eVM4hVVUwNPxrk2v5NfC9SG2lqSu9w03HnAnniZGcHHscDeBHgHd06VSiJZVYsDUVf08knT3Bcc/A7xZUJ+bkdJ9X++JnVDIQTkAM6Cs3noLZLq4lmwuLsp/xwQgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ItHj9aes; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ItHj9aes"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7CAD448;
	Thu,  9 Jul 2026 11:23:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783589033;
	bh=tj9CZgoogIJoXfl5hvZpFrBq8F9OGHWTwOHP7wc1KTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ItHj9aes2qpslBfvtm3LOn1l0c69tRcfcbvpVytxvYwT2zKa7qd7+BHwzguz4E9sW
	 WZdq/05ey23NcxLSByvorJ922A6Ssxt/r2ARKfEb0pZk1/OWisOEjLut67YBVgiPTH
	 38jA9yyTN6raOD0OwYhmdnQM7B0hCv9JTwc3rqZA=
Date: Thu, 9 Jul 2026 11:24:41 +0200
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
Subject: Re: [PATCH v3 1/4] media: v4l2-common: Convert v4l2_fill_pixfmt_mp()
 to static inline wrapper
Message-ID: <ak9oDISHgAzIfqjE@zed>
References: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
 <20260708161406.396183-2-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708161406.396183-2-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso

On Wed, Jul 08, 2026 at 06:14:02PM +0200, Tommaso Merciai wrote:
> Convert v4l2_fill_pixfmt_mp() to static inline wrapper: drop the exported
> v4l2_fill_pixfmt_mp() function from v4l2-common.c and replace it with
> an equivalent static inline in the header that delegates to
> v4l2_fill_pixfmt_mp_aligned() with stride_alignment=1.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v2->v3:
>  - No changes
>
> v1->v2:
>  - New patch
>
>  drivers/media/v4l2-core/v4l2-common.c | 8 --------
>  include/media/v4l2-common.h           | 9 +++++++--
>  2 files changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 65db7340ad38..54995ba8c20d 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -537,14 +537,6 @@ int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
>
> -int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> -			u32 pixelformat, u32 width, u32 height)
> -{
> -	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat,
> -					   width, height, 1);
> -}
> -EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
> -
>  int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>  		     u32 width, u32 height)
>  {
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index edd416178c33..749fe38c134e 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -556,13 +556,18 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
>  				    const struct v4l2_frmsize_stepwise *frmsize);
>  int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>  		     u32 width, u32 height);
> -int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> -			u32 width, u32 height);
> +
>  /* @stride_alignment is a power of 2 value in bytes */

Well, 1 is certainly a power of 2 :)

>  int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
>  				u32 pixelformat, u32 width, u32 height,
>  				u8 stride_alignment);
>
> +static inline int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> +				      u32 pixelformat, u32 width, u32 height)
> +{
> +	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat, width, height, 1);
> +}
> +

Makes sense
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

>  /**
>   * v4l2_get_link_freq - Get link rate from transmitter
>   *
> --
> 2.54.0
>
>
