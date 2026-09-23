Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A2247A0C0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 09:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154802; cv=none; b=XqxDdt/97CI7VCK3CVe/YopIUpjgsF/WmCs+jI6pFuVWkbGzHZbHsqEoQ2dOFEFYUNbw4JkVSiriuT9yLbpiWDG2FswrOOGFX8Bl8QXEmKPhPUghIWkrTOUNuEUp8TTCSjt7Bjhc3II9WcBh9SJogrIzQPNyLvSJt4d1EGIanOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154802; c=relaxed/simple;
	bh=pChAlCbUWivP0jckC5mbXA4KLqm12IMiCjsns2Xs9aA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e0qh5bTi3kM2/4SHn/6eJChi4t0js7z5DwRWVosbu41A7tS/Vmt4SswltRVsyuSRDQene50ELuA2/gaMvy1l/wahIN/j15yECghtozSm0LYJT/MZmMx47hNoeI/jaTgEFQZbh56buYKKa6Zew7SzYM2ly9XKHwq5yA+AJPFXb4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c981b0d59cso550654e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 02:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154800; x=1790759600;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XAKYyai8psRXv0/QFZ5hHt6xP/WwuL0KY0YP7Ej03uE=;
        b=akc0/gtxsuo7jH3Adg/4djGN4vthwvk2XeKKZQIfwZ9PjwjZyV4zRQNDPQ3NjWPbp6
         My1GKi0k/6mFnYpyE0XGiYJl5JKqOXwBhR5wZduBMrF9pWXwKBNiadErlPwBAnEETQzq
         BPlitPUJ31xVEELa7hSFBgABEG3EQdWXmQjiZ7Tj4YzHw4dwW+5QhWcyLwPzJTXL+wOr
         H5HKdMtK/jdmcBeocS6En7ar22SUwXgAJ/uRPtJ42bVDAmKOVOI7yV19C9f6bRfWPm+Y
         /fXiqkDRb2lpWG5m/RgkVD1WB9eGSOvS2G6GcwpriX2FrraQaTh4vHRYamCZNg89QU90
         /mBw==
X-Forwarded-Encrypted: i=1; AKwUvByDA6xyAh8RctilNe33nzT03yZH8hvXSEjE9I/vy/fIoNTpEZ4kr2SBPd7OTq7HfgmM3L7iabKc1dD0tCmzsvBb0g==@vger.kernel.org
X-Gm-Message-State: AFuF++mzd3Lkk/9zzHqEVjnzGWu5wF2x7k9c+3imV0YJZ8jA12fJulgU
	0dvkQtxwi6i7hyJlKK4G1MFf6etXxsdlyMPfS83cUnc6Kpt8GzVzUIYqeyaTEs7JZSk=
X-Gm-Gg: AYBFou2uYPMye4lDV1+5sVZwd+5BIjuZOKl+wM/8mF/61tJfrDlKwkDgGEAyAAz9gC7
	WGCMoZBrXwVbH1vgdCiPouxMwOuriLQwSnOYGegIDkyVhDM6CfB97bGd11qkRwx0XOQGnpfDVc5
	KosAL73WedzQkowN9wHiLahN0tQE/Fs9rhYwW54B1vneTBBCpIoOa+KoRKguR1olW68dYPjri9O
	hMQZOg9hbmWrLV4gBdgcI5+JEcx6A+lZLeVfGuMkBZs8Lhs7MVxHldKQaAg+/8XF6slZOZiKBBF
	/KPk+dYa5qUd19Q/NvSu5klJMAM0dUprz01KC0nV9QtNI4RWW53HKguYYrTDTW+SSdex770CEH1
	aspW7KmiRqGJ16yTPaNukOzPmJin4TNq3D2eojVTVu+hjIYwmBhgqeo7vzrxtT6qGqM6QBxakGc
	+uRxZuno9VkRzb3+ijWyCYB05ehu7JwIlFXeLO5O6NtY4SsqxiNyBstniOo/ea79k/80u4p7T1e
	wY+ZC+XfUcE1xcWt54efZnsFpUUU8fk4BTYLYE=
X-Received: by 2002:a05:6102:50a6:b0:7a1:4799:33eb with SMTP id ada2fe7eead31-7ac1a8b4512mr1989322137.5.1790154800162;
        Wed, 23 Sep 2026 02:13:20 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf65b6a0esm2814101137.12.2026.09.23.02.13.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:13:19 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7b3so442469241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 02:13:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzaU/f+ULJs5KnaGR5Kh0/y6WaFmedPLn7sDAJp+/dFDOF08oen5MiAM3P0bO0wAlwsJVJA29PzvrcyvHmB8Byctw==@vger.kernel.org
X-Received: by 2002:a05:6102:3a08:b0:7a7:19aa:8a89 with SMTP id
 ada2fe7eead31-7ac1d6f6461mr1654647137.36.1790154799016; Wed, 23 Sep 2026
 02:13:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921131951.187981-1-biju.das.jz@bp.renesas.com> <20260921131951.187981-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260921131951.187981-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:13:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_fR8-NpJgb5_J8aZ8XypHis9Lf=C-yW-U2ehrut-aag@mail.gmail.com>
X-Gm-Features: AclHuK_ep9PIij6_rn7bpnDa0DbLwc_cLRHpWMpcqauyM0t_Uefy3670sPqkvj8
Message-ID: <CAMuHMdV_fR8-NpJgb5_J8aZ8XypHis9Lf=C-yW-U2ehrut-aag@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a08g046: Add CANFD node
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:20, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Replace the CANFD placeholder with the full node description:
> interrupts, clocks (fck, ram_clk, can_clk), resets, power-domain,
> and three disabled channel sub-nodes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
