Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B809C43D50D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 15:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786547655; cv=none; b=bvGjh9aXoDJJwnxaOJepN5FRPVjGj2zLuFpntPpoMSdun7ZbQbKUOMFJoUoikM7LlaNwzBgbFyNyRNGTG8RZBDuh5LlFIZtrDOyBEnHvvOTdwlRaJn/gvMSjzedUiZh1yrjR+EkeVBcSmvHGwhial7J964/CNiwmfDELdcPlZcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786547655; c=relaxed/simple;
	bh=jkvefW0b5OLyxRr3z2DDupDky1h7+DUjqwpf357sAoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DnwbIWNDQx/7CyqwrWKpe1tRyw1eFnKMzgaufauHEGkxRB//NO+wLNZZyiX/vlIMmUI4PkYp77Fwcbsi0L+IzRoT0CAP0fJGFlairx8RJ4l2A88DNz9kPGPhhyvw58Rp4zbz+GR5LpgWBp7siu+1a0+sGt8dK7MYxWm77lSD3ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bf5370d38fso294199e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 08:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786547653; x=1787152453;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cw+NZafyiJw4ZvXIE2j/bcnzNM3NWIqwVIiiJnuoWhA=;
        b=rFgEUoeiCufQC5p8kKjscI4hLsASxCBpxxvanCm3/n3rJVKflrVsfLOZtJKee2OAqy
         qd5Y2G1DzYxk2A1oHXBYFGJOUZD5lzrnDJoz83ZWldK3AMIqAB+EV9KBLKV3K/1j5zo6
         2XaqGYYYwEiFAmNZrXLnIjnYEul0/IokmRra/zxbAiSiSfRBXJ/s8gGLv9eXtNZSMOKh
         cU88lZhpK9ou8uN+vXisOXW5H+SIrkZPpRvyHa8ba3qZTxdaYjuj9lTXioGBHx6RBMHc
         AU5YHsTQl6MS+tCitS8taZhIE57IIY0h6iw2H7buppSLdey4H+VDQ/DjUYP+LVGGVuT6
         Oz0g==
X-Forwarded-Encrypted: i=1; AHgh+RqH869SOrxsxV9wtNY3Py9preiLfGDN9KMwT0KGkNIZkC3u7NQgmSLi5bUi7m0D9+wukc9ES023qCfZ4e1Llu9sOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgDTPJ4+gQJO9g0kyVMDjUQwHwF90oDf5hKtu+ZtEhwWCTTafK
	vRTOJgErNDGMGrhACRUSh7Pv+7wqx3pEqASIr/00yJTsOppC/1DPKC6rYB2vPqcK
X-Gm-Gg: AR+sD13V60qGmFTp2XBU7pgARHneiJ8oF3HRbXrliBFmLygQowE7zCyQJA7jEUkf/iR
	wrETOKx0IPVm3AogZfR32xVmxQWRDnfteWmVPDAZouXihefK0+iiJhwFHr6JzyWDYDdQATploez
	+c8cRepaVc0o0PIakv04r3xKeWAIHZ/E61P+lByqm4yZhIQ2W+V97fdsN+zAwGCz5OzCL4OO/Zk
	19oUk5MzaX09yg5dW/X8Goa0xJtJhnPbOvwOJx3lJQwmoF+7YpyJINhlsf7gHfgoi3o4WM+bT+4
	ppia9RWlih4a66lbPCKOMzInfzBax6RRCULMvLpJhf9RXr3NLmpeEjvhKQoc9XK9cE6PS9MhXGm
	SExJPJIQGlkPNkyCdt8AYc21+KC7QkJX+30e1zYIBNfGtbj/f57p6dt5kiKdeANMgXtWkeArEeC
	1wZsUbiV+cCsHtaKK2nIc2ucrknbUJy/Dho84ZdXXF8uasZZafw8Pufnl5MO//oMiVXhNTeFmPS
	rPfLjXV55iQlx5/+IFYHgvQzQ==
X-Received: by 2002:a05:6102:f9b:b0:6f0:6293:747d with SMTP id ada2fe7eead31-76c8a76b707mr1013160137.14.1786547652601;
        Wed, 12 Aug 2026 08:14:12 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76cb152074csm839169137.7.2026.08.12.08.14.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 08:14:10 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-74aa416ebb1so294407137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 08:14:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrugbEhsZ49BoNvLH1K9uvpn13r04/REX0sF4UkQCgOqxcIQvaH1fRK7EjI2J8n9i276zCDTHnwXCqZbQFV+4cMlA==@vger.kernel.org
X-Received: by 2002:a05:6102:c13:b0:6a2:b2a1:f16a with SMTP id
 ada2fe7eead31-76c877585f8mr1067211137.2.1786547648892; Wed, 12 Aug 2026
 08:14:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619075621.126961-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619075621.126961-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 17:13:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVe_kfdgKCtS3BZKqXiZp+pxJrZ=VAVmOct-qk5tZAFuQ@mail.gmail.com>
X-Gm-Features: AUfX_mzoBBNS13xMaYa5qntVW1fi_TuZRWzFFUrWE0n2bMAQaMF8b4n6LMfodoo
Message-ID: <CAMuHMdVe_kfdgKCtS3BZKqXiZp+pxJrZ=VAVmOct-qk5tZAFuQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a08g045: Move max-frequency to SoC dtsi
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 09:56, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Move the max-frequency property for SDHI0/1/2 from the board-level
> SMARC dtsi files into the r9a08g045.dtsi SoC file, since these
> values reflect controller/SoC limitations rather than board-specific.
>
> This removes the duplicated max-frequency = <125000000> entries for
> SDHI0 (both SD and eMMC variants) and SDHI1 in rzg3s-smarc-som.dtsi
> and rzg3s-smarc.dtsi, and the max-frequency = <50000000> entry for
> SDHI2, consolidating them as defaults in r9a08g045.dtsi instead.
>
> Boards needing a different limit can still override max-frequency
> locally.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
