Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B627468C2C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 12:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710797; cv=none; b=jlpPOLTrvfP4/whcScNzojB7jJBsJoLv1/4fhcdjEw6ATVPXYedeyyLyY/PRiQPXCJv/pawI59vFefno5XEHyAPvazKe5YSglQTuVpZsFnqzvupQuzdFTic6RHkIafd9HumYIpUP7UF8nldRP3pB+FaPPeC7RF0XfmrWALvRkIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710797; c=relaxed/simple;
	bh=lpDKeu4gnJGfhZbEt2GaXRuJjB5sw59Lf/Fn95Ptb3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhvUcXHJOjWnPKV6j+2yu8il0HR7bqJFslRoWSW/lgDPoyTHy4DUjZJyXOJLpj9lSBkxMX20GLHXBxcnDOmnhzCnPPi4B8814Nf3NIHtaLLHhWTaY1H83WwJXMZSSSbH+1vt6nxNTKtFSn9Z4MEhvalMLh+XtvFTsFQsgjbKl9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so1362527a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710793; x=1787315593;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GbV4OWs8XFK7SLn1+udzJUHUarHLrWsKwUB5GORF0Vg=;
        b=SohSDfvWPrx7wTAmfRsyD/zdqVyi7WqYOujmmxvt6FUrgJwf79OvMHXbdxhaBval9T
         JAb7+DDX9n2sF5C73JS3Wx4MpwHj101IGYlbthvMZHdpv9aKyLvHcEzxEFh7vSsYw7vE
         UaBCAP4no/07P+FykayqPtnmY8qmXOMBLplOdT+kcNsoqVgrYgGaZ9UMEPn6ZiqBw930
         XKAO4kyGdZ0rlH/Fdg0IBcfGNQioOX/6L1O3gW/owsjMc3tJPf+G2KXQyrMk/9sblSeG
         707YSelPvUOdPygudL+JQ2BfSSSyqVsDE0m28owGpDFhXjdGDO4pmirk8WFFQsWpTuuC
         uxBA==
X-Forwarded-Encrypted: i=1; AHgh+RovD/1ZNOWPrxy3mnQjlF6lz7GsC4h8cmAZo+dZKKjzAWR8mKt6XXMlEUXVAOQht1TZUCZ32kpbyR5mXrJ0EGUNFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCZ2gvw1tV1o8ezWxo/mKLaO6L3Jnpin43DtHkng64wdTer14f
	aAgxi/XpiYeD2wr5LiefARb1c7CD1Ao4ky9S0y4iwnd1At2NiANRLuep1BD70TtFzoM=
X-Gm-Gg: AR+sD13jkn1PwGDchE4BsYvJ49p2+COPdVyd0b5aMbcN808OYFCfW9Bfer0rVgQQO/H
	DYmuq7fkKPq4qD22h4Pa7boJ38YdI3WLQJCWW0whKhoxXmxEIEkWLNYyIeFfQPzT5FHtQ8W1OfQ
	+l0zFqxS/cYLXtD3yxY7uKjz2pvpkrFRHkgJ2rBGhQYxPt6B0y4LhFs0PXi+AK5N5ZwCga0ShSE
	drXoKG3fEvZi27x7itu5vuiDTWJ/4zcD31UtAQgtDvnzbCflZlCsoGfYSu5lLYOZsj4ITAurPWA
	vfUPcf7q+eFj3nUfEyh27MjZKRiq2cO5Snaag4eBL20/tjfqUJEGZ2K3304kTyyi2GDPNoQoI0G
	2M679cejWadFBh6s7ZV0sIi6dqFKBG3pobkFJyB9zH9rsMmQb9hhelTgpfQpd2g6rUeJ0tOiDGr
	7mKBk0tKbUEL+mfwBgRijnGP8x8aA5h6V1WNqmm3+YzlbMq4AR0a9Z9A76cj1cdmg2bN1nHu7A6
	YSzUrTsiHmrESEBVn9baM87jQ==
X-Received: by 2002:a05:6402:43c6:b0:697:de29:c802 with SMTP id 4fb4d7f45d1cf-6a38a98e32cmr2621975a12.18.1786710792844;
        Fri, 14 Aug 2026 05:33:12 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38d79e42csm640785a12.30.2026.08.14.05.33.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:33:12 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso1398505a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:33:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqCLlgUUuzjRdXHpZ1/G+V9VA0PsvgRyE/lockyRTOgxqiK5w5IsOmLxRqXz4jty9yv10O8JNV8KM6eE3nzfXEivg==@vger.kernel.org
X-Received: by 2002:a05:6402:5484:b0:69a:a4cb:2882 with SMTP id
 4fb4d7f45d1cf-6a38a8ff103mr2505014a12.9.1786710789414; Fri, 14 Aug 2026
 05:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:32:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNZzMYgCcMCnL0WFRu6Y2-64msBsaMc+EUmTK93Z7F2A@mail.gmail.com>
X-Gm-Features: AUfX_mysmNYT0DocB6TyyIzLkjU41VqoAr8h9dGeeAp5etkkWrmICu7IwdklYpo
Message-ID: <CAMuHMdXNZzMYgCcMCnL0WFRu6Y2-64msBsaMc+EUmTK93Z7F2A@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] clk: renesas: rzg2l: Rename cpg_core_clk::flag to core_flags
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Aug 2026 at 20:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Rename the 'flag' member of struct cpg_core_clk to 'core_flags' for
> clarity and to better distinguish it from mux_flags. Update all
> users and DEF_* macros accordingly. No functional change.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
