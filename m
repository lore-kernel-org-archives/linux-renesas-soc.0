Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB6447F2F1
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Aug 2026 13:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108609; cv=none; b=QRSAtU86ktivenhn1hkEoUvRoESwg28q/7OhViZoH9gZpd5bPHJ+bD28E9dehd5TDEpyY9iQhmaENtf/vXHKP059o6HPauvojFxXz0sxTlu7n7g3j5Beccj+gZxJO+vz+9hvOGbkmWu/d6PbG80cPGbRUH7NGb8hWidTIN5Ba98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108609; c=relaxed/simple;
	bh=kCe7+ovW97xnpwebauqhnPTjDQ/9rPidEkTfLc/PfTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cw6CT9nJsy63ll5mJO5K3M/s+zPJo1EE3tZq1Rxjk2SsOK0FCG6K2yX+S15Il8v6PgYSESgOEw6Wqk5S3otBKojrN6qNZ9mKdhC0FnyZQmnQf11v/hy/oMPXJU7Mtv1joiC7yn6SM2wJjdnBjq7dn8wctuOmHXuX697/WKEAsYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-74ab6c88052so912294137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 06:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108601; x=1786713401;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CNCX7FMkI+eIPoPw4/O/hZx4FHa2CnaRhnoCRy0wWYI=;
        b=oYhLuEauOLicgwzYRsUzYvAdW59YeRv7BvVJXEbe+ecVkWeXuU9V3q2M3qWO86GcSf
         AOtQW59FNeF/i5+LLJ3OQr2bXtb43EL+13DBHo0KahunJQTg7XcvPQteza1ROD/OITbi
         0qUG0nPnR1A83Ipzja/Rfcyj78nH+luLe+Gg0eHgZ416tNMRSGU8lrSV4kZKwGnFSbkN
         OdH57BnmIXs/VJ1tRfkKQEovbbdDLYLfrKjg00ST6i0YA6w7uyPXtbF6j0jTUAL/QaiX
         V7fUiK0bHjo39LBBieDcryj3FXfBCAcQLIEo+ksCeaHs1CyZJMDAEl93OwlChkcoqsQS
         oGow==
X-Forwarded-Encrypted: i=1; AHgh+RrPMQpBPN9ZmKMy13/6YC1W2u6nJf2m4jVUi7MNrTWmTPxLqYvUzNGMGS3j7vfUMtbWGhjEn5f7j+oc6Gqx6cC3yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE7P1KvY8YNRwCaE+E9ByRXs+7J/uduIzmf14dCI1HB7VrcGBk
	Xo5ccpq3wLgE717tj3Hg2CRhSuoWug4piHEvaPzar7Ah+jwjbon7pQ9tgrWmlVov
X-Gm-Gg: AR+sD11/8cmAKrM7OpO2AdhcAPK4H/jD9Bf43kVYl9vXPSM1oKeC5NRWNMHpXak4hJm
	HwH/WhDUkRhOmQTj4f4gp8R+uVE9BlGHKRwbCGwG+5L55mAXcylVqzM4DUyqElN2OvHeVddg4f4
	ZlldFAVujcpTsTnQeQAd6WHCXlDMHZyiP1hUEE0/4xCHJWnALOZyVCYAmovt4ecKRj1Vg7wOEIS
	ohp2r+7wXUjG0fVSAgPizYwgl1OXJA4J8LQ/ikql3DHaa/s/mHwQPoyIy7vWxjngByCoEQXxjcu
	4LaE7zX6VWEIhw8JdqA+P7LcbbMpItfJofy9WZToNH0kjpvyKCHGlcSq/mlg/UeB+RC9OgkJ2nI
	/UMESc9xH6FhxrkoI+iln+Ji1Ui9eVJ91oM6wBoi0lrCZQ2nnad5M2UP67xyDQj6Rps0SVCECXA
	+RdD+eZI3Nhw6sEKokc/k8nV/XPk9Uif/CCGeWQwcu9fE8jgldALttJN6pMTFRaqfgC/l4tuP2Y
	fAJORyWUfm+PjuKOVvmIwLQ3EaiFQ==
X-Received: by 2002:a05:6102:f82:b0:745:7f23:a876 with SMTP id ada2fe7eead31-7642d16f34emr867166137.1.1786108601426;
        Fri, 07 Aug 2026 06:16:41 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763fe4daa5csm816620137.1.2026.08.07.06.16.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 06:16:40 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so1319860e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 06:16:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqXYxymN2bvawBQb15eZXOUvSx+29urMKhNbOd1htCiWHgm/QtUE8IU0VtlUQEYBfO7CSed6YWctZ/ruTHoiEkrog==@vger.kernel.org
X-Received: by 2002:a05:6122:d89:b0:5bd:cb34:1b70 with SMTP id
 71dfb90a1353d-5c4092da336mr389660e0c.1.1786108600257; Fri, 07 Aug 2026
 06:16:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730113200.36456-1-biju.das.jz@bp.renesas.com> <20260730113200.36456-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260730113200.36456-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Aug 2026 15:16:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAFX1bji7Q+OAmDRYmQ8Gezxhf2RsrBOV34AXLOBgLPw@mail.gmail.com>
X-Gm-Features: AUfX_my9Sfq3h2qGUbcX_HTTH1M-D8wf0nhKfba41o9CddFp_OLJvLenzCoUQpM
Message-ID: <CAMuHMdXAFX1bji7Q+OAmDRYmQ8Gezxhf2RsrBOV34AXLOBgLPw@mail.gmail.com>
Subject: Re: [PATCH v23 05/14] mmc: renesas_sdhi: Make clock divider mask configurable
To: Biju <biju.das.au@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 30 Jul 2026 at 13:32, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a clk_div_mask field to renesas_sdhi_of_data and tmio_mmc_data
> so each SoC can specify its own divider mask instead of the
> hardcoded CLK_CTL_DIV_MASK used in renesas_sdhi_set_clock().
>
> Default to GENMASK(7, 0) at probe time when unset, and populate all
> existing internal/sys DMAC of_data tables with this value to keep
> current SoCs unaffected. This lets RZ/G3L, which has a wider
> divider field, reuse the same clock-setting code.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  * Assigned of_data->clk_div_mask in renesas_sdhi_probe().
> v21->v22:
>  * Updated commit description.
>  * Added clk_div_mask to of_default_cfg and of_rcar_gen2_compatible.

Thanks for the update!

> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -41,6 +41,7 @@ struct renesas_sdhi_of_data {
>         unsigned long sdhi_flags;
>         u64 clk_mask;
>         int max_divider;
> +       u16 clk_div_mask;
>  };
>
>  #define SDHI_CALIB_TABLE_MAX 32
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index d893a263e770..5dcbb431e1e1 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -224,7 +224,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
>                         clk &= ~0xff;
>         }
>
> -       clock = clk & CLK_CTL_DIV_MASK;
> +       clock = clk & host->pdata->clk_div_mask;
>         if (clock != CLK_CTL_DIV_MASK)

This strikes me as a bit odd; should CLK_CTL_DIV_MASK be changed to
host->pdata->clk_div_mask in the check, too?

>                 host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
>
> @@ -1138,6 +1138,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                 mmc_data->max_segs = of_data->max_segs;
>                 mmc_data->clk_mask = of_data->clk_mask;
>                 mmc_data->max_divider = of_data->max_divider;
> +               mmc_data->clk_div_mask = of_data->clk_div_mask;
>                 dma_priv->dma_buswidth = of_data->dma_buswidth;
>                 host->bus_shift = of_data->bus_shift;
>                 /* Fallback for old DTs */
> @@ -1186,6 +1187,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         if (!mmc_data->max_divider)
>                 mmc_data->max_divider = SDHI_MAX_DIVIDER_DEFAULT;
>
> +       if (!mmc_data->clk_div_mask)
> +               mmc_data->clk_div_mask = GENMASK(7, 0);

CLK_CTL_DIV_MASK, perhaps?

> +
>         dma_priv->filter = shdma_chan_filter;
>         dma_priv->enable = renesas_sdhi_enable_dma;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
