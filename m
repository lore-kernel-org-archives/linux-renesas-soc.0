Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC8D3DC850;
	Mon, 27 Jul 2026 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147110; cv=none; b=FUjk79Zh8gzyNhNOQSeY4rEsn8PMUsADbr8yox0OTBpZ+N6EdjlhcWhaQlxbndAnCxq9+uFFjdYzdv9ebEksKdScHz8m8YVVwcVpYDhuP/jfGYCAgo/d/PbR2a5rLviNYJj289ZrYQh5UpYQoQsvMBWV0+nfd5eQjfsw1Y8IN+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147110; c=relaxed/simple;
	bh=FG4vhRlPRtovhn0bnesjGLn2hfgCdngP3LTSt3DqwoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dg+l+B4WpjMvv62FPbNPGKMZ8sMhj2oFliWX5mP1RDhGDhLIcEI0aGoCRB6JTZhx9lPicnDnY1y3735K5JyQ4GobOG8jOOulJUf7iqedT4cmaXFTl+wWf2z2pb5HZ2G132HmziPq7jWWbqcc1waQ7pEpK+5PjVNiIukyKbIdxXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c7wy4iGx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c7wy4iGx"
Received: from ideasonboard.com (mob-5-90-50-102.net.vodafone.it [5.90.50.102])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E7873A4;
	Mon, 27 Jul 2026 12:10:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785147043;
	bh=FG4vhRlPRtovhn0bnesjGLn2hfgCdngP3LTSt3DqwoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7wy4iGxuN+uNkvjccL6jxC8s2AjmCOIB/9yILaLFcwO0qRFDEdH4uryqOh7/6ZBR
	 QSkU2w9r7k7yQW21qJuhfu7yH/GzMa8SJ7M0/mfHYqDHM0+7+SbI1mMEBac4mHA2mo
	 b2ZJsoAUqjyalZtJnj1IHyrgG2YBI6wk/nHos6j0=
Date: Mon, 27 Jul 2026 12:11:43 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] media: rzg2l-cru: Move active_slot reset into
 rzg2l_cru_set_stream()
Message-ID: <amcrr7__3gNxZzxW@zed>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
 <20260616170542.447804-6-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616170542.447804-6-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso

On Tue, Jun 16, 2026 at 07:05:35PM +0200, Tommaso Merciai wrote:
> active_slot tracks the current DMA slot index and must always be reset
> to zero before starting a new stream. Previously callers were responsible
> for this reset before each rzg2l_cru_set_stream(cru, 1) invocation.
>
> Move the reset inside rzg2l_cru_set_stream() so the invariant is
> enforced in a single place and future callers cannot accidentally omit
> it.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index e283d9b69342..71d9c671f739 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -559,6 +559,7 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
>  		return stream_off_ret;
>  	}
>
> +	cru->active_slot = 0;

Maybe one emtpy line here ?

>  	pipe = media_entity_pipeline(&sd->entity) ? : &cru->vdev.pipe;
>  	ret = video_device_pipeline_start(&cru->vdev, pipe);
>  	if (ret)
> @@ -698,7 +699,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  		goto err_assert_resets;
>  	}
>
> -	cru->active_slot = 0;
>  	cru->sequence = 0;

I think it's fine de-coupling the two. The end result shouldn't be any
different after this change.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
>  	ret = rzg2l_cru_set_stream(cru, 1);
> --
> 2.54.0
>
