Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017EC399372
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133617; cv=none; b=O8gBWPC8amurwUSKbR3ayVvpbhL+RcM+68eq7JZtpAcW+rTjwRTpB/KLgVS1WH1+2YqbkF1KCUm3M+/J/VO/YkFYMgqJ2byCgHUj9pKH72XVCCmpKj+ek3DOD/e05arHoeCsrCHLt+6yQoS81fMXP21gQXnWEXWfhejlS/y4v3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133617; c=relaxed/simple;
	bh=SM9VHBXV6TBGOikkFpTdL1XsyNkeAn7us1yu5cqpdvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p71qG/xxe7i/Acmixw9ul99ib6irwXFP46H42Clpaim8Xf9jcVK4QpjVVVHBByXrY6OAvxskxPmatDK3O7gOt3o0YXfGtYNN6nT5/fIF3reb0bJqmhBv7noaoJoPe6LPZVXP6ErLLK5cScsNL9G9aqedPJlLznPcCTTt653UIEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8db4b249ebfso56241866d6.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 06:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133615; x=1782738415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WkmFP8EgfTBK7Rgts2GV0gt8NlsFBfLpTTFR4+sUd8=;
        b=rpI9rZD3vBiQ8LT2CNtRHkyyk3JCnjDPSU6KOeIAyeQxNzMhcDJebMmKsKg/INHqGX
         A8bwG7E/p8fLPW1uTqCbVR/NWEQpdwnlwEmHFuvbYj7/lLOWLwDDAkVkVHyOtXecyI5L
         q9M35DIlf28icS/ppRctTFo/H2AtC6mMq5Ur8AEzxsoxFbbCentGrG5zJ+xUGByckxKd
         RoJxHjS+756U6sOTgcdP6VWChEZd1JXq+HwMvsR0lgD3e5ph8rUEld4TrFN1D+R4S/oH
         doNks21eGungpqZ+od7tO93PRzCczfm3ZTB3uElaCj3XketoqHDZUQiHy/tH/+EumNK2
         cVFw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9ekZ/+AM9BGyPPxeO13WgiZwrSZm509SLYNzmCLFdfg7V3bX4TlCAdT0I3fK2xEklzp29eGxGAjiqzwtfhEleCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCKnQQpgDi/1QLPEr+7kpKUSCfb3XuqTcIBim6VEYkMiXdzhmm
	VrItxt0V0QwKkv43q7/kXSgbfudW5Ptz6/R5DSwiKAr3yuIXKjMQFxEjBqk+/iokITk=
X-Gm-Gg: AfdE7clD5W7Xes3TvmCshqG563OSqeCr5pPR17zz1bvuqjLO8FH3xhc0eSWzGXoFNY4
	Sz8/vpUb5dbXUXD2BpwhKZIqmnf/TLiJFcSziM5OwqDH3mFP0+VoCdOZPsPdAonbOqpGESZlt2k
	+Xxh9DR2jirPrk+T3Nu4X8pAQEjLjHN4uWwF45jC7jlaJAAuEleu9rUO1gJDlbU98j3ChF5rIi5
	B8sCOeg/P30wURCSUNCXblSAFu0T1k4VKUdsO66ZdFNTNNiCdggBO7l7SePmQkuGiqjfR1LysOw
	kcjJ9OWV/ufPn1kyl3lEyHzpyVmJIT6cosdhW0+R8t9d6H4Ngq3RtFSEyLr3lsJ32Od811IsRfu
	k5FKgZiEkiDffNi1HOdsQ6lb4Pge0GI8+owTpu4kDoQ8n/wm95dJWuZilJWkz6CRxLjGJbGEPyO
	9Dj6Wu3mNJkDgCKy0EuzLhGNTWNJhEVfX1lyTd1lUczTwfXzACWnD3sA==
X-Received: by 2002:a05:6214:226d:b0:8ac:732b:6cf1 with SMTP id 6a1803df08f44-8dea3ae0327mr223901296d6.24.1782133614868;
        Mon, 22 Jun 2026 06:06:54 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde303sm95383286d6.25.2026.06.22.06.06.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:06:54 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51778069c31so37064081cf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 06:06:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ94CkZNc3WCgJtEgBc1ipCLt8bdoGgWdtDk5FMLadaa7gF8anAGMwWeEm/7eofXHrlp9hSJz/4ZcwdDWkW63d94RA==@vger.kernel.org
X-Received: by 2002:a05:6102:1621:b0:728:3f9a:897d with SMTP id
 ada2fe7eead31-72a791ced61mr6106327137.27.1782133184732; Mon, 22 Jun 2026
 05:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618181949.3036280-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260618181949.3036280-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 14:59:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWEmc8ihrAqBKc1E411mHk80t5ky6e4zvKPGwa2s0vtg@mail.gmail.com>
X-Gm-Features: AVVi8CdvOYFyC2YUihLVLYtBBghtLclJxlI0ynR5jdq3sSBLsDEr397xBO2_96g
Message-ID: <CAMuHMdXWEmc8ihrAqBKc1E411mHk80t5ky6e4zvKPGwa2s0vtg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jun 2026 at 20:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce a per-SoC PLL reference input frequency parameter to avoid
> relying on a hardcoded 24MHz constant during PLL configuration math.
>
> Add an input_fref member to struct rzv2h_pll_limits. In the core
> calculation helper rzv2h_get_pll_pars(), derive the base input clock
> rate from limits->input_fref, utilizing the conditional ternary operator
> to fall back to 24MHz if the struct field is left uninitialized (0),
> and drop the obsolete macro RZ_V2H_OSC_CLK_IN_MEGA.
>
> This abstraction permits the reuse of the common PLL divider logic on
> newer SoC platforms like the RZ/T2H, which feature a 48 MHz PLL reference
> clock input instead of the 24 MHz signal used by RZ/V2H(P), without
> disrupting existing platforms.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> - Fixed MHz to Hz for input_fref in the doc comment for
>   struct rzv2h_pll_limits.
> - Added RB tag from Geert.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
