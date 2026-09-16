Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CE33D7D69
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551007; cv=pass; b=pWfuHOn3qn+XRD1YKPkSD9uIMqBRntSlr0Pr4o139/nHNu2FypWhqgC0H0cn0aaI152eV8D9CFkUs1R87fLBmeuAkQHCJWojNURQOGUSGcUXjby8NY1aCEd98nCwe0ALKRpt1p7s1SN7PICLH+/VSIvIazbZLkzMB9W1f3pyNUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551007; c=relaxed/simple;
	bh=rVlNPjI4P2z37o7qE9/JXBSWEwGmZChcHXGnM7D9n6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6itYEVudPdwvkGfQtN1L25BwJ5u4H0XTmSkUTRqmYqPrId1J7AkawSMoW0JNlNFS8W9tWvFgEK1XbhZMN5qUKnyRnKdT1LcYgSDuJQo1n1r0isAEb981OQedbon3KNPes2Y43dDij6UrXbpf2B/COfSkF4ROAzEBe2RnIWKI8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YCaIdDCy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WRnBBIGW; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YCaIdDCy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WRnBBIGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789550997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
	b=YCaIdDCyoE93yZmBAfESVoajo49TPwa7hyUImgklXjgAUauE0Chzl86f50GNoG1YHkECbX
	uKOo7D/Pns4ekjXFNcSGeDA73JAlN9XoMn0nntR3B7692bbvQVsqyPCtGxslQ+DCgKEJnz
	UEYk9QAiKvMY6GLKrQa4HtfSFvVHLhs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-rG1huFKsNxWAv2l4BRqOGw-1; Wed, 16 Sep 2026 05:29:56 -0400
X-MC-Unique: rG1huFKsNxWAv2l4BRqOGw-1
X-Mimecast-MFC-AGG-ID: rG1huFKsNxWAv2l4BRqOGw_1789550995
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db22383e8fso28716325ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 02:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789550995; cv=none;
        d=google.com; s=arc-20260327;
        b=IvU3fY38BRz/vRtsW2Iq/XbNqXT1uGh8QOZiCE/3/KVWudTdYq4VkRLxOU436v+iLu
         LpC29RKtwdiUmXvpvlcoToE40oRB69lsZSBxWR5UNYYRb5O3VDYaQ7NB8k1u7g3TK1rD
         R8InOgJv5XPYW/g1iEcbA7ldncByYBoTYTEBtCl3gisXFx8fNcmLmvST37h4zxN2nB9/
         1EpHJro/mlA5rkakMPtyvtwmzcto7G+qO3r/R6RhxaKvILMwua0R3LncBS6xCmdUfSRp
         tDqj6OATHIlalOTQGG7fJFkY0eykyaP4yuHPg6TwOfMfHMiCjVX6PBdudqfPqAkcKTQM
         dywQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
        fh=ANVZORq8bElH5ZpzutwHWEm/qu24vmcQiX1bykl+VrY=;
        b=WwolVw4rz2bLc3p++BSV54kbFkvvbBdnN+ie4YLcA54tuN7QQXWed6z9XYGbNzj330
         KV5Ivo4cN6dijsRqfQxxI+hImTYenne1yYtXIc64OewYjo1tfOrCXWnFKwMrUSm9yTEG
         HXDqyR10h3Gy8amjl1Ds2ouOtu8P1YejtiipMxzsWVmoXVOi7O5qcrB3boCsCMfBWJD6
         Stt7H0cBPL78fWLOEx00CavgZNntnIsAM8FLSKL/OlOh8iMx45h/c+qViEnLy1txAyZL
         4r/SNaKpsdF83lcP5CfzxcHCHSlPANp/0yDrxngPsiI6HT44CDNuAtq4B18UAGf/+nTm
         8rDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789550995; x=1790155795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
        b=WRnBBIGWZwHMn0ZjkwESc0vAF9AHz6MKg5a+Le6ugPl2SpFowsXuhEonCafP6F+ZjS
         W0qMM4kk5aqErx/gFDyI3fCZvELr9KMvk0bjPR25BsIwqMIPUiCxlChn6VbCIGc8Hr8x
         P/l7JkuNt+enKPxChzh6cIms67RaPlFkSL/Z066e2tEsw+Uwc9bnKUAAbowsgS2leZRA
         OgzKAvyMwJprx4UXVctmV8jAdbojb3Py6EnFTTziuHf4d+aVJMrjh+5ZCUuLooOyDPkz
         pgiYOkdl6i/0sf1bBnzYeUh4vWE1OorhRxF4143F35mg7tBnNp2s1cEAK0jCLZDswaS7
         lZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550995; x=1790155795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
        b=OB4bGM/3aAynd2eJW1AGOV30WmMn8GDpI+KI9cFSPt4GvYCH4XkjVTG/FxLTbmqTmO
         Bp7qjjBetnx6uH0+RLpQ4RKewn8QfSzaDE/a76QU9u8qE1l/6t1AbaokYWvFPA3lWtDh
         t/A0UIkeL+/sG/ag9GHzBj5BPEyMje7KI/bLVJdiU84UhtMD5FmdbSFhK9bEgx/wOran
         XtEVq6LKPRfMxFB2VvHQa8IJMLcKrklzuItILGoWIlhFcE1fdijvXQUOofmssiJk4ECv
         z8fO6vAOu28Q8ipz4mQ3OZLelavDJSI/isSHheMEUpETE6/rfI00fR4Q+8GG6t/E1u8d
         axjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbXJCSmf9ySjbEjZlE2jgHWI5CveC+ZNYhXQmaDzu1xNd9nA1HnEe8EaCeDEm1nuP5ivnxxx4qKPcYQ2KT/nRMjg==@vger.kernel.org
X-Gm-Message-State: AFuF++nBfkONYyHB0X46k/PCb2dy49wnvnuMsFiOArLcbc5lbDcXsnZU
	/C6QWK6L/AzS3mmY8HqMPAFReYnSpET0XJfy8ZiZ4DydcIWZ+pwslHU9YqRrd+9bWHJ7yfwpqcF
	g5K0Lgbx0BpoEJTegDm9eL+YEKhrxrJcIdTfJqQvjCBEZGzFYAwZdegJMx3i7QI3ZuqCiI6m7b+
	fuo+l6EhiZ+0wyCI4hbbkCD+j0MK4oOPq2OmXBFjOlnBVuW7k=
X-Gm-Gg: AYBFou1kZMIqbchSkRe8UyYcOgO+YmURiIa8X4nckYRS8EO/s5uk6VaKQKDV3njVZlg
	uJr7Msxkg9vcV1cg1pRGMdpm+/FNxJ4jAOjVoyG6Yy56nB/Aft4UxKR9NcpZNiJrxI1ddxmUELY
	C4ZylCwknrfYCAVJcaltqtHVcTc/CeKhF+fCmeJiE/MTJeidm4ZmjfXt9J
X-Received: by 2002:a17:903:3b8f:b0:2d7:4bc8:41a4 with SMTP id d9443c01a7336-2dd8ea1cd1dmr23798555ad.10.1789550995047;
        Wed, 16 Sep 2026 02:29:55 -0700 (PDT)
X-Received: by 2002:a17:903:3b8f:b0:2d7:4bc8:41a4 with SMTP id
 d9443c01a7336-2dd8ea1cd1dmr23798155ad.10.1789550994573; Wed, 16 Sep 2026
 02:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911124540.279841-1-tzimmermann@suse.de> <20260911124540.279841-3-tzimmermann@suse.de>
In-Reply-To: <20260911124540.279841-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Wed, 16 Sep 2026 11:29:42 +0200
X-Gm-Features: AcwNN1VjQRR608PaSU5v9yXg9eP7o3aE9lu55JInhqrDujLUhvS3kxSMIUXF4N0
Message-ID: <CAFOAJEfWX09ZvnQvn1+SBeW4_MaSRO2JNLfoJRGYS4jXGr-09w@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] drm/panic: Test address from kmap op for NULL
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, airlied@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

On Fri, Sep 11, 2026 at 2:46=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Do nothing if kmap_local_page_try_from_panic() returns NULL. This is
> not likely to hapen, as the previous page from the same memory area
> has been mapped successfully.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 23437509a694 ("drm/panic: Fix 24bit pixel crossing page boundaries=
")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.18+
> ---
>  drivers/gpu/drm/drm_panic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index ba21df4be338..d28ce8878e05 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -178,6 +178,8 @@ static void drm_panic_write_pixel24_xpage(void *vaddr=
, struct page *next_page,
>         u8 *p =3D vaddr + offset;
>
>         vaddr2 =3D kmap_local_page_try_from_panic(next_page);
> +       if (!vaddr2)
> +               return;
>
>         *p++ =3D color & 0xff;
>         color >>=3D 8;
> --
> 2.55.0
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

