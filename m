Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4267E314A98
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 08:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215612; cv=pass; b=RwCD1s0+25/AKLeT8GazjnWAfL1XTNkTNfka5aj/O3p8SY1+BQkMrpf/GBs7HcJneHq/EB9Auuzb2oaEj6qHooCghMLxAGlofpRkiNT6cNTGZqAORi/NdfhLneQ9Lhn0KJ0ZxLEpXXLrndFOg46iX0OM+J6GXV7QgkeBiCiBuYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215612; c=relaxed/simple;
	bh=cU2M9PQTUwXXPvb4pWGxaXdz2036Pp0jkz2zQWC/bPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TkCsZn7Ec6sjRdFki15Uzm7u04C5DkpQicf0lMRgHBNJoHAmy9KoFHmpufeMKlxZLUR+cz+NLzqpI72c9CM2gge3MhVTegBRMEMiTd+ralAbGWVc5GZhrL8WCtXs7tW2x0Z5/yn6V/OpQefMw3QoeDErIu6u4G06m0XshtY2zp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FABH+VlM; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FABH+VlM"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-472326ca506so1333942f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 01:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787215609; cv=none;
        d=google.com; s=arc-20260327;
        b=lPjUDOD0rSLE7kNqsEZ3IqJQnmCo9+FMoJovOn9g6S04K3tGPLKQie0AHPNZrL9CUq
         YPrwLgl55RDOiC0g+jhGbiEvruD+PYHSWA5hhK5Y7hWa7jCAcDOmvMUC+bXr2CFS7C1R
         UkxMcsVrwZpqrhNFMeGGcVf74krNu8WF5IaMJBxQd8vyS3qnaAmM9d4Byw8S92+giK62
         naiSUD6sKYKA+sID0bxUC43Cf+0h8E3W+wcBSTVnG/AUMwYX8t556cxlAFw1X4ii9Rgr
         vQZgTAxypieiqOz1JAZE8mAJvM+yHVcetmuHcezeiNO48AND1+bWOcEosQEJSOuJotNV
         8T+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qk+WGSHaUqhCb3U92mE+N/QPAOIrTCp/3aDSHoJPti4=;
        fh=LPsJBqfp5tu4klW4b6oyHPyoEbenyVhqkonYI1/Bhjk=;
        b=XosTqNfk8F8lYiuBlmWeJe7lqDjWtXVJQM/btfX4d/BcA6QFrbAB59dxH0SQBni5J7
         4hDrwjBX4Bxws07iFv7dg0uBtBXlZ720bljweJyd+BmgCJScuStlrrNaYVgcygl0lRVM
         OS8hfz5V8GhkkuTMIJoof12fhnnhAgkXp/mOoOaRSh/2W/fo9P6L31t3bjzeQZwh8sLE
         iWDYZYOmDuIK8kRONrhfvRPMv/nylyAHD1adgmKPSF8dk4/FnHVU8JaGFmQjyDVPbgU0
         F4Guta3E74voPkkCZetBF08zPk5HW0nkYx5gqD8Z1G4AGwZmxOfyHh+j8qCJnfSCEfUf
         RW+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787215609; x=1787820409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qk+WGSHaUqhCb3U92mE+N/QPAOIrTCp/3aDSHoJPti4=;
        b=FABH+VlM+aJzZQgoidbhsJXfjVoAG43izeE2uZNFyLDFDMMelQ9DWajwJg4+KUKL2v
         7eFu0BD91dpixFRlXexEzcz5ZvN+EXhel0le2kVZK5puTAx5j9wjTm+ZU+Ug5XZEHxDx
         nOOdWqPrU15R8/wMCFqWN8NIeaZ8PsONi7TEKcIXYZgED61uIOHUPoFGT7mwvlo8dv7h
         FB/32AzzFKCquQJ+9CBb4makqV0aJ//9nbuIgD+gdDGElsFBEGwmA/H/LtEv2CqXdAof
         CdD2a91pN8BJyIFYpcPstgomVSnn5D36aKlB8zroIMpke33+IbZkXqFk8VcScxVzMQcz
         /wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215609; x=1787820409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qk+WGSHaUqhCb3U92mE+N/QPAOIrTCp/3aDSHoJPti4=;
        b=mwY3AntLaQGGd3hs5euVutsHmFJ3DntLm/uTyevKsK3y1Ztyiri8S0YS+SXUf0oS/m
         u1UgsonN5ARYBVGpAABhKUuWv9C3d+XcYMiNekSBsBjeuGevyUh+prI/HpsjDUjDvQOS
         Z5L9ba8h2574eeuPMPE368bTA5lfRK0/XuuWfXC4gVTh2cqQtDXwt3BzOLARE+ATnU8Z
         6RJ6eBRWgNGCTz4CTz88BNE8FzrFqidFQjsUBSbrQqFW4dI27eoRT/Ckh4xInKZ0dXFe
         ZPyjG3z9Q/boz/JZouzavqBRHKDvyrjV9ffIelyYHgGw+ZmFBwPXLsePEg0BG/G1iesA
         KOHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxTNuAh7JZQoHrMykwztS6AD6Oa/KzP/9Nv5hF0QUwZqP5m/Wx6WTvG/yzB0I2ObTRAfnv48dYil3O05FWNBxlug==@vger.kernel.org
X-Gm-Message-State: AFuF++mwLRQFHJQjyySdsGMKPlgzVSA4+PltIl8/neaaBjSEhFMYmzg/
	fCrWyfPT4HqFqtle4myww9jK7y7fjrqz5Vd4zwhgiQ2/WD2TvYeSIE9o7hv5tM7JU+mtontUH0k
	NU4xJnFdbdrDrAGPLDk0NNxUgiyQgoO8=
X-Gm-Gg: AR+sD12MrDVpWAsksveNBe6ICmMb6lkoItl+qk1a6G4xQJI+f74RJId3op1bA25Om3N
	EUvvwGRXO1at/Jel3Pt/uTwhvZMOk0xlhe1luhPmCTvX8Z3tqOM8MaNBeD8AwUUaChmmMziSedU
	ESKBaVsoGUfiSvUYDnO9SoLHrvXPdQOGowb4UJu+kqcO7NEhgqthaOF0JIid5BrOKFEOBpsBEwH
	g8NaYxlNerN13UBbc5UTg6GcTbUpnuSmqHm0aIhIx+xU2LNSNMbD/7gw/JCTD6w0hCxoDEhl6qY
	AMiqrhps8uJEWTC3KkE/LMA5Dkaj8RGgq1oD4CkQ7Qhy4tdA56dYiLlF7bunlegItb78KAZjRoI
	VJYkockUFm3g8k3H3asgNuIRv6T5S9qk=
X-Received: by 2002:adf:e190:0:b0:47f:96e6:70a with SMTP id
 ffacd0b85a97d-482b1e1eeecmr20816426f8f.0.1787215609438; Thu, 20 Aug 2026
 01:46:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com> <20260819102812.2592880-4-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260819102812.2592880-4-tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 09:46:22 +0100
X-Gm-Features: AcwNN1VTPj6iLUNjW1T6H8GAeAfSIFUUWyR07LkafGHFIZ3H5Y3eG3WZpSJ1Wy4
Message-ID: <CA+V-a8vePb44xDTgxjb+5-wtOiZqWt_+oREs2fikgOCZbBGaEA@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] media: v4l2-common: Add kernel-doc for v4l2_fill_pixfmt_mp_aligned()
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

On Wed, Aug 19, 2026 at 11:32=E2=80=AFAM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Replace the bare placeholder comment with a full kernel-doc block
> documenting all parameters, the function behaviour for both single
> memory plane (mem_planes =3D=3D 1) and multiple memory plane (mem_planes =
> 1)
> formats, and the return value.
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
>  - Fixed function documentation.
>
> v2->v3:
>  - Moved to PATCH 3/4
>  - Fixed documentation as suggested by Sven P=C3=BCschel
>
> v1->v2:
>  - New patch
>
>  include/media/v4l2-common.h | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 4e5c5ffaf651..33f5713734cb 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -591,7 +591,33 @@ static inline int v4l2_fill_pixfmt(struct v4l2_pix_f=
ormat *pixfmt,
>         return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, heigh=
t, 1);
>  }
>
> -/* @stride_alignment is a power of 2 value in bytes */
> +/**
> + * v4l2_fill_pixfmt_mp_aligned - Fill in a &struct v4l2_pix_format_mplan=
e with
> + *     stride alignment requirements.
> + *
> + * @pixfmt: pointer to the &struct v4l2_pix_format_mplane to be filled
> + * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
> + * @width: image width in pixels
> + * @height: image height in pixels
> + * @stride_alignment: stride alignment in bytes; must be a power of 2
> + *
> + * Fills all fields of @pixfmt for the given pixel format, dimensions, a=
nd
> + * stride alignment.
> + *
> + * For formats stored in a single memory plane (mem_planes =3D=3D 1), th=
e
> + * behaviour matches v4l2_fill_pixfmt_aligned(): plane_fmt[0].bytesperli=
ne
> + * is set to the primary plane stride. The strides of all components are
> + * aligned to the @stride_alignment. To keep the chroma strides consiste=
ntly
> + * derivable from the luma stride, strides may be aligned to a multiple =
of
> + * the @stride_alignment instead. plane_fmt[0].sizeimage covers all
> + * component planes.
> + *
> + * For formats with multiple memory planes (mem_planes > 1), each plane'=
s
> + * bytesperline is independently rounded up to @stride_alignment, and ea=
ch
> + * plane's sizeimage is set to bytesperline multiplied by the plane heig=
ht.
> + *
> + * Return: 0 on success, -EINVAL if @pixelformat is unknown.
> + */
>  int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
>                                 u32 pixelformat, u32 width, u32 height,
>                                 u8 stride_alignment);
> --
> 2.54.0
>
>
