Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A1853D0A0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 12:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871186; cv=none; b=DsdW9KuVHuX18xmiuY92dvdsC9les8CP1Xyyfjtp4V84epoel9WAudN92EVjFvUXZ9+OCW8+DUYSTOtGfQKwwn4Qibbo1riSMtmIcwk88mT9TyloT5voR0IrZ+7wLPo05etJdCFfb1QPqDgr7Ko939WuG+KkPhAqYW/bqOeM8TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871186; c=relaxed/simple;
	bh=xjqICCjmH0ghryW8dOBfRncjaOxBbTFkSNvlzCO9/PI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZgSDPBAaUw4df4qM1SOyjw9H0WEJfYrSvO9raP2oVdu/Pr9lzmwEs6jX6eSAeJbPyn86Av0aMt4yyKMrj1vBszpTXO4dGn+HsUGBPfrYcTFXZE0EsdtC70OjPQLkNtOT5uvPpdPc9aHAU4JYED7TuGXWni6O9dKeItc+n5sVL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6b12ada8befso2521519eaf.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 05:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788871184; x=1789475984;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AvhvPfE1o8U9V0xY+ZBtjmprcW5MUShi55REbbGvMBg=;
        b=WLRIwX/wbSNAbr7aUOLBSLtGvRu7vRz+2sKedQdeSh44CMvy0nV+7CMIzBYqDrIKVM
         JP4sY8spNmwnafLiMU+0nbpHFYc80hTBeWAptJrVKXhYkb+AZRNYtDIMbxQgXS1zx9cb
         h2fgRQ1yAKMfeeP3ACzSYSe2jZ0GTIMgUIjQfhf1cmNHN+NDjZ3IicbMZrt0zGIwzvLH
         VPFSVvFtfi7p9LPiaKFuxagL2LDED0gtHfs5nyFWcPnETS07Ur3ZdNrY29R7t5Z6H6Y1
         RSdrr0e2p2ol7lFY3AimowpY63REbexZ7BT71hg+Uc5/sQqa91iJJAT6WBdYu2tbFgUq
         xCLg==
X-Forwarded-Encrypted: i=1; AKwUvByoSfgV1EkRlTdMT1EfxP+HH+NLkpjMFAiUTvusju2PdKbB4QF73kcx/fjAMlkdOnwD/qefPkCeXfkhrMp/RaJmMg==@vger.kernel.org
X-Gm-Message-State: AFuF++lOO+tscwa6BoLnt6yrkjPRfkooRXRXWAhgOQJrI6SBLMGhomys
	WqJejXk0uclrjTjxNTOlLMkvLQhgcCcMv3esjPw2QbAlLX3K5e/IXwQJOouckgXZ
X-Gm-Gg: AYBFou2pxd5enNd0VkwUcYT08mG0LPdKMRvwMpdEOEQULPG66xJqkETB5mn8wbDUYYl
	osDIHapIJV1t4UzSqVZ2vm+gbetyDqTpPP6IUM4p85hV5odyo1MF0fTetA6gj6IadearcPViy+x
	UztAXiNNRIZj5Zh576DuadIKGhIHXk3OYYAWmJNn2nBkr35QbHhtdVUa/HfvzXDwem6puG11SKC
	HHewLzyQuxo20jl4lcCUkT/j2Cq3sEwKaQcZlAKSi2UFATUJZQJ6Mfk2wdnNKBXPiOoEhu8duQi
	6kc/VHdER5k3AX4yopQttXAejGwFqFAQtU3pGKAyeyzmwO9g3DoMTiFX2ubhCAFudTRexQ+8Ma/
	/pE+6wfSS9sQ2Vz8SeBRNuTnP1T3pTdG8coBCuHVOKTH1HYGxO9WNUQn6Eucc052KJQOgmxZ68P
	hbPxSX/8wqEfYcOPyo+uU2JyNc4abQqtgGHVQLJj/fFFQUwmLp+wDP7wB0+dpDmL4IEjqQ14ThP
	8xyI07bQUtoxgTldkp3n8TqTXu+Gg==
X-Received: by 2002:a05:6820:1c83:b0:6b1:9ffe:a71c with SMTP id 006d021491bc7-6b6f7d7778emr23139531eaf.0.1788871184047;
        Tue, 08 Sep 2026 05:39:44 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6bab80ba74esm6581391eaf.10.2026.09.08.05.39.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:39:43 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4ab47c40e7eso2817398b6e.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 05:39:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxcNP+OQKpzoYrBLBROpTlmbK1Ax+FhmLfTIxU/5RQFvtGLHhlYxso4Y35+f3d7ckKvnLG6i114jC9B3KLiG4zS9g==@vger.kernel.org
X-Received: by 2002:a05:6102:374f:b0:784:b9ec:913d with SMTP id
 ada2fe7eead31-78a4a91b281mr10556868137.8.1788870699731; Tue, 08 Sep 2026
 05:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:31:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBFu=W1MnEA+Eu_zzUy3qMyFRbbeLgYn0waxMdr5cAnA@mail.gmail.com>
X-Gm-Features: AcwNN1VHwQtBXkE1g5B-tKWZHl1EPxPwrUnATnMeQZH1DQxtt1IMi9pdue90c-g
Message-ID: <CAMuHMdXBFu=W1MnEA+Eu_zzUy3qMyFRbbeLgYn0waxMdr5cAnA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add syscon support for Renesas RZ/T2H & RZ/N2H in
 CPG/MSSR driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 17 Aug 2026 at 21:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs
> in the CPG/MSSR driver. The CPG/MSSR block on these SoCs is a
> multi-function block that integrates several system-level features beyond
> clock and reset control, including clock monitoring, write protection,
> and peripheral configuration registers.
>
> For the other IP blocks to be configured a syscon support is provided in
> the CPG/MSSR driver. This allows other drivers to access the CPG/MSSR
> registers via a regmap interface.

> Lad Prabhakar (7):
>   clk: renesas: r9a09g077: Register SYSC regmap

Thanks, will queue in renesas-clk for v7.4.

>   arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
>   arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes

Thanks, will queue both in renesas-devel for v7.4.

>   dt-bindings: watchdog: renesas,r9a09g057-wdt: Add CPG/MSSR syscon
>     support

This is now in watchdog-next.

>   watchdog: rzv2h: Add syscon support for WDTDCR
>   arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
>   arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

These two have a hard dependency on the first five patches, so they
are postponed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
