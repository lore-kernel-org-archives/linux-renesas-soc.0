Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890182;
	b=1+tWvO3c1ZwUf0kjlYlkH6UGblhUzQRB9Sx3+r6/cd9pqnzCk9gm6mVpLT2BeePfe9Zi
	 jiQhRSV7V18BkdQ6inEJmNZtFg44Q3GnZdtUAL8GJ3U+wOsxJkkjFOyRT3MugPW+g9Mef
	 GE34tmsB15zCE0CjQAI3iqs6/PhtL6qQJyAjbRCDRAzkA3ElBBRC+nvxhMuEIhyoinwGq
	 whsavs7z3V8Aqvt0DPU0i5Sww6/z9EW9nbyLO5RaoJ9bO9CXv5AXNajmK/V1mVMS8e/G5
	 min7H5SSAXjxELH1M8pe/3GCDh6f44DqEvgHMtEHZHsbWcvxq/ZED7hlp0sqYpYerCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890182;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QpwPqOLAugA67x75tYz1g7ohdoIGIFAO4TwGyxZEzGk=;
	b=3cZMe/7gwNxiD0aTRWL0V0tr0z+k05AQap/kGqpab1PBCM1aLjeJXi32pTe8Zi05JxLb
	 MiOQtlu2PN4kaHqAISj5pU/rjweAplezhpQx7N+oazZtwEoTX5rVM5v7vY5MvFyOM55MT
	 BA+0p+RDD0iaRJM7UltosMUMBBu+SDbwFY2yOyZkg+zFEzKjJo/1qBnMqErNkFEGKOFEE
	 oR9aVbHmNV8qY1HhLzxa8fxwq43xh9+Mb+icHzH9wHuMcmnP2CqwVhMvdxdI9r1uBHQ6Y
	 ovWsbnk7f3QXKf4Hpg4x3Viu+L96Ro+W3//XZykyMRcfpLG7cuSdpInzNI56nZpdEzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941DF606A337
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Nov 2026 14:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 941DF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9912c47367cso529382241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Nov 2026 06:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890181; x=1794494981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QpwPqOLAugA67x75tYz1g7ohdoIGIFAO4TwGyxZEzGk=;
        b=YDud29UnxNDkljnehiqskeR9jNpH70H/sjpxf1Vh6izYGV3GqQEIY/SRr3x6FrgA+n
         C5iT58IKuWssAQDJ+pyg8eiiK1zOW8uDGk0xmwlk0ENMSs/rHjOLQ+mnGGz4y6DlZ6hg
         1CWuwaJdWvBP2yMZ6EeSxH2pif4T0t82o0+fCWbQYD9WOmZiNtTlC37enJiquyB/Yeyg
         TY6xFkKiXH37dXLRunK0y2jl2AmoTEsfTvOTBeXNW+MvNZBgG7HVle7OA7xGN6+3VAOT
         mP82jE96HDQjk4BelqZBmezGOzIQ55HR8/UbPJ2KqQ/xUPoBRfvlJI5kyApKngK37Gxq
         4pRw==
X-Forwarded-Encrypted: i=1; AKwUvByUQwzKDn5rcCyCLLjgJ0PnEVUsBkOgUURLYTWBXNUckBoVZmCCaR841MXuFDvDylIAPMpvVlhqoE3QZnsw6J1kfg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9afzXFLpF5PgvDtztRLHN88RnKfSuE/YnMeELXg8WoNYLlteSv
	3FEoQkElC3lZ8TYndxOwOHXvBXTS1fOicN2MyUSO1gC4G5iHfLJZ/GUQNK2ECj2sank=
X-Gm-Gg: AYBFou1FXSkfyLcibiwQkUKOHdg04p7F5rews2n5BaPmRYKu3Rvkuv3tXvfBSLcV1mj
	Qi8xZy3mOuprmBnEEBWMlnfyWlOqZQbI9QCHxyzHOxkMyKO2M7S0mIpCt2A/KBUQBFuMfCzZLrW
	610AaI7Y1djbHApBwxRd+vvxkk2R+w3wQ05PuvziBXCIofnUYCxfZYmvDaUiYqcVLCUB0gJiJov
	SGUvLK5+uQ9EPq1HjqR8gsq3ND34Q81nRWYsnsuFXToOz0Rw+lIcgyyKbF06Mxf8Mp+Q9MyqouK
	9l5KwOdGhaGLh6aHZjFCmmAkwKQuVWqWvRfORoRRBVhK9jxv7SvyUfTCsLZP5wWbHYv7+VIRYpe
	sRaa6VlZH26aQzyIjUKx7qwulnfIEmSRi3+EoK2ygwQl3t8MbGEH4VGvfbERfgCLR073+0qthrw
	wbWBIR4mapdsMsl7bM/QrymUbGO8NzEEIY3XBSh2yjRqEL5Unw0y8hdVaNPhPxvJbvi//XcmGk2
	Z4iSrcthhCey7cVGtd6s/tYU1CPJqABDveGwQZEuiniOuVMuMVTHbQIWaVGHQwcLK2Y4FXutBim
	gvacKGY8G1bbrE9qbc00U+WLIHDDOtgN8hNsWK1WF7ez0IrahGMkcXdBERw4i2qtgQ==
X-Received: by 2002:a05:6102:570b:b0:7a5:673f:9a37 with SMTP id ada2fe7eead31-7d286a045c7mr1513901137.15.1793890181541;
        Thu, 05 Nov 2026 06:49:41 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d277d13753sm3698781137.10.2026.11.05.06.49.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 06:49:40 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7ce78f9d6baso531768137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Nov 2026 06:49:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzSzfJ8F9H2t8KxGx0JSJeSxqE+VmUc5GAxBj1s+Nx7tk0MIHFrRm7J9iT7TPhuSSgQNasZxOFtwJmUVNmqRpdJOQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3590:b0:7cb:91a5:7cb1 with SMTP id
 ada2fe7eead31-7d286b9063fmr1558321137.39.1793890179880; Thu, 05 Nov 2026
 06:49:39 -0800 (PST)
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
 <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com> <CA+V-a8tbWcODg8E1qDwXU63ohfSgdeMm6GuEkrg=vyrNLQpbgQ@mail.gmail.com>
In-Reply-To: <CA+V-a8tbWcODg8E1qDwXU63ohfSgdeMm6GuEkrg=vyrNLQpbgQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 15:49:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1j6G+Kd80-6s5PEVkOfG_tS2U8p47929G9kHvD1S-eQ@mail.gmail.com>
X-Gm-Features: AclHuK8-DY11fAp-Ju55qxGdxFOla992yKCcExdnlJgG4bXumg-5poK1WA750QA
Message-ID: <CAMuHMdX1j6G+Kd80-6s5PEVkOfG_tS2U8p47929G9kHvD1S-eQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, 5 Nov 2026 at 15:03, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Wed, Nov 4, 2026 at 4:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Tue, 29 Sept 2026 at 13:39, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add clocks and reset entries for the ADC controller.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > Similar comments as for "[PATCH 1/2] clk: renesas: r9a09g057: Add ADC
> > clocks and reset".
> >
> Ok, I will apply the same fixes here.
>
> > > --- a/drivers/clk/renesas/r9a09g056-cpg.c
> > > +++ b/drivers/clk/renesas/r9a09g056-cpg.c
> >
> > > @@ -539,6 +556,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_=
clks[] __initconst =3D {
> > >                                                 BUS_MSTOP(3, BIT(4)))=
,
> > >         DEF_MOD("gpu_0_ace_clk",                CLK_PLLDTY_ACPU_DIV2,=
 15, 2, 7, 18,
> > >                                                 BUS_MSTOP(3, BIT(4)))=
,
> > > +       DEF_MOD("adc_0_pclk",                   CLK_PLLCM33_ADC_PCLK_=
DIV2, 16, 7, 8, 7,
> > > +                                               BUS_MSTOP(3, BIT(9)))=
,
> > > +       DEF_MOD("adc_0_adclk",                  CLK_PLLCM33_ADC_ADCLK=
_GEAR, 16, 8, 8, 8,
> > > +                                               BUS_MSTOP(3, BIT(9)))=
,
> Shall I also rename this adc_0 to adc_?

OK, let's match the docs.

>
> > >         DEF_MOD("tsu_0_pclk",                   CLK_QEXTAL, 16, 9, 8,=
 9,
> > >                                                 BUS_MSTOP(5, BIT(2)))=
,
> > >         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8=
, 10,
> > > @@ -634,6 +655,7 @@ static const struct rzv2h_reset r9a09g056_resets[=
] __initconst =3D {
> > >         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
> > >         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
> > >         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> > > +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */
> ADC_0/1/2_ADRST_N?
>
> > >         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
> > >         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
> > >  };
> >
> > The lists of clock and reset signals (tables 4.4-2 and 4.4-3) claim
> > there are 3 sets of clocks and resets, one for each ADC instance,
> > but this does not seem to be reflected in the register bits?
> >
> The clock tree in r01uh1072ej0130-rzv2n (additional document).pdf
> shows single clock is shared by all the three instances.

I take your word on that (I only have the additional doc for RZ/V2H).

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
