Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4746249EB;
	Fri, 21 Aug 2026 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320368; cv=none; b=cwt55vHeMRXZq8ZJZgEzkxWlK+bLr1Lk8SyUNqkzIdQwNfWA5WO8/HnFoYAljVmFVebiYd96fY5oCKSQsYdLlj0Ci1ppPi9OP3+WZJstrl9L/1eULNPllFulNDqk1iVP4ogvG1wedrAo1sOjKx9cHpjQJQ5r577cQJmPOwLSt3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320368; c=relaxed/simple;
	bh=aIbfl69tUpXlS2S+WYmmd3nGfM6bDGIKmP9UmEbgz6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SAhsPmkq+N03STexepjxg6YleMW5YhBaeD+q4Gr4R3GLXaiDFgKIU1RmEBDzHnrRl3Y1LvLAKAxC5YpkpXpgHqJBGuQnkgCB7nCs5jX06O9/I0xgnJPDXjYT9QFVhq1m/1DQDjL975VkkfcXCALNd6C750HwZ6yn5PDjVJY+Xoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [0.0.0.0] (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: spu@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6CD5A201096;
	Fri, 21 Aug 2026 15:52:43 +0200 (CEST)
Message-ID: <9568f865-053b-452c-8b64-d4a2ca515454@pengutronix.de>
Date: Fri, 21 Aug 2026 15:52:43 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] media: v4l2-common: Add kernel-doc for
 v4l2_fill_pixfmt_mp_aligned()
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
 <20260819102812.2592880-4-tommaso.merciai.xr@bp.renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <20260819102812.2592880-4-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tommaso,

On 8/19/26 12:28, Tommaso Merciai wrote:
> Replace the bare placeholder comment with a full kernel-doc block
> documenting all parameters, the function behaviour for both single
> memory plane (mem_planes == 1) and multiple memory plane (mem_planes > 1)
> formats, and the return value.
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
>   - Fixed function documentation.
>
> v2->v3:
>   - Moved to PATCH 3/4
>   - Fixed documentation as suggested by Sven Püschel
>
> v1->v2:
>   - New patch
>
>   include/media/v4l2-common.h | 28 +++++++++++++++++++++++++++-
>   1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 4e5c5ffaf651..33f5713734cb 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -591,7 +591,33 @@ static inline int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,
>   	return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, height, 1);
>   }
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
> + * component planes.

Given that the behavior matches the non mp function, it feels a bit 
redundant to explain the stride scaling again. But I don't mind keeping 
it to make the stride scaling behavior more obvious, so feel free to add

Reviewed-by: Sven Püschel <s.pueschel@pengutronix.de>

> + *
> + * For formats with multiple memory planes (mem_planes > 1), each plane's
> + * bytesperline is independently rounded up to @stride_alignment, and each
> + * plane's sizeimage is set to bytesperline multiplied by the plane height.
> + *
> + * Return: 0 on success, -EINVAL if @pixelformat is unknown.
> + */
>   int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
>   				u32 pixelformat, u32 width, u32 height,
>   				u8 stride_alignment);
