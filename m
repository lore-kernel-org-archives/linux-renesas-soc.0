Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636182;
	b=1e3HUP5cL4kaNCNHRPG4cRRz0B+RK2j1uiaU2bdxjG4iVKx41el0Y2eyIt2+c+dIwDvK
	 obUqqwQYvI7tMnUWcZsW3GtIBd1Lhd+no2kqGSF/toIW+/BruX8Wa/iattzIa+QwooFmO
	 UMlNn3EhnM53O4wnSPYB9DEOqS0fWce1fUptfL5x8yZyJon27QHvXsABZbWaWRyvSzXRb
	 7u9vPeUhNiNyXsntD8ALHn2NaYOfiUiJQ+5+DLW0+fxl/FJiSdLrHTU5K7dP6HRtDOkOy
	 A9OxGYtxIDHYQ9db+jKURwQDsPMA0Ad230iTcwHhYnOsyQRt79Mu90akc/bumTCm8cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636182;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Ch9JtC98wUdbnFiYgfve5cQZzyl0tJi9sgGxiR7zz1o=;
	b=H//LDJcYd7rTE+H0QR3KFQ/zgaQLnMvgFzniRuFFxMhp/PYKp4NuOPDyJm8RyOVHsQJ6
	 miyYzzTdHmI7pgeJmfX77PxZjcOLmlbp4OrtDFBxlJpqAhyli6dtB978d145hxABD1XRH
	 qsGiO9iD6ELtfjFfcntr1wrc5JWEl2HmwDTdwRU6Xpc95fqeO4F3kdGLLY0Gc46WRVSDd
	 EZ16QDYc+PKprEloB5RyfLa+QVtboo6VOH/DjFTdcjI6UwmPWBqDQmA0ZzOpVio4xyO8T
	 udlWR+HtMZLEQOciwgUFqrFldy37osVVOyh5JlzHH1UIxLgTjF8dHbvDyGD4TBVY2BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B71E6082C43
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Nov 2026 16:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B71E6082C43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eaefe5b523so2517337e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Nov 2026 08:16:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636181; x=1794240981;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ch9JtC98wUdbnFiYgfve5cQZzyl0tJi9sgGxiR7zz1o=;
        b=YK5ans/Q5VfqMyIkRkWvBl4LWO+Jq6zg/z74jxYWx3IOi1kJfrzcHLnScTx67v2wn4
         gDmJ2xFWO5iyEaCuGOxA1CfGrUJCAyabkWQyA1Uc9H2pAF8w/lB0pt33t1L0pb9DNK09
         5EpnTknT6gY7jRlL1booxJsT+FuBkaR62+V4m/yk58+QI4JaYF9PJ0px3yzLBPJ+LUhR
         L0xiFVf0RIOmMN5pcPEFO276iFqr30ZxJ8DYYywQFMh+xGb5TUc54pT2EJFs1bd/G1k4
         ieh8Xa3sAnt8U+077t9UPdHmO6YA0nFUYYCJHdn2tfrwykC0G9m1Qo/R00Dbkiu9YXfV
         jz6A==
X-Forwarded-Encrypted: i=1; AKwUvBxHCQhcWBDA4Zmp7Rda95xoqwD1XqUp+co9arQFe7bEMXVEtEogOb/JatVr5SoHY/CaiHstdZrmc12u5h1YBI6Yzw==@vger.kernel.org
X-Gm-Message-State: APuU4Z80ZLLTyT86fDmteI5BDlBkOb6XSlmtFFECIlIz74BEmrpi8ru/
	pjCUdYl2+oIqJvYEuRFBvOZZZqrF8BCNns28fukBj4uHP1hkYE9myQUlw1QXt5B/GPo=
X-Gm-Gg: AYBFou0dlo2bS3zaO72jNQbwlp+rIfQO0Qa4f1iTqHECphnd0UGvjHpYRffw4p/Vc4o
	fNpxtYtOKbF+cbBmRUUNPrn0II673N42NBEeYrTuBDB0/GPIbRi/PhgMhA4v4IkRhDlgDLJiwo4
	nFcEpF16abfADVMvGLf/x+Q0bwDJADJ9O7lRXwU4yMXfs/3d8F1qhqy+naejQ33sqiv+CtBFmn7
	twLER2KBXLij3z6GPf/knWQjtzb7IWxH2A+72Ujh52GnVqOwvFejWdrjpXDidvEecxsYistaC/I
	34z5gX+WFWE/d3hrBhPj7+uKHzf4ek2ausELrdY8OtxdX3znJx8qxHfOji/jJyUSndpZHRGlPiK
	VGW2yf0u4ScC5SPrwBGEXJQ3TC83IHkWNC2hxHwIOd5aOQL11cou0YGV72Jqr/ncfg9ind3joUo
	+/T6Jfz3EbIHsVPMS8rpY6fOFFoOzJ7g78LObVisf//U2HzovNPyyIkL2XS+wNLo9JoXyBeUZh6
	fRIMlQUvGPUwaJWJOwUikVMeHHFdc1EWL4okMhvbb99VOBpYjzUczMEcFdqVo3vHtYbGSyh+5nC
	IhM9ldn3uM+VGfKEhDHU5zZUwgkbFudZaNk9kaNxnRMPByjNBjhV5eUMaUg2z0gNigPMuA==
X-Received: by 2002:a05:6122:130e:b0:5ca:f811:25ac with SMTP id 71dfb90a1353d-5ec6895c285mr4414935e0c.14.1793636180960;
        Mon, 02 Nov 2026 08:16:20 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee409dfdsm12146195241.6.2026.11.02.08.16.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:16:20 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eaefe5b523so2517304e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Nov 2026 08:16:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxK+iqb6GCo7swsXx536dFBHvwmf8ljl5BgMWkLFxfHNlLGLWcFPxM5axs8KzUw6zBERSUaurMEgXg7pGJqI6yhvQ==@vger.kernel.org
X-Received: by 2002:a05:6123:2eb:b0:5e8:c908:d60a with SMTP id
 71dfb90a1353d-5ec6883a419mr4465957e0c.9.1793636180228; Mon, 02 Nov 2026
 08:16:20 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-0-47f23de6bdb1@bp.renesas.com>
 <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-2-47f23de6bdb1@bp.renesas.com>
In-Reply-To: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-2-47f23de6bdb1@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 17:16:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX5XuDpdmcUhPHU_uNggpXq_L=6DRSN3ftWEApubu+VMw@mail.gmail.com>
X-Gm-Features: AclHuK8jrseFCU3Itfq84vW-XdE0TqbVlqwmURK0nQgZ-nx23dm7hkxRm8PcLJM
Message-ID: <CAMuHMdX5XuDpdmcUhPHU_uNggpXq_L=6DRSN3ftWEApubu+VMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: rzv2h: Report the DSI duty cycle from
 the LVDS divider
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, tomm.merciai@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

Thanks for your patch!

On Thu, 29 Oct 2026 at 15:26, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The 4/7 duty cycle of the LVDS path comes from the division by 7, not from
> the PLLDSI mux, as an odd divider cannot produce a 50% duty cycle.

Note that the latter is not true in general: if an odd divider looks
at both edges of the parent clock signal, the output will have a 50%
duty cycle (assumed the parent has a 50% duty cycle).
If an odd divider looks only at rising or falling edges, the output
will indeed have a non-50% duty cycle.

> Report it from a dedicated LVDS divider clock type and let the core walk up
> to the selected parent through CLK_DUTY_CYCLE_PARENT. The reported values
> do not change, the mux keeps selecting the path, and its duty cycle
> constants go away.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> @@ -890,6 +863,94 @@ rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
>         return &clk_hw_data->fix.hw;
>  }
>
> +static int rzv2h_cpg_plldsi_div_lvds_get_duty_cycle(struct clk_hw *hw,
> +                                                   struct clk_duty *duty)
> +{
> +       struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
> +
> +       /*
> +        * An odd divider cannot generate a 50% duty cycle: the output stays
> +        * high for (div + 1) / 2 input clock cycles out of div, e.g. a divider
> +        * of 7 gives a duty cycle of 4/7.
> +        */
> +       duty->num = DIV_ROUND_UP(fix->div, 2);
> +       duty->den = fix->div;
> +
> +       return 0;
> +}
> +
> +static int rzv2h_cpg_plldsi_div_lvds_determine_rate(struct clk_hw *hw,
> +                                                   struct clk_rate_request *req)
> +{
> +       return clk_fixed_factor_ops.determine_rate(hw, req);
> +}
> +
> +static int rzv2h_cpg_plldsi_div_lvds_set_rate(struct clk_hw *hw,
> +                                             unsigned long rate,
> +                                             unsigned long parent_rate)
> +{
> +       return clk_fixed_factor_ops.set_rate(hw, rate, parent_rate);
> +}
> +
> +static unsigned long rzv2h_cpg_plldsi_div_lvds_recalc_rate(struct clk_hw *hw,
> +                                                          unsigned long parent_rate)
> +{
> +       return clk_fixed_factor_ops.recalc_rate(hw, parent_rate);
> +}
> +
> +static unsigned long
> +rzv2h_cpg_plldsi_div_lvds_recalc_accuracy(struct clk_hw *hw,
> +                                         unsigned long parent_accuracy)
> +{
> +       return clk_fixed_factor_ops.recalc_accuracy(hw, parent_accuracy);
> +}
> +
> +static const struct clk_ops rzv2h_cpg_plldsi_div_lvds_ops = {
> +       .determine_rate = rzv2h_cpg_plldsi_div_lvds_determine_rate,
> +       .set_rate = rzv2h_cpg_plldsi_div_lvds_set_rate,
> +       .recalc_rate = rzv2h_cpg_plldsi_div_lvds_recalc_rate,
> +       .recalc_accuracy = rzv2h_cpg_plldsi_div_lvds_recalc_accuracy,
> +       .get_duty_cycle = rzv2h_cpg_plldsi_div_lvds_get_duty_cycle,
> +};
> +
> +static struct clk_hw * __init
> +rzv2h_cpg_plldsi_div_lvds_clk_register(const struct cpg_core_clk *core,
> +                                      struct rzv2h_cpg_priv *priv)
> +{
> +       struct clk_init_data init = { };
> +       struct clk_fixed_factor *fix;
> +       const struct clk_hw *parent;
> +       const char *parent_name;
> +       int ret;
> +
> +       WARN_DEBUG(core->parent >= priv->num_core_clks);
> +       parent = priv->clks[core->parent];
> +       if (IS_ERR(parent))
> +               return ERR_CAST(parent);
> +
> +       parent_name = clk_hw_get_name(parent);
> +
> +       fix = devm_kzalloc(priv->dev, sizeof(*fix), GFP_KERNEL);
> +       if (!fix)
> +               return ERR_PTR(-ENOMEM);
> +
> +       init.name = core->name;
> +       init.ops = &rzv2h_cpg_plldsi_div_lvds_ops;
> +       init.flags = CLK_SET_RATE_PARENT;
> +       init.parent_names = &parent_name;
> +       init.num_parents = 1;
> +
> +       fix->hw.init = &init;
> +       fix->mult = core->mult;
> +       fix->div = core->div;
> +
> +       ret = devm_clk_hw_register(priv->dev, &fix->hw);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return &fix->hw;
> +}
> +
>  static struct clk_hw
>  *rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
>                                void *data)

Since there are now two copies of this code (see rzg3l_cpg_lvds_div_*),
perhaps the time is ripe to add odd duty cycle support to
clk_fixed_factor?  As duty->num can be rounded up or down, I am
envisioning two new mutually-exclusive fixflags parameters, e.g.:

    CLK_FIXED_FACTOR_ODD_DUTY_DOWN
    CLK_FIXED_FACTOR_ODD_DUTY_UP

What do you think?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
