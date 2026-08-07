Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158CE41DDFC
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Aug 2026 13:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109125; cv=none; b=P4Gy1K5XGbUsYjjCSCtYsXg5lUM9fZandFTK1sBbOQOu4JVj6zlQ4cWpO3mB6CaLPqjRQ4ac4sagChUBN3XJAVaz+D4toHbZg8iRjaF9ZitsCxifhCG7HE26x70TuS8fAGXiAfCa6qqNps5rJg+dxXJh71U6RQqRMKd+WKOZ2Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109125; c=relaxed/simple;
	bh=a19jPmi+GzVCvFFZOgNfOCBH89do39+pNlklgVN8luE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TtWETPN3ZsOk/FoCuu8K6xinFVByWeRnCe/BKnVcuwu1jhbXZohTwdBztTuF3VErQ1RVdJa1IxGQOLYrwj5MKUFtpEBdhiJ+956mhZS8K5y7D9BFk+mIMJQEEDTjLkUgI0bsxaH9pWcE2oiVWt1y75NMgQnFlMjI9a1EM9C/rAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so1120317e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 06:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786109120; x=1786713920;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s+oxSUT87w6ZNNbKpTMGnmQcsBsam/5hlyl/VeXKudE=;
        b=DfxsWC7DVhpgZZA0ddBFhBHtbu7Owp8fFVFuflGHJmJw9GOasfS/6I8BtlrsFldt2w
         TiIOwtI/lGb+haxfBY5vsPLgwYJnbhjGdmAQH4UGDrQp2pJVzddZai8POacXDd3NTZqd
         Ylx03RdFgTtBUhe18NNZV6wHrmyLiza3ZAf0KIEXmLForiyGM/1CAo1LtXTDJQjXvvot
         OsjghkdV423hHeU7kuJ1HU4cxsSTc+gcBxIVCjib+gfNi4edxMtVer0J35GV7bxYqHk9
         bMLuHLlNWIAqI/feIoxSsxCdkNzp3ei0Dd5GFHUr9rX7hzjbdCgwZhMbUo2LKdXJBmVv
         nItg==
X-Forwarded-Encrypted: i=1; AHgh+RqTQJn4IFbEYYjEkCl1FaFDRU5ZRArXqzx7gOJT5MPgTHrvirtuBtS25U/M9VS9vfx32yiDx5ftY52jB94poRCFLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCrnm8bFosA052LXU27I+iYtAEGHpKv8e+FquIy0VkyLmfZBHT
	N/7F78DP5CbmMGXWNNl/WYYXnM0iaO6CAY9tq5WrmLd/LQqYkg1miMXnJeMoZGNM
X-Gm-Gg: AR+sD11XUAzlBhH+lCZHPFOHPaPjqZ1MJVmqlIRXuq8OuQWZBxqq2Rg9qWxeGXUeTM6
	RTc3UFZT07T3h02UH3fSZNvGMC5V9e3mbds8zbLhYHL1KdNbKHLstyCHYVH7RJhSzEcWgGMZ/nb
	nKqeIsE3XMJ71/FXqPS6/zTAKC65mDazwAV3a52lcipYc3s0CPxlczthuKZRLAWu9EqXYwuUufH
	5SZ6+OQg522WVfpzX7H+Pun+Pe+Obp2EETNb+ECrf4Fx0oAd962JPDLWYYoAbRgyqYHqFXrVcIT
	1SbCO9G8N+PTaDkpsmIBHuCtMssQqSrZPxysl0PMLgEESHJ15cTT40S8eNdB7WoBsUQyXTCkPaj
	5TW/QwJa1rBFRaT+vh6RtBeoigaq8k3HChKb004oY7N/qvGBjmP3/vQIcreXd7AYYeLrCPMVDMk
	Tf3g3Gx+UI9dnjlUXr3lkf6014YN0K+H3Tt1F7La0Lu1hZa0vAJRMxMVxyh9hfWd4ePgO92HgNw
	xh+WIj4HPsF1Jh8rbdOEIuHpw==
X-Received: by 2002:a05:6122:78d:b0:5bf:ab99:ea89 with SMTP id 71dfb90a1353d-5c3d924f087mr2822474e0c.12.1786109120066;
        Fri, 07 Aug 2026 06:25:20 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40aedae26sm487163e0c.7.2026.08.07.06.25.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 06:25:18 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-75738fcb0d9so583115137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 06:25:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RruAmnve1j6X3pPi64ytJX1KIcjT9eMBnLytcoZNy2AH5rN/L6IFWI5a8ZmnOtZuX7nbSHCWX0A5pfYfxlCDcz6Tg==@vger.kernel.org
X-Received: by 2002:a05:6102:4bc6:b0:740:2664:801b with SMTP id
 ada2fe7eead31-760e851e3e5mr5577733137.11.1786109117333; Fri, 07 Aug 2026
 06:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730113200.36456-1-biju.das.jz@bp.renesas.com> <20260730113200.36456-14-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260730113200.36456-14-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Aug 2026 15:25:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkagUkD=HhfstYyazZdv25F6ab-ZM7k9T0=EQtfindvA@mail.gmail.com>
X-Gm-Features: AUfX_mzQPeCDyQ1wyaJV5V4Fa3iFtKPteQt78XLxVMU8eg754UK0SgY97Mc3Jfs
Message-ID: <CAMuHMdUkagUkD=HhfstYyazZdv25F6ab-ZM7k9T0=EQtfindvA@mail.gmail.com>
Subject: Re: [PATCH v23 13/14] mmc: renesas_sdhi: Add RZ/G3L HS400 support
To: Biju <biju.das.au@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 30 Jul 2026 at 13:32, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add HS400 support for the RZ/G3L SoC.
>
> RZ/G3L needs a second HS400 enable register, SDm_SCC_HS400MODE2
> (offset 0x020), alongside the existing TMPPORT2 path. Add a
> TMIO_MMC_HS400MODE2 flag (bit 16) for controllers that need it.
>
> renesas_sdhi_hs400_complete() now also sets HS400EN2 in HS400MODE2
> when the flag is set, and renesas_sdhi_reset_hs400_mode() clears it
> on exit. Add renesas_sdhi_set_tmpport() to mask off only the lower
> 16 bits (TMPOUT) of TMPPORT2 when writing it, preserving the upper
> bits on controllers with HS400MODE2, instead of the previous
> unconditional zero write.
>
> RZ/G3L HS400 supports only one divider value, so
> renesas_sdhi_set_clock() now forces the clock value to 0 before
> masking when HS400MODE2 is set and the internal divider isn't
> currently enabled, rejecting any other divider. This also completes
> renesas_sdhi_is_internal_divider_enabled() from earlier in the
> series, which now additionally checks that the current timing mode
> is not MMC_TIMING_MMC_HS400 before reporting the internal divider as
> enabled.
>
> Enable TMIO_MMC_HS400MODE2 in of_data_rzg3l to complete RZ/G3L HS400
> support.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v22->v23:
>  * No change.
> v21->v22:
>  * Updated commit description
>  * Added a renesas_sdhi_set_tmpport() helper to set delay values.
>  * Added a check in renesas_sdhi_is_internal_divider_enabled() to
>    return disabled status when in HS400 mode.

Thanks for the update!

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c

> @@ -355,6 +366,22 @@ static inline void sd_scc_write32(struct tmio_mmc_host *host,
>         writel(val, priv->scc_ctl + (addr << host->bus_shift));
>  }
>
> +static void renesas_sdhi_set_tmpport(struct tmio_mmc_host *host, u32 tmpport)
> +{
> +       struct renesas_sdhi *priv = host_to_priv(host);
> +       u32 val;

u32 val = tmpport;

> +
> +       if (host->pdata->flags & TMIO_MMC_HS400MODE2) {
> +               val = sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2);
> +               val &= ~GENMASK(15, 0); /* TMPOUT MASK */

Add a #define for this magic value?

val |= sd_scc_read32(...) & ...;

> +               val |= tmpport;
> +       } else {
> +               val = tmpport;
> +       }

And then you can drop these...

> +
> +       sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, val);
> +}
> +
>  static void renesas_sdhi_set_hw_adjustment_delay(struct tmio_mmc_host *host)
>  {
>         struct renesas_sdhi *priv = host_to_priv(host);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
