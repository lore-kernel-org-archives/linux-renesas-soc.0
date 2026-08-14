Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0338233998
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 12:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710917; cv=none; b=GmeKGMFU/xIwmSOIXMHNhF8imqsPA/ZHficquN/fzSV4VYReVuHvgckbD7nWNbTUzrrIj+njhAMCKvktNQGC1Fjbyfjl0iGXBd+xbTORLiZjNdTU5rIM+4CtV/3ELkQZjruZcMg6fNwGOjoiateQ/eVv9XEIw8q7YuOlbeDbCEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710917; c=relaxed/simple;
	bh=8OCXjdlcsorW7F3wlDb9Rg1EhzwfK4LjvHWJgLnbL8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/r3NHE4Gy508sQ2BS+smOVsAFfNk3ffGMxozWEJ593S6vVy5Z0HzaOACN02ca36IdVmKldIp+iOTOCzUxMwb7P0DoCYpx/3I2yx8FqRvBWErcjjCPEJdzAlCNwznFDs/nYqRZ/AupaG/0HjGmt1EiUN++6WXs/jbcrYsddbsaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a17c04563fso1330867a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710914; x=1787315714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FB5ANdhijMw8+haLtploY2iQ9eczR6t2NkhhsUQF4JY=;
        b=em8KMfQNMezH06GibhlnGq+E1TVUPBzqJHV+c7EESIyDmqg4O73yHHkqsEOf+9ZMq2
         IN+DX/SGUbraxkyJhQqVjeOV+oG33a8DYCAJXI2d6Oyp1MJvCx9agFtFIob8xIJ3z45e
         BNJDTI/EAwC8suakunfVnsG46CIOlFk62clRAAP4FYBWeaL3x4/FVr5qdIE8c9qG/ASe
         RO3LrIaJ8JcqbNqwCEa/J9md7PT1cWHf0cKU1jjfl/M3ZwAe95H3Gg/4BVy33CFF4tlP
         Zeqi3+FSPmyjATHUFrDqsHhy3G3vP6J55mgO+Em8YmVeHvvzDAkxzHrujrEcU00BU17M
         Yc1g==
X-Forwarded-Encrypted: i=1; AHgh+RqaWRllojcZQGjdoYLRr/t2wC3Sa5l/r2vp74Kna9NnVnS1h1adoCFJzvTY8DdUtboBqwg3b6Q42Dd5L0OIBGGhyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXA5lo2cTS+qWynRIQ44nKGlgGfCAuVooOMxhcCbGQT94aMq6r
	o2Ge2LnRUAhbFgzbf3vYeqfk2+ESg/GefYYFSKNTCxfHaPzjeV7WEdSOPKKm2GcW5zw=
X-Gm-Gg: AR+sD13UKHHh9E4SQqwCpWBS22N79hdCvKTGizOqosZcMmSLjbM/O+MZnsb6+3TjOGl
	JOOoy6eqoXwxDOZAaIzCmXNJ3Zhvm1FFjnnPH0/Vbn57ji/qEyUcV5LYfhyJBMnbdxOqSJeF4a3
	KHd8Wqb3ogao9+lXfOHqYlBoUGec9mdCIj4QFzXd9XUGADvC2IteS65wkdHn0IS5asFVS+aA99z
	sZwcFB/ne8B+R1W2HKsi6ywDt4DBxtglP/gY4yJjgmNrLDSknZLFYYch5CiRhYNukO/lP/GUr0m
	2KABuwpKvDHFVJrgjfC0sXIzaPM5qGP9T4oXLZ3tbZTNyMcVrjEnsRB79ScooWw3I+mbMLFaGxL
	Wdo3cFywez/TCqN9a3npCJRhgL0TDaDN2hBNP5+v+zY1T1P72jFPkfU4aLRS2nXqgLj7HA0ZTRk
	hWdJNuzx6v5DZVJkInRUEHWNVO2J4FnVypX0i8BkZq+qCDnNvqWewbOxTMiXoLGdyFqLCMyTMoY
	gLb/OIB2eGENRTmYULDrYwNXw==
X-Received: by 2002:a05:6402:4345:b0:6a1:29ca:681e with SMTP id 4fb4d7f45d1cf-6a38a927f6dmr2617449a12.7.1786710914156;
        Fri, 14 Aug 2026 05:35:14 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38d7698d8sm713354a12.14.2026.08.14.05.35.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:35:12 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1fbe461f59so151776566b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:35:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro9eQnT6zsBwktwSwB1xLyyzEVhfbfINnKGmRsVNl7BrEaANBUjzlNzPkeT1vN/mHGnsMe+rfEmvdAkHs79bBLBSg==@vger.kernel.org
X-Received: by 2002:a17:907:c17:b0:c16:13e7:fd63 with SMTP id
 a640c23a62f3a-c21291fdcfcmr243697466b.0.1786710912661; Fri, 14 Aug 2026
 05:35:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:34:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV115FmUP6tiNi1YjEfOevuDvuLib7pLd1da=7JwnsNdg@mail.gmail.com>
X-Gm-Features: AUfX_mxcx88DEcyLlr5JNAc6a9MM4NBZevz1i_Gg-nCQLWP5aYOxwOMH-wNJ27k
Message-ID: <CAMuHMdV115FmUP6tiNi1YjEfOevuDvuLib7pLd1da=7JwnsNdg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] clk: renesas: rzg2l: Add support for LVDS
 fixed-factor divider with 4:7 duty cycle
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 11 Aug 2026 at 20:27, Biju <biju.das.au@gmail.com> wrote:
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a new CLK_TYPE_G3L_LVDS_DIV clock type and register function for
> a fixed-factor divider used by the LVDS clock, which cannot produce a
> 50% duty cycle for odd divider values. Implement a custom
> get_duty_cycle() callback that reports the actual (div + 1) / 2 : div
> duty cycle, and add the DEF_G3L_LVDS_DIV() macro to define such
> clocks.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> +static int rzg3l_cpg_lvds_div_get_duty_cycle(struct clk_hw *hw,
> +                                            struct clk_duty *duty)
> +{
> +       struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
> +
> +       /*
> +        * An odd divider cannot generate a 50% duty cycle: the output stays
> +        * high for (div + 1) / 2 input clock cycles out of div, e.g. a divider
> +        * of 7 gives a duty cycle of 4/7.
> +        */
> +       duty->num = (fix->div + 1) / 2;

DIV_ROUND_UP()

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
