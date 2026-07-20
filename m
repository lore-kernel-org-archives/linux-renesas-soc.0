Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0CE2D5C7A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784560530; cv=pass; b=qMx4WmvbUZlD5iwlL8YF34P+ddn+Ara1RChWPhQMFqIkHX7+UA7ocKNux7vAR3mhhl6U54feMtw6z81B1yS3BaW9SfEi8/Et4x3JAene2T5kZauy5EC8jc8BQ9Wc22lszMuezpEw8fD+ipMyb1TJYL6Jb+vkCxDchliJOjUOdrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784560530; c=relaxed/simple;
	bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+cF+Pxux/mzlrTu3EDEws1M8dopwGd8bR58Cy4VphtVTEDp/N2udVgJ3y/KNqJO24RSwylH/BAb7qdWXWTy8ywZ7W5jB/7HunwozD/ryjBfweqczJemmFdHxmay4D2pXqLzgFqwHdTv2qxgBwU9ujcEStD5bvUDx6f9KFEreY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qa0titk7; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qa0titk7"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-451fd21113cso3047121fac.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 08:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784560527; cv=none;
        d=google.com; s=arc-20260327;
        b=YNte12kFtRNZH7ItTvEayULEM69JrnVuLQtKeAhgyRfx4gCTNfObuaC7w6PCjSHu77
         0sfBlf6t+e1QGbenHJyxlm7RFaYfusqD2zZzh2R32bEzOoQVD2Dg4et+Jey3xyddWT/D
         LUjAnCtaDSZO3igJRgi1NZ8ugfPblLPHWMcmmbNz5cWWmS3PVC0Fc+tGyL1BQ38m3oLZ
         tEo+bB+v7z0QyW1QSPL7dpzCW/Gfp6h+Uqr2Vu1X22x3iUzaK0LvjrEeFEQAqxxGrbca
         Lu/efjCEVC4NX9vfWFJ4tQ3OBl2lv6sgeIeHcJr38F+xHrsj21ajTjv74bGlPaqBci6r
         P9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        fh=Xm7VR7xnuPApfjxjHpV61MBaWN8JsmXFAY/xWlxFBZ8=;
        b=K+JoHqwWAvxBorDcpwlraQuqNKjYxYVt7vdF5KLLAMmRbS/eQChi425iXOnDdW7H6w
         0MAtKY8giFFr3dciVBp9o2kEMBbcY7ApI2v3bTw60CiMoTT24XIF7xllXGeMQWRr2knP
         d06TRJG0aCKDUurHOadyKsplAVolM+DLbHbggyzcNy2s8qoHkhnB9KGrbph4djGxgt60
         vgBq5wq/t59uqz0RC6+fN8U65ROkEvT1wm7OEyUJzySAdN3E318V90UngROmqUsSHUOj
         8b4U1oZA86rANBSx9XItTDK3t5Tua/0bHCQB7O3NDhvbHo2u/b3QWzNkgD9haYoySMN2
         a21Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784560527; x=1785165327; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        b=Qa0titk7cfg9viilFM7aeV6rGktWqe7x27okTN8DPh4jDXARUYMWgxFqxEmt8YHFW+
         +Dy3mi/GxA2kDbvpK4sXRTXDMIx5qZMoh1bmYVVQnnXM7jzGCCq237bpKk0kli6zUIwC
         RgrZZlqITt9lVBKOzUieGKvb1HV/BfWBY/b/Rd9Rz1cAQ7x8FjzLslZp0N2vNpZmfJ4M
         kEbCbg6fooOpLtFBl7cVMWXd6yY/4Hm7nVfgRd7zX22de0JrbPTmGMj/gm0BRTPniOZP
         xv/19X3ArFMOQLOzuBwpydTPmof4NiCVAQjsRUDqg9jUJNUcr08+k2jKVpsfpLEJpR35
         selA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560527; x=1785165327;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        b=mCn+/K1Uv7FsTPXv7qsOaOLZtu6qvRvmlGBnCJ1iRCDN8CYbUgM6e+OZK499lbQG+g
         yTwQp3p0xJ9TPjy6508gB6bAcPfqmVZIa7mmVDdErb7SuhWjg/oPF8meflqWWHe3MV5q
         Zt+HD2NPjST/gb9tzswuffEgGlfHHdWfC+Q+B4L4XRpxI16BS8A8FXAlTEuagaa4o7O7
         3leJgGU1qRH467zJJLeK5GJCG1DseFTaZYzZd6yWrS4QWsRO175aDErgX/ouHIgPOAC+
         TJWutnKiakP8mU2kbiqLJxyMZP2+25bge1XneymPTPF28e5Uk0taxiaJlJpu4Sph1HH5
         sRzw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+lbZHINodEP1NljBlm6g8tmx4RYOWrO6EfQfTGayZYTu/xmQioyf1/cK1IFQmj+5bhi6QkuufEzQoyXCWFY76qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIFx0HCq68BMsunTG2j3VIM7aM7UMYy/b5L0JlHV3UREo0+yee
	kmeuuYSu+5Dwi0sDxKXxn524oqXI97Cn57ulKHKd/gr/MEuUa00Ug23foKmdlJDH5NYDuDVLKpu
	TYECM4zcq5Z58nvSDiMHx13bM8hUDIRg=
X-Gm-Gg: AfdE7cmann5yjuDg/2NwJk3Y22rVbu5LJ4ZtqnQsxr82Cc+UCXrJUdgN5XVJSvLrX5T
	4UgrIRtQzm+6fwnA0mkpEPYPKp+Tf8gE+RRLK87085kC91covLCwKASNSyo3xo/o7n7cCArEQUm
	pNPCuMu2osYbyJQEIQ9fR/UV/yeisJfo+V92EVC6JXBfdXKgepXOqAxWPH0dCOzQBuFqO62NNGr
	xATvzViu5KAZVp89oevZaS07jL81TqTpQOdlN1YR7mvZJMcdORVm1TbP9U5M3Sf99wl2Yk1NcZP
	hv4pGzgWJoUfqBfo8ujB7qkOYTU=
X-Received: by 2002:a05:687c:260d:b0:435:bfb7:695d with SMTP id
 586e51a60fabf-45661144d55mr7411947fac.27.1784560527422; Mon, 20 Jul 2026
 08:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
 <20260719-drm_simple_encoder_init-v1-1-a78c509e3062@gmail.com> <4af254a4-beb7-4f77-830f-42d5bacb10a4@suse.de>
In-Reply-To: <4af254a4-beb7-4f77-830f-42d5bacb10a4@suse.de>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:15:13 +0200
X-Gm-Features: AUfX_mw73hUQoweWxVmRQ0kaDeRwypjcxis2alI1xmtq6INWQD6CfuNjqz3kn5o
Message-ID: <CAJpoHp73S2_cavgV3aVwC5PS8H1GRqTdDV-Xu8n6nXavBnV2=g@mail.gmail.com>
Subject: Re: [PATCH 01/15] drm/exynos: remove dependency on DRM simple helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, David Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey,

> Again, you rather want drm_err() with drm_dev here.
>
> I've briefly looked over the series and many patches seem affected.
> Please prefer drm_ logging functions and DRM devices over the plain
> device equivalents.

Thanks. I will submit a v2 with consistent usage of drm_err().

Also, is there any ongoing task or would it be useful to submit patches
changing the usage of DRM_DEV_* functions with drm_* equivalents?
Or from dev_* to drm_* when possible ?

BR,
Diogo
