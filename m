Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643733DDB17
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Aug 2026 07:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916016; cv=none; b=akQA1v5KLYHiU+qx5M+UmZyIPg2dwN//cw3xgyaYAGo8m60PIGg5Gvb89FVJTifTssS0xwXNbPi/V+k0ON8y5yr0Cy5wa/Tit0mrC/N8Xm2wlhWRkOKdx7goCK0DyZp69obRyj7ksylefOsY40D3mvkkfkCjT3ppUZDvjtysHV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916016; c=relaxed/simple;
	bh=G59qDOx2jTd9qjsp0+h9RG2oLDW00rHwlre2kDIhz+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vja7rgWQiv4FP0iG0gSN6lB8d8n0Gt3OtcYFt305RN3/YumBGUy2g4EvECrIDqX+ru2lcTtzHiuqKo7Dj+YYVyVMqyMQK3I5zEEZ3O6hs87e5e1tPcg8krE/2h1caGUNJC8DC6vTc5ukkSxRY7ec9X7cvmrFfImx7zCGvX3FHLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-75609e844faso494480137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Aug 2026 00:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785916014; x=1786520814;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v9f2bbRgE8MWMbDEyixm1GtPCGsIBoMbuqXI3KLjQ8I=;
        b=Vqy6cC2imejQ+J+t1hWF7Ppe7MkH9bNbtQ7+S7v16yn+RDOiCpH6qVaGKvjdlhffUP
         XlS2BiHttbA+0RQxGyNpBKeynUp8dfjNNtcfxGsGoJIvP9jV+9F10wHeRjMmV+oGKJof
         XnnnOeWQ0KIdZw8rNCm9VY0c4WctBUbefbqXDDgBBtUEy/ELQh/Qqgnw5h4SB4z7Uw7l
         Z0yxDXUwBtKzbXIRkDTkG/NyOkhKPR3pSBzF2BYMU8kFsqf+GLsWXDmXS+Flpt7ptf8m
         tauvAiZYwaU4Iq8oWYlqEhr2ik3nShLXTgUQZ2YYehlrvSTyKoWqGw9f+kWGqiEHwSeA
         brTg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8vLIrKFRoWbmb688gAOuOUJsd8b313OpRViaPIhQyDFfhXi9O/34sjKU9CZe3Mojm+jxPIA9JKZ8bsqFKNvf+Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+8zLDb274Cu+SW+UZxbIxS1XI33lTvf1rEnsb1+jx1BOkUqIx
	EhTJce3OWDkDpvh8lA0l3t5aIIzmYzVmwetu7yBPQSxNbXA7aSmfHRANJHu+6/92
X-Gm-Gg: AR+sD11sPBzOy8Jwqd4ucyrUJufhpu7DanIoLJG9iuPswntg+b4c/QSJy1OW02r2K4G
	4/7JltLn98Gh2LF+f/O53ReRZMM4VFjJmAsdUWxm20XLpGL6TuPJUcCuobhjsLV/B2mDvbPQsRL
	lvz+R1DQJbyWs+5gs0t/N8cMi5Qgz+GWGG34dS/JWUpgalsn3iWzd88yvxA6NGjnFPLiJH+umSt
	z1vpHNsFpd9u+IGwxzz2Sb2ClNpKmmoXpRARaefK9hJ4mOjHgo8dHXVu8nsn1d2z8q8iYbxI58E
	Vvtn40qf1quK2bpIzmBfht7BIGQZoyZuK9QP7PwyBnoZobf1UIz91Q2AkeF44XJM1fKbgByXHm6
	8LUd+F+acqF0IWYkvxoaZyRzvS6V8qEJYhfJeqYu0D8r2aFr2lfhmLpkVz4Gxt28/czzxnj/iSV
	1roJ6rpLdIGRTyoNkYUqXp3feX1lIc4SU42SyJXP307IjOzFHoP8HPHbnyUTfCr0yVzoW/eMyd1
	gO3mq8jLhVy83GB/0Ogn6FScw==
X-Received: by 2002:a05:6102:418f:b0:613:3fff:febc with SMTP id ada2fe7eead31-760d588689cmr627045137.2.1785916014251;
        Wed, 05 Aug 2026 00:46:54 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76048764defsm1739190137.8.2026.08.05.00.46.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 00:46:53 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7377dde7bc6so986239137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Aug 2026 00:46:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrdIUKUhsU9NMWPD6GTEjsWodu5PxN/F8D1WRAN/XRMxsb1ykJjFQ5gXuJKWNItLfZF0wQ/gTw2YRglevYcZiRtLw==@vger.kernel.org
X-Received: by 2002:a67:e8d0:0:b0:738:f27:43fc with SMTP id
 ada2fe7eead31-75f741509f1mr1478257137.2.1785916012832; Wed, 05 Aug 2026
 00:46:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721082952.215691-1-herve.codina@bootlin.com>
 <20260721082952.215691-2-herve.codina@bootlin.com> <anJGNyNxcSAwylK8@ninjato>
In-Reply-To: <anJGNyNxcSAwylK8@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Aug 2026 09:46:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUn+di4YWAGS+CeBiCD_9EhqUz0O4FkuHZwmPo531+7Tg@mail.gmail.com>
X-Gm-Features: AUfX_mznd8_0iTIOHpj7a9PH_3O9MrcjKogeVMZS0BvwuG3MgvXrPfPog8GoIxA
Message-ID: <CAMuHMdUn+di4YWAGS+CeBiCD_9EhqUz0O4FkuHZwmPo531+7Tg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: timer: Add the Renesas RZ/N1 timer
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 4 Aug 2026 at 22:06, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Tue, Jul 21, 2026 at 10:29:47AM +0200, Herve Codina (Schneider Electric) wrote:
> > The Renesas RZ/N1 timer block controller is the controller in charge of
> > timers available in the Renesas RZ/N1 SoCs family.
> >
> > This controller handles 8 timers:
> >  - 6 16-bit timers
> >  - 2 32-bit timers
> >
> > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> In general:
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> One nit:
>
> > +        reg = <0x51001000 0x400>;
>
> Isn't 0x400 a bit excessive? The last documented register in my docs is
> 0x114, so maybe 0x200 will do above?

FTR, 0x200 or 0x400 does not make much of a difference, as this is
mapped in PAGE_SIZE units anyway.

According to Table 2.1 ("Register Map") in the RZ/N1 Introduction
document it could even be 0x1000...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
