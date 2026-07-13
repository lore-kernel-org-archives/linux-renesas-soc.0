Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF4D305679
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958052; cv=none; b=lWbX3U2+baNLlo369+rjC5hSNA8qOm6WUgFbQ0RkT+kWiwUmQXu5hE+Lqw5c8rT9H2ePRp2YchYPRaxXsIY2N7LDD5B+sRuBSahhAN+5NUT5C+p+IukMoUrXw9ABmH4XsQFts4bVknibRvV9cJIvi3C2It+DptQhEZSyao9FFKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958052; c=relaxed/simple;
	bh=m2bCXYj8AWrMF/1laWCVCT5bKqmKjFJ215Tf8K6H5u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rIbXYOuHdohzmv2mEPT/eKi9a6gxN9oXyugDOOYeSPBu8lMjtVMQJfx7wAZpVjAj8DJiTEsXutC8CZhpfq+0A1243PyA/0sTF2A9VjqKkb9cYZZCviUOpFwJUbOcZcA2ei0O07dGHAcbvN6vder8nf32rj+FI0w9YKmvb10NFwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9674d727c0aso10489241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 08:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958049; x=1784562849;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qzEerLqOaw9Z3GkpXKkc+Ohu/zTEKX/5jHpFuADj7Ho=;
        b=HBk5IuR3UU7c27m24xxRrG11JldV/YZVwGyyTqIKvtGo0rt+Sve7ALmtOlNpD21qjT
         MmOT2l9E3I7u8Tn5CmEsjI0PzBcTWPsR8gUffi+6NxnXp6vASeSaQCjtM/r7TbrEBzPt
         0mMD9/1klF96tjsaYwTgC5PsBJdm97nA9FOuESx+ACdc+aQizlc3+KJ5UzQAPvsKQlhy
         xLjWXJxnQt9kOi2q8oyNOxs/mko+rfetr/Un9YmXUEmmskpKmYxwiZnneCnrxgVAleph
         0u3c2IiaBwy+zQxdyw5qw+g/Yj/MA+2w8UBGNRkE+80iQDsvTGZa345nmu+9eReG1vM4
         Veag==
X-Forwarded-Encrypted: i=1; AHgh+Rr8x1xK57AwmK0rBP8QYkmk61RetP/Bji5UF8MG726RU52CU/goR1VoRexSda05v6BicznskrtSZ+LJ8Pfr7NMHMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvjBBHl0I2a86XCt/5Ehue68xWTXl6jULzRqajjpYhgR8PbpPm
	WNLxnj3MVmryVbCl2/3GnGLy+rZu9qzwecm1LwYi1Gv2XxTtZs89LMp8Ij1LdqNPJ0c=
X-Gm-Gg: AfdE7cmHod8k0LEAFcJ631KXd2rM2Fj2iEZ6gcTT4gKFMF4EEEdNDk0wH+w7lVXDevO
	PiMi3vMD3FJeEzwthCnzPXjlJ9NJQJo2Jb2/4A2H1AhIzDgGm5n4NphPqqktIsggpDIktz96F/j
	k5X7s7pbnadvPVC3ONyMuZ/5O9OiY5Mwutv0dFSulzqrmGqnVb5bgysd+pOcRIkFg9tbqEP76wJ
	dPiXWqorMbMZTVTP2vqW5YEX9EEuu7qupGwaWpWruvNlGhNzdiU+1uOtshZzYeJ7pQ+99vW6K04
	t2/Ey+kDqVMvBw8vTWzO02CSS57/9AxzrvL4wvLNICqFBEUB7D9guxgK43sVwxETTgwnNPTjdxF
	iAv1G5E35QpaLz/Y7FL5d8Bxwdp+mlyLm6CGW442f+PLAkIFLe8o0zCWzan2u+dts4rdLHYCFrK
	+f4yL5Mi7NEtLTo2mnaT5A30qGGz5XRfOuAUdqFBMi31IMpicVlVpssOo4F6Oo
X-Received: by 2002:a05:6102:f12:b0:740:2664:800b with SMTP id ada2fe7eead31-745368d809fmr5160737137.10.1783958049352;
        Mon, 13 Jul 2026 08:54:09 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6e38e25sm8995926137.11.2026.07.13.08.54.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 08:54:09 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-736eec08c43so23464137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 08:54:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RogqFopioz7xY6gja6C9r6S0VmWUgH+VlaCs9AS5+eGTAGA2BPzgoKVvDSTvS3iSem+eINBUK6nCf49txD+Tw67YA==@vger.kernel.org
X-Received: by 2002:a05:6102:610f:20b0:738:8b5c:a41a with SMTP id
 ada2fe7eead31-7450cb34f7dmr6282037137.18.1783958048566; Mon, 13 Jul 2026
 08:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 17:53:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdViSFTZZMe0SsC_aYmyZqTHCFNN0NxPVoNx5OBfwi4MLw@mail.gmail.com>
X-Gm-Features: AUfX_mxFOjb_ZRaEJnQ5ujkHKlta3EMpWEatCZQZcSke1bOSWzSUjDpkmkvLviw
Message-ID: <CAMuHMdViSFTZZMe0SsC_aYmyZqTHCFNN0NxPVoNx5OBfwi4MLw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/9] clk: renesas: r9a09g077: Add SYSC regmap support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add System Controller (SYSC) regmap support for the RZ/T2H SoC.
>
> The RZ/T2H SoC features two System Controller (SYSC) blocks that handle
> low-power management and access control. These blocks are defined as child
> nodes within the Clock Pulse Generator (CPG) address space in the device
> tree. Implement support for creating regmaps for these SYSC blocks.
>
> Register the regmap using of_syscon_register_regmap() against the CPG
> device node so that consumers can access SYSC registers via the existing
> syscon phandle.
>
> Add a sysc_init() callback to the CPG/MSSR core to allow SoC-specific
> initialization of the SYSC regmap.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Made use of for_each_child_of_node_scoped
> - Moved sysc_init() to the end of the probe function

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> +static bool rzt2h_writeable_readable_sysc0(struct device *dev, unsigned int reg)
> +{
> +       switch (reg) {
> +       case 0x0000 ... 0x0008:
> +       case 0x1000 ... 0x1164:
> +       case 0x2000 ... 0x2024:
> +       case 0x2030 ... 0x2054:
> +       case 0x2060:
> +       case 0x3000 ... 0x300C:
> +       case 0x3100 ... 0x310C:
> +       case 0x4100:
> +       case 0x4200:
> +               return true;
> +
> +       default:
> +               return false;
> +       }
> +}
> +
> +static bool rzt2h_writeable_readable_sysc1(struct device *dev, unsigned int reg)
> +{
> +       switch (reg) {
> +       case 0x000C:
> +       case 0x0034 ... 0x0038:
> +       case 0x0048 ... 0x007C:
> +       case 0x0100 ... 0x017C:
> +       case 0x0200 ... 0x027C:
> +       case 0x0308 ... 0x030C:
> +       case 0x0320 ... 0x037C:
> +       case 0x0480 ... 0x0484:
> +       case 0x0580 ... 0x0584:
> +       case 0x0680 ... 0x0684:
> +       case 0x0780 ... 0x0784:
> +       case 0x0880:
> +       case 0x0980 ... 0x098C:
> +       case 0x1100 ... 0x1118:
> +       case 0x1200 ... 0x1204:
> +       case 0x1400 ... 0x1484:
> +       case 0x1500 ... 0x1584:
> +       case 0x1600 ... 0x1680:
> +       case 0x1700 ... 0x1780:
> +       case 0x1800 ... 0x1884:
> +       case 0x1900 ... 0x1984:
> +       case 0x1A00 ... 0x1A84:
> +       case 0x1B00 ... 0x1B8C:
> +       case 0x1C00 ... 0x1C8C:
> +       case 0x1D00 ... 0x1D8C:
> +       case 0x3000:
> +       case 0x3010:
> +       case 0x3020:
> +       case 0x3030:
> +       case 0x4000:
> +       case 0x5008 ... 0x500C:
> +       case 0x5020 ... 0x503C:
> +       case 0x5100 ... 0x5114:
> +       case 0x6000:
> +               return true;
> +
> +       default:
> +               return false;
> +       }
> +}

This exposes a lot of dangerous registers.  Aren't they also exported
to userspace through drivers/base/regmap/regmap-debugfs.c?

> --- a/drivers/clk/renesas/renesas-cpg-mssr.h
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.h
> @@ -178,6 +178,7 @@ struct cpg_mssr_info {
>
>         /* Callbacks */
>         int (*init)(struct device *dev);
> +       int (*sysc_init)(struct device *dev);

I would rather call it "late_init" or "post_init", as it might become
useful for other purposes, too.

>         struct clk *(*cpg_clk_register)(struct device *dev,
>                                         const struct cpg_core_clk *core,
>                                         const struct cpg_mssr_info *info,
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
