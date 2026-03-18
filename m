Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6803523EA92
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846079; cv=none; b=ghCIGBzJ4RhJH5Ia5Ftm5uVzEDE6JId42LhZvYu1qjKMuA21smXOSC4AXbR5N21dymoKVtrgsSvIOAZyYKVHKYJBXragcElurSzzGfATGj/6MzxyOr85+qtxwG9x+bKbjzl7zMPWURcrujpPMZlkN6ulHWejgvQ74KroTzSstXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846079; c=relaxed/simple;
	bh=BFPlFdGofjO1NMSH6MTDaP0xfeuuIZQCHtJYo8BHycs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZaKx04SNp3zPdqGtQgSOAbC6HdJXAELiDGOhrFm36e4yCcRWMmY1aA+fqJkgTsEuxDxnldJRNPssMQ0ZEXed4xBe30EqyUroAf4jywHurIPLZ14OaGSI0TXvlP4+uvMQHjrQN3x7s7Dg/BxY6ety96l9+brKVPzTmOpFdmQIu30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56b58473bb6so5407048e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846077; x=1774450877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXg7FETapjSVXFHxAADyy8y1j4tl12Oxzd3Nyl9hAYU=;
        b=HI8F3DfQsHG3NarjROwvNGfxbLrvOljK58lAAcynxWyM5iPYQGFXxKEgjVJo7Pxv3y
         B/We12l/6AQhH9tWi7czMVkdeNNSzmeMQyyxPUE37IVQ0L2tjtr488df058O2BncFhZ2
         2JtMtpzTC/PuJ03fCaZXO5Q89CH5TxhReuTgCaZ3lWv98uhFM9uSxsVDOGAwRaY+ymY9
         +c2zapBCq1rzOGGbOKcnouv42Dtd9iTA1/QKrFejcdLiHaRnYXrI7TSQ0wWPyQD7IJpk
         X9r3yXl/Zxtyro6fCFM+KalnKTh1fjcOXVGmdi7WZybSO1ve/OWu/i1MEXdxTXwSQnwk
         neHw==
X-Forwarded-Encrypted: i=1; AJvYcCVXI8o7WQTa8nTq6bJUTGEwStxNLuoa3DORuSc9SdvyDOQ1I5OmhJRSckZqkzvCkRhx3R9S0y1kg4zwkSTp88peRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyla/DK5b93HxzEkjJulCfqfkppXcTyCLlYKVxk6ER0CBHYsfSg
	du4PynwvvpBGsoEhUX3bwh4GCebQuYDpFQIUS7RFGs4ftoSAsptFJL8cDgENiUs6dqQ=
X-Gm-Gg: ATEYQzzLk/sKWCtMos4eDvegIFRKqAjJ7zd/ogXhhwZnBBkQ2SgNBZVR4qDQzm2F07u
	uMWHaLgGmjGejitvtgQMQg3u2m0fnXKm7YoKbD42RGm1cWwwssfHfHY7Wd/a3iFqdBn5wUXKzNr
	tUgdty1+3mr/l9u7xIS0s9w2tXUuY97lWI7tpSz0EAcSfJUZz2soNxW1p+ayfSvEOFVImPZpBtf
	F7vPs/yqWktDX6UVGrd0cHL/+pqa5YT4VM2UBDCeiIbPEWKy76xJ1MzjnlmZxaEAtkHUAhW/+Cx
	VONiTjVt+FKZBJlUh7iCUxk/z0nNhp/9Q1M7Mz9X+UsjAwZ4ShfKUuqBEhY/ORZ9LQslegZ6tEP
	eP7goq7PIGPtn61HSGOv7PGBB+TnHS0geO4CsolHTUDwq8M9wFzxy+A6LTyzHKjNwGhQBmN1gcZ
	nxFeara+1VkgAqQp2jmx8mQzIv7ajxSDcDlEmJrx43NLoBqhQo2n96U5HjMPgNpmLG
X-Received: by 2002:a05:6122:8c1a:b0:56b:5952:9157 with SMTP id 71dfb90a1353d-56ba71d039emr2206739e0c.15.1773846076542;
        Wed, 18 Mar 2026 08:01:16 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95102ff5f68sm1470058241.0.2026.03.18.08.01.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 08:01:15 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56b58473bb6so5407009e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:01:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/7AhM5uLtYnOsXOBMOYpr3QpyNozbKQchSlvikZaTd4dTSrddPsnX50SIXPiM2TyvVa60sdd+XCWZMDY/rsayhQ==@vger.kernel.org
X-Received: by 2002:a05:6122:178c:b0:56c:c76f:1bb0 with SMTP id
 71dfb90a1353d-56cc76f1cd4mr1137814e0c.9.1773846075257; Wed, 18 Mar 2026
 08:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com> <20260318084151.122674-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260318084151.122674-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 16:01:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2hr3svoxqn_xw1y6D4yTcsHhFU2sz3rfqkXdTsJOEvw@mail.gmail.com>
X-Gm-Features: AaiRm52l5JvJI6VrRb9P6PewmuqbHa_trQPwdZfgYoddw9jAVQwgLAT7GxG69dE
Message-ID: <CAMuHMdU2hr3svoxqn_xw1y6D4yTcsHhFU2sz3rfqkXdTsJOEvw@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add
 critical reset entries
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 18 Mar 2026 at 09:42, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G2L SoC family requires DMA resets to be deasserted for routing
> some peripheral interrupts to the CPU. Asserting these resets after boot
> would silently break interrupt delivery with no driver to restore them.
>
> Mark the DMA resets as critical by adding them to the crit_resets table
> in the SoC-specific rzg2l_cpg_info for r9a07g043, r9a07g044, and
> r9a08g045, preventing __rzg2l_cpg_assert() from asserting them and
> ensuring they are deasserted during probe and resume.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a07g043-cpg.c
> +++ b/drivers/clk/renesas/r9a07g043-cpg.c
> @@ -379,6 +379,11 @@ static const unsigned int r9a07g043_crit_mod_clks[] __initconst = {
>         MOD_CLK_BASE + R9A07G043_DMAC_ACLK,
>  };
>
> +static const unsigned int r9a07g043_critical_resets[] = {

"r9a07g043_crit_resets", for consistency with ".crit_resets" (everywhere).


> +       R9A07G043_DMAC_ARESETN,
> +       R9A07G043_DMAC_RST_ASYNC,
> +};
> +
>  #ifdef CONFIG_ARM64
>  static const unsigned int r9a07g043_no_pm_mod_clks[] = {
>         MOD_CLK_BASE + R9A07G043_CRU_SYSCLK,
> @@ -420,5 +425,8 @@ const struct rzg2l_cpg_info r9a07g043_cpg_info = {
>         .num_resets = R9A07G043_IAX45_RESETN + 1, /* Last reset ID + 1 */
>  #endif
>
> +       /* Critical Resets */
> +       .crit_resets = r9a07g043_critical_resets,
> +       .num_crit_resets = ARRAY_SIZE(r9a07g043_critical_resets),
>         .has_clk_mon_regs = true,
>  };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
