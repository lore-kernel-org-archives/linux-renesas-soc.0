Received: from mail-ua2-f14.google.com (mail-ua2-f14.google.com [74.125.226.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEDE40927D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 09:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154165; cv=none; b=e+aF2CVxf8T7CXs32pLWoZtso/QfBbw2BGIOE10YV6cXucQoKt38P8O2x5D6i9SDfJ1sSkEjGqLl6If2C+01xL+M0NHk685llyhmTnHTrKmSpk4fQcgwuyqgH72bhUnBsj4ZHngsbZwH65NYotUmo/i0SFA1CYH89uE9Tr2BVhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154165; c=relaxed/simple;
	bh=S13/a2DUuQ9T0YgUluW/YdBy44Rsv04xd7u3nkFLvKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ABJB39hAMhWWMTcJpSYiaRIdU5Iev+oLvXvMGvZtFIQihntEbqT+nsCcqPN4Z4lfNpJ93X+QIlApYRKtRyS1qxQiRGaxUQUAnsSV1qmYGuZ6sUNxRgN12SHoeznrqH4dxL+/XvRPoNrwYrKX0cN3yK0ATKctHPL2+EOWLeB2l5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f14.google.com with SMTP id a1e0cc1a2514c-97e7c7bc5bfso217911241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 02:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154163; x=1790758963;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y9uL6EIaNRwgONG86sMHrIXf+Agz4aVAR96rGI+nBOA=;
        b=kWHhA3UaL+zGCWNgL/KO+VSRGSCGkTDH/Xt3tF1G2bXAjZmfhgP2C2QEtVw5WnXqGQ
         VTGvCXoBPWHIsII+FT+N7HCn0E+VDSkyGJNygHQW34cAFA3Jnj313MmlG5/K3bEBcUZi
         4W2QD9wNOL+ExvBn8dRP4lw6VRh+LbVhn3D0WlUlEneYWHii+IOFeGwLgvxziNUsyMQ4
         Et2t62kWo+Xbp8/qrBfsNjeEL6PypEFZFGwzz9Ee44NkaS2Fwfp0D6/bYgy/MEH3pNoI
         9e8NCgjNAJvR7ZLEtwNQ62EhrJcPfXEGaaLYYGcn1UU7oWnIt9fQqH6CPpweHQzvG8sc
         ffbA==
X-Forwarded-Encrypted: i=1; AKwUvBwbuo1phFt9K8EUGvejAamHZPUsovvAA3ZwIYJWwHVqXXH+h9opi1cHVKX5EnHuarU/4aSL9HFigTKEhqOHSVV2fQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l8YfRjf7p08iPxI55HlP14UpLCBBzLpMqi0j7UlqekoKJVnWFe
	WVZHjD/slFW5NpCh5tLq2kdNEoOqDiTzsF2GR09YPLcnXfiz76myBbjjsBkQ1ibE1Eg=
X-Gm-Gg: AYBFou0w4Mfh2m+hEHSkAh8q3xY1R4duHYYK3xwk8d7XfdwCBB/I7ozMHabkN/9eUsN
	/sIlkI//5mMqCwqjyfi8yE/4J/x84PR+9iEkB9ZgUq2PCNTQcfabvJzt9GajT8BCOMJi02F9Eb6
	R4HIMZUdomoMQcIzVfshaWb8rq27nsHVlsUwMLPskTsh29PvmQs7DLgihmRtNYY0AmtqsvwTZQq
	PKYdnPwyOSBUEI8+fWkE8GHZFiKpC6ZF7UHQl7dyWgR5U9ym0foJKYEQU45yesMGB1nqe7P3+yl
	1yGv5DbyosWqoHwpIaR/CAgpc3u257QzZUb+haq7rHdUjJ0PMEfOA7SGX+21it4WUeFkHT2R2YG
	aSmKxyx31d0SaARSb30mvyhLz7c1sddOkLqlg+x9rtLt+2+N5ml1ARcJyrWLRhGLoGAhMIkQ7Wb
	7QEcFwNMIIfPxA13ZISKYbrwX962CV4PKhubr2dlFyBEuezHQFh9QzN/iZLhY/2TFKpTLja64PG
	Miq/3Iq5/oLgnVEyAIp0k+zP3yiovInlWm9
X-Received: by 2002:a05:6102:2926:b0:7a4:f8a7:d4a3 with SMTP id ada2fe7eead31-7ac1b30b778mr2018174137.4.1790154163090;
        Wed, 23 Sep 2026 02:02:43 -0700 (PDT)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com. [74.125.227.40])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf566d033sm2758067137.5.2026.09.23.02.02.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:02:42 -0700 (PDT)
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-78a4c5c582eso267017137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 02:02:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw5cxvXNsjeJhft2wM8w9UYrYvdT5h5bF16CG8/MM4AKgjfOKZnk7xxmf+VWyrdi91WCCMJneXpxCXP8EHR9B2XTQ==@vger.kernel.org
X-Received: by 2002:a05:6102:f09:b0:7a1:f9df:e35a with SMTP id
 ada2fe7eead31-7ac1e056ffcmr1746641137.33.1790154161709; Wed, 23 Sep 2026
 02:02:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921131951.187981-1-biju.das.jz@bp.renesas.com> <20260921131951.187981-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260921131951.187981-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:02:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXe9kmC7Y6nwXhamvEVwiw7SkWamsSYxgJHoVz-XtfPFA@mail.gmail.com>
X-Gm-Features: AclHuK-1ZfYuQqGN_jdMP702kjKVobBbRT4_4h64Ii2zniFyeaaaBXe0tOjgNb4
Message-ID: <CAMuHMdXe9kmC7Y6nwXhamvEVwiw7SkWamsSYxgJHoVz-XtfPFA@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r9a08g046: Add CANFD clocks and resets
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 21 Sept 2026 at 15:20, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add the P4 and P4_DIV2 core clocks, CANFD module clocks
> (canfd_pclk, canfd_clk_ram), and CANFD resets (RSTP_N, RSTC_N)
> for the RZ/G3L (R9A08G046) SoC, needed to enable the CANFD
> driver on this SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -162,6 +162,7 @@ enum clk_ids {
>         CLK_ETH1_TR,
>         CLK_ETH1_RM,
>         CLK_M2_DIV7,
> +       CLK_P4_DIV2,
>         CLK_SD0_DIV2,
>         CLK_SD1_DIV2,
>         CLK_SD2_DIV2,
> @@ -337,6 +338,8 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
>                     dtable_8_256, 0, 0, 0, NULL),
>         DEF_G3S_DIV("P3", R9A08G046_CLK_P3, CLK_PLL2_DIV2, G3L_DIVPL2A, G3L_DIVPL2A_STS,
>                     dtable_4_128, 0, 0, 0, NULL),
> +       DEF_FIXED("P4", R9A08G046_CLK_P4, CLK_PLL2_DIV2, 1, 5),
> +       DEF_FIXED("P4_DIV2", CLK_P4_DIV2, R9A08G046_CLK_P4, 1, 2),

".p4_div2", as this is an internal clock.

>         DEF_FIXED("P8", R9A08G046_CLK_P8, CLK_PLL3_DIV2, 1, 8),
>         DEF_G3S_DIV("P13", R9A08G046_CLK_P13, CLK_SEL_RSCI0, G3L_DIV_RSCI0, G3L_DIV_RSCI0_STS,
>                     dtable_2_16, 0, 100000000UL, 0, NULL),

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
