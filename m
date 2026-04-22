Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C785737F8A1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 11:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857754; cv=none; b=DWajwH8ZrIM2pf5laB/O/5AB5ytdVl4+LhET1DCGK49Fb+txbOlzlQ4xbP9wNnLfMnW0X0Gf5XcVgV1EjP5Vdk9uEMHZm1vQDtJQuZF7g0oDx1no7z6FBsNlBW5z75P19aX0LhFbhZUKikS0ybc0lIwAEPU0be92dmP5vDoaefc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857754; c=relaxed/simple;
	bh=R9JlaNaEei47q8RFqO5ggVnbPEsNSaXaU0nZijnGZ+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPs4YuGPQmk8LT98pk/q7IhFXehsuLrQ9fUKv7+6aHipxgY7Szc7EfoQBuXmL8JYeT/xDQanVnsli/6fpzUHb4XZT45ny9/EL2JGOX+zBU8RLJNQyMTVAZ+eOHCaGBmS0r/U+ARVngNUoLc96MEtN1drOS19WjBIYh9hpAMr9JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-953ad5a55b7so2920930241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 04:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776857752; x=1777462552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELJxWI9ESJzbGIe+C75G9R94zA1sKEl066/NjIEF+RY=;
        b=WJsKJxkg3OPogHkCX0W+8LC2p3yp9HsNk5KY+g3YY2ufo62gE8kjls0dUF5+7byU/R
         sYIwdqrehlrETB6LQe/bfRNiNOoXj48sJuV+l7tOzMXVjjWSxoH8PXoQaMjZccxjKE8N
         vxtzGyyCIETIJ/517G2zxBqlJQCiBpb7yMp5d51B+B6B2Yv5yvpxtxqKgwqac3Ql5lVV
         1Ew5G26YeGcsi67JzstrmUz2V1DGl0v4gQ5OJghDlV4WH7N/AYk1jW9d3ldDV4KCvFpF
         ej8RtDdUX8vs8lHUtmivCK3WtC161/hYWZB/+pEAImKwe3I3Pe/RDJVH1kwTxiIvLdJb
         OJaw==
X-Forwarded-Encrypted: i=1; AFNElJ/ojgdjaP+k8ASF5Czq1Pt1muBwf7orPLEL04WJrL7lz0nBWBGlofT57ucNsoKZFafoqxhfJYGr8RAFUxNss0goXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMOXPM/HpJnJO7DA0rVBf3cXbgaT5esFH//Q2LUUIVCiK/zvuS
	eYCabAbTlEdFAfkkG2zQR1qS2rQw2LaboNCUU5GmhZQsmZPQ2RJMp7pmx3Mxej3HqwQ=
X-Gm-Gg: AeBDietvs2E3Ln0Lu0vY1VNccMkejangspI+NZl8rjI+t37nM54lptHXC+qpTvvQ4VV
	CRRXRWfoSVpenDQWE8UrNUBvMiWSQppxLZ9g5RKN8b6kx7QTRJYGAwjd1j9okcPlTlX3pzIzMum
	wuARJJg+m8MtHLK0nA4M4OKm4bq56UV05kpQ1x8S9W6o6d05vBgoWSMcqJqb24d92yjrX1sqLtX
	LWIx/452D1pmr84YJ2CHhxmC/nwsAExc4ZfNKLTU0u1SSsmtrFsI5CCLQtKAGrahknn+aNSKBh3
	dT2BZWcA3z8xI2sj1o0sUaTgrggxBT36teuaiZ4iHzw1giEZLzom01SYdTm7f/VMZ6Cm00y+Tzm
	In6EUUBpbfsX/6VEQ4LhTk/yrBWAuS60EDY4hWkMuBV3hPNirBMiM5KSbdEgITSYt9/m7i9R3un
	iNGrFdVvkIyNleI9ZYAgM1lkKsnnkQm5GowmvaT8nWMprJTWLNRojJcQA5oqN1nWN5XgpuJT0=
X-Received: by 2002:a05:6102:3e1a:b0:606:49d:1861 with SMTP id ada2fe7eead31-616f772e6b0mr10847471137.27.1776857751698;
        Wed, 22 Apr 2026 04:35:51 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589093a8bbsm7230619241.3.2026.04.22.04.35.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:35:51 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-953ad5a55b7so2920916241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 04:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ajyUjQ6iQGYHH1KY3EusYrimRwqQUF8kADB21I9qak/Vekmxkc01mo0lFNQHSSeW1Hma9K7TJMrY0DhPie6+Shg==@vger.kernel.org
X-Received: by 2002:a05:6102:f14:b0:611:3bcb:aef6 with SMTP id
 ada2fe7eead31-616f16429b5mr10579231137.0.1776857750839; Wed, 22 Apr 2026
 04:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260413182456.811543-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260413182456.811543-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 13:35:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXew2OoNujZUboymX6ZJcxQQUjH0U1G+neQexz90_hqCA@mail.gmail.com>
X-Gm-Features: AQROBzBlN3WCKio0G3EgdMYhQvWWpP_T7dxVxH_6xJWVnBA5bQ7oLj2FGGENTas
Message-ID: <CAMuHMdXew2OoNujZUboymX6ZJcxQQUjH0U1G+neQexz90_hqCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: renesas: rzg2l: Fix SMT register cache handling
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Store SMT register cache per bank instead of using a single array.
>
> On RZ/V2H(P), the SMT register is split across two 32-bit registers: bits

Also on RZ/V2N, and RZ/G3E.

> 0/8/16/24 control pins 0-3, while pins 4-7 are controlled by the
> corresponding bits in the next register. The previous implementation
> cached only a single SMT register, leading to incomplete save/restore of
> SMT state.
>
> Convert cache->smt to a per-bank array and allocate storage for both
> halves. Update suspend/resume handling to save and restore both SMT
> registers when present.
>
> Fixes: 837afa592c623 ("pinctrl: renesas: rzg2l: Add suspend/resume support for Schmitt control registers")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-fixes for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
