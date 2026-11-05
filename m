Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793887424;
	b=oSDsEH57HbYcumUuaT6VJ30sAAlbceTDZ53r1wsKBPCGXJ+T+JNtu4XXUMEWSLpp6SNp
	 parNPYGdkMBUH39zUGjXvIBZ99tNAe5oG8iwQw++h2mQeLlxCasqnbPyQ2+EgPIGlKdpp
	 39HzHDhcy+plWVmN4p41fK38axF3VgcVnUr5qHjwis2pOcF6yK1vuo6Gd+S7Nbw697oWt
	 mrF/rOt9MeXwHWKa2s16eraitcztETUqx4fJ/V7PbTROMRKNcWFtBaD1LeQDBrdXajMMK
	 f1hQEda0GRgQqQXZQ2Aot2zNwAUILq3FY9eYio9rGln+u9LWdqiAGSuzdwiEVtVayog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ggl1f/cyRla/UR8ICBsxDNfgZEO9pIEnMQLKQjRy/No=;
	b=HLay4xyAeN4mEJprR9s5i04nPfjpTsyWlKBeUpEBptrIxijbR9pNwq2DcmFBg8cjLAP6
	 +cJ0SO/rQFllnp2uNnltBBSe+Rwvkh1viCDUVI28RUZXRTZr07KH7MG2oSXbR9IueW4wL
	 +4X1vCa8TFG1d3HcHtSuEkObYTveIaMLwXEiHkd2e64p1cvXLLNm8qyRd8qjjNNnMh24O
	 LK3iLAb2BZMqow+LpUvtpyN9diWTDsGGuLbqv0+XwerC+YSlyNsey0IlGoDKTUhsWrkc9
	 52hn1thxs36pqYa+BYJgLwEO0Fl4d5r1b3dA02ZNGLMjKNFjC1+SymmKMw+1T9CJLqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0l0ZNbQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C448606A329
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Nov 2026 14:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C448606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0l0ZNbQ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso17797415e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Nov 2026 06:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793887423; cv=none;
        d=google.com; s=arc-20260327;
        b=EoWF3CCd613F45j7tbtDvzyD6IuOR+Yzf7S2fzfTdyxQHCvgPfAZAFbcE1KtP8mtDc
         9b6VI30c4I1rrHQwWBRpadDpB2OivlWBiUuruTVLjgeeaWrKss//Sn48lYNX8TTzGzJj
         8Kw9e4kWbnGFjHePfkT/D+6Dxiy3Pn0ysSpYTbCp6TThq0CNr3d4gzkq2A7F/hyUyKXK
         A65v0B2eBc9ookKYC9cLalNfYSGdZSPlH5e2aTvwd8v0ruo1wkVd5bqKX+1IcQXc5oau
         x8eCdOuesW392XxDG3IKGb+ELsEyt0Qd4gk6Gjpkkysb3t45USBcl/Aq1sxYA+A3NNp6
         rUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ggl1f/cyRla/UR8ICBsxDNfgZEO9pIEnMQLKQjRy/No=;
        fh=0SFQInTK7wJooiTkE6APGCq5e9y51dQ9BTEO1dB3dkY=;
        b=WFkNXbyMVuDoJmrZnOwNweJZr+4va778dBeCjqtiw9aGUCDQJDF8EQ9nvuGwacF7nR
         VCnyvKVrT63VjDhdT6XUNSRV0TXl4Yh2VvmsPYy1ni/uhWI3Dc7FSyL0vTvAFaBCYkhf
         pL6II17r4aKZ4bEYYJ7ZcEDGVoien3YG+UPiwRBiFDI/uyMohtGPqAx/3JvWsPbXj0xC
         G7UPIJOpWH0c3oauVGaOMXbHke9rJE/j1bT3MSeqrJuelpiGyg5lgtsIen7jaxjTm+aw
         xYQ0bzI9iE+MLk6riFudIgFOdUpnUx1+VvCO6QrZWHyXk5q4vq8k7sip5rrOxQnqn7cm
         5l2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887423; x=1794492223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ggl1f/cyRla/UR8ICBsxDNfgZEO9pIEnMQLKQjRy/No=;
        b=W0l0ZNbQJdLMoD4eiZMmnkoN54pHEVybxhqzG0UpQGAVs+252K87jW/1q3ylhKmNhW
         ozZzwwRgKor1DX8p5OJFXGyvNHYlhHlvUsffaORzXhMRKPsI9hRZOBwSfT02nLH9/z/K
         momGFCm5/qMjX6u942cqwrTYC1kf47c+qDtmEhIUn1tU0kozUxXn45TgCpBZg2+fgLVf
         k4Lsxucl8yhcnDs1uN3TFQMFPP31uyN51jN+HWDqdVtGBEiVjtwZwrxuICCFoizafgGO
         jTV3CV/77YwAcqDcO9KdWxKFZVcsq9gkc4cY7kQ3fznVeR9h3cCGkBl8Hyu/Cl5bG3LV
         ugfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887423; x=1794492223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ggl1f/cyRla/UR8ICBsxDNfgZEO9pIEnMQLKQjRy/No=;
        b=AJxbWey+QrkjorV+SMJIT0kdEl0Qo6FQZqlXPT5W4+kH+/yQiWsHS+G3CTi+qEFZNx
         PA1HFgebwvB1EcWD1ZoQ1H45m/YLZp9vCtV34cfDJlqEGRvb82/dTcUAQZLvOdf59DuR
         i2nzk7JTRGr9rFNKIPF0pBpPjImpz1zf95OUjfi5IQ90oo6UGb7xmW74f6aniOmLUZLZ
         tSYcie6h6Ip3JtLr42pBspfG2POEp5qLe89jsdB30wM8LKInDCXH1BBoePa0XMbouULH
         LQPxF3ZDlOooaTIStJ1aXxJ0D0mGI4WypUx0BN10mK5VVnm3EqDYB6z5VCzO9yesohvd
         UguQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyFMprD4VMVVJ2cPa94WLjAvCxoJ3TLiLGzfVqnGYmnLQOsSwvEttfwmCPdZDbIn/eH1UHiqdd//wLW4ebUwIkPg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8fiDsvX6FUAJmBCL+izIWv1FKXOHVTy7BCg3cKvKsKqsrrTmsX
	3kHBLdf+mFNdf8FT3b3wrbBzrudqtnahl66K/aTm2p6OwPGXfiJgtdzkTXPy1cgTxjClFBm2OXY
	etFMj+uKXd6KTDAA7beFCZDbvKCzBre8=
X-Gm-Gg: AYBFou0lMlHlEaKBKC64mFRe+1OIgvSGR/jDB2SCxmXN82It6jMqlX0wSuNphv0SyFB
	Zc5bnMh3y9CCy2YBxeAzJqpFc4u0UP+QFB0XSf3porGM+rmonKsDUIiS+eJp70kfDGP11O+gm72
	pj/j5nqbMSQVvcyZcFNvSbdn8ksB5Iec5+SLybhIE0xrPXz+9G7NwtuCf96QIhVKK/IkD4v403q
	rNdYHh+bKAIqfFUeMeYE0glmRzHSTRfsY0OMEXGRSJPN1R3ARHGocE4xKprMnkoUmn9ndBU3Ukj
	Xe+9bHoPT7ICjsZEtMMeOPP0Quu7UGJzOXI6/fS19zjSHEuPXKx1XQUcc8Vc0g0Qs1TRySsgt7E
	om/eOeFUhKi1y2qj6iskLR8rnBOTTp1CUMESrza59ARx36ETCOygBZl5nmfU2+59zohtEcei0xH
	MveDRHU2Z0ZxgdOX9r2eT4YN2IeAUGw28Kf/n//VNXGpeg
X-Received: by 2002:a05:600c:3554:b0:4a4:7a8d:c436 with SMTP id
 5b1f17b1804b1-4ac17470fdbmr429355085e9.11.1793887422595; Thu, 05 Nov 2026
 06:03:42 -0800 (PST)
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
 <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com>
In-Reply-To: <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 5 Nov 2026 14:03:15 +0000
X-Gm-Features: AclHuK-GdqKV4-tANS8vahs3lcw_PvOtgyZxhigPFnTBJ5wOeikqaIi4MNhd1_M
Message-ID: <CA+V-a8tbWcODg8E1qDwXU63ohfSgdeMm6GuEkrg=vyrNLQpbgQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
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

On Wed, Nov 4, 2026 at 4:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
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
> Similar comments as for "[PATCH 1/2] clk: renesas: r9a09g057: Add ADC
> clocks and reset".
>
Ok, I will apply the same fixes here.

> > --- a/drivers/clk/renesas/r9a09g056-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g056-cpg.c
>
> > @@ -539,6 +556,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_cl=
ks[] __initconst =3D {
> >                                                 BUS_MSTOP(3, BIT(4))),
> >         DEF_MOD("gpu_0_ace_clk",                CLK_PLLDTY_ACPU_DIV2, 1=
5, 2, 7, 18,
> >                                                 BUS_MSTOP(3, BIT(4))),
> > +       DEF_MOD("adc_0_pclk",                   CLK_PLLCM33_ADC_PCLK_DI=
V2, 16, 7, 8, 7,
> > +                                               BUS_MSTOP(3, BIT(9))),
> > +       DEF_MOD("adc_0_adclk",                  CLK_PLLCM33_ADC_ADCLK_G=
EAR, 16, 8, 8, 8,
> > +                                               BUS_MSTOP(3, BIT(9))),
Shall I also rename this adc_0 to adc_?

> >         DEF_MOD("tsu_0_pclk",                   CLK_QEXTAL, 16, 9, 8, 9=
,
> >                                                 BUS_MSTOP(5, BIT(2))),
> >         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, =
10,
> > @@ -634,6 +655,7 @@ static const struct rzv2h_reset r9a09g056_resets[] =
__initconst =3D {
> >         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
> >         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
> >         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> > +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */
ADC_0/1/2_ADRST_N?

> >         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
> >         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
> >  };
>
> The lists of clock and reset signals (tables 4.4-2 and 4.4-3) claim
> there are 3 sets of clocks and resets, one for each ADC instance,
> but this does not seem to be reflected in the register bits?
>
The clock tree in r01uh1072ej0130-rzv2n (additional document).pdf
shows single clock is shared by all the three instances.

Cheers,
Prabhakar

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
