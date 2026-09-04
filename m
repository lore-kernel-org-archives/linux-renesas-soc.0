Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32F541D120
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 15:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534341; cv=none; b=UALYT7fA3R+217eVEwx4+8AtB6/3Hm4Rb87AzuRDErXXlLnZj2+8xs42mgrNITkRf/vlak6vN3zUDWdgl6LeVYcNPpHZgKAtc6VM/muAUohSv+r7Zimr3UONW+8UKAbr2D4msawHGYgMgw57GNzZQ1BtZFUDU5ifrTgpcBZlWXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534341; c=relaxed/simple;
	bh=d1r8YLCgRIdy4KEcRiU5xhMZDzm5Ir3G6LE/EtLImp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NMLQP0/4hrVsfulrRFU9qmAvMDwBgRyr9YG0ab29Gm/zuT5XVP+iURtlNikSs7v+b4Of/u/DlVV/ZsAQFhVunHasEIerQtxdEJyL9DsPKwFDGJc+Gf0aweYDhifFmL2cQaiRg5ISklEiIZwTBZp+vplFhVvPi13v9MzjQQ9c+G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-745497ac8fcso318772137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534333; x=1789139133;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DBpBma5dCQR0Szv2MO2Socgh1RkSDenfZa0jgmlXBh4=;
        b=JRCl6ZF5s+29gAqee8UidTjEIqq4vLFuy2nQn8q8Pj/XDAufvB7Rax09FmFVQpC9H3
         bSRqkDYU3YAJMUc8TfSAuZH8p/qMcjFmOpmts2+WawUwwFTnXNHVrE69WAcJzxL68VdQ
         7d3WGZL2eXKoLgZ9z2RKMm4kTNs3W66ZjFytcsmzUMLSCu/aWrY89aL1YSyp1PaRJuSw
         bwCidtyxqgMk98Oz+oufk6Uw/6zcSg4p431tJiLwDb3KRlI4hn3XNXLVlpIiJRaXaeHf
         nJDga+s1f5nwvCp0bpG4V6JTQtRYAfBPv2QF+dtjoYvTOuCAGeRLK+4cKXceLWGO1AUL
         jq4w==
X-Forwarded-Encrypted: i=1; AKwUvBw/gHjnSnp5zvxga0nfn8OWo/8NV/gXdFLCULPmPE7h7uRK4TCkTICDw0yaGmbuqc1dWQ2q62gB9PCFIv1tDAKTjw==@vger.kernel.org
X-Gm-Message-State: AFuF++mo9NyPxM07QOZJlU1q7OcxhMCy6Jnzgygya7hjQiIuZr5IY8SH
	g2m970pMOv9AOf2dgP2NRwKMgAFpVl86vTHa/IX0xaxVdsFqov6Cup0d7hPWDmzg
X-Gm-Gg: AYBFou2zg3gZ7Ljid4Nt1Rx8JI89WRRHBFHYl/nY7CM3Lq1IuGa3w1mNzz+3u1SZdMJ
	UI5yeQAiqFAZp/gSE37XTndtWmO66hhDNocdWqaYq5Ml8/slhTEz2Fp/DqYEcJhMzV+EnuZfnTI
	8nRk8elywIcMqQLb6qXzaZTHX0X656tgAepizUwlBKSAJgC58leTUf5mQtCVKhmYMTJ9ifDmJSI
	e20HNfpjsoXKCfcaTgol8yko+eyzpUq2ExGB0gbhbtwlL0KAJgEcXU0F9NU26Oog3bJGli+Ed/u
	kALjBHsKD+vaCvG6hKp2sl65o8FjRFudM+Tn14SX6p2RAVxxsEElU5HqJejy5LYEggB3dWmmEgn
	fTpQ07qVVTKgyuVZuCOeDPbCfyw3u/q22gnZ0TIgAKYvAIHshSNqL+q0Bt34z1rtFd7j65GsVby
	b/4TvSCZPRrOTlkh2amaXXoCRVX/ikQaR0WyKQNIHYjipuIOwWO3RnklDqe4s5jS9KFucIvv+XX
	P7/m1pBWrEaWToTK61/4ltbjQ==
X-Received: by 2002:a05:6102:91d:b0:785:76cd:ce88 with SMTP id ada2fe7eead31-78a4a67ba9bmr2057953137.3.1788534332915;
        Fri, 04 Sep 2026 08:05:32 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed7018fsm1788630241.6.2026.09.04.08.05.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:05:32 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-75e2905c09aso264204137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:05:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzlZvDRfqmh2rKTRAqom2YvnDZZ8qtOEN/xb6vsTPkVQFcCS/bZ+QbXLRSY9m1mzt5YC9H0kAInaPsjKIQvxLS8ZQ==@vger.kernel.org
X-Received: by 2002:a05:6102:f06:b0:785:eb33:8794 with SMTP id
 ada2fe7eead31-78a4a91756dmr2264959137.10.1788534332492; Fri, 04 Sep 2026
 08:05:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-6-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-6-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:05:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVch5xkg3p0+9mvEk9393ZuV2TO-kcyVci+VBAMCG4RPg@mail.gmail.com>
X-Gm-Features: AcwNN1XC5gp_Xk8OzyKjoKwIynG-nLTbzWvj7aLGFiNz0LjJGn_EivdUH3_smAk
Message-ID: <CAMuHMdVch5xkg3p0+9mvEk9393ZuV2TO-kcyVci+VBAMCG4RPg@mail.gmail.com>
Subject: Re: [PATCH 05/10] soc: renesas: rcar-rst: Add support for RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC to the R-Car
> RST driver.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
