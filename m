Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793886203;
	b=qqDAtEUCrOQLKUHEPnOTaD5V+W0FPJ5bhwrDnYUIyAzOrZvYaU4wFq/EBmiMLDvTWuYA
	 JAmWtvtZPUB40ayCCWwzGsrUMlws8NPv9Wn6neVKVP4ASCmC/hvr5zzkWbYh5tJ8B3RWh
	 d1Q+kLbCjnpkd2gzedwiWIe7tYPSylpyIk/0XzeDbOKn+imJJHC8vUvGM1E0Mv1eKxlkX
	 9gtG3Boz7VHQ1vh19YRTjCUnvoHH3eXcDKjxEybFJxsnVvWxxscds7m4G3/xO6UYs3enD
	 QcEU28I8B8ecT5D+x5lxXfD1c6ab55Q7nIyDaexDEKDdMUyanC31HQImIXLECb3GnGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5InNLlTBW1+FHMMXtqNCm652eEhZdNBTTArid9tphss=;
	b=tL8wHvN8ERWSfYQHH2tlCAfhme5llWoCX7UAsOfiOmFT+v8Nv8+7n8wYOPsxweS+P6Iv
	 kJ+HI8QG7Kj4zbo4C4i8aVFHpYFVNP84BhdxMF3YblnUBdYgf8YEemfT7cUxV1BBQS6/w
	 ShaQaOR9c4B5WYdHtSkM8irm+yjiNkmSVGcFbGLaJmDTdn3SAgKADEF5qlQe0424LiWoE
	 uf/7WXhxQ3E/lnx9++CfuGJMdE+RdXnR423E4DkjS7TqglXH17UKr569EM1xyvInSJJHa
	 KNVfT9eWEdBvveCG4ukMIgOH6FUrj6xjLJU9X0XdsyXOVTaTLC0tTlMV3jYGXWol0rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmurvqvT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF7F606A326
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Nov 2026 13:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF7F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmurvqvT
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso11249615e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Nov 2026 05:43:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793886201; cv=none;
        d=google.com; s=arc-20260327;
        b=qwfyxm9urX5bJ4eSQYUJ/3HmEFmSTXAZXOvcawl8niAxeCJWVJSDsRAddFunNqnp44
         2Nbubytx4Ufr9MRKKWjQv8O/L4QsyX0rt1+/17v1mtaDtCK0mdfZRBIs6Yfp1mPs/Qw3
         U1j6UXLv69NIo0iYW9oLlUexFYxfHxJwtPBCnvTE1VygDyEPVfzJO1eB+QSk6LIfElky
         elyXbN2ui3DueDK+n+bYfam3Z+z0/5SjmpyXPFLRQvXPUmqK9EWsf8sSJGbSecYN6+LL
         GqaaadgVeOZE0hiOe2QMXWRJeBnXA+ujo7AbfyKW24EubCkJ+ldjAB+Mxmk+MtPUHJQr
         WvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5InNLlTBW1+FHMMXtqNCm652eEhZdNBTTArid9tphss=;
        fh=mQdnuS2LiCcrsPxNHhyrEYUrgjUa2gjYIBo72XGfEbE=;
        b=a9XanMdthdXoSHgbo7AWLyIRKPx42rPelJVDUmFx5NVoWzLB0hFNDwWmjKiI7UxMLn
         68RH2ONLgh9LVOk/GvMHx6q9purVWIeIeH3Wia87exvr7iF1bKSmmAkakDSQUttEIBTF
         eTa49G1FyAFiNKpndDWxy7f92rZOJNsWGhRL4Zj2ZPpS7E8x3hUiVGY/zTGOOwl8Z09M
         Nw5CBSMyEGVh01MNoFOjpLMU3wIVqzFH1myEexD4QqzKoIlocX/mc4vGa1zoU3JUt3Js
         LGO9HN14O3jdIkOQtkmGyO6Mna2iM8LWijiSQNGGpqtj92Ds3N/GGKKaB4/6ZL/ZJS8g
         WHMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793886201; x=1794491001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5InNLlTBW1+FHMMXtqNCm652eEhZdNBTTArid9tphss=;
        b=mmurvqvT+z3WqxIrFi6mIwXiICJd076DFKfZ9ie+T9w7n+pCZ6rvIwh7bplFf3ytGe
         +NawPJ/F4zbKYPTahV/wRXW2lQCTq8P/Omu2hRB15SavqkKWNxPtxTdwgfUiMLwSN8Ay
         ClkO17wxr2uYAqnLmC5k+hfbdq0fyUVVSxuRCd8zwZqWrdoG3xg2lzG2OOdHvZXc/3HT
         W7U/Ue7LRBeuV4gLSiHju4akKZStC6q2uAnKHD88lbWrE50csXiL3JRC8NaL7W0Ap75H
         A9gSDo8S1ywxIfdHde0Ojb/RXbwWkhYNJ2z1H/H+Ky7XvnzfmwQtrGs+RbYufT0hJodT
         ASCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886201; x=1794491001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5InNLlTBW1+FHMMXtqNCm652eEhZdNBTTArid9tphss=;
        b=09QxSK5obYp0SaXfXAph3f8tJt4Z/7t0LihJUhQWg2/1BfWpC5Uy6B7k+ZsW/VaZzP
         SJ1KHiTVBaZV5tsVEwXr5vnVDUlNJJ765oZTBWipFSwzX1lUD9HkvhRuwq8DCaqAF/6k
         hWrUkQt0jD0qWMn1VuRF3q5+ZR7Zz2mE7rioTLU9cK9zxJUhJX+pnIBk+R2T1FKM+024
         WhA7o50I47goKHUCf6DfObDuOdyUc3UEdeJW/A2qGCKPgUwvyOHtoXfBh12C1H4hpoWY
         HQjDjY3yC195nmRX9Iy3H2upPQiGoR/bikKzGowl9W/Kh9sB2t2qGVdUXP63FQU+Xsz5
         gvGw==
X-Forwarded-Encrypted: i=1; AKwUvBwLuCD4kRKOF5iDD+OmHahtdoY6CKcb+mOZiqrhVQOARjZCGF1zBaOu5/6vU3A6/psU73pTDDslHurmfmAnwBH0DA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+poaxaZ1cGEyA6Pcx/MTTG6v6cuA3UQgmibEEnxASrCo9YFFAY
	IJox1CLOmJrB4U99U4CqIop8ncxHuEx/KZgdb8Qhj1llheWdzwMxtI97xsTcBfnM7ipa6lJCaeO
	Oj1Pg2sgaR/HNMSX/wAoY8e4UDBYCqTM=
X-Gm-Gg: AYBFou1mhIbI4dH1b0y3hwnfXQIQW2ts+8kLSw56IkmEjFg0rLTVPrn0n0/VAQseXV8
	rYo1GqPux0bu5Yye5qOa2muS/GF5p0hxi4aEXStReXcqXs9d/SxS/e1Jg+vlYsOs8478mvnMuPW
	bP9AGXr8/MAiBz27zaj5bLsQm5xQUmLQZ1SPqV7DV9Dar0o/qaytWMb3Hz0Z4ZDF70+0ANtDJ5u
	GpKhfO84kTsF9e7jYSVM7KtaackPZFwJqN5ghh0szwTJM1ds5GGDAkGveYDP8pCfR10/PleZDWl
	rkuvnEhQB8K//Ev/bHVbY1QZWVxb8xu58LY0gqO4OXE0xFzTGre70VyJEyJ+a9UMG06pOoWcM4v
	NosNJsJpqu1B/tT56QAE/JcudMS9qALclRb2/pmjUKtYoBPW9DQcrtbskbRW/CXxAFn1uhe40J0
	XD+6djELsX3D6tdz6qZpgW01fQ
X-Received: by 2002:a05:600c:3554:b0:4a4:7a8d:c436 with SMTP id
 5b1f17b1804b1-4ac17470fdbmr428347465e9.11.1793886201331; Thu, 05 Nov 2026
 05:43:21 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929113921.119489-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV5Sn9FaMNEaxQKF7_rm5hvM-pfC2-KU14=96DFGp85jg@mail.gmail.com>
In-Reply-To: <CAMuHMdV5Sn9FaMNEaxQKF7_rm5hvM-pfC2-KU14=96DFGp85jg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 5 Nov 2026 13:42:55 +0000
X-Gm-Features: AclHuK_NJQNESWK0guGnOVGqynMZyFihFGeP8KPEUxdd-p_NokaiWz_ftQoKZDo
Message-ID: <CA+V-a8u=W+74U-+=k6MdhQsS8wZYkbuvueun15M3AiiA1=T58Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r9a09g057: Add ADC clocks and reset
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Nov 4, 2026 at 4:42=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 29 Sept 2026 at 13:39, Prabhakar <prabhakar.csengg@gmail.com> wro=
te:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clocks and reset entries for the ADC controller.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
>
> > @@ -173,11 +183,18 @@ static const struct cpg_core_clk r9a09g057_core_c=
lks[] __initconst =3D {
> >         DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
> >
> >         /* Internal Core Clocks */
> > +       DEF_FIXED(".pllcm33_div2", CLK_PLLCM33_DIV2, CLK_PLLCM33, 1, 2)=
,
> >         DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3)=
,
> >         DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4)=
,
> >         DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5)=
,
> >         DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, =
16),
> >         DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, C=
DDIV0_DIVCTL1, dtable_2_64),
> > +       DEF_CSDIV(".adc_pclk_gear", CLK_PLLCM33_ADC_PCLK_GEAR, CLK_PLLC=
M33_DIV2,
>
> ".pllcm33_adc_pclk_gear"?
>
> > +                 CSDIV1_DIVCTL0, dtable_8_10),
> > +       DEF_FIXED(".adc_pclk_gear_div2", CLK_PLLCM33_ADC_PCLK_DIV2,
>
> ".pllcm33_adc_pclk_gear_div2"?
>
> > +                 CLK_PLLCM33_ADC_PCLK_GEAR, 1, 2),
> > +       DEF_CSDIV(".adc_adclk_gear", CLK_PLLCM33_ADC_ADCLK_GEAR, CLK_PL=
LCM33_ADC_PCLK_GEAR,
>
> ".pllcm33_adc_adclk_gear"?
>
> > +                 CSDIV1_DIVCTL1, dtable_2_16),
>
> >         DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2=
, smux2_xspi_clk0),
> >         DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3=
, smux2_xspi_clk1),
> >         DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK=
1, CSDIV0_DIVCTL3,
>
> > @@ -669,6 +690,7 @@ static const struct rzv2h_reset r9a09g057_resets[] =
__initconst =3D {
> >         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
> >         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
> >         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> > +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */
>
> ADC_0_ADRST_N?
>
Ok, I'll rename this (and all the above).

Cheers,
Prabhakar

> >         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
> >         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
> >  };
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
