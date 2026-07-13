Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2D6282F2A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 16:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958454; cv=none; b=GPTDrdp2wAgVlq53cKZVBR2QZ4Mjq4gKhEYZjGrRGhs0R+IOUYlS2rIVwslIpqUWqWlJ2RpSSqoPMG/h5qDiHs0ivEgU/2j70efLw7ojv01XrppIUO24imn7U0XmS/a1FIuVMftciW7/xZwIbFQHsn9VqTlobrfL7cY2l5rb4jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958454; c=relaxed/simple;
	bh=O5pyFLw83Ql+8EIFjSrZ0kqwUIJfbEiI35BjR/8WVDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pmYIg1iHwPybpHms/l9NTLaKcl2rnD5bWL7FYIVqOYC0pydj82d5Z5UTXnyOdhG1zlkM8D3uKKMVtf90aU6V7dxBYdFoDGGu/s3z+fL48BHN/oT3DojuO6j/2LLrpzXq83mZJp35wju3m0sC4s04bScLpEznoSH4qouGRX2Uuhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6a168dc590cso2338915eaf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 09:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958452; x=1784563252;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dGAf88p06+MskhwY7uBe/JNJCrwrqcblSzHwwgSV5+w=;
        b=TlXl1LZSHfQwAZV1N4KYYQftGFPAngWP7ZaKiEmLsTdGlPN+Ujc00JYDEjq7KKO5T4
         99OGEbs2qS8LN/1XehBUKpMomlSBhnwkntVh4+6xGoO+T7aCYI6FHb4HZ+XxBHUXaQMs
         tw7NqbZUa8TaarJ5K3sNkpy1IfWdML6y2GhCkimylj9ZT9GWHvt0MteyFcebWR8/GC20
         WU/CacUn7V+TW96qLapvDvdTYvfyKuUR6uyFjDVAkUAZbDQ+hb00uLo6osyrslQMa46c
         ALt8DEFyx879/B92Z3uT4P1bOIm0abT4Us/Tnsf4i9bgwmhoANOPXw0SD/F1rIZdSReA
         C2aw==
X-Forwarded-Encrypted: i=1; AFNElJ9joLEn+/m1DFI4P7GpXtrXP1qEN+Lyx35pS7aeWLxcDcVzSAXCNnvOE+xQyn04kNUE4+9Q9m+n6JlDOaZpGYTNUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl2Pf2yY8FlRNyPZXNShL4leOChxYtzN+oyst9dVQY+e3/LZMC
	8Ci9gnl1gCevRjGomB8gGG/bAudVbMeXvcmQa7yPJV5bbh88QRxzWm4ttRQr890BcIw=
X-Gm-Gg: AfdE7cn/t1HteoJJSEchtUeUrD49e6KV/POHYcyt1yu4UA9FXjuEYQ5gorFucwhghgJ
	y+LyekVbV2nnqOeTVkexOelzFZnY1SNjHGmFqWyINWlRbk3SvxTrG8l88TZJ01sP+hFqg1t5LKY
	baHEZ7Q/zfQp43vr1gLub49AOQo28A3qk/PKqEI8iVtNWr7vPWDE5p04CDavDle1xUMbUr//c8m
	ThfcW/VaxW5JtS2RadnIro6ifv8OPc7pDSXTAQcW9T8fNI/xnPuMCjA1FqFhra7mGagsbZcgFC5
	5OsBs+L80ExHuBpJC/H2TMFusVdMD4cqwqwVvQsLAjZX6gcg0GJN0JObztBZAla1FEXu2fdrSu2
	Jl/LOr794W9ZuZ3WcaEcPJ6laeeu3zeaQlovFHbvR1+ZccSlhpUUArKPMoA329MXY41+1/AqoGZ
	+ufBcik+jJEsbtPd+SMUR76gLi+6MtBoms3AijZe4lrqcgL4Gzdg==
X-Received: by 2002:a05:6820:1391:b0:6a1:80a7:2c8d with SMTP id 006d021491bc7-6a3c60f9b6emr42200eaf.32.1783958451488;
        Mon, 13 Jul 2026 09:00:51 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a39a4a7797sm5301575eaf.6.2026.07.13.09.00.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 09:00:50 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7ea9c6ea7deso2399195a34.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 09:00:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8fxj7Zj2Not75tnShY3UTybEHzp/89JgK7VlXwBwNlWvazYh00CtI882sVD99txuSbbMP3PDo0l6Y6fWhPD1C2DQ==@vger.kernel.org
X-Received: by 2002:a05:6102:1626:b0:739:8c52:f2b with SMTP id
 ada2fe7eead31-7457e8e369cmr48584137.18.1783958102735; Mon, 13 Jul 2026
 08:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260702123112.161160-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702123112.161160-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 17:54:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYpDfoRhgfhqeU4_acGQj7f4ivEdB3Ms6SKeeSwY5iLw@mail.gmail.com>
X-Gm-Features: AUfX_mxzgD_hAyuoiso0jWBOVR76LgHMAUSKVimBZKTOAwoA2LG95DcPvI9LrPM
Message-ID: <CAMuHMdXYpDfoRhgfhqeU4_acGQj7f4ivEdB3Ms6SKeeSwY5iLw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/9] dt-bindings: watchdog: renesas,r9a09g057-wdt:
 Add SYS syscon support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
> resides within the System Controller (SYS) block rather than the WDT
> address space itself.
>
> Previously, this was handled by including a second register range in the
> "reg" property. However, this is architecturally incorrect as the SYS
> block consists of two distinct regions (0x80290000 and 0x81290000) that
> contain registers for multiple peripheral blocks.
>
> Now that the SYS driver provides a unified syscon regmap, introduce the
> "renesas,sys" phandle-array property to allow the WDT driver to
> access its control register via the system controller.
>
> Mark the use of a second "reg" entry as deprecated in favor of the
> new phandle-array approach for SoCs that require WDTDCR access.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - No change.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
> @@ -48,6 +48,17 @@ properties:
>    resets:
>      maxItems: 1
>
> +  renesas,sys:

In Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml,
the similar property is called "renesas,sysc".

> +    description:
> +      System controller registers control the start/stop of the WDT, and halt debug.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to system controller
> +          - description: watchdog IP instance index
> +            minimum: 0
> +            maximum: 5
> +
>    timeout-sec: true
>
>  required:
> @@ -73,15 +84,29 @@ allOf:
>            minItems: 2
>          clock-names:
>            minItems: 2
> +        renesas,sys: false
>      else:
>        properties:
>          clocks:
>            maxItems: 1
>          clock-names:
>            maxItems: 1
> -        reg:
> -          minItems: 2
>          resets: false
> +      allOf:
> +        - if:
> +            required:
> +              - renesas,sys
> +          then:
> +            properties:
> +              reg:
> +                maxItems: 1
> +          else:
> +            properties:
> +              reg:
> +                description: Deprecated. Use renesas,sys to pass the offset
> +                             of WDTDCR register instead.

the index of the watchdog IP instance?

> +                minItems: 2
> +                deprecated: true
>
>  additionalProperties: false

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
