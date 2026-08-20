Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BEF305666
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215499; cv=pass; b=QPqZwqwephz/iwJzWEirH3A5M81+mV9K0BaWgHp7AwP8tMfdefj3rLEQvcL31BjeIB3duRFh87JifBvINXx796CoMd9ffZ5lRhfouJd8kaO8m8NeYQxQupAQVBIPNwQJEf4oGoE0RStm3PgI1Y/b9CtjZw3LNn+9GkYUJHm9Sjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215499; c=relaxed/simple;
	bh=6K0vXl+7XqVkMU05NyIWM3U6GOCf8fnZsVbnMubo6uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3hfQGZPgYNHGqtLijziXIICGA59hmDXHtif88rqiyueGApT5PkuP43rne0osIl87lZOJZbWLf0+OF8t5iM7Mj8iOF3pV2M5A0+Qzox0cF3RXVGDAgW42CZ53/sWWW9Ss1e4FZ877gxYuSGMI6s2l1KMQcAjpxi83Ks5jG0P6+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwDQzGj+; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwDQzGj+"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482938466a7so1675986f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 01:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787215496; cv=none;
        d=google.com; s=arc-20260327;
        b=JvcCdIs7jAbT/7dzW3S6ZUVcDW/skRy/up/wLy+bekcnTFaM1LA5TIdbzDvw/zw27O
         IHRghpgFGLVWZiojJ7N5m1NENdswq+S7yqQDlEmfbWPvyaEUwTVfu9FwXGaL8Gvpuz6y
         U+TGpi4ASwiMw8VYlFmARmf//vPx9WoA7grMNyUKPLlzfH3RqIqcQe7Y3nXenMtWgmd4
         czV+lcI0eZhBbC3+ixoR+sxnctjz5RFEJ3RYjf5/71vsSn1hy25j0CZcNvkbq5s8dLeg
         MRi9q54ljZVjRBIPzvWe+5n36/i0XQIN5C08kK8JSjq1DWLr9Vl5rB7wscWJ28VzQ7oO
         YnvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wA2J8BLeP7iBIJb1HYoJPxBCCTSKciUwm8LMseHtCJo=;
        fh=kYYINlsm4uinJizS/S/cAol1lgloodcDy2PLwYkLZCg=;
        b=P6He+iAuNUlGHk/erFg7qfWng0nAUoOGWvBptOvmT3ItzBZ+qLA2eINkwM/EACT+Uw
         9AA4ZqmztZUNnhhA7wh6dNIA96uTvq2t+roxHUKFjDd1S2fphnjPGhn+PGgAmwSktzPv
         kuS95YB0oHIrekqVAgAfxeh2I2oMJMZRziDOt0a5n07J+Se54EehVYtg68UTiTJm6M81
         P9gmnkmnF384soSLo26sWdgNacNq8bam0Y4rI+iOV2aRxav3XFBaXQtJFk2f9xAnMaeS
         /k6HBtOc0Fp2Plb4acM5e4g5r/MWKJeDFjb7TSbJM7aabTqHLx9ASy9LPrAR40sT43IY
         AdbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787215496; x=1787820296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wA2J8BLeP7iBIJb1HYoJPxBCCTSKciUwm8LMseHtCJo=;
        b=VwDQzGj+tDYziDvS7hYtNjWlxmEs9V4ORJjegVifMMwEBX4goTRKIcVYGmIuf1SS+k
         l1tzrrB4O6kwrZKiINBqJ3nOzL8qgfwcyXRVXp7g19p5nXnlkHYJLxFGoofygKhiZRU+
         bwwlIi/YNVdK5NUNuB4rAqnSamn+fIkkz6W1zJmsW042ZnXCxshi3DxCfQLXG1HTvt+B
         hoMdspgLhR+yyZHY1d2NgFC1K+bpV702UzpYxhc1meVRiF+KgG1EIfYHr7NPDYwHsGe/
         8LZWL1TWN0mVF+SD8y7ov6PefyxZiK4Ssy0I3wioxH3s9sY1xp7X1BfSOQtykDqfLkL4
         bk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215496; x=1787820296;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wA2J8BLeP7iBIJb1HYoJPxBCCTSKciUwm8LMseHtCJo=;
        b=bkVKB60bbtGJpLvRXQdpVxPEC3HefTQs+1aEDEmIEjHwu44J1xWCbfXRoFWKt1/iqw
         Td+11jpAIMns7GpEL8m84XSzu1ba1CkAwi+JaN6kkDVhAU64+XJUyEIzppu4apHUsNkI
         +K/fgBBaon2a+m4UZ/VEixc6U5THbgRR2r4f09piRynRMrvUVBFe+NenWbxISv91x83p
         RLrFaty3Ph9h42dZfXt4EU48R3pjiTv6J6e/8y5pP51yofMBNj5F+00xejJBfpprjUAg
         Jxbywqxj7L0Wbf6tcUKL6q+wjcaVdyu+I1mHDzBTzesninJW79p7JCBxled5gXJcE8Ln
         KaJQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro45z/1teMKRH6mAH6t1PUFmyPV7MwEUNwMxxatMaHIyRLfb3Ls/VxWOHfuQPf5mLLu+P7kSxld4nLp4GdcBcZvxA==@vger.kernel.org
X-Gm-Message-State: AFuF++l+Gvf2jEiq/7hIIR7O8SO5OS3V8nhwWG1rT9Xs78Qkxb0KY66l
	bHHsa5T+kz26qZLLgbG44ItlIMAjkLv6xocp9P6T8oJ3oxkHRL9RW4cpRbZjxkYBXqlVShgKRJT
	2/Ch73SNt4UJeSUyF+/DJCX7USBi6JyY=
X-Gm-Gg: AR+sD12lIB+KELyXZB0nTcsF31CH8qCoz7nECig3vJCXUt6tOJKaVeolY2In+6VC3PH
	eV+Jvwprb+O5xhEuyHdUMMPdREphpLpAG0Dgnu/Cn/7s13LPtruuro9OZ/ClM0i//K8vpSFPPDC
	jGA3FaBDhEIpbR2E65aHKL9j2ZnUwRmU3Ze2q6v2PBqbzA3fhKzE30AenqixTcmsL4RdgGWSe5K
	zhj02k0doxqbbhua5QOQfhy+fl816EYeu38+TCIbFS+Ip0ApIbYSvw6O48DKtfWCLU4KIfZCRA3
	W6kZJFxHZGxNJB+2kEfNJlwBTUSSS6ysiW0KmfHCKgB2tSHG3rWBTC2DlUmiNG/V2PgJIZY3t3J
	i+GPrpOIHXtij5nevwE+aJnII4eq1yMESfdDnFH8cuw==
X-Received: by 2002:a05:6000:401f:b0:47f:fb2e:f63d with SMTP id
 ffacd0b85a97d-482b1e94e3cmr15789665f8f.9.1787215495473; Thu, 20 Aug 2026
 01:44:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com> <20260819102812.2592880-3-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260819102812.2592880-3-tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 09:44:28 +0100
X-Gm-Features: AcwNN1XMZ7lCC002pbG1M_9Cx_PPFmWFHfCPDrQH9tCeK5pf760lbsCqYkAEQ24
Message-ID: <CA+V-a8v9nwvX7hpVu13Ryoo3Q5+bNEh+2Nwm1aMhCCinfG=PAQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] media: v4l2-common: Add v4l2_fill_pixfmt_aligned() helper
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: jacopo.mondi@ideasonboard.com, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Isaac Scott <isaac.scott@ideasonboard.com>, Paul Cercueil <paul@crapouillou.net>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 11:29=E2=80=AFAM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Add v4l2_fill_pixfmt_aligned(), a variant of v4l2_fill_pixfmt()
> that accepts a stride_alignment parameter, mirroring the existing
> v4l2_fill_pixfmt_mp() / v4l2_fill_pixfmt_mp_aligned() pair.
>
> v4l2_fill_pixfmt() is refactored to call v4l2_fill_pixfmt_aligned()
> with stride_alignment=3D1, preserving its existing behaviour.
>
> The new helper is needed by drivers whose DMA engine requires the
> line stride to be a multiple of a specific value, such as the
> Renesas RZ/G3E CRU which requires 128-byte alignment.
>
> Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v5->v6:
>  - No changes.
>
> v4->v5:
>  - No changes.
>
> v3->v4:
>  - Collected tag.
>  - Removed "." at the end of the function's brief description
>  - Removed "component" from @pixfmt->sizeimage line
>  - Removed wrong tab
>  - Fixed example (e.g NV12) -> (e.g. YUV420) into function description
>
> v2->v3:
>  - No changes, just moved to from PATCH 3/4 to PATCH 2/4
>
> v1->v2:
>  - Move v4l2_fill_pixfmt() into v4l2-common.h as inline wrapper
>  - Add v4l2_fill_pixfmt_aligned() helper documentation.
>
>  drivers/media/v4l2-core/v4l2-common.c | 12 +++++----
>  include/media/v4l2-common.h           | 38 +++++++++++++++++++++++++--
>  2 files changed, 43 insertions(+), 7 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 54995ba8c20d..2ce4f1c20fbc 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -537,8 +537,8 @@ int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_forma=
t_mplane *pixfmt,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
>
> -int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> -                    u32 width, u32 height)
> +int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelfo=
rmat,
> +                            u32 width, u32 height, u8 stride_alignment)
>  {
>         const struct v4l2_format_info *info;
>         int i;
> @@ -554,15 +554,17 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt=
, u32 pixelformat,
>         pixfmt->width =3D width;
>         pixfmt->height =3D height;
>         pixfmt->pixelformat =3D pixelformat;
> -       pixfmt->bytesperline =3D v4l2_format_plane_stride(info, 0, width,=
 1);
> +       pixfmt->bytesperline =3D v4l2_format_plane_stride(info, 0, width,
> +                                                       stride_alignment)=
;
>         pixfmt->sizeimage =3D 0;
>
>         for (i =3D 0; i < info->comp_planes; i++)
>                 pixfmt->sizeimage +=3D
> -                       v4l2_format_plane_size(info, i, width, height, 1)=
;
> +                       v4l2_format_plane_size(info, i, width, height,
> +                                              stride_alignment);
>         return 0;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> +EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_aligned);
>
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  static s64 v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 749fe38c134e..4e5c5ffaf651 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -554,8 +554,42 @@ static inline bool v4l2_is_format_bayer(const struct=
 v4l2_format_info *f)
>  const struct v4l2_format_info *v4l2_format_info(u32 format);
>  void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
>                                     const struct v4l2_frmsize_stepwise *f=
rmsize);
> -int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> -                    u32 width, u32 height);
> +
> +/**
> + * v4l2_fill_pixfmt_aligned - Fill in a &struct v4l2_pix_format with str=
ide
> + *     alignment requirements
> + *
> + * @pixfmt: pointer to the &struct v4l2_pix_format to be filled
> + * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
> + * @width: image width in pixels
> + * @height: image height in pixels
> + * @stride_alignment: stride alignment in bytes, must be a power of 2
> + *
> + * Fills all fields of @pixfmt for the given pixel format, dimensions, a=
nd
> + * stride alignment. Only formats stored in a single memory plane are
> + * supported; returns -EINVAL for multi-memory-plane formats.
> + *
> + * @pixfmt->bytesperline is set to the stride of the primary (plane 0) p=
lane,
> + * rounded up to a multiple of @stride_alignment. For formats that store
> + * multiple component planes in a single memory buffer (e.g. YUV420), th=
e
> + * alignment applied to each component plane's stride is scaled relative=
 to
> + * @stride_alignment so that the chroma stride remains consistently deri=
vable
> + * from the luma stride. @pixfmt->bytesperline therefore reflects only t=
he
> + * primary plane stride.
> + *
> + * @pixfmt->sizeimage is set to the total size in bytes of all planes.
> + *
> + * Return: 0 on success, -EINVAL if @pixelformat is unknown or uses mult=
iple
> + * memory planes.
> + */
> +int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelfo=
rmat,
> +                            u32 width, u32 height, u8 stride_alignment);
> +
> +static inline int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,
> +                                  u32 pixelformat, u32 width, u32 height=
)
> +{
> +       return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, heigh=
t, 1);
> +}
>
>  /* @stride_alignment is a power of 2 value in bytes */
>  int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
> --
> 2.54.0
>
>
