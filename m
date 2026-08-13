Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D08948424C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 15:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635801; cv=none; b=k9o3qwOfb+TjF7+P8zKiEZyLiNcWsskqxAhiPbg3E1wjrikKFRIcEsGQBLEaAQZyejBYakt4hgTbXW3+dj/mF6+DsuFbjVV/w3x1oWqVys9Blo4oy/gPWAd0t1vlYlH1CLKFEdgKnG815Ei1ITo//qaDaY00kHcQZHbUVoVjEHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635801; c=relaxed/simple;
	bh=GY640qtsu1SDkXg/qpZjw5AVg1oBJIZPusqb/qNK3PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYKGi7r/TeDM29MHPJT7MIFKkScuJ3NvYUZUPH9ae49GULsZw+1/oq2mNZvSyRydWACyh+mebeBf/0uUeGIGvKjz+zECRytSSWTtsTQ062vbibGcT5EHyziaynnunX5aq/01bPwwgC8uiV4Gn5Uhnr45yiT/LftdAaRz6fjpXas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1600d040e4so162234066b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 08:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635798; x=1787240598;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aPYhCdtqz3bibVAFDWmRXBuIoXULoG3VemeqJBNfpCA=;
        b=G4UoRm/hHRadDgo22z+8uoMhrOFzHtP9aJNvLRpDhXO2kvgP9kYJk5HvrC8UPRve4x
         rjNlxGT0Qz9uJONz8BCNcafMCYUEteYk72NnG1PqhdVuZq/Qjt/wZVWKk2RohDDwMX8d
         jwjhgDvJnrxoS0rTFBYThU26qonVOgO7KEJPZmvqIwl1Z4unvzBg4EH3vy/LUH84ESRw
         eoXEZrNgNqwt0SYaiosX/9Ip1dcyO9cHbOdxa/8xzb+FMV4sOJoZiS8mMn8ZuN34dZIC
         +cjtK9OHiCwigrsNxp6M/GipIURh6Jy3X3NkWXzD0clcIf1EDUaeffuqsHxTPLI68SAS
         1oTw==
X-Forwarded-Encrypted: i=1; AHgh+RpsNMxN4t6P49T/+DNoIzfi2IvJJOj5jIW9thki0YEBOZ9jLJKL96oNPKTLgmL/kM8nDELBJHF9Nd4A5rpyqdILbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1MYbb8uhJmpJo0AXbz6DFHJPuRrC0Ev/9P4ModPRyVKh+ePJo
	oXs4e6t1RfDvn2VuHXSfj503sY03IChPBmh4p6OG6HBTk4xXVaRazCGZFGoby1Xxl1k=
X-Gm-Gg: AR+sD10f2fnZ4Zg5UNZl+32GvWitH76FK8gpD6llShu8J4yJI61JXKfXxcKz8yoehNp
	zI8tmPLSO2Q/I2limnw0ccRZiYgCmrakYNw+WDM9vIdk3H7LlfccHCccBJfwkEQMpOIHX9yYBy0
	s8hycuPGvkKky5G3XmXN+Dem11QDQpy3cmei6+IhG/8h/GvbajPSq+wJUvPdJ8/uODtaF7vUz6Y
	v96AmQ6rkYY5sLUEPL6hXF9OkE7wJz6+ISCaoa59Tp0B0GlRcUpo87lZRzQdL4vL2zwitMgeoYo
	oLAOclrJzLKXb86CRCH/ZGbewlPTV9E3hYSbTUEDFQnNE0s5O1tSImZ79ICSUEY7BjBWdxmwrpO
	ygonoB98jm37WX4UbvYpGOAzBt0AO/5aKHF+2fVAdOF/OmI46uMUw7dwGvGPa/9KcOSmpZKI/+U
	KpuOZZ5nHreaZH+12SJY+jW+k/Rj3rPt9nm0PSJfqiBPyCIbE6CQBDUHaI9JUJQkIHXwZ3fIQTk
	k34E+0/98PCmXUzyRKWBcIJBQ==
X-Received: by 2002:a17:907:94c7:b0:c15:f55d:f0d8 with SMTP id a640c23a62f3a-c210a7e319bmr271699966b.4.1786635797268;
        Thu, 13 Aug 2026 08:43:17 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234b3feesm8249566b.14.2026.08.13.08.43.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:43:16 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c169ae1cb26so202889066b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 08:43:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrcqjLBOBB4q3Dx/Nno5aGEkoJzEMaYWtupySFnIVIqCQkmnY8zLcXHAXmLABMsfNv4dyg365Da8zic9iGv12ZL8w==@vger.kernel.org
X-Received: by 2002:a17:907:608c:b0:c20:7166:cc16 with SMTP id
 a640c23a62f3a-c210a26f8cdmr362136666b.15.1786635796639; Thu, 13 Aug 2026
 08:43:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev> <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:43:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWfzr0FTq5796ymJbrJMTYcHko0SPoE_hPYJxNi-pLG1Q@mail.gmail.com>
X-Gm-Features: AUfX_myjkFFweUQc-pTKMuHXcf3jvSHPslpABu71PbitoSzzI_g3EH2qpqjRiDo
Message-ID: <CAMuHMdWfzr0FTq5796ymJbrJMTYcHko0SPoE_hPYJxNi-pLG1Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 10 Jul 2026 at 13:36, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -69,6 +69,7 @@
>  #define PIN_CFG_PVDD1833_OTH_AWO_POC   BIT(19) /* known on RZ/G3L only */
>  #define PIN_CFG_PVDD1833_OTH_ISO_POC   BIT(20) /* known on RZ/G3L only */
>  #define PIN_CFG_WDTOVF_N_POC           BIT(21) /* known on RZ/G3L only */
> +#define PIN_CFG_IO_VMC_I3C             BIT(22)
>
>  #define RZG2L_SINGLE_PIN               BIT_ULL(63)     /* Dedicated pin */
>  #define RZG2L_VARIABLE_CFG             BIT_ULL(62)     /* Variable cfg for port pins */
> @@ -186,6 +187,9 @@
>  #define PVDD_3300              0       /* I/O domain voltage >= 3.3V */
>  #define PVDD_MASK              0x3
>
> +#define PVDD_I3C_1200          1       /* I3C I/O domain voltage 1.2V */
> +#define PVDD_I3C_1800          0       /* I3C I/O domain voltage 1.8V */

This repeats the existing pattern of having both #defines...

> +
>  #define PWPR_B0WI              BIT(7)  /* Bit Write Disable */
>  #define PWPR_PFCWE             BIT(6)  /* PFC Register Write Enable */
>  #define PWPR_REGWE_A           BIT(6)  /* PFC and PMC Register Write Enable on RZ/V2H(P) */

> @@ -441,6 +455,7 @@ struct rzg2l_pinctrl {
>  };
>
>  static const u16 available_ps[] = { 1800, 2500, 3300 };
> +static const u16 available_i3c_ps[] = { 1200, 1800 };

... and arrays for the possible values.

>
>  static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
>                                               u64 pincfg,

>
>  static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 caps)
>  {
> +       if (caps & PIN_CFG_IO_VMC_I3C) {
> +               switch (val) {
> +               case PVDD_I3C_1200:
> +                       return 1200;
> +               case PVDD_I3C_1800:
> +                       return 1800;
> +               }

Look-up uses the defines...

> +
> +               return -EINVAL;
> +       }
> +
>         switch (val) {
>         case PVDD_1800:
>                 return 1800;
> @@ -1121,6 +1152,19 @@ static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 caps)
>
>  static int rzg2l_ps_to_pwr_reg_val(u8 *val, u32 ps, u32 caps)
>  {
> +       if (caps & PIN_CFG_IO_VMC_I3C) {
> +               switch (ps) {
> +               case 1200:
> +                       *val = PVDD_I3C_1200;
> +                       return 0;
> +               case 1800:
> +                       *val = PVDD_I3C_1800;
> +                       return 0;
> +               }

... just like reverse look-up...

> +
> +               return -EINVAL;
> +       }
> +
>         switch (ps) {
>         case 1800:
>                 *val = PVDD_1800;
> @@ -1194,12 +1238,21 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
>         return 0;
>  }
>
> -static bool rzg2l_ps_is_supported(u16 ps)
> +static bool rzg2l_ps_is_supported(u16 ps, u32 caps)
>  {
> -       unsigned int i;
> +       unsigned int i, len;
> +       const u16 *array;
>
> -       for (i = 0; i < ARRAY_SIZE(available_ps); i++) {
> -               if (available_ps[i] == ps)
> +       if (caps & PIN_CFG_IO_VMC_I3C) {
> +               array = available_i3c_ps;
> +               len = ARRAY_SIZE(available_i3c_ps);
> +       } else {
> +               array = available_ps;
> +               len = ARRAY_SIZE(available_ps);
> +       }
> +
> +       for (i = 0; i < len; i++) {
> +               if (array[i] == ps)
>                         return true;
>         }

... while validity checks use the arrays.

I guess one could drop the defines, and always use the arrays?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
