Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FFB381EB8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087648; cv=none; b=MiLbvex4oS27jun8ULD6pg82gU7aS3AnrLLPupD5rCOnpFhknV2u2ttf4EMTZIZwVr/MUjZ1rOlkGOyGHm/pu3y+nNR3NjlMmCgYgbMYjOc0R5J4+Cjm8/CiSYlhDJZNAorOSrt17a/701f8Fn7NPo3evrTwvEPAOl3zBl3kGgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087648; c=relaxed/simple;
	bh=zHlsfWC8sX3pz0/XSFoxgX7FqDI7whEHdUXnwOXIQoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PMBVvAMVR6q/qpT1IMgaOW4fikNobSrysv+PEWU2NK49uMOa0SAtvIbq/hHDO7UFDiUYCLbxtWhZb6Fp2Ws5wR/YmjX4vmoNHEEBYrCp3rVzr3qmrkuBuAlDOdvPVheBCtagFNKHSpSYYKTli6tI4xZziHVxDZJ2CnDdEnN9df4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78564313adaso1302592137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 07:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087645; x=1790692445;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ifr1hHZZAJWVubWKqPeVb9esvq1iy0mCWPvBSTHrG+w=;
        b=wtuplal3/4Su2j8R677kO+aHOv6rLuZjFiHybILtDKgQyOEN4Nqv/Z7qNWbEJS2sH7
         BV+LGkw+r33OdqGBFOeKOtusly1BddAMJiliNpF72TXNnioM3Lx7yV+6mRzIhITx2W8i
         ol8xtf5Jl6DikFIUe42OCt+fB9jWqD3ywb9ovUw8RjLIKG0FL9wotOiG6cPYh0V1G5wT
         qpLQkXLlfifIZ/4ywsSqS0c3V1DCCLSGb8bU3ddwDPFtrBuszE2fKr1KNhXSVtJErPZo
         9VNfdA5zG8oNn3I3ASonUrD2uTYiq33Z/eBTtrswMbVHv/2+s91VIE0D8qGk0ATEDJ/t
         fIfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzErNUPY68L21tuUBNPQB5N7yrRoc8hyB8CZtrpavucl1WTB7yqmssFTyP1jtZ/5IeOa8Pz1ACUktmN4yVxnA1GIQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n25QmK+zLFMM/cHozaBGwjmKQIuW8NAJ4IqyqplrrB0sJB2v/s
	XQmVESDDQPNb2S1ZHmmDb0cF3+69TKBbF/xMJBCPjTmcyNRwevD3uGgOU9ldW2Sw
X-Gm-Gg: AYBFou37VsWy6jS5tkIFFZkL6mh8ufAeXGnICaL4MdDo5pj8EMgEMBkxqKt+gUSJCz8
	+bJ3YtwCVGHrCq51lq488PrcK5Ux5To8EfNLcroAZqIMM+GH/P4KVWWKW31GF7icxCdoNaPSjWq
	eA281Sf9OaOlz30hRon3A/xFdLy1gXWCIZydc3iEFaOIRWByRss4O8HcHNW3Jg38uQDqUyTZ/Az
	4Jq6Ocrt7osdo193djqb53/0WANp/R/irki7zZyLlPSBs7YeJUB9fztTYJKQenkJQ2ffgcyd8z5
	fdtwqYPEwHglT+xIo+bJ7/0eHxCKhw1UuelUlC7eJPv9HAGW+8yIwi/nuuFSnpLEVw6tubYvt1b
	kLxxhhZ3T6Zv6kIyMDWHpxmGP61u6yyxh5NOrMxvJdJmUh1Oxdg8mMCt0ML+xe2rFNPIylJqx2H
	EDzTVWexiIjIynv3dTYoVosTXeo2SSje/ubSo6X0TM69h9k6U+gIiswqdo37T61U7slqpWjhLgR
	sflyNx9HWGBf0URCEGO475vN+KpTa6UfFm7
X-Received: by 2002:a05:6102:4489:b0:7a7:196a:84e7 with SMTP id ada2fe7eead31-7aadd4f13c7mr1774018137.31.1790087645054;
        Tue, 22 Sep 2026 07:34:05 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ab17f39273sm1898062137.7.2026.09.22.07.34.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 07:34:03 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059faso1470807e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 07:34:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwRpasKvAdcK2GoGw9c/b9kv+c+sVPdaIdYNs1PkcAvVck7Y0wfaOAC1ld2M1Hu4bFKX17aDdtWJT0r6DimSCEQLA==@vger.kernel.org
X-Received: by 2002:a05:6122:390a:b0:5c9:a617:580e with SMTP id
 71dfb90a1353d-5c9b8b29cf6mr8586451e0c.11.1790087642750; Tue, 22 Sep 2026
 07:34:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922042707.116378-1-biju.das.jz@bp.renesas.com> <20260922042707.116378-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260922042707.116378-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 16:33:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbyktVBAwBh=LoARWHHmb_FrF+omeDvNdR76uxus3mPA@mail.gmail.com>
X-Gm-Features: AclHuK8QDsFUbN6MlA77zfZcOMVCYGTCDIMnum6Wgku5P-WW7MUQq9pjTBb7a98
Message-ID: <CAMuHMdVbyktVBAwBh=LoARWHHmb_FrF+omeDvNdR76uxus3mPA@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] iio: adc: rzg2l_adc: Rename num_channels to max_channels
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

Thanks for your patch!

On Tue, 22 Sept 2026 at 06:28, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Rename the num_channels member of struct rzg2l_adc_hw_params to
> max_channels, as it represents the maximum channel supported by

... maximum number of channels...

"the maximum channel" (aka singular "max_channel") would be equal to
the maximum number of channels minus one.

> the ADC hardware rather than a count of channels currently in use.
>
> No functional change intended.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/iio/adc/rzg2l_adc.c
> +++ b/drivers/iio/adc/rzg2l_adc.c
> @@ -62,7 +62,7 @@
>   * @adsmp_mask: ADC sampling period mask (see ADM3 register)
>   * @adint_inten_mask: conversion end interrupt mask (see ADINT register)
>   * @default_adcmp: default ADC cmp (see ADM3 register)
> - * @num_channels: number of supported channels
> + * @max_channels: the maximum channel for the ADC

"maximum number of channels", to avoid confusion.

>   * @adivc: specifies if ADVIC register is available
>   */
>  struct rzg2l_adc_hw_params {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
