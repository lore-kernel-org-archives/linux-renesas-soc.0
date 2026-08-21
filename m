Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DD339A806;
	Fri, 21 Aug 2026 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319708; cv=none; b=P6ojsE99votv/IBxFJU1F4LxwYGC8g8Km0j1x2Eii/TDyhw13q6UCaJihv+Drewb0tioWfyCN9V5Mm39KidNOLap9YrLSbIi43H3tZk565SKdbfNteXGl4pX4OdqGUZvqMwp1qnWk3wwxWXZa46LtMemh7TwQzzKhDwaCm2BGb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319708; c=relaxed/simple;
	bh=tq7keHs+/2Iz/8uisXvMgEzz/Nyl5t/AJC6Yi3EQ5fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WT9k6FGgZR1JcHfcyZt0UO+F+lHhxAC0f/HOGoKs13jaxpuqbSuX6n+3uT3qJt4gYt703FQHcGkPrlSHR2whcejcGlwS7jnIWTa47Z8y+tK31MqXBsVMgwitQmL4a6zGKTfEOXlXZtxAdkJdVXrAhdrwYo06X64mpLBiVE2z9Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [0.0.0.0] (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: spu@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7E5D5201096;
	Fri, 21 Aug 2026 15:41:41 +0200 (CEST)
Message-ID: <de73432f-c843-49f0-854b-7f50546351b5@pengutronix.de>
Date: Fri, 21 Aug 2026 15:41:41 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: v4l2-common: Convert v4l2_fill_pixfmt_mp()
 to static inline wrapper
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
 <20260819102812.2592880-2-tommaso.merciai.xr@bp.renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <20260819102812.2592880-2-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tommaso,

On 8/19/26 12:28, Tommaso Merciai wrote:
> Convert v4l2_fill_pixfmt_mp() to static inline wrapper: drop the exported
> v4l2_fill_pixfmt_mp() function from v4l2-common.c and replace it with
> an equivalent static inline in the header that delegates to
> v4l2_fill_pixfmt_mp_aligned() with stride_alignment=1.
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
>   drivers/media/v4l2-core/v4l2-common.c | 8 --------
>   include/media/v4l2-common.h           | 9 +++++++--
>   2 files changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 65db7340ad38..54995ba8c20d 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -537,14 +537,6 @@ int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
>   }
>   EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
>   
> -int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> -			u32 pixelformat, u32 width, u32 height)
> -{
> -	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat,
> -					   width, height, 1);
> -}
> -EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
> -
>   int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>   		     u32 width, u32 height)
>   {
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index edd416178c33..749fe38c134e 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -556,13 +556,18 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
>   				    const struct v4l2_frmsize_stepwise *frmsize);
>   int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>   		     u32 width, u32 height);
> -int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> -			u32 width, u32 height);
> +
>   /* @stride_alignment is a power of 2 value in bytes */
>   int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
>   				u32 pixelformat, u32 width, u32 height,
>   				u8 stride_alignment);
>   
> +static inline int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> +				      u32 pixelformat, u32 width, u32 height)
> +{
> +	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat, width, height, 1);
> +}
> +
>   /**
>    * v4l2_get_link_freq - Get link rate from transmitter
>    *
Reviewed-by: Sven Püschel <s.pueschel@pengutronix.de>
