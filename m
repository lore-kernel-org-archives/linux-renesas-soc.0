Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CA845FFDF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710859; cv=none; b=Q+s9216SV7GlOSrHei6bwEQFwcDJig8YTOEAx3vL9JBUeo+bzmRehebg9NWZkNSNpTUmkwBObZm/cxihO3U5BOH6m/WQs9pPlHaPbvjEKcifEKQjsR1T5dbassxF0wzgqFfqypWHWSuuPShx7Co3HqgwHNRZu+05ntQWZlwymAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710859; c=relaxed/simple;
	bh=8fm1wQqNdK8Pqh1xZ0Yz/MAvNolCHkHoVBPeugbRbLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZdWf9FYodmR85EHeGgHNrgwCuQfzFVinBehnHpsl7FBttT7PHpD7Lq3khc0U1mfGb9pHJGG3mVK/iz7JbSdSsSRknUA3wKD4xs5FrBjowUri4HuNV/Z1bhAoiS8QS48WG06IfW68GGhu2o/ixA1GRpt0232n5WtggCgpRjHXPFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15d111ca99so110187166b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710856; x=1787315656;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5jTjhdgDgezOGQJNdD5S+MhkhGYZML4+d+xIz3mpVms=;
        b=opuq8yUowZYdeX/L3ndL4zB6QMybl9BLHJrgkZ0YPDd9GP/Md2GeYp0Dv9SPnfz2hV
         5NJpPfOJfDKNW425Q6l+SeEbBBzyEpt+zABLwoq51DRBPAE2/ntTz8LVseXp1kilCPTc
         F1I/m0o9sh9LMUPl7qh48Z2AI9FLKD9Fx1r2MqvJCizlJl+B8I+h4wxj9wejMgE0a8Bc
         +q25CZtpIk7n8vQ2lcM1Ahg942aLSTabSgtla6hkzYhg9nkyPSoccRhdwmD/ftFIvhOc
         DHh9TKBAb4QsQBl3BPdED3xGDlXVn3189aFagXq40ajfuuOXes7Km5VaVMnwcd5md7jt
         w42w==
X-Forwarded-Encrypted: i=1; AHgh+RojJ9sMAzJk5yvSZmfNbl6peqqbU2jCmxQayXnHjtP1rIdAkq1hVX+GPc0xnx5r42DqqzzzVrkEK+vcNS5BfnC2Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuoTdGaAO5C7HtJuvOWiBqUIs+quaLO4dxy6HHzCoSKdaDIbW2
	/ObqwT+tUY/qF8WyhUedep4WXclVQYbJrYSEqrW1++b5ZS8iR1JNnRCy0VNhMg5kSMs=
X-Gm-Gg: AR+sD13pu9XwFXnys+u/AgshYHlEQN6jVfqyyYhn1luXo38WZBJNiKCJApZS0N7ilAQ
	ipYERHnZwTFyCrziV4ExyDMhfG0R3VpySGLmqgk3z4KT8G7klhS78k6ZcdlZGLotUZjCtaVn8tX
	fUb+j0sbE329DyqLfqYarUHNlBWDi0vD8TlKrSoLpcnEFFb8hAp8N+AJXPdhEm1HNBVHpjVM1to
	zKi1MqkHJVdiVJ68FH1MJXC2z69bhD48aUQ8bBuRoSKXv4D8DsX0D2mj96Fzmk3V0NmsAkoUjsy
	xGfQYlScjhZeJbHbEAlYCEg20fP7ckzck2fECId6lOxNnC6LS/FJd4/MHaAjL8OUi7hJKoBg6TP
	xQrP76MhUearaVVUwxq5CtNRaB2+MeCWU44F+Zi33HClWAMgbRYTb+KieKXEshyvZxIseiF6SKp
	bSB/AkUONT9VaDHp34ED9I7kCWZJdl6j+ezAlJozBcqULN3YxXJajy5UxQ2pfLmQgaDie4qBujA
	xVoeaApCASapaj2w6JXsPNJmg==
X-Received: by 2002:a17:907:3f03:b0:c20:f871:1041 with SMTP id a640c23a62f3a-c2129c1bec8mr283578166b.7.1786710856321;
        Fri, 14 Aug 2026 05:34:16 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234bff06sm100600866b.16.2026.08.14.05.34.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:34:15 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so1436765a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:34:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqulOuyqEi62SRB4stpJ/0/pSQjQG/pGTg6R9Rm71wCMKKgIWyFpxUiiJXIC6v0uDM3xADVEPcCh8mnxa4JDOCtXw==@vger.kernel.org
X-Received: by 2002:a05:6402:c286:b0:698:6084:db7f with SMTP id
 4fb4d7f45d1cf-6a38a96199bmr1711549a12.10.1786710855432; Fri, 14 Aug 2026
 05:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:34:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWu5AQM_x+0JviyhHpA_8GrvOs4cjtMtavUz+JVuYvE-g@mail.gmail.com>
X-Gm-Features: AUfX_mz94vfWwhgBn2FgWCEksiaALpbjVla2lJItINWmnEhbnvNVKgSFjzFn1qk
Message-ID: <CAMuHMdWu5AQM_x+0JviyhHpA_8GrvOs4cjtMtavUz+JVuYvE-g@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] clk: renesas: rzg2l: Add support for divider flags
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 11 Aug 2026 at 20:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for passing divider flags apart from clock flags from soc
> specific clock drivers.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Collected tag.
>  * Fixed a check patch warning by using (_div_flags) in DEF_DIV_FLAGS
>    macro.

Thanks for the update!

> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -112,6 +112,7 @@ struct cpg_core_clk {
>         notifier_fn_t notifier;
>         u32 core_flags;
>         u32 mux_flags;
> +       u32 div_flags;
>         int num_parents;
>  };
>
> @@ -168,11 +169,18 @@ enum clk_types {
>  #define DEF_DIV(_name, _id, _parent, _conf, _dtable) \
>         DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
>                  .parent = _parent, .dtable = _dtable, \
> -                .core_flags = CLK_DIVIDER_HIWORD_MASK)
> +                .core_flags = 0, \
> +                .div_flags = CLK_DIVIDER_HIWORD_MASK)

This can be simplified to:

    DEF_DIV_FLAGS(_name, _id, _parent, _conf, _dtable, 0, 0)

I will do that while queuing in renesas-clk for v7.4.

>  #define DEF_DIV_RO(_name, _id, _parent, _conf, _dtable) \
>         DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
>                  .parent = _parent, .dtable = _dtable, \
> -                .core_flags = CLK_DIVIDER_READ_ONLY)
> +                .core_flags = 0, \
> +                .div_flags = CLK_DIVIDER_READ_ONLY)
> +#define DEF_DIV_FLAGS(_name, _id, _parent, _conf, _dtable, _flags, _div_flags) \
> +       DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
> +                .parent = _parent, .dtable = _dtable, \
> +                .core_flags = _flags, \
> +                .div_flags = CLK_DIVIDER_HIWORD_MASK | (_div_flags))
>  #define DEF_G3S_DIV(_name, _id, _parent, _conf, _sconf, _dtable, _invalid_rate, \
>                     _max_rate, _clk_flags, _notif) \
>         DEF_TYPE(_name, _id, CLK_TYPE_G3S_DIV, .conf = _conf, .sconf = _sconf, \

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
