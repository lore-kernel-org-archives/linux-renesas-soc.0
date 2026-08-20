Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EB435C1B0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215859; cv=pass; b=EAPc7sWw9HHY6XKsLJQTn/HwtHxB7KFTWPdBs5gXI8L9jTwRK7TWKEgipcJBqR47iUO5BqjqYZ0bMRRDKNNy1NJ01kzCODlaSV8rxEWoPQe8tG/6sjBR/Yz9XN3Q0NT5IQnn+jZOrd1LwNboch2o6ZgLeEk4hXRwqW6RxnNGn3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215859; c=relaxed/simple;
	bh=GDnqSDkKScgrw/63AKS5/QQ0ImhBg6RKsAwuTPI4dfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bag4TvVQJClUV2SeE7w7aUbqYc9va9OIzuYXMiOMa11/VpHQAatHWEBN5CvR4t0HyEGgWahNitNgJ7hUYcPNhkCBXNbktReAtLAdzgxIgB2EM6tag24uMH/k+8Kd+mM4ac46by6cRFh1Emd+E+HAlB4aF+hFm9unEm+QN2IKTxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ztb1Mxle; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ztb1Mxle"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1135443f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 01:50:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787215856; cv=none;
        d=google.com; s=arc-20260327;
        b=mQDUw/bHYLY3hvkIfqFUz0B1vSPhoZFrwtkys1dlFAtq20iGeaVXJ/AcYfx0Sszo+h
         dYq8bSWwKLfZS4csfSeErT2ebmcUNgsz1+9w+qpj7rHfH+dPoAjB3p/cJeO1eEAn2H2A
         pkFPKQ5gwH57sMPzg7r8rbqnHJ3t0UBrHMLrfUakoyZVd2JcoAIYK9X7R3gYbtcVIqkt
         8quFRkGB1hdlWlyLyKTz4sGuzyEFQyu1PhIm6/LXYL1+NSnEJNFPzhKcNV6p9XDPufeR
         ZHIM8zrXmKJwkhapVq845PkbfaOtyGB9XI6a3352TPEWYzr/LRNUB/AuF4ZP/U0fTNn3
         WgMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+b4KsqgVhxvXlRz9mSDNS12qqfAiKAY39eGBuHcw7yo=;
        fh=tns/wv08jtP3bS1JKSt1dS6s5SllFzM9nQK/XruvDlc=;
        b=macr25uRVWM9hEUEZxYp2wU1EirLX9qiCleWwdfyBfNKBeAH7kg3Pa1Q615eE+LS0P
         wSpsnjXufIBUDEj/jv3Q5hon6cWok/0UX9JMO56X1AUk864NtD9eR2ym9i07H6CxJDmc
         Lp/k3xhZ+UZxa/fgQnQOQSzwyg7xAjX8s7jemoF2OBR5yNNe5Miqe+7ZOKKedp6fnkb2
         Jt5LU8cdmy+b7jYRJbH4QZhRmmsFii9kRnCF90pV0H07Dzamier9Ldv1fqcnDlp8Q2mI
         fo14z2WHSrzJCdwZI4KfdLBnMEAHuhnYyvVYiA2Tm0R2Jc/oFdcXZ/EO0mOfXsN7YKtN
         Uu3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787215856; x=1787820656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+b4KsqgVhxvXlRz9mSDNS12qqfAiKAY39eGBuHcw7yo=;
        b=Ztb1MxleVmN0uprmSW0Kn6b3hTuIam4KoQHZZQl/SfZ45rflL13KoI3W1RGBX30xSF
         1qOEH8O9uCNckpG/rYKk1H05jZz6XXEjk7AsD5J5ufgE/dooe3TKi+hSIoinOikkp/M1
         3pS4mtwcY59x9ZhJZ1GORUDw4ScGHDiALjWCwHxLLasKH2bLkORtG6I5djoIOWNN0n7d
         KEgBt9lNBSnBXrFJP5mZCRrkjXoSAuYn6ttSzWApiA/abynJqHh8DpnA3BFF5RH+TEwW
         BGtD9xU2zLgT/NlKJ2BTmiGvk497Mt9Lnr/PsGqOFjVm8xWyyGxZMpvmgzbtLxr2JsVc
         LTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215856; x=1787820656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+b4KsqgVhxvXlRz9mSDNS12qqfAiKAY39eGBuHcw7yo=;
        b=PhlfTKoNZwL6xfKLc1JkgDu0sYXKKrK2UZ2g5FiEw2xrFR9ifSTJLTbDUVdd5oYatH
         qnjAYC28c43jFwdUxFNvId81IdVvZu63Q0jCETe/AXXxjjhmUkaFK4xAGB9LJb3EmvmF
         7/i7sMWXhf/BoOZGdnRn82jEfXS/HSewcR8vlDVtgTxSOdGUnY0VNOywcoPrjzE6zoVg
         iX3nRmywEL1rbqoo4MvDx4cfbO0Bs5VsZ5mVS8iNgoir9fhgNDmd7IU1ex7wHdjezkn5
         Eh6/sEyVm7+0k4+RRihSwIX3/5CZE25j1hkuIn4EyWzNk3HnCkn4rnOSVqMdOb5Fnw6b
         yuBQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZGbyWSAipbHjCBw0rMd0+ftAOMQptH9EZVS1mLCV9VGE3JaysZ3jW9hZnkIkg53hv1dIlvzDdJX4VYFqW8gpF+A==@vger.kernel.org
X-Gm-Message-State: AFuF++kUAsPtSiGh6JDMClWNZn9YxengEclCQ8fZP7TNPlTq/rzQA8yU
	5XKXma/Z6Q2z+HbqV7YzEvYE0K5GZsTjEn2yjwfn0Md+RgfBmfq7uHK6BMmlVTGd2eIaIUfCiEZ
	hY00ipdAXB1koVoopNsQFr+9rxxooeWA=
X-Gm-Gg: AR+sD13TBahM28GPu5OIDIUyJ+HQudHBGotFbui/GepemoGe22I1IzXvGxnqZ3YwkKk
	Y8QSWUCt8OohSZojjZ3SwggEsXyS55fKKXIA5hJnP2GjiKYrwzwFkbArkkn1/JVBxopRBS4e0Ir
	xz57TskpgFVZXuXBgzPMZ5XnBDEAUr7kzjm1f/GJH66NjDRPFRTYR7bWHfTm7Dj61kBisU6i1VO
	dr8sZyXp7o0U/hlQwUXrfEDnFTnLTeFCL1mMT0xr7Jd/u+GsizodQjdDtwlPafMrT+N/t10nYB0
	H+NmeXLRzOqaoVuf6gc3r8MFbLpKNgsGg64VSemO3E3IAE/EZVJpZMr8hFQGJiULwcYMoP0u5bl
	TQd/IlBCT3bKnUgK0Q1n1pR4NgIxcxTM=
X-Received: by 2002:a05:6000:1448:b0:47f:96f9:a99f with SMTP id
 ffacd0b85a97d-482b1fdcb2emr17783279f8f.13.1787215855817; Thu, 20 Aug 2026
 01:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com> <20260819102812.2592880-5-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260819102812.2592880-5-tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 09:50:00 +0100
X-Gm-Features: AcwNN1Vgk7ustH1NWBXWkgswHDe5qoB_RvWnWMldXDrYp2dck44yCb8inYnx0HM
Message-ID: <CA+V-a8to3fjK-phJ4PmsAdHxR5co3H3izH=KXcGhVjart8=Nuw@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] media: rzg2l-cru: Use v4l2_fill_pixfmt_aligned()
 for stride alignment
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: jacopo.mondi@ideasonboard.com, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Isaac Scott <isaac.scott@ideasonboard.com>, Paul Cercueil <paul@crapouillou.net>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 11:32=E2=80=AFAM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Replace the open-coded bytesperline/sizeimage rounding with the newly
> added v4l2_fill_pixfmt_aligned().
>
> No functional change intended.
>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v5->v6:
>  - Collected tag.
>
> v4->v5:
>  - Split the fix so it no longer depends on v4l2_fill_pixfmt_aligned()
>    and moved it first in the series, so it can be backported to stable
>    on its own (This the old v4 PATCH 4/4).
>
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 91eda5034248..27a35ef2a6df 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -849,12 +849,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_=
dev *cru,
>         v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
>                               &pix->height, 240, info->max_height, 2, 0);
>
> -       v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
> -
> -       if (info->has_stride) {
> -               pix->bytesperline =3D ALIGN(pix->bytesperline, RZG2L_CRU_=
STRIDE_ALIGN);
> -               pix->sizeimage =3D pix->bytesperline * pix->height;
> -       }
> +       v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->=
height,
> +                                info->has_stride ? RZG2L_CRU_STRIDE_ALIG=
N : 1);
>
>         dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
>                 pix->width, pix->height, pix->bytesperline, pix->sizeimag=
e);
> --
> 2.54.0
>
>
