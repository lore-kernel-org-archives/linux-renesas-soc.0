Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A003D34A0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 10:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690706; cv=none; b=ZVwPY+aIqfDZZ7iFumyG8RSMRFm+MVRn4nqGz8PTyMTvwL7w60wokCtS/89Q0GcXLlrGGy6R3BvCkYORlTKfGRLd9SI5o08eHR6oJCwRbG/z7MwyLO1th9yeopmnhWHGB+YkLMMxcd/EFjg+Hi4gPxXVRs/vbaNWBevTDWUg3Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690706; c=relaxed/simple;
	bh=05HtEekKnLhODQoM/NJU1MleMJk27P+YZTUKE2RwX2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwgFahg9u3DubZnZLDJGbp+JFMZBtJAE8dAsSNtT5CTxAG4ND6RGhLBiLglrTSOZDtQc8osllXj+6wVkmVdKpsEnnpfYnGyUyTwOIA9myk47+BVVf7eYRcA10/reisWsgB7R/8A81RGUWeJQ92nkqa53kQtC4ztoAJiQ+oqin0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bbc6c99c3aso204289e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 03:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690702; x=1782295502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/+25ljVbrV0cFHF02tOeYF6TAhfGn2KQZp2f/CD5R4=;
        b=T34+JxTqOTYsUNNsF0Hm2QRXRZJCMPCeta5UKcIxVkkvZEJWFKzdlUraBlccmg3loO
         pCmFJKj5ThSs+QDGNJN9h+kPMP0ul35sVVia6dQvAgpu8DOZm3OH2BE0zq5MTr+xLjtJ
         B9a7GTLMZabEIad46DrtWsIWlVkefGYsBVxFMcOsEt/QOo33oJJoHhyAIM+9VHo4VIUd
         SGZVvgn7AhfNZUfxFCDSmenU3FXpIu4EaYm7FmETA/XRUNBW+ngbjyoEH+fLwH7cmQjy
         xceGrTOgb8/AmIgtegU33fJOc9nsuGnkl+V+nftSGt4N6m3Ae2IKrnCwRqCLjz4JnsSA
         871w==
X-Forwarded-Encrypted: i=1; AFNElJ+KICOAHxuImrCyhtXOem4jsQd2yNn9XqlF32EG/v/q7eUCt418ZzOnAGnk9uFWZ2At52JK2iAw1wMOa00aaoceow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYUaK8YNiVjHMzNZzOxgHrFDGBO5LpLedTYX3J3dSjQoQxrBij
	RCT0jcNz0UspEry4GCOUBnrO64kcc9VCpml0ejrfOwFWDGCG9Ec/mk9kefiM7Cq5
X-Gm-Gg: AfdE7cmuiraByhgo/x5PLdsKgdaVU0ZkEojwzc8azwHC3w6C982zrYheH4iguMsAg7S
	JYPRdnXQrShrSIvTDtcz+P0r1P+K59h3snyFRd8Hk5erWzmJjsygLEG62eyw/g0WB14HmU4ww0B
	ocYHGDwzTe4QP1zPtugPEl4bizEOHjUwTIAbZ34b+vnWLZXNJkC6EIQ9PMpHASX4Kj5HcgiL+WB
	285n6+MbmTFZxW9ycs+RQ561lJaV4s9VY6+XjFhCKHrGkjt7XhmY14KCtjXGrs13vgRfd3jrFVm
	4ns+ghPzs5ziPnsW3rczkPwIsbQUqN8uZEjPAzlMBvYZzcaa87xdLEJyOPdi7Zka7lKvyAKMChr
	WCZsVOb1PY0Wk1IvoDORiHw+UVJY8TBkxphE0VNXkIeYrkZHACuogBDUUFm0cmEu8FcazsUiWws
	l36c/rzg32o3tMPw4WfuCzMfFCgZEFa9IYYkZWQhugJoGhQwW5Uw==
X-Received: by 2002:a05:6122:45a7:b0:5a0:3d17:f939 with SMTP id 71dfb90a1353d-5bbbe682d5amr1489538e0c.9.1781690702337;
        Wed, 17 Jun 2026 03:05:02 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb901ac206sm8009925e0c.14.2026.06.17.03.05.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:05:01 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-963a7e48493so3755923241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 03:05:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8eN63tZgTiWYA+If/fN5ce0bxMTjjw8w0peANj4cUa6hnd0yzV0J/Kd7Zz8RhJ9dmQMgX836ZoxhI7Y5HVi0f2OQ==@vger.kernel.org
X-Received: by 2002:a05:6102:1513:b0:71e:39e9:ce5a with SMTP id
 ada2fe7eead31-7246d11266fmr1475284137.26.1781690700505; Wed, 17 Jun 2026
 03:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615104845.4122868-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615104845.4122868-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 12:04:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVN7dfF6bah0Ca=G-uHZwJ7JDyQb5NoE59PPfAuXp+mHg@mail.gmail.com>
X-Gm-Features: AVVi8CfvzgARP_H_QUsETrMu4OFV4lGTR_oJF8-LhQSQALrUoXJKUkxdtqOFv-s
Message-ID: <CAMuHMdVN7dfF6bah0Ca=G-uHZwJ7JDyQb5NoE59PPfAuXp+mHg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] clk: renesas: rzv2h-cpg: Extract PLL calculation
 math into a library
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Move the common PLL and divider parameter calculation logic from the
> core rzv2h-cpg driver into a standalone library file.
>
> Introduce the CLK_RZV2H_CPG_LIB Kconfig configuration symbol and create
> rzv2h-cpg-lib.c to house rzv2h_cpg_get_pll_pars() and
> rzv2h_cpg_get_pll_divs_pars().
>
> Keep rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars() in the original
> driver as wrappers that call into the new library helper endpoints.
> These wrappers are maintained for this cycle because they are actively
> referenced by the DSI driver; they will be safely removed in a subsequent
> cycle once the DSI driver is updated to use the new APIs from the library,
> preventing cross-subsystem build breakages.
>
> This restructuring allows other Renesas SoC clock drivers, such as the
> upcoming RZ/T2H and RZ/N2H platforms that utilize similar LCDC clock
> divider mathematical logic, to share the iterative calculation helper
> infrastructure without duplication.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -213,4 +213,27 @@ static inline bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits
>  }
>  #endif
>
> +#ifdef CONFIG_CLK_RZV2H_CPG_LIB
> +bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
> +                           struct rzv2h_pll_pars *pars, u64 freq_millihz);
> +
> +bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> +                                struct rzv2h_pll_div_pars *pars,
> +                                const u8 *table, u8 table_size, u64 freq_millihz);
> +#else
> +static inline bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
> +                                         struct rzv2h_pll_pars *pars,
> +                                         u64 freq_millihz)
> +{
> +       return false;
> +}
> +
> +static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> +                                              struct rzv2h_pll_div_pars *pars,
> +                                              const u8 *table, u8 table_size,
> +                                              u64 freq_millihz)
> +{
> +       return false;
> +}
> +#endif
>  #endif

What about just dropping the old functions, and adding two simple
compatibility defines in the header file:

    #define rzv2h_get_pll_pars rzv2h_cpg_get_pll_pars
    #define rzv2h_get_pll_divs_pars rzv2h_cpg_get_pll_divs_pars

That way there is less code to change in the next phase.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
