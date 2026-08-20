Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B293DF01F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 08:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215333; cv=pass; b=lN2sHh6+A5TsRnHH7QbBJw/qICbpO8AfZaxZ35uBmOxj3Ih1ztfPmRX7VdgravCxm1QzFbAyeiG1HuaWPWkth9ixUIt1EzUQtRjAm6xS/xxDrrOGoBajWgB5EmD5GOuzuoiqhlusYvvmb2RNOHHCngvOZRnu2FjmrjF3ottmHnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215333; c=relaxed/simple;
	bh=SSKSnNK72yAHHpvxHbN76LZgXagsVuidWHkXdpQYMwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oplw3T5mfSkAxS48KyRm9YATeBOIZ877nplmhdR22QQ0imf+qoZjmhxUTSzXHtkBGURC8hmzslht93Q58qH7XS/PbDfZyIMQ3qPHAUvNFTeVs1aasWaj49lmHom3+FQC1/8pWooBm+vDKnhkMpNV7FjEAn/ifUnVdekkOZycH5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFH9PtkT; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFH9PtkT"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499b57cf2f3so22975e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 01:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787215330; cv=none;
        d=google.com; s=arc-20260327;
        b=IFPmWk8qV+iG34ehPHPGRnDrxhJLDZSAhqDPg4NrfpBiPPeE+cljgvvs0ET8N6FObF
         70QLePDyBRqS3vqe2vfHlw+P27+WvJvFv0WRjE06KyI0PNxQdgIWLic05YR8DJPM0qE5
         zjS7JDUDxZYUO8nxhL4VQ9uMFDF6hzMKRczy4HnT+4qAZ7ONWLlyaNI2mqlANtplGFwF
         S5kYeS1y8sVGR9F115J++cDNu6AyZ8RQnZMyYoVoaY1yxkT9tYBiLyQXW5ueA+ojxXYl
         T6aNLG///Po1wrobJuumeSAdVWizlsBVNiuMj1oa34UyMT/S+0W3/4yxow+IRfnxHBgg
         PHhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8IAh25Y6gpDB3AIPvbgjXar+PmqNUm2Qfk3Q5Mu44RQ=;
        fh=KTcwFpBbEKUA1lRVRkvLtVHgjKf/wS2e3XvYA89uf28=;
        b=Xb/ZWTsYz8kT1eFXOM8n8wdvtdX4A82E1HJBy4mfTNkpRbOjbqo/uPcc0QqwrYqhSq
         QtCDb7WIi7OPu+a242eq1Wji5cBD9DMAUBQOlJUJLrjC44KFc8GmQ5oN32Icf+2kq34o
         /jVaiMMj2vP9w2fT1un6aD9mcvjyEbOgp1PiSoLUJnnJyo06Ma5HOYXqkpCBs9OVQiKY
         JIr0xSlPkPQAPx8g+Tp6ojz59i+iBVXrKuXB3tIDoOSvRYxtNFf8dhdsZ//f97BWszuY
         2IMdFsQyIjGmiPKQdYVPzJmOkY9eL7PF/BVlEwcDGWdZp48kf8Jn50QzAEQsc/sERC71
         Jv0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787215330; x=1787820130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8IAh25Y6gpDB3AIPvbgjXar+PmqNUm2Qfk3Q5Mu44RQ=;
        b=hFH9PtkT4TG5fXM7j+yH7sk+OTTcilMpfZt0R/yZDlEQddBMI1RYJhu3zKFvZnLjR+
         7y+RfL/OwyYmLbclJUq5M6FSl18Wi67RXPRjMSknS5JkrljdGWWB4v0qQvTrxNZh1i+H
         RZEV/fxMLpqoKoE/vd6Oibvj2koBgBRrEnlfuvUYHGaHYcMEmKhuojyo7ZSTJXYSKXWQ
         qCWQpTLlYgRAIX1wZ0P4PqXdYYCQdOeWe362kbXSBknGMl1PZoLeShrFE+vL5onwhNlO
         VBeWlkjO1SVKVVlZYrMnVrOUhK3pLlFeoVa4IuhH6dj3byANfJ1noAQ6e+SnW3PgDG4u
         t1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215330; x=1787820130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8IAh25Y6gpDB3AIPvbgjXar+PmqNUm2Qfk3Q5Mu44RQ=;
        b=lREiEMIBWF1vnJs/fr7tgEoP4CNNW7yaojPOlE8AlZGTxvgUCNQMrVa4qktceCZEeb
         yLFEibloEqItx1wI1CPgTnfkdOkvTiQ2awZnSyxKYqw2z9TAmzwT1AVIKsCsfBRnejo8
         dtfCc37ZXnENQz9vALa5e+eMXrzd1tUGXm1XjFkjF7Z2lRPsJnYywggOxoyBhQWIlhw6
         Z1D0RjmXCGzyDzS+5Iv03Ks30xzFKcBtFD/mEjeXMt4D83MdKFtIF3ZTQIy9dPx0nbsT
         mWPi7CmRj3xg7KW+9Gz27RhXXhVGQQ9aX1eOG0ward8ufF6BqczGrlMKgTuDXTK66zzY
         t93Q==
X-Forwarded-Encrypted: i=1; AHgh+RpbSc0NLJxZvVbC8ip6HgqgTTlxftOBPc0i7+4sL40W3uNUH6oulOyct2TZeg1UxE56WWu3vAWwhr+MEos8Our+og==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywajf9vKehW3jH9pFxDvZ4IEHlvrv1hxKU3J5k+Mq/AiV+WzJBK
	zNDUVF3+pVdwVFjfhACUgVRqe9cjMkrJFzgV/80vzhWoZzJ6wk8IjtkShg/IlhPMCjxx+w2Ffj8
	TFFqZHE9bAojoxZCtJ60Q95Oz5fecFiQ=
X-Gm-Gg: AR+sD11Y3S3CDMOnZlZpb0ce0fvzsvS/+Fp05bgoWVIeJKfEuJCh0cR/DIfsk6Ct0t4
	MDPJkNaBUs6U1JWadOUNKkRZTTNZO7Dpvt383tVk1ZHYug8h5Afx6rGscOYt1l34VqFm0B8+mo0
	+86NedxoEybkrKumA3DnoHqpiAg6tZqIyCJ8t6g5PDeasmEB4zVnt+q7v+FGiVhCQwRzkQJQyDD
	DzwlmYNjrWZ7LaI7RBYTYxNVziq0UcbW+wd1+J5gJRx+2jPAqbxKzi8d66lvJ3zkQfD0GapquFJ
	cjOLC7quQ5d4+9+CURT5I6LI6dKNlGt+oA7sg2Sy4BtsJSi5eA2ZQO3RbXuCYW35rzktqceJyZx
	fr2cemnJcNbhVdI2nEHpxpVxzNmrs3f8=
X-Received: by 2002:a05:600c:810a:b0:499:59fd:dbfc with SMTP id
 5b1f17b1804b1-499b06a5900mr41867195e9.1.1787215330179; Thu, 20 Aug 2026
 01:42:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com> <20260819102812.2592880-2-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260819102812.2592880-2-tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 09:41:43 +0100
X-Gm-Features: AcwNN1UHM6d78eJknN2umOmtPFMrbyKPFHdLr4AFH0nosOnIzKcRLcSXje17w5M
Message-ID: <CA+V-a8vfSTAi+fy3ngTxVGfXmbpXCabGmuRzf1XCv-gF5i=bmw@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] media: v4l2-common: Convert v4l2_fill_pixfmt_mp()
 to static inline wrapper
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

On Wed, Aug 19, 2026 at 11:31=E2=80=AFAM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Convert v4l2_fill_pixfmt_mp() to static inline wrapper: drop the exported
> v4l2_fill_pixfmt_mp() function from v4l2-common.c and replace it with
> an equivalent static inline in the header that delegates to
> v4l2_fill_pixfmt_mp_aligned() with stride_alignment=3D1.
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
>  drivers/media/v4l2-core/v4l2-common.c | 8 --------
>  include/media/v4l2-common.h           | 9 +++++++--
>  2 files changed, 7 insertions(+), 10 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 65db7340ad38..54995ba8c20d 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -537,14 +537,6 @@ int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_form=
at_mplane *pixfmt,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
>
> -int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> -                       u32 pixelformat, u32 width, u32 height)
> -{
> -       return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat,
> -                                          width, height, 1);
> -}
> -EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
> -
>  int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>                      u32 width, u32 height)
>  {
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index edd416178c33..749fe38c134e 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -556,13 +556,18 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32=
 *height,
>                                     const struct v4l2_frmsize_stepwise *f=
rmsize);
>  int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>                      u32 width, u32 height);
> -int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixel=
format,
> -                       u32 width, u32 height);
> +
>  /* @stride_alignment is a power of 2 value in bytes */
>  int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
>                                 u32 pixelformat, u32 width, u32 height,
>                                 u8 stride_alignment);
>
> +static inline int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pix=
fmt,
> +                                     u32 pixelformat, u32 width, u32 hei=
ght)
> +{
> +       return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat, width, he=
ight, 1);
> +}
> +
>  /**
>   * v4l2_get_link_freq - Get link rate from transmitter
>   *
> --
> 2.54.0
>
>
