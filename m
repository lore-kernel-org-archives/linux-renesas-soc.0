Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422274;
	b=icFbNg0cAIkw8kXzco6tci7bBEPEIiPlOOpM6t9PZSo/yWapiN2qDRchLl7p8AC9yUrH
	 FOu1lLIuWHsqBxVFlSB34Gkcn6NthKyNLTBpDjLLoyQRNdKs9cimu7ELf+ctXkcKjQGvZ
	 mGHl0MYw6N3NOaofv7VtaSMTk+QLQe3ccFuMNwPqLOjfJ706VkWuCHm8Me0xq2PYTFjef
	 F8IMQWlIjYG38ORNJ958cJICF9p6NyiGDIkKTpuR5TUuzSjPeo/SUdiqdMx5s9WkhaThK
	 Ue2Epw5Ibb6cWbGLBMPSSUtbfqyFgLKZRLX8D77BUzzhAI7F770K1tHr1IyvGr/wiOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422274;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Yo6/2OGJfxhXILo4QGIB9gHfvFskGfKjbh+hNyiFvf8=;
	b=wtGV3VrAYia9nrNO11QyVDd/8JDmi0P7p0b8y9QkIuYygsoP616ebidwRw6UOg62NdlH
	 Z3xYgAzq9HBLegwRm/Q2A3KIMTjOmgbCFCtje4i24PVZ4YmrvilzLdekciyZbI1TzSzDH
	 tAT9j9m1KvAGoXPmOH5iJwpqF2pAC+FnvNbywea7cBBPpmT+ekirOM1MpJdfkerp8H5pN
	 KV9We7BjzMr98wy2msbyUlJjfbjsYdvMk5OdnRFRsjLLyX28n/DAZju5ZNvPIB5/HKR5D
	 EA2GxVtdAdL/HUkzmqEuySMthFWY7tiZGmRGTdVqkDXPfFvvle3PGmOctbm9ZZbZUTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4B5607F48F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 15:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D4B5607F48F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f259cdc86so225921785a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 08:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422273; x=1793027073;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yo6/2OGJfxhXILo4QGIB9gHfvFskGfKjbh+hNyiFvf8=;
        b=fSBVRpOv3EM9TqhntHgtxb60qig0rHVnzGm/I0qoxzvYm8dHhOL+ylw1pZQdXYcAaa
         8OMtwhtO/qAErGP6OeVFuDrCPGbr+ITVlfuZ7xVaXA29m4DIe/LHJcQMfLO0I7DWm23c
         0nER1aTGUQKf6bwQNWaS10wQwx7r2q2APp4IqgnsMylrEs4tHeX0LB7urFtihEXwOsNn
         wZi+nVlVL7bsjkosyIBG+nuRXZoiKfB0hiJx0TyEkjUZonB2RP1jdJk/YqyYnkoGdUpw
         tF6oM5gjNku+b9X1PLyF134zFoLzgQwm+1u4axLVD19hRJ+sWICiJ8PwB4j5v0Q/xKs0
         vkNg==
X-Forwarded-Encrypted: i=1; AKwUvByE28KhYhmGRZu5PZ7KICKBSm96b9Jf3P9wiyFBnv03brhmlitvqmcwTafhdZDhqm87+S7G/jE3HPuMti7WvQetLA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLhqbliv50FzfayZiFBQe7hcjslKsUV9HgKcbJ0u0hH69MMe/ON
	BAkBNlJnCZVHSQUKuuxVABInxyjPPjUbGYMC2Pej1vEKcvGVNjcpk/munsETWzlMCbY=
X-Gm-Gg: AYBFou1LO2SfFOR9Q6hDCD6AFMjX3Dgr8J9KJFj0Ks7m+XVYkgeR+4nVNUiNdlj+MA6
	hob+mRfvTqakZKMBxMQiSRo/3CmRtXvwLpInLZdobcmlhaCKLAQTulZqbPRSdkyC/rOStFYptMr
	kjEg7UGwyIxK1DdJi0X+kJ9RwblxxkRWtiMYUfBnT6hOS2ljvKY1BchHRNyjPFGbezdH5B4gh+C
	1thf0vXX1zZDiPmGGZztL2hetadJQUknKnX1rvNDI58vJ2V37eFMgZrV03a+faWf16/wlxCxFZt
	+LANis5mUam1GPuNceELDhNrXnojpNmOUxUwEjwKvuv4MDM6gShQ64XBXD0i8Ntot8UkEx0o767
	cCR+gIqumPEd+G/MTgIBSg97rI4sthN8fwuEgbESeqa9XKMaFpxzYpfcAoBp0czJvJp5/9e+DVY
	5fX3hIcXzLPPHgYOxUt6f7pA1UsqVJdZk0TZ/t4LgYENMS2sh+ZsoEVQlpi5SdLS7LUxJ+67n1p
	1zFWX+UFc1h4wbHZjhy/NJvPUFh3bqD2hv9Q5hA
X-Received: by 2002:a05:620a:370a:b0:93f:25c7:a4e1 with SMTP id af79cd13be357-93f29c99e55mr1330454685a.26.1792422272989;
        Mon, 19 Oct 2026 08:04:32 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a19ce5asm998608485a.32.2026.10.19.08.04.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 08:04:32 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-535179e995bso24062761cf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 08:04:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy84SKB8Mp1AYRYOs8LWPQh72/GYivg4uoqAy2hrF6AARKtxWQcOeX3AOfUYa4tJRRRsv5gClpFMvMZsvqDV5J6QQ==@vger.kernel.org
X-Received: by 2002:a05:6102:f86:b0:7cb:288a:b66d with SMTP id
 ada2fe7eead31-7cc369ac7b5mr1684195137.20.1792421799154; Mon, 19 Oct 2026
 07:56:39 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
 <20261019144256.GC763679@killaraus.ideasonboard.com>
In-Reply-To: <20261019144256.GC763679@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 16:56:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkAvkxHkzRVviF_NkZHP7UeCBjebxciE6jFN_8ViM=aQ@mail.gmail.com>
X-Gm-Features: AclHuK9UZUEUyPMO3TO_vFhUiV57c9SStFUdXlV8TRdwkOQjKO9ySUhEkuMfo5c
Message-ID: <CAMuHMdWkAvkxHkzRVviF_NkZHP7UeCBjebxciE6jFN_8ViM=aQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] clk: renesas: r8a78000: Add clk_hw to clk_map
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 19 Oct 2026 at 16:42, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Oct 16, 2026 at 05:55:40PM +0200, Geert Uytterhoeven wrote:
> > Prepare for mapping to other than fixed-rate clocks by adding a clk_hw
> > pointer to the clk_map structure, and populating it up-front.
> >
> > Move r8a78000_cpg_priv.fixed_hws into fill_clk_map(), as it is no longer
> > needed afterwards, and drop NUM_FIXED_CLKS.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> > @@ -16,19 +16,24 @@
> >
> >  #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
> >
> > +struct clk_map_in {
>
> The "_in" suffix isn't very explicit.

I can add a comment...

> > +     int dt_id;              /* DT binding clock ID or -1 sentinel */
> > +     u32 fw_id;              /* FIXED_CLK() ID */
> > +};
> > +
> >  struct clk_map {
> >       int dt_id;              /* DT binding clock ID or -1 sentinel */
> >       u32 fw_id;              /* FIXED_CLK() ID */

BTW, do you think it would be worthwhile to reuse clk_map_in here?

> > +     struct clk_hw *hw;
> >  };

> > @@ -92,35 +94,69 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
> >       return hw;
> >  }
> >
> > -static int register_fixed_clks(struct r8a78000_cpg_priv *priv)
> > +static struct clk_hw **register_fixed_clks(struct device *dev)
> >  {
> > -     struct device *dev = priv->dev;
> > +     unsigned int n = ARRAY_SIZE(fixed_clk_rates);
> > +     struct clk_hw **hws, *hw;
> >       unsigned long rate;
> > -     struct clk_hw *hw;
> >       const char *name;
> >
> > -     for (unsigned int i = 0; i < ARRAY_SIZE(fixed_clk_rates); i++) {
> > +     hws = devm_kcalloc(dev, n, sizeof(*hws), GFP_KERNEL);
> > +     if (!hws)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     for (unsigned int i = 0; i < n; i++) {
> >               rate = fixed_clk_rates[i];
> >               name = devm_kasprintf(dev, GFP_KERNEL, "cpg-%lu", rate);
> >               if (!name)
> > -                     return -ENOMEM;
> > +                     return ERR_PTR(-ENOMEM);
> >
> >               hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
> >               if (IS_ERR(hw))
> > -                     return PTR_ERR(hw);
> > +                     return ERR_CAST(hw);
> >
> > -             priv->fixed_hws[i] = hw;
> > +             hws[i] = hw;
> >       }
> >
> > -     return 0;
> > +     return hws;
> > +}
> > +
> > +static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
> > +                                       const struct clk_map_in *map_in)
> > +{
> > +     struct device *dev = priv->dev;
> > +     struct clk_hw **fixed_hws;
> > +     struct clk_map *map;
> > +     unsigned int i;
> > +
> > +     fixed_hws = register_fixed_clks(dev);
> > +     if (IS_ERR(fixed_hws))
> > +             return ERR_CAST(fixed_hws);
> > +
> > +     for (i = 0; map_in[i].dt_id >= 0; i++) { }
>
> This is avoidable by passing { map, ARRAY_SIZE(map) } as match data
> instead of just the map.

True, and I did consider this.
The same mechanism is used in the MDLC driver, where using ARRAY_SIZE()
would quickly became a bigger burden due to the presence of many
more maps.  So for consistency, I kept it the same in both drivers.
An initialization macro might make it more manageable, though.

> > +
> > +     map = devm_kcalloc(dev, i + 1, sizeof(*map), GFP_KERNEL);
> > +     if (!map)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     for (i = 0; ; i++) {
> > +             map[i].dt_id = map_in[i].dt_id;
> > +             if (map[i].dt_id < 0)
> > +                     break;
> > +
> > +             map[i].fw_id = map_in[i].fw_id;
> > +             map[i].hw = fixed_hws[map[i].fw_id];
> > +     }
> > +
> > +     devm_kfree(dev, fixed_hws);
>
> Why not plain kcalloc/kfree ?

To avoid having to free it manually at multiple (three) locations,
both in the error paths and the success path?

>
> > +     return map;
> >  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
