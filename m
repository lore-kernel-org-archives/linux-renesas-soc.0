Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB75445FFDF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 12:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710774; cv=none; b=o/P3JN090Elyubj8kOmJBTuSOn1r0pusUrOzwAR3MTfPKAsPJP9jhWhC1mzpbJHObudt9vl5CMSFLE3fOKLIWTD37vGNMt29UkwS5nBUZif6zsM3Tzi14cQLCtjSRZ1NxYXBH4rPrUqCZE5+ZRj2ud55NJ4g1aM3nQGYenVRZ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710774; c=relaxed/simple;
	bh=Gm7XpMTBI9C6os8izblCzRmv3EKOG46D4FOgROjtKdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LF6FnpzvtHBEY4+9Y+uQWqdqfSVnUzjk+Hd1YU2bB6swhTzEtSu/H6lam+tyy10mmKt9oyUjtPuTuc/LDmWb7arQkn+7Cv4YjvgrKo7fcl99lTG86ohST0FLGkZ/ssKE4FBVc6E7bDJGR/nsm/nLkVG0oZTrtvl/kk5Ulc0DdG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c20fb91ed0fso163131766b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710771; x=1787315571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQwQJ7BuSB9LR6pXE971+6A950GIyy9ZUcXBGdW2QIc=;
        b=hmvjj+lZ/sHYtkG2oFlWQqkvDlkN670/aY6ajgtwJt+Paz7k7mTxVTwfTDlrH331ae
         UI8ql7nFtXUItfB1yGuVxZ7akXIA2eGOZ3h4v44Wkt16jWzWxRVZ5RbcZAA+0J014P/I
         xQOdE9BBLVusi19IL/SlBY2rcN0eAN0mQ1oFn/IH0dJkoUTisBd8tkIh3qE7xYKb9q/L
         /EC+nwxktflYMf38jz/nJzFxPr9qE9EeOPGda/NlPLeKQZsZ0Q0nqIPrGHf1QL9jCT9k
         ZOX2pGmmtjYb6lypf1ivI5+/g8OBTeBr7hoay2pa5LxFKjxnOtH9aZ13wanUCbiKUNmj
         f6wA==
X-Forwarded-Encrypted: i=1; AHgh+RoOO0qBYYISBSSHqeAZxgiPRGspesOmdihFYl9NeOAeZVEoc+nCGEBOlzDNAFTIqfgA6gF2/Ya0DmHwfm2DnszxIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjtRuqLQWyNnR1vF/pu0dEyFYmViYsYiB5pZp+VjtvJbuvTIzP
	h/swZ1q8YJQCQreG3FJBI2MsQ2BVoBGIkl/NwIUExtOvgCPsS7BpezdkdF6z+Hjrixo=
X-Gm-Gg: AR+sD10HWncPMLQ69JpURovygKnuqXRZtPEIizJ8TWnzFhwZy8XqT3SPk7NlCfnSODI
	00W3gu36gmKN3OSc8YfUwQDGxLT9qqoRnJE2Ww7SRKMWS5G5qihcaeq4vdRuQAAu1G9fOlkZp/x
	JrQAI//95Pn7J8voxctJB+LIAx7JauTZNmF7KUokc4WCCqyioSIkG5e4mE1xtrr8/0VJfoXXW+t
	gZQSDX+U55JnFnqPnO53F94x1LbPitCWcYKnjlXVm39Mwc6Gor04xwIx4gceNj7yGai9/7EQ9cF
	+tEosGASukhN7GjnJQryvWckF3Mwg3wvgtlhQ05lw5cS9EV6Nt/YQMRfiu46gOgKA08bwR74Bhf
	/OmtMPSW0GgMy+2IJw+oMmP55A5zghOP5Fp2Wu/okn7OAs/IiVmQYLOwcg063JmKdJg36QVbbBF
	WLSnTmLhKwOWYxaBKGfCBVkh0jgVrFfeHlmhM1BWg9s+eEpoOCykxyDJFmeWBEIvf9h2XV9pqqZ
	S51MgzOa2oeWnzUaIIdKt2Lqw==
X-Received: by 2002:a17:907:e1d4:10b0:c20:1e97:dd28 with SMTP id a640c23a62f3a-c212a18c64amr182588166b.2.1786710770788;
        Fri, 14 Aug 2026 05:32:50 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21237e4d26sm99168266b.45.2026.08.14.05.32.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:32:48 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso1688919a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:32:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoBlGhrHdtofv9Ibm57XhBZ28tJ2di1WFRstyWismG/QN4xSLdfzczyblaeUeWS0Ko5uk5aSNf5JkBGI/Cqzk1R/Q==@vger.kernel.org
X-Received: by 2002:a05:6402:4513:b0:6a0:926e:f907 with SMTP id
 4fb4d7f45d1cf-6a38a8bea9fmr2749183a12.1.1786710768303; Fri, 14 Aug 2026
 05:32:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:32:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiEQw94rf7ZP_8PV8EQo3K03ioFpsxG1sh=HLJOgzQpg@mail.gmail.com>
X-Gm-Features: AUfX_mx58STpckVp6kMwxfOPKFC2_LGNIJFgER7roj-40A3WGKTSPesm0sP_dCM
Message-ID: <CAMuHMdUiEQw94rf7ZP_8PV8EQo3K03ioFpsxG1sh=HLJOgzQpg@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] clk: renesas: rzg2l: Add PLL7 DSI clock support
 for RZ/G3L
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Aug 2026 at 20:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a new fractional PLL clock type (CLK_TYPE_G3L_PLLDSI) for the RZ/G3L
> SoC's PLL7, which drives the DSI interface and requires a dedicated
> parameter calculation and programming sequence distinct from other PLLs i=
n
> the RZ/G2L family.
>
> PLL7 output frequency is determined by the formula:
>
>   Ffdco =3D (NIR + NFR / 4096) * (Fosc / MR)
>   Ffout =3D Ffdco / (1 << PR)
>
> where:
>   - Fosc =3D 24 MHz (oscillator input)
>   - PR in [0, 4]   (post divider, power-of-two)
>   - MR in [1, 12]  (input pre-divider)
>   - NIR in [56, 375], NFR in [0, 4095] (integer and fractional parts)
>
> The FDCO must fall within one of two valid ranges: 900=E2=80=932000 MHz
> (rangesel=3D0) or 2000=E2=80=933000 MHz (rangesel=3D1).
>
> The parameter search in rzg3l_dsi_get_pll_parameters_values() iterates
> over all valid (MR, PR) combinations, filtering by the required FPFD rang=
e
> of 8=E2=80=9316 MHz, then delegates to rzg3l_dsi_compute_pll_parameters()=
 to find
> the NIR/NFR pair that best approximates the requested rate. An exact matc=
h
> returns immediately; otherwise the combination with the smallest absolute
> frequency error is used.
>
> Computed parameters are cached in pll7_dsi_params within pll_clk to
> avoid redundant recalculation in determine_rate() when the requested
> rate has not changed.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped the macro CPG_PLL_CLK1_VAL and instead using FIELD_PREP
>    at all callsites.
>  * output_nir updated with mul_u32_u32((p->nir + 1) * MILLI, fpfd) as
>    p->nir is small.
>  * output_nfr_range updated with mul_u32_u32(fpfd, MILLI)
>  * nfr updated with div_s64  as div64_s64 is overkill
>  * mul_u32_u32(p->nir + 1, 4096) computation reused in fdco and output.
>  * Open-coded 64-by-32 division replaced with div_u64()

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
