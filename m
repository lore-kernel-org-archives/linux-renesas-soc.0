Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54D57260D;
	Fri, 31 Jul 2026 15:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510433; cv=none; b=LgGb+eDzm+nKNgUEeFI6r1dEYtTLskx8aktvk4+E0IEebfSgo6r0ivqqrW2duUwimv3XdlwyV7nh94oqHgMNFLZzTFYH6AMZGFuRTtl/H8lIRnUu+Xgc21eUNoAOQPcicVPeHbJPkOF7ZvAA/MqmFCL6sCmVKAojtzPjTexQDTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510433; c=relaxed/simple;
	bh=j3jXh9cSKOE726BNMKAFaxe6KGIWbRG91UtITrbacO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7B7yiiDRs5XsVrfJQkLuOLWBtXed2EzXoUqobRKHtE5KeaSnmOXyWhy4ZmlwatF0IU+Xymg+KkYH7Ook/3w6Sq3Cj+Q329Q2M6v0eB1mFNcJdFGnobfQy7FFo2fvZ6UHwUeYtAEuDG2i9GQPrBTDDPoxh6k0oFOxAvc6lngNbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=logFW5aE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="logFW5aE"
Received: from ideasonboard.com (mob-109-113-25-35.net.vodafone.it [109.113.25.35])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C0D5E91;
	Fri, 31 Jul 2026 17:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785510362;
	bh=j3jXh9cSKOE726BNMKAFaxe6KGIWbRG91UtITrbacO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=logFW5aEJ0FsHuPiiBEpQgFAdjPVvvjAB7fVlAsJOnejqEFJcEXZa3BfZDtpM1NE0
	 yfpK602x8sh3u65YXK37knkxJrPedL2lfUPWT4FlL8zdHHTyepfJbuK1QVybQbeoaz
	 xfUwS7ouYNyvBeuZd1BUv1bFjRl9LZej8JVySJe0=
Date: Fri, 31 Jul 2026 17:07:06 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Isaac Scott <isaac.scott@ideasonboard.com>, 
	Paul Cercueil <paul@crapouillou.net>, Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] media: rzg2l-cru: Use v4l2_fill_pixfmt_aligned()
 for stride alignment
Message-ID: <amy559iChdLrrMTj@zed>
References: <20260729105603.1160966-1-tommaso.merciai.xr@bp.renesas.com>
 <20260729105603.1160966-6-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729105603.1160966-6-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso

On Wed, Jul 29, 2026 at 12:55:50PM +0200, Tommaso Merciai wrote:
> Replace the open-coded bytesperline/sizeimage rounding with the newly
> added v4l2_fill_pixfmt_aligned().
>
> No functional change intended.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v4->v5:
>  - Split the fix so it no longer depends on v4l2_fill_pixfmt_aligned()
>    and moved it first in the series, so it can be backported to stable
>    on its own (This the old v4 PATCH 4/4).
>
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 91eda5034248..27a35ef2a6df 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -849,12 +849,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
>  	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
>  			      &pix->height, 240, info->max_height, 2, 0);
>
> -	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
> -
> -	if (info->has_stride) {
> -		pix->bytesperline = ALIGN(pix->bytesperline, RZG2L_CRU_STRIDE_ALIGN);
> -		pix->sizeimage = pix->bytesperline * pix->height;
> -	}
> +	v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->height,
> +				 info->has_stride ? RZG2L_CRU_STRIDE_ALIGN : 1);

this will look very nice with info->stride.

In the meantime
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Sorry for having missed it yesterday
>
>  	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
>  		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
> --
> 2.54.0
>
