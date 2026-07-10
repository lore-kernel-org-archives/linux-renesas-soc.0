Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A79A43078D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 15:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698201; cv=none; b=F1qR8CS36HZqGZKP6dRmjAQ/XzDqqfcFVx7fkA2auFISzmb3aT5Aod1RDKtw1GxvP+lR/1j+032+H9EytPSJBhwrzqudE6JxxtaCA5gTg9NQxR0A87OQNW0Z6RhpLuowh7UEdqPzROy6uABbD/ysy/bNXNT3Zr1BdeklVGgTSzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698201; c=relaxed/simple;
	bh=tPEuv7csDipdv9nhCylG4VLlHMY2sUgBrjYOhSXSxtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gO0qADrM6KxrJXTrvxmEQkj0FsFeEJPM6M5xmU5EvXjyNixyqSdwYQkjJZQHV8saAhvqJHDUoiqShrZ59p0mHG/hs6lS5YTiA5R0Ykor5JMrYm40ejyLYJtHG1eehJnXZ+fSwZL5zFaGrzz4aeVraRzJtjlmXU4SLgJeOhpynN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so551123e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 08:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783698198; x=1784302998;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=beio+ZM1BqNzXiuYoOgxpj8ydblvVw96dXPEBtyAT1Y=;
        b=c/RonK/3gHievLGuC6C0B9+zcvt1GaSy1jmMhHO8uUasSkhTmPz8OqHgtDA5kkaLEX
         erTcVtKwhEmCiQykE1O17s//Aw9esHJtNCY99CGmGllwoB8z/1kAtOKUQqSoheAWdWPP
         TueDx7cM17NRrqJYxxyrTUOF1LHbcjbyzXbewWZRn1AW8OklRdL9sycT++JSp/CCLtzi
         MnXHqIF3ebDI4SA8z/DTyXtsHezut9rZ4k1P3AtKze4748OwwCQmN2Bq9J1FdPBgBoZg
         b8+QqGcNfomjQTnqU199YF1nuaoMG/uOyYbJfVHRlH+71+dJVSWrgBKzW+VEQppWFk5j
         OMKA==
X-Forwarded-Encrypted: i=1; AHgh+RrF4XMedrQtZp6Sd9BJJ6iFO6QBz4e2pduSzSr1gV9M2VVcNlS4XqQ3xF75oLTDpt8Zi8dj44Z5twjxdrTHLxoHxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfk1Y6CwM2fHhsTgSbC4IDiNqAY2mMjusEZ3IgOk9COm92/All
	OmHCjaisBzhcu+04kioGmdh5uWOw7hak8x1iJLTVqjrQdZwALG6a4k0pL3r5qng9
X-Gm-Gg: AfdE7cl9WBN5snvZukHbSvN3yIAZg2JjAEX50dVc7vbm8wOSchPEdbrZXzKATCypbnj
	BRLokE72BzJD64azqCcmG5KX6D3n3w4OofssuoRub+MZ5Fg31MqlVK6BkDo4qaArJa4o/rFBzFi
	T4Dk+0P/Tn4foh6DvNuCSYVqJn/BhoBYFBA1gBo9fYkjUHDAujEGP1kyBPSJnH4CMac9E6IFWcy
	yywNLhiN7VafkxlOKLW0LKblqelI1oMFZZ9OE3Ll8JQtyKN5tLYAsHuSRnXvR0ACrZauSsReQGw
	HnWY4IZL41u34Idyshg7OjECqVQcbLnHS/zqcZLkixVcYdft8irXA6mna44EgwJOldqB73AoZhN
	MWD22KVYfFGwhNsKcKUB1s/2D9qkaQzNW1iJmQZskfI8uDCGFd5kT0T43Imt6+czWKI9x8z6eQO
	cqWhDLO6cRclnadAJ/VeYBx54vwHGFcDbWc8tFVV+3rP9W/sYpW11c5w==
X-Received: by 2002:a05:6122:16a0:b0:5bb:fa79:56dd with SMTP id 71dfb90a1353d-5bfa554025cmr2271688e0c.7.1783698197886;
        Fri, 10 Jul 2026 08:43:17 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f8a62ffsm5227799e0c.13.2026.07.10.08.43.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:43:17 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bd8efccd11so1749639e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 08:43:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro8vHSQgWgRkhinTef3Dpvv2XSNdIbXunriyihsKFguKoUBm0agNETUGrsq+Uuhls7zs38TcjmRdQqDkxpsFn7qUg==@vger.kernel.org
X-Received: by 2002:a05:6122:e010:10b0:5bf:7812:3e4a with SMTP id
 71dfb90a1353d-5bfa464b9d7mr1794594e0c.2.1783698192577; Fri, 10 Jul 2026
 08:43:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com> <20260619164030.380098-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619164030.380098-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 17:43:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7=NEJJV0k1vLjLT9FBA7MSj=wm3J0-roTpsA9azhwrw@mail.gmail.com>
X-Gm-Features: AUfX_mxIJvDWFvMMXoxDbvprSmwcHbW78Ry-V250yy9HG4EgUM4X_R9k7-dLQF4
Message-ID: <CAMuHMdW7=NEJJV0k1vLjLT9FBA7MSj=wm3J0-roTpsA9azhwrw@mail.gmail.com>
Subject: Re: [PATCH 4/6] clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 19 Jun 2026 at 18:40, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for RZ/G3L DSI mux that supports 2 duty cycles.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -120,6 +120,11 @@
>  #define RZG3L_PLL7_FSTD_DIV_MR_MIN     (8 * MEGA)
>  #define RZG3L_PLL7_FSTD_DIV_MR_MAX     (16 * MEGA)
>
> +#define CPG_PLLDSI_SMUX_LVDS_DUTY_NUM          4
> +#define CPG_PLLDSI_SMUX_LVDS_DUTY_DEN          7
> +#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM       1
> +#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN       2
> +
>  /**
>   * struct clk_hw_data - clock hardware data
>   * @hw: clock hw
> @@ -741,6 +746,20 @@ struct dsi_div_hw_data {
>
>  #define to_dsi_div_hw_data(_hw)        container_of(_hw, struct dsi_div_hw_data, hw)
>
> +/**
> + * struct rzg3l_dsi_mux_clk - PLL DSI MUX clock
> + *
> + * @priv: CPG private data
> + * @mux: mux clk
> + */
> +struct rzg3l_dsi_mux_clk {
> +       struct rzg2l_cpg_priv *priv;
> +       struct clk_mux mux;
> +};
> +
> +#define to_plldsi_clk_mux(_mux) \
> +       container_of(_mux, struct rzg3l_dsi_mux_clk, mux)
> +
>  static unsigned long rzg2l_cpg_dsi_div_recalc_rate(struct clk_hw *hw,
>                                                    unsigned long parent_rate)
>  {
> @@ -1402,6 +1421,116 @@ static const struct clk_ops rzg3l_cpg_pll_ops = {
>         .recalc_rate = rzg3s_cpg_pll_clk_recalc_rate,
>  };
>
> +static u8 rzg3l_cpg_dsi_smux_get_parent(struct clk_hw *hw)
> +{
> +       return clk_mux_ops.get_parent(hw);
> +}
> +
> +static int rzg3l_cpg_dsi_smux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       return clk_mux_ops.set_parent(hw, index);
> +}
> +
> +static int rzg3l_cpg_dsi_smux_determine_rate(struct clk_hw *hw,
> +                                            struct clk_rate_request *req)
> +{
> +       req->best_parent_rate = req->rate;
> +
> +       return 0;

Why no forward to clk_mux_ops.determine_rate()?

> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
