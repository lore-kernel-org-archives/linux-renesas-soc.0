Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810750;
	b=edpTQp8j9JrXPCK9W+y/L5ZjQKZV3TQtZbtwH3Z0ivdjz/h5A/ehQdvjCboSS0nrQfD9
	 M0+6LU6Vlmsab4PKDpTsH3zPKAlkY+eEL0L5r8nsYmexKwJ9mThXIcQ9L0m5QrzQJ846G
	 NXOVEgnXA8X0YvZS3CWjpKX5iUsy6gIoAgkq3f5Iuq7AqBvnynHjiy6V/xFp21HtuDJwD
	 O4TiCJ9QqZXUxgR4UAbaOva73Ki03ejEqQUj4OxJUVRD/PJWkQ1rjqqFfsNJ+PK2u9pPy
	 Xg+puniJI/bfPiYVSuIsEj2laiJv8SE2CHav+6zy0rECuQgEuaEmOuU5cezYYX3s6sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810750;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=7/PYDWmtNB1AMn5wxCKpnTjNlOxtiG/bHQ8Qe7AN3rc=;
	b=eaPWT1V7dE6OQ+dvN6L/RyD6jfTxL2TWpmG6hznE7c3wknNM6hz8i5wzJn6KlAqgQDcK
	 QIxTGeoROX11RyqIi+HWguu3n1I2ujiQjJ6YEULDXe6r5JaTwg34ixQUa7XlPg2RH3xR3
	 QCa8A3gecN7xfCXbjR9jIGhCnrsaUApGU79ovw6XSw0pW2kdtVD8LLNP1G2/i4Ymi/bjD
	 0ImKMcw1SPnZtKbAwE0e6uL3yR/J2jMhAABtjh8002G8WTbf3QmqxeDXg+/RXU5HoXoNT
	 iW4gFtKfPVlV4jtNfkRUAMQwaCcj0+8xdPx0yu2fhUInrMwMKJps4gpTHrg45uFBdmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6BF606A31B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 16:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD6BF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9950a7530d9so496453241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 08:45:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810749; x=1794415549;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7/PYDWmtNB1AMn5wxCKpnTjNlOxtiG/bHQ8Qe7AN3rc=;
        b=KxWz1sCdtJnftLxyrDLw6an5i4Bgt7tPyrCO5V8+wXETj7zWqHhUGrw3k7n902Qffd
         LjEuuPVCjNVkK+Tj35/rHJJCcG1Rgo9RPZvzSw1JydNW5lLVaIRMSEkk0AiEey73uJ0f
         8t5AcQbjxufRhbmVAcPzhs7d3/Bb2PCkOji5zlUac7XUS7RWkVNFe2yk2wuWbeyeOO1N
         9mOIYS2BXwqoTH3BdzfNaqm0sEwQs7Fc0pxsQata5mbW2epP0iY+T/jPSGlshi6YdRWn
         StV3ZYik9y7oBQ5IZf7pjPQqaS1HgwuF1fjEroK91Xu8hRlAacyWdjLabAh4L+ZcB4Kf
         7Ynw==
X-Forwarded-Encrypted: i=1; AKwUvBxHVCCErOypa5sWMbsoY+nrlGNAXlZ1/+HmeTf0+NeDYRX1JvGvnwRHW2VvaqwImfGHBaHBF4h12m4yd77AyYhang==@vger.kernel.org
X-Gm-Message-State: APuU4Z9xOmy5o2Cjmc72uQ7AuFhXceq6s1to3MYvM3q76bN+nTgDsimf
	WrL+nZMfJXg1xbj+aT8JcsWCL25YwHGZe2Ua2QALuvsD03AVQswkf8mzrPYXH5GaXBE=
X-Gm-Gg: AYBFou2RQ772GIbvp5pubZfjJss3wjiAO3fKBIYhDQHaVYe+1WrJ+yXKjEIxPzQY8yH
	vJ278zKT5nF/WtO/uUT8AnYzF8r+mI2iNTvtT2GAEYS+T8RKQtobgxxAUII831YHhQJOZhusCTr
	JBhg1EJn2LyfobnOyLur/mKc1BNciqhi1S2qQWAdTR5TS+zdVAaaZAql96JrKu8RY5F4EAQrKNF
	OwMjn7Rp8qmhBoS6D2AMImd0HsPVGt7LP4CVVTItMms0n4gaHZsnTwFLZzzs3MqeHoTs7YdyInA
	Nd+/UhgEH07/lMX1TsSqbHpIc1EGbg3TjaM/CYjBinhdMZIlCkaxkaCXdfneI9Rb8CkKqgRSswA
	2AQaRRhwnzximBfSlGrppQpMD7/OP1H/mwnQrwC9VL+xalO87gzF7s8vV5J+maZGfuDw6LGQdq4
	B2CAtQF5usVbr2hTFVqdC6umoKU9vo0lP76v4obs/XrVcZWCRV3rRHaB1VTKMKISPI2QoGuxro6
	qGhkadBSSlaHBbH4tWeEv2SXxZuRqCxklUQETIPYUeG0a1n8fvJZ5JlNIaDer51/BRKIE9DzFeC
	NFvc8zGC91Dhk8Hd4T51k1T8Ok7W+NJFt79NK0HwbROEqpAobFUCdC6MXrlduQSW+bfjycpL+Py
	V3yxa5lBh+/Q=
X-Received: by 2002:a05:6102:5126:b0:7cc:2712:caf2 with SMTP id ada2fe7eead31-7d0726cbc51mr7209033137.23.1793810748728;
        Wed, 04 Nov 2026 08:45:48 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d9c906fcsm2309517241.11.2026.11.04.08.45.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:45:46 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7c322cbc998so218103137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 08:45:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByFyftcsGXwxlMGohJv0BHYMCn75NC+tZX5FP4HWsWeBVoUoFHiL8UL3XL4I5/x/aAnOw+xHb9E08WE8NA0M5bwGw==@vger.kernel.org
X-Received: by 2002:a05:6102:b04:b0:7a7:198b:6747 with SMTP id
 ada2fe7eead31-7d072713841mr7188563137.28.1793810744356; Wed, 04 Nov 2026
 08:45:44 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 17:45:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com>
X-Gm-Features: AclHuK8CcANpUVtg31h47wbirSO92khOvhLt-OHr-CDqoYw8N4PrzA7mWxauNt0
Message-ID: <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 29 Sept 2026 at 13:39, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clocks and reset entries for the ADC controller.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

Similar comments as for "[PATCH 1/2] clk: renesas: r9a09g057: Add ADC
clocks and reset".

> --- a/drivers/clk/renesas/r9a09g056-cpg.c
> +++ b/drivers/clk/renesas/r9a09g056-cpg.c

> @@ -539,6 +556,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("gpu_0_ace_clk",                CLK_PLLDTY_ACPU_DIV2, 15, 2, 7, 18,
>                                                 BUS_MSTOP(3, BIT(4))),
> +       DEF_MOD("adc_0_pclk",                   CLK_PLLCM33_ADC_PCLK_DIV2, 16, 7, 8, 7,
> +                                               BUS_MSTOP(3, BIT(9))),
> +       DEF_MOD("adc_0_adclk",                  CLK_PLLCM33_ADC_ADCLK_GEAR, 16, 8, 8, 8,
> +                                               BUS_MSTOP(3, BIT(9))),
>         DEF_MOD("tsu_0_pclk",                   CLK_QEXTAL, 16, 9, 8, 9,
>                                                 BUS_MSTOP(5, BIT(2))),
>         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, 10,
> @@ -634,6 +655,7 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
>         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
>         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
>         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */
>         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
>         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
>  };

The lists of clock and reset signals (tables 4.4-2 and 4.4-3) claim
there are 3 sets of clocks and resets, one for each ADC instance,
but this does not seem to be reflected in the register bits?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
