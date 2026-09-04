Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FA94A0143
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 15:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534172; cv=none; b=TTxqCjWzChdpW2GMkVetzvwuH736/ftQmvixf3vKiBj8oetU+dy0ztwcgfYD2RrAuk9Ef1EDcNot7UUJs2r0UykpaGyjj+Fo/akXBdgqNyFmmTE5hn+ZDxerODaINMxAPr/0C7iBIQ4NKuPnn4J/ZdRqebYJgJkFuqfIYuqbjeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534172; c=relaxed/simple;
	bh=OVpDaLi1lD+Takpp4uvA66C8HI92i7f0cSJulK2KE6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U6mDFPw462cKKkgFNdmyyaVQPVAtyVJ0Cxn7g8MNv7jzoqdfl5aDJgqNX4sWp754FCmUB48URZ+wj+cgWjLUVN40Av9NLx26eZltanFWo0mFph42m0ndP9ItUucnyWT7eLMCr0fna9N4YTVURqHTnHaB+R8GfiKgyW+heWtW3ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c65093556aso901217e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534169; x=1789138969;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qjft24L+Kray3Ujvp0X5j4rTQSYixQ6JGAbX73Xi0TU=;
        b=GL/yBI9Cwxg3XLq6fawjsCWZqJaB3sZiwqtoC/f2UmO7vuGo/QsUqd1QvMRZvRsOke
         N1D4f3XG2DVFVNEr8q8poJpY7Vb8LPRKsGYSQZLkH00VNYUfxtPDhVd5OuTIPd9sqZ4b
         ZP+Er8jJYU2VU47VmkTuzDfB1lHcQ6fJSlhqTvvAXlDBz3rhdf0lUL21tzRFM6LKbo8V
         XPPxTOtSgaCgcKoPAfVS5HBCak6K9cLcBP1AqpqaxpaiGBdyQE82mzJQJ6uvhILGSDDd
         yVO81fOlTl2pQSVrkaLXkfbK/rQJPvwZywxkJCa+046lDYsrmJtBAVQNM2/c7Zv0kXbm
         REcw==
X-Forwarded-Encrypted: i=1; AKwUvBxfs77a8pnlsDMML84NuuuIMTD9xBGbyPOIxMaylZ+W2+DhBGzfNfHQQjaiwsQTjbtljYJm6RynfiJZ+FuS7QmXPg==@vger.kernel.org
X-Gm-Message-State: AFuF++nIGfP+H+b2X4t7nx/Zb5i8M/Y3nDl6UMn9X5gmHs4xYzGyC/gV
	CJLiBVJZB59HyI8+S7HlsRbEVSxNPMLre8p8fuqEKq0ckgDoCLtAV+4IOk8BERm2
X-Gm-Gg: AYBFou2ZyDhCKvqSY71ulx92/dF95fso6XNCAJyicBZ5hTKdemFSDK79H104JuYpwFa
	yGuMfEgT2S1PxeDebDSTComP3uGjlACZ+97LyuqrrpzpdsPw3niNeog7gWWw2y0U9JlETYr8qAb
	fJSjAZmR37ZXHBVuu4MQExMNPmp+Gme5NU1BN757CGmVSHrF0IU5wRinH+SgOfSKYm9tTA8mL8/
	ontKXAsEw0NUwc59cXniaVOib+IJSfnu5TshTctoBKUAV+vpkkmtNXWwKx9E+IalS0zUu5xOado
	ukgkcpRVJWoyQ2rOGAfGZxPqT1FQRu1l2jMyCebIjtJ5js8kIBlLbDsTjzYdx42HT/d4qoaXexC
	XXey+LL0IaTK48qcAF4HiuJxEkQi7CEBnzBl9y5ZlYstkBd2CKp15icsH0EwRO6yU7eCovV2tjq
	JLSwjhN42FrER0yt4aXXOefsE+UvmZqOK1//UBL5C+ttcsuGDjBPkff6+4RhbtZnq3VSfoLPLj+
	dhLn954s8IZ4lpQMf7wlsPY0xm6LQ==
X-Received: by 2002:a05:6122:8f8b:b0:5c2:b01f:e503 with SMTP id 71dfb90a1353d-5c7ed81a4femr3375157e0c.7.1788534169203;
        Fri, 04 Sep 2026 08:02:49 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ebf559cbsm2315921e0c.0.2026.09.04.08.02.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:02:48 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c65093556aso901193e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:02:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwQG052CZw2N19HgscibIGSTfQT5A1hUzAW1P08WgQZB434UfzzPx75ZsNHm2v+NR4jutGmmOjh/Qr+uo5RjPS44Q==@vger.kernel.org
X-Received: by 2002:a05:6122:8f8b:b0:5c2:b01f:e503 with SMTP id
 71dfb90a1353d-5c7ed81a4femr3374662e0c.7.1788534167484; Fri, 04 Sep 2026
 08:02:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-4-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-4-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:02:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWH2ojjcpKK4vDWQWw7buj67H4y9=Mpf9L-xn-qD_4U6Q@mail.gmail.com>
X-Gm-Features: AcwNN1XqgKT4w_HXWtn4Y9fm8kvbc5sNYhBHCQ08jgA0R_r3KSaIYmzU-ZXgbgE
Message-ID: <CAMuHMdWH2ojjcpKK4vDWQWw7buj67H4y9=Mpf9L-xn-qD_4U6Q@mail.gmail.com>
Subject: Re: [PATCH 03/10] pmdomain: renesas: rcar-sys: Add r8a774a3 support
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

Hi Ayman,

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC power areas
> to the R-Car SYSC driver. The RZ/G2M v3.0 SYSC is similar to the RZ/G2M
> v1.3 SYSC, however it lacks the A2VC0 power area.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/pmdomain/renesas/r8a774a3-sysc.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G2M v3.0 System Controller
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + *
> + * Based on Renesas R-Car M3-W System Controller
> + * Copyright (C) 2016 Glider bvba
> + */
> +
> +#include <linux/kernel.h>
> +
> +#include <dt-bindings/power/r8a774a3-sysc.h>
> +
> +#include "rcar-sysc.h"
> +
> +static const struct rcar_sysc_area r8a774a3_areas[] __initconst = {
> +       { "always-on",     0, 0, R8A774A3_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
> +       { "ca57-scu",  0x1c0, 0, R8A774A3_PD_CA57_SCU, R8A774A3_PD_ALWAYS_ON,
> +         PD_SCU },
> +       { "ca57-cpu0",  0x80, 0, R8A774A3_PD_CA57_CPU0, R8A774A3_PD_CA57_SCU,
> +         PD_CPU_NOCR },
> +       { "ca57-cpu1",  0x80, 1, R8A774A3_PD_CA57_CPU1, R8A774A3_PD_CA57_SCU,
> +         PD_CPU_NOCR},

Please add a space before the closing curly brace.

> +       { "ca53-scu",  0x140, 0, R8A774A3_PD_CA53_SCU, R8A774A3_PD_ALWAYS_ON,
> +         PD_SCU },
> +       { "ca53-cpu0", 0x200, 0, R8A774A3_PD_CA53_CPU0, R8A774A3_PD_CA53_SCU,
> +         PD_CPU_NOCR },
> +       { "ca53-cpu1", 0x200, 1, R8A774A3_PD_CA53_CPU1, R8A774A3_PD_CA53_SCU,
> +         PD_CPU_NOCR },
> +       { "ca53-cpu2", 0x200, 2, R8A774A3_PD_CA53_CPU2, R8A774A3_PD_CA53_SCU,
> +         PD_CPU_NOCR },
> +       { "ca53-cpu3", 0x200, 3, R8A774A3_PD_CA53_CPU3, R8A774A3_PD_CA53_SCU,
> +         PD_CPU_NOCR },
> +       { "a3vc",      0x380, 0, R8A774A3_PD_A3VC, R8A774A3_PD_ALWAYS_ON },
> +       { "a2vc1",     0x3c0, 1, R8A774A3_PD_A2VC1, R8A774A3_PD_A3VC },
> +       { "3dg-a",     0x100, 0, R8A774A3_PD_3DG_A, R8A774A3_PD_ALWAYS_ON },
> +       { "3dg-b",     0x100, 1, R8A774A3_PD_3DG_B, R8A774A3_PD_3DG_A },
> +};

For the content:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
