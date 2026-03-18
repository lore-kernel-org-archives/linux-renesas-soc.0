Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD0C3FADEB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 16:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773850030; cv=none; b=mrdLGBqjRiqLncycL5xL+oQBt3g85gRY9zyYOu2TFjzOz8xaUnfReZ+mtyWxIEa+1k1/C1zDMmEJPhDUxms+XHtblJSH+8JKp3xAf++ejSJxcrgXQKPxs3gYWKu0mUw6WGl4UMuMCXv2rqgfOruttvpORUXfB9SoYBHp4tCSEWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773850030; c=relaxed/simple;
	bh=C0K3zuIGCFbCWEAA6RQca9NBjlh1H0UByRONnfECmAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZLlkBKec7wuNDbITL7Hh7xdc3r8CZZFPShDu8RUDT/+R9XGFxxbF6bR2D527E18ssK5uijIEeO+3xXsH4vtyf05bEAbL1t4SQOZD+VPdCDhtv/VsOMrQdEdT8daBXPcBpDCLaDgOCjRXqnc//8ukFMmyN3QgBGB7SyGMD6Mv8nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56afbcd8adbso3178899e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 09:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773850024; x=1774454824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikhQ/s135EgCf6c2OwoW/1zLZPqI7cynubnVYKoEijY=;
        b=i0EF1aqzglp6gz3hKRl4vOVqGwJnUjxEts9RcgccQSjndbJipKEiOYQ9jhaOr8PHOs
         49wp1F4iLKR5yBL0HyHUzwyQkpWuID69t9/FQ77ksdYvUtQ+us9FttZKzGqavpR9LnQF
         C9snlesGiOdATX1DBVJwTAPlyWcYqRa23aqKNLf2Sm+8B+isJGg6osrWIFp+oBO6zc3X
         PnSy0bzjNAHWobP0KSfZCv9dpu/ZmdFlIukxTqJz38hbtBIHyh9dOUTjqZQTn7X2OXnK
         b1uILhpiDQNmEbolF6e+vMJsBzNLA6L8DKr8L13Bg+a/y0jT165+hnetV81D8WYq1wnn
         cc3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWt/ApJobtACnfelKUzaXEhp32DFIDC51t2b2iuXBaltca4zGPpNMjoyc9SSLVqXN7NVIX9GjRhi3VTLvgZCnwVIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl+UeD598dQ9c42vN339aSuYrsv9teJT15aslTd3MXjZD74CLJ
	OowCK95KSQSqS9pKZBldW2FjhWFJoKbn9RvzrPMdNVfiRU8njH6sGaJkrs7dlZ2LbE8=
X-Gm-Gg: ATEYQzx7Rr44wKfQQwTvXv2SUe5gSccGImhsioln7id3HM4X9/B1V9KrMa+QzRWXHx3
	nz5Rm6myG7oGTnwJA+UDew9Tf/QTDDUBY+U0AUs59lUCsHv6Vv7FbZcDKndhYNqIWAf9gvw8PSL
	mlkRDKlsYkNkVHBiLVw96/gh5ah1bmSkoWEVxvlFS2kvzplS4SmvZgnOMIj0mzfgl8rbuCZ6qgE
	weKclZthBqngKw6RwiOx2sK6EtuZpUDH4jrtLXn4h8SV567bdSdjD8dbUI015rt7Ei4e6HWl3v5
	dX4GP/C+bBjDyev9jv7RAMus1twWbM/gDZ471t5wjWGw94VBO9W4BOhO/GYgXwp/qyvUbXaorcA
	SxYfNYZuUQI8voHBmdZBzFbKKnHItvWi9uxXb9pmSohoW1AMvEigXEgt97b60X0ilL30N5ZmCy/
	0cx6QOuvASGtggLKDm4pAqJ+kLl581H6vZ2IZtagwA7+QH9SWgwRrO/ZvOvUTpWBQV
X-Received: by 2002:a05:6122:90b:b0:56a:9401:11eb with SMTP id 71dfb90a1353d-56ba6fe6acamr2137722e0c.2.1773850023926;
        Wed, 18 Mar 2026 09:07:03 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba6fed64csm1820695e0c.9.2026.03.18.09.07.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 09:07:03 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso2814101e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 09:07:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1D5szPpRrhlLLKWrqvBW60VHMLyiXQFT0mPGRr728l3r4FlObi47NoZH7aFXxLdSLomDHpcMSJMZojByRF6sylw==@vger.kernel.org
X-Received: by 2002:a05:6122:8c0c:b0:567:499d:1fb8 with SMTP id
 71dfb90a1353d-56ba719311cmr2253679e0c.13.1773850022582; Wed, 18 Mar 2026
 09:07:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com> <ea6ed3b82c5a326732adfc0fcdb2922bfcad2591.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <ea6ed3b82c5a326732adfc0fcdb2922bfcad2591.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 17:06:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXOxG7JKmwZFEy5EE+qJKSMuafA58HQGfFxzNDTsJ9OEA@mail.gmail.com>
X-Gm-Features: AaiRm53ykWAMjD_Bg0jQpCEt2WVWpWU9Yx6QysAtvExMVNjGws_pY1ovqWPD_kc
Message-ID: <CAMuHMdXOxG7JKmwZFEy5EE+qJKSMuafA58HQGfFxzNDTsJ9OEA@mail.gmail.com>
Subject: Re: [PATCH 2/5] spi: dt-bindings: renesas,rzv2h-rspi: Document dmas property
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Feb 2026 at 17:24, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Document the dmas property to state it must be specified as TX/RX DMA
> specifier pairs.
> This clarifies the expected ordering and improves binding readability
> without changing behavior.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  - This patch depend up on [0]
>  - [0] https://lore.kernel.org/all/20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com/

The dependency is now in spi/for-next.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
