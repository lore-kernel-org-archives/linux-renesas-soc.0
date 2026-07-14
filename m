Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F1246AEFA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 13:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035863; cv=none; b=DMm5dlqI1bvr4Wii5r0sDY6M7w0ly3pr9gj4hEGN7wCSiWoxudJ204l8SoQX5GuGzMdkDwrySyT7OtxqsbU76dSxnyhjRiCfNUOz1tuKYqEjima4Q7A/d2TsgBOj3fLuKD7uzt1kLZe34q5dyaG6q9dLLNoyt8Imqe3Y0mPZHMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035863; c=relaxed/simple;
	bh=7ltIk942FlcNb7c4P0iS7YuMPIYJUL+J93HcQaMBRJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmCYFkhiz+lIFioOdZc8K8g6JKST/pRciax3NyU16fcQ2SNYxlW9DwOdFwUMsgIWQxyVXky5mc3LJD9r8q26TrjR1gfAM14MDOfacQdNdYf5mohN3qsKv5Me9ZKhRFIfsA32wZf0B5pg+XN8TshBvx6v1J4XJxxDgh3gHkSaslI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c12614b81c9so804751166b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 06:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035859; x=1784640659;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FfpdozjO3owtTfsOTXpWhJUHafNjaGvEr4pDq5DSDJg=;
        b=Y+d97yvNbP3r6rR+I3d9uG0Zs+de8YyX6R+kMnvWjgK1JLlilCMYp1OOavsuVg4AVl
         n7SQbLZnoEfUseL/jZfpg/embjDGdZNfxxJJwgGU9mMDCnPcKmTj/kYD3dW+11wcctzI
         vw3OQ2qOPHWi4xpDeFiDMcfqDnsmlUNJl/ViaQFKxUrZc96ZD2fTwAiZ30zf/+FFstFy
         ifDZT5aXVxsDNeOvHyXma6hIP1Qhd6Kf7J0F2MhhNie5cM2LJ575oLyDfKdmCbPrpWUG
         rtwKNWAcQSDFv78smN1OZ2suoGeQ6FreGBNXNnzlZ8c0GWQBMF1zV9htrmqlfiKncFsQ
         A43w==
X-Forwarded-Encrypted: i=1; AHgh+RpVIlKv7sMXfV2zT/NKTPvZMqODcmDkmnuh4sq6i3q6fIYSqFOOQ4GK+qqzDUyVbSgrpz6s3q32keRbzLcNv/mXig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6iegGfmrDFmWGr1aXIhtOT4Ytp1JRsAzRnX0/NMwmsswlEerZ
	vNZyJvL79reS9kU2b89cEMNSCXXs28iz4LbTd7RkNn6djnSjRZYEnsG/f5uLsCfxIjs=
X-Gm-Gg: AfdE7clQkmPUUVsEhb16tEogJhcCnnwdNJWExDpkLElRLdBv5DRqMI/c8ouRzKGlzqG
	kYN1A9C7Qfq2c51mnASktcnQVV7Z1QYk0DRwXgWP27Gqft7J0L4SM85SllefVH0vSomvwn9iqI9
	RSCPNs4tMI4EP9bhexK/r00KL/X47zKjmhNf2fnqG6mqIsHDkrDve2TuEvgVTtYw6JvwGTMVzOn
	lI0vsTg4u7g+GxLjKmyfNMUrq4ek3Ko7ZtwgouNFgarB8ePhiL9YBz7vX55oukj1XDAjmBXjLIF
	2GvSAgZXyCcgvdI8Lj+goBe9xAhQJY82utu6FElUI3y7e8KKhFp14LuEdfXsGfeS92YHC2TKI6O
	qz2YICyhW8lm268O+wdMxtcTcLadyBsY3VnVwPZ6SaEXQIWKXyLU39eBMyRGekqhzh6abpdW6Gm
	cOIsmyoWC+ewESgqjNxBWdgV6+83pa6RW57LeY7tJpP4geout6mg==
X-Received: by 2002:a17:907:e117:b0:c16:f44:5375 with SMTP id a640c23a62f3a-c161f4c9d3amr392697766b.60.1784035859068;
        Tue, 14 Jul 2026 06:30:59 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1673a00e9asm7897266b.20.2026.07.14.06.30.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:30:57 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c12614b81c9so804742766b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 06:30:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqjxhMA9JBrbLWIzUPdisrFlkuZV4TL7qF+I7YkAyZrOeMXFzR/tnZCKOGPCEExBv+aESPpkN4v1Rd0qe/Vuy65dg==@vger.kernel.org
X-Received: by 2002:a17:907:1ca0:b0:c12:80a6:2df9 with SMTP id
 a640c23a62f3a-c161e9400admr641458666b.8.1784035857577; Tue, 14 Jul 2026
 06:30:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709192916.630794-1-biju.das.jz@bp.renesas.com> <20260709192916.630794-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260709192916.630794-9-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2026 15:30:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW00Z-Kj7nQiZ+W6fuj20grD9GUg93K8dCKH0wWh4U7ng@mail.gmail.com>
X-Gm-Features: AUfX_mx2ffZ10VqYnA4gH8_EiW4TggJsmyvBwCVek-BHgyJ2IKNd_EuJjfrBJ5o
Message-ID: <CAMuHMdW00Z-Kj7nQiZ+W6fuj20grD9GUg93K8dCKH0wWh4U7ng@mail.gmail.com>
Subject: Re: [PATCH v19 08/12] mmc: renesas_sdhi: Add RZ/G3L SDHI support
To: Biju <biju.das.au@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 9 Jul 2026 at 21:29, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G3L SoC (r9a08g046) has an SDHI controller with several
> differences from existing platforms, requiring dedicated handling.
>
> Utilise the TMIO_MMC_HWADJ flag to identify controllers that carry
> a second hardware adjustment register (SDm_SCC_HWADJ2 at offset 0x010).
> When both TMIO_MMC_TUNING_DELAY and TMIO_MMC_HWADJ are set,
> renesas_sdhi_set_hw_adjustment_delay() additionally programs HWADJ2
> with 0x3FFF at 3.3 V and 0xFF at 1.8 V. A new RZG3L_SDHI_SCC_HWADJ4
> register (offset 0x022) is also cleared at the start of tuning when
> TMIO_MMC_INTERNAL_DIVIDER is set.
>
> Add a new version constant SDHI_VER_RZ_G3L_SDMMC (0xce10) and extend
> renesas_sdhi_sdbuf_width() to handle it alongside the existing Gen3
> variants.
>
> Introduce of_data_rzg3l with RZ/G3L-specific parameters: a wider
> clk_mask of 0x200000200, a max_divider of 2048 (reflecting the 11-bit
> divider), a dedicated rzg3l_scc_taps table, and all relevant tmio_flags,
> including TMIO_MMC_INTERNAL_DIVIDER and TMIO_MMC_HWADJ. Wire it to a
> new of_rzg3l_compatible entry using sdhi_quirks_rzg3l (which sets
> fixed_addr_mode), and register the "renesas,sdhi-r9a08g046" compatible
> string in the OF match table.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v18->v19:
>  * Update commit description.
>  * Updated handling for clk divider.
>  * Renamed TMIO_MMC_HWADJ2->TMIO_MMC_HWADJ to make it generic for
>    hardware tuning delays
>  * Dropped duplicate SH_MOBILE_SDHI_SCC_TMPPORT2 macro

Thanks for the update!

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c

> @@ -234,7 +236,14 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
>         }
>
>         clock = clk & CLK_CTL_DIV_MASK;
> -       if (clock != CLK_CTL_DIV_MASK)
> +       if (host->pdata->max_divider != SDHI_MAX_DIVIDER_DEFAULT) {
> +               u64 tmp;
> +
> +               tmp = FIELD_GET(GENMASK(9, 8), clk);
> +               clock |= FIELD_PREP(GENMASK(17, 16), tmp);

This fails to build on RZ/Five, due to missing #include <linux/bitfield.h>.

Oh, fixed in v20...

> +       }
> +
> +       if ((clock & CLK_CTL_DIV_MASK) != CLK_CTL_DIV_MASK)
>                 host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
>
>         sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
