Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA8F4A840F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 13:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440865; cv=none; b=gt6OLd0Qq8jrzXMEMNF4vklcE0SedA8I1jWpEUJ8q0im3DwHaPBkXc61LuesG/0fQDf9JCTUCwQJrR5BWz3wVw/B/V4PAnzK2rTM1ehUunU/bLg3I/KEZNMEM70bNlRakdqGRPadvQ3yc4OpsV5MEslp68arW4y5ojSaW6Aebb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440865; c=relaxed/simple;
	bh=/hmoURmIl/bUQbh8UOa2R0+uRCpVJKU0vq8AlikjsbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fN9Gwsuc1Ad7rMKVfkiYM1dzKL2CISqgjQgQWlL2QtUailtyIG5lEhOl/Q6OiAinVwEAvp3Xh6zyydx0kPv80/aoCVN4e4L9E9QwOvgf3FfTGcjVSNqLMHrLhslDqgmmb6A/4QAeJUoBk8cHbYhaF3swQisfiTttczGh8FcNZO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so1437780241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 06:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440849; x=1789045649;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=neL+IFdaoh4oslsqt6WgBGKpzShvTB78/gz0eSfjqO0=;
        b=jVpDUwFu2k6XbNhLwv3H8ffkC+2x6dAeXZ198H6tEvX9Iau/ODyK9LOKjSa7hgQTdT
         KhzZNSAynmrMpVDy6P9MJ6mNHU10bCwgZclyMmmPAjIBoqIAPZ8KXTt3SzZuEdDCJIju
         qEnli0YYbb7EhmyYJpZFmnSCJpvFtBQkctn3Zf5mgQo8o6+J80VEY1BpyV0HOp6NE0nE
         3ZzcqaZSGlXxIw39O8bPr8RYeZXcH8mtSnu7NdcKce2d6m3RM+WjA8EIgX01i7AIb4/M
         60NXJ6sdMEljIp+PDIP/C28YS1dENuydCliE/h58jo1lDGH0K/tsUzATu7LbIyt0owQ8
         snxg==
X-Forwarded-Encrypted: i=1; AKwUvBztpKRCm+PinWEJ0jRU3YxLuzwckx8xT4AtkSA5apkL/aIYTEN49FliiZNk06QvaqpjFX57gBTFLiAM+IuBsv5trw==@vger.kernel.org
X-Gm-Message-State: AFuF++mUOo088dSrHjPjNqftq1sqFRwFvLGyeWnDgvqXA7v2pTUeXPT8
	AIYFDowQL63g3Y7+v38hT0qwPcHud9pgBR4TfTYbYJRjMwu6g4zs5gHIGVxmtj5RA/I=
X-Gm-Gg: AYBFou2i69yO41526doGkultkrU4+Ir0/yTzZgergJfjGJzdNpM/cYeJmLaOlk6nnJB
	IvTe8pV/JHXGA7IlrGjaaNcInsD+mf5fVxdmqxdOvBk1cPzvsbnnWshUZX7oDDYtKZK+S7b8c7S
	HQ7RT1ox0P/CKCeEn2LvRHTa6hjBz58d+KuzF+dXsfnXWPaP0X8NbbsxpKgkOo9dkjoKDZCy5Po
	1k+dvjrolgYD+woIbM1vb/jCjTiQBCC9kWTXGe/0gA0Qh9WFUn9GvuBYsmU+LfEBof61xpPYKEK
	dgeXLmRjHE9KAeVZ2QI8JkzQ0eUSNugjji0WtksVSDlkOeczjNiHU9ToZz73kuJ3S6NKfcFwRwg
	GtaBmiis0t4NUj/DP/aVpqRtPIVHENM9UIaSyPtFIqQ2RrNS4LFuAHSwmYlKw5MqWYpg/6kQGOU
	MTQFK5Er0ySRNJiI72jxtpFRjJozAYLQmV5UrdnDiuN7uOvmiO798FUMN1iNUcXGgVpkkk3E0gU
	zBxcL2ixPe/026Twicav8b1eg==
X-Received: by 2002:a05:6102:2d0e:b0:784:b9ec:913d with SMTP id ada2fe7eead31-78a1f364141mr5002243137.8.1788440849405;
        Thu, 03 Sep 2026 06:07:29 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1b89ee0asm4243961137.8.2026.09.03.06.07.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:07:28 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7866d924eaaso1594264137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 06:07:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzHJf2q5s85bid0uUwOdl1OFoTqPBqfBwOeIC7oOuWeB0PUmNTn2yvAMyGK/iZgH+pxB2BnD3Ir2sYOa9Y5LRqgfw==@vger.kernel.org
X-Received: by 2002:a05:6102:3fa8:b0:785:d308:cc2e with SMTP id
 ada2fe7eead31-78a1f363e2cmr4316460137.9.1788440848450; Thu, 03 Sep 2026
 06:07:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902104939.25522-1-ovidiu.panait.rb@renesas.com> <20260902104939.25522-2-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260902104939.25522-2-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 15:07:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUR59_-_HB8JcVi77B-Pa4UxPf64QO-cDn1ogQ8shFR7Q@mail.gmail.com>
X-Gm-Features: AcwNN1U_nOCF9hyFbscO2alVpr_m0LN2_JeCdjkgGXp8PKg9yAEFa13OLTkKydA
Message-ID: <CAMuHMdUR59_-_HB8JcVi77B-Pa4UxPf64QO-cDn1ogQ8shFR7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: rzv2h: Drop duplicated parent lookup in fixed_mod_status_clk_register()
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, John Madieu <john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 12:50, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> From: John Madieu <john.madieu.xa@bp.renesas.com>
>
> rzv2h_cpg_fixed_mod_status_clk_register() looks up priv->clks[core->parent]
> twice, with an IS_ERR() check after each lookup. The second lookup is a
> leftover from an earlier refactor: the value cannot have changed between
> the two reads, so the second IS_ERR() check is dead code.
>
> Drop the duplicated lookup and check.
>
> No functional change intended.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
