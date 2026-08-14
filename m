Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A70137F322
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 14:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786716332; cv=none; b=JmHkS3j59ohXWVWGPAnVz0KD/ERWBC4wEztBGVN8FAh8DLO5N860zd/1oCGUWpUSjjTGwVSioQq6Gdohwb/v0kbF4tKwJqfVXGR6re9scAcPpVEak8EuT32V41znlzDy5HUZmOEVqxK797SS3LBTAbvp9djI6lQrWuEaXWoWIx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786716332; c=relaxed/simple;
	bh=5cftMS0auI9pYPJMYXdZkXOpGmdziEbkbuirl1FFsCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gj2xqY6sq/ynt6KXSIGsczzkHMP2mijFXTmOlG+0QBzvztejrZa+wmC96j0UEf1p/fCOwgEKUHYGs5ZtANx1xK3O6G1xXWmYUDwLZJTuxIP8AHz2K519mtSbN3bg+lel4C9AHdRkpjsdLjGRKtjnTOgp+FzVYRSep59dKCqBwRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso1586209a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 07:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786716327; x=1787321127;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C3UNXhafiY0LD4updnZw8gGuBZp3aK/i5GgK4h2PG4Q=;
        b=XSIqpoS/2uFXONjX/Pkt+cE8Iu5crqGObvvwRsr51a9u8a23rxQAtjyBJKhfWMv9cE
         vN3NqpVW2zcSRAo5vgRXbqdLzqZGasGEUc7VqUT0jHYx4uegHPpaFVjhZe9TRpvO5aVg
         AVyCot1sHoGu5Knb+rUu9NTZX32grcIWI5iW/dtWkmhAIv20WUml8Oojvht7qX1YO1X5
         SrkqNfkX/dwpGiBRIV+WKXwYuhDWLjhGfrK4XpKvTtEOdAMNnf2X0UqGS4OnCd7ezQIn
         6II+//JzHqGTfFal+JjKV/WTJU3bmCZ7rHDKh/gWCy03QitOP2IKD4l8iTkG2MZNoruG
         Hz6g==
X-Forwarded-Encrypted: i=1; AHgh+RpwGNhJqxUMtftuOoO88kc1O1ypy5VeJmOo5Ei8JW8gMtIsPlnJD+61Uksgl89ctPbrTULI/f+MEj4BHx3XsXpBgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1SeK+CG3/0KuZv/poJh0sg1sh/0aE7Lc48tgE+sH0NSJjFVkn
	RqmKYlJQ6k0NIXA5GeXPOOeNUaDKUHB7Ig+L6Xdz3wp0FGhzGfLtYvBFkUJWtNIHUoo=
X-Gm-Gg: AR+sD12OHPRvIXlyEhn+CGsKMagsXPHPSOHP/ShS80POK4O5EsRMdNr/Pb5gsV/vJBV
	IpWbLJxSDNxiO7ipYN4ezzdwTauaiKI21vkUYgXb6NC4cN7h06H3Q+KrO7UZKi9Ne94Zmm/PpKi
	Wyusk3PE9iQ+J6dPLRE52qZsp4eYjwnD4COWmGI6a+KJKxlowarBzoloPs2siU4lwsBZGblregI
	NaF6GqJBjveOg4TpKoq0g4tV8khjhU4GqvhtMf3afZVTgdYDidgHG29UGtiH1EyIj/z1Tcp1P3a
	qLG9BcsmBpdieW8Adc0jhXVmXjKSZQqDeBJUY5f5J7apttL3beGVGSwrr71NQZHUfmgQqfYWthU
	VjDpQ/40GNGNLr6bCQEAKrmEnFCQiYm8MucA7f4ml8zoJlXT4O/Uxd+/M7O8ndSo6Wg7pXyJDK1
	4fAR0NusU0BW3Z4jShtOeHzlpr05U8Qxg+ARlZLyRIUDtaaTq72iH4kvC2y6z4BwqF/9YB74qr8
	0txEiKXsXeb0tJkkJ5HUcN25g==
X-Received: by 2002:a05:6402:540c:b0:698:8847:e2f8 with SMTP id 4fb4d7f45d1cf-6a38a9b8dd2mr2798194a12.15.1786716326782;
        Fri, 14 Aug 2026 07:05:26 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38d76961csm792283a12.18.2026.08.14.07.05.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 07:05:25 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso1586085a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 07:05:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqaPLrP2+U5Ez43Sp0vK/771+a2BTfOA3kU2EEur8TKomiYj95Yb/sn8MRboc6uwRMa4ZMU5NmDj9PZjlbjl3BjYw==@vger.kernel.org
X-Received: by 2002:a05:6402:a6d3:20b0:6a1:b515:d2b9 with SMTP id
 4fb4d7f45d1cf-6a38a9b3558mr1824677a12.14.1786716323309; Fri, 14 Aug 2026
 07:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812115010.108322-1-biju.das.jz@bp.renesas.com> <20260812115010.108322-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260812115010.108322-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 16:05:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMiwiDXCDxbZpn1=3w04Jj2NpGjMKoong3wQjAdCfh0A@mail.gmail.com>
X-Gm-Features: AUfX_mw8gWdzxdUwXmAJ-FRY8OhFtvIZg3GQXFjOR3D_CJRMatnEwZUwwKORFWs
Message-ID: <CAMuHMdWMiwiDXCDxbZpn1=3w04Jj2NpGjMKoong3wQjAdCfh0A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] soc: renesas: rz-sysc: Register auxiliary device
 for PWRRDY power sequencer
To: Biju <biju.das.au@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Aug 2026 at 13:50, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Some RZ SoCs (e.g. RZ/G3L) have a PWRRDY register that is controlled
> through a power sequencer rather than directly by the SYSC driver.
>
> Add a pwrrdy_pwrseq flag to struct rz_sysc_soc_id_init_data to mark
> SoCs with this property, and set it for RZ/G3L. When set,
> rz_sysc_probe() registers a "pwrseq-pwrrdy" auxiliary device so a
> dedicated driver can handle the PWRRDY sequencing.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2024 Renesas Electronics Corp.
>   */
>
> +#include <linux/auxiliary_bus.h>
>  #include <linux/bitfield.h>
>  #include <linux/cleanup.h>
>  #include <linux/io.h>
> @@ -84,6 +85,22 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
>         return 0;
>  }
>
> +static int rz_sysc_pwrrdy_pwrseq_init(struct device *dev, struct regmap *regmap,
> +                                     const struct rz_sysc_init_data *data)
> +{
> +       const struct rz_sysc_soc_id_init_data *soc_data = data->soc_id_init_data;
> +       struct auxiliary_device *adev;
> +
> +       if (!soc_data->pwrrdy_pwrseq)
> +               return 0;
> +
> +       adev = devm_auxiliary_device_create(dev, "pwrseq-pwrrdy", regmap);
> +       if (!adev)
> +               return -ENODEV;
> +
> +       return 0;
> +}
> +
>  static const struct of_device_id rz_sysc_match[] = {
>  #ifdef CONFIG_SYSC_R9A08G045
>         { .compatible = "renesas,r9a08g045-sysc", .data = &rzg3s_sysc_init_data },
> @@ -149,6 +166,10 @@ static int rz_sysc_probe(struct platform_device *pdev)
>         if (IS_ERR(regmap))
>                 return PTR_ERR(regmap);
>
> +       ret = rz_sysc_pwrrdy_pwrseq_init(dev, regmap, match->data);
> +       if (ret)
> +               return ret;

I agree with Bartosz.

> +
>         return of_syscon_register_regmap(dev->of_node, regmap);
>  }

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
