Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5507317145;
	Fri, 21 Aug 2026 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321752; cv=none; b=jENUHHp/eyUsflD9VUGoPFJ9mPlIO1+48BHYOpVVv2ZbnAWGbMAr6FIKqHEl/cB9Jmwo8Qihdmf33HOLgvJlda6rdiYH1go4XLw/1AxyDj2Hg8m9PmKDfzbdoCQcvHn/AVStbO0vcSVYJN/Pk427+kpsKbizwXq70GNOdTxXTps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321752; c=relaxed/simple;
	bh=abWD/Abw2fEyKRKf/nfTxFPZitb4HrtUtbn0PAvjD78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p4NsYwjr8MhbcpPJWhyTmPTNhZJ83mn9K6iV2AMYy6OAThioej41ozELoiUwOcvbe541cRGga4vc0KeAhJGexnC0RDegweRX4NeqZ6OcVMVE5m9bUFMo+YCRtMa8e0F5MLHre/aD1AfTsUuz4KYYl726OQn7uALdrZvyS7Wd+U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [0.0.0.0] (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: spu@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7329B2003DE;
	Fri, 21 Aug 2026 16:15:46 +0200 (CEST)
Message-ID: <6f6cd30a-d73a-4ce5-a26a-af2fd2023486@pengutronix.de>
Date: Fri, 21 Aug 2026 16:15:46 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] media: v4l2-common: Add v4l2_fill_pixfmt_aligned()
 helper
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 jacopo.mondi@ideasonboard.com, tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Nas Chung <nas.chung@chipsnmedia.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, kernel@pengutronix.de
References: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com>
 <20260819102812.2592880-3-tommaso.merciai.xr@bp.renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <20260819102812.2592880-3-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tommaso,

On 8/19/26 12:28, Tommaso Merciai wrote:
> Add v4l2_fill_pixfmt_aligned(), a variant of v4l2_fill_pixfmt()
> that accepts a stride_alignment parameter, mirroring the existing
> v4l2_fill_pixfmt_mp() / v4l2_fill_pixfmt_mp_aligned() pair.
>
> v4l2_fill_pixfmt() is refactored to call v4l2_fill_pixfmt_aligned()
> with stride_alignment=1, preserving its existing behaviour.
>
> The new helper is needed by drivers whose DMA engine requires the
> line stride to be a multiple of a specific value, such as the
> Renesas RZ/G3E CRU which requires 128-byte alignment.
>
> Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v5->v6:
>   - No changes.
>
> v4->v5:
>   - No changes.
>
> v3->v4:
>   - Collected tag.
>   - Removed "." at the end of the function's brief description
>   - Removed "component" from @pixfmt->sizeimage line
>   - Removed wrong tab
>   - Fixed example (e.g NV12) -> (e.g. YUV420) into function description
>
> v2->v3:
>   - No changes, just moved to from PATCH 3/4 to PATCH 2/4
>
> v1->v2:
>   - Move v4l2_fill_pixfmt() into v4l2-common.h as inline wrapper
>   - Add v4l2_fill_pixfmt_aligned() helper documentation.
>
>   drivers/media/v4l2-core/v4l2-common.c | 12 +++++----
>   include/media/v4l2-common.h           | 38 +++++++++++++++++++++++++--
>   2 files changed, 43 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 54995ba8c20d..2ce4f1c20fbc 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -537,8 +537,8 @@ int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
>   }
>   EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
>   
> -int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> -		     u32 width, u32 height)
> +int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> +			     u32 width, u32 height, u8 stride_alignment)
>   {
>   	const struct v4l2_format_info *info;
>   	int i;
> @@ -554,15 +554,17 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>   	pixfmt->width = width;
>   	pixfmt->height = height;
>   	pixfmt->pixelformat = pixelformat;
> -	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width, 1);
> +	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width,
> +							stride_alignment);
>   	pixfmt->sizeimage = 0;
>   
>   	for (i = 0; i < info->comp_planes; i++)
>   		pixfmt->sizeimage +=
> -			v4l2_format_plane_size(info, i, width, height, 1);
> +			v4l2_format_plane_size(info, i, width, height,
> +					       stride_alignment);
>   	return 0;
>   }
> -EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> +EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_aligned);
>   
>   #ifdef CONFIG_MEDIA_CONTROLLER
>   static s64 v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 749fe38c134e..4e5c5ffaf651 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -554,8 +554,42 @@ static inline bool v4l2_is_format_bayer(const struct v4l2_format_info *f)
>   const struct v4l2_format_info *v4l2_format_info(u32 format);
>   void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
>   				    const struct v4l2_frmsize_stepwise *frmsize);
> -int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> -		     u32 width, u32 height);
> +
> +/**
> + * v4l2_fill_pixfmt_aligned - Fill in a &struct v4l2_pix_format with stride
> + *	alignment requirements
> + *
> + * @pixfmt: pointer to the &struct v4l2_pix_format to be filled
> + * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
> + * @width: image width in pixels
> + * @height: image height in pixels
> + * @stride_alignment: stride alignment in bytes, must be a power of 2
> + *
> + * Fills all fields of @pixfmt for the given pixel format, dimensions, and
> + * stride alignment. Only formats stored in a single memory plane are
> + * supported; returns -EINVAL for multi-memory-plane formats.
> + *
> + * @pixfmt->bytesperline is set to the stride of the primary (plane 0) plane,
> + * rounded up to a multiple of @stride_alignment. For formats that store
> + * multiple component planes in a single memory buffer (e.g. YUV420), the
> + * alignment applied to each component plane's stride is scaled relative to
> + * @stride_alignment so that the chroma stride remains consistently derivable
> + * from the luma stride. @pixfmt->bytesperline therefore reflects only the
> + * primary plane stride.
> + *
> + * @pixfmt->sizeimage is set to the total size in bytes of all planes.

Out of interest: Why is this description different from the _mp 
description for a single memory plane (e.g. not equal with the exception 
of pixfmt->bytesperline vs plane_fmt[0].bytesperline)? Just had to look, 
if both describe the same behavior. Personally I also prefer the _mp 
description, as it's a bit shorter and better conveys the intention of 
only using a multiple of the stride_alignment to fulfill the luma stride 
derivation.

Also on my first reading I've thought of "rounded up to a multiple of 
@stride_alignment" just meaning "rounded up to @stride_alignment", as 
rounding up means setting the bytesperline to the next multiple of 
stride_alignment.

But given that both descriptions describe the same behavior (and I think 
I've also partially wrote the mp description, therefore being biased 
towards it), feel free to keep it as is and add my

Reviewed-by: Sven Püschel <s.pueschel@pengutronix.de>

> + *
> + * Return: 0 on success, -EINVAL if @pixelformat is unknown or uses multiple
> + * memory planes.
> + */
> +int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> +			     u32 width, u32 height, u8 stride_alignment);
> +
> +static inline int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,
> +				   u32 pixelformat, u32 width, u32 height)
> +{
> +	return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, height, 1);
> +}
>   
>   /* @stride_alignment is a power of 2 value in bytes */
>   int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
