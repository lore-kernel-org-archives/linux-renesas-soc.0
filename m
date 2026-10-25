Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792926601;
	b=Hwso1rCtirqSX/FG8BIHfQ+2h7ESAerxogCWzY7dEWu+UdaLR5k/RV1FCrwxeP7EaLtK
	 oyhcF01Xlj1DBF0kW+jtMbMLB1eO+wGNZDdlU+fVAJA2omCW8df7iBZNBlNzJq0rXp+dZ
	 xd1Ylw4RdKAyJVoVxedaE/KnXhGGGEu8RDBWfZRwgOwV2z/sFyvWVceQIGnNjsB9e4G5X
	 4l7MOdM4qOaTSR123yzjX8fss/qYsktkswinujQk3T6iZDXmWRl4tVKsGJl+snue/wouM
	 ILWP8QsNBVu5YmA+MLSgJCrDxjhe39dbALEflG5hLBXxwfbiHk4nkPqiKzeytWTKPQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792926601;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=GjtDmUDJ7P9a7dCWsPAQRfLzfmaw50jjj96MMkbrG+o=;
	b=0H6TqCDSu2eetkc2P8HvKJKtoEqqNbAZL9s9aJp3Sq0J3rOYVcP0baWiPb9Vd7NQcvow
	 vt8Kktn/L3Ehzz98yd1wh8qSLeWt4UqMc09vVVb8mjS8pjuuX0FOc6rbIOhXtGJ5ZDiao
	 gOIj25wn3gyfCqNWhd6VGnU3Ru9CtGF7ZSggQVMFiRNxRc5vW6TyuRCXlk/wvixQIv2Hy
	 lpm9s53PwDX+kpeEcr005FMEoIyuJbaRBYBgdpB/8UY3vqzCIOTpraK91H5Y8Ck3OR5CP
	 i+MCGDWZOEb4/bhEK4ZnpCvv1mN0A5MB8O1XROwpnJGiirks3KtQ8kmwPmGqlFoPKSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDC0606A31A
	for <linux-renesas-soc@vger.kernel.org>; Sun, 25 Oct 2026 11:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BDC0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4af81963f35so1514665b6e.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 25 Oct 2026 04:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792926600; x=1793531400;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GjtDmUDJ7P9a7dCWsPAQRfLzfmaw50jjj96MMkbrG+o=;
        b=2BYlP3g2sJiul2Xphu/J1GC42ERKFhVuTGSghRo4yhlQU1sRjfHrLM9nR7OG8kueqR
         4O698sObvbRHFDkPK+AR6IL6uO1Eex+5cURUmviDy6odXNftwLEZrht3zsGJZ+aahH6R
         V3KWmztwoNAkT1jWPpysGcvsjF/8T0V/NU8Jadbz8f9aft9TjwKra+vQAQVybi4bntiL
         EHQC5LHKBoEdOHoksXZagV23UPx2eCO4OT0KiyzPHsGL2hOAnxfSQr4cy5MAMp99h0LQ
         wuMx/edP4JLZBRPU+WSZ2DjaxC+hyKYo007tPBtTmgzCRUgzerZs9rlF4+GcmzNBoUF/
         i9jQ==
X-Forwarded-Encrypted: i=1; AKwUvByiqwoqHXd1iORbVNufe9M6nnd8agD+QhIA/1OF3D6Ve5vzoihTKUw7hB9cgnNwnwgSb7yY+pHH7GshPFZ3RizTVw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKjN5dEDacz/JO1fFyp2gyM5dcrCj5LPSJJHVm14MgLkvTtLCBx
	TvNiIrxfJFxX6yIXWCk8CHDbdi0QCcouteAhJKuiimypIx+DxyEk75inTtUgRV0U
X-Gm-Gg: AYBFou2C4KBGC8ny0kh5666XCtPf/IWT16zXrm+KCEx7V74AiOdz+qPO5zQM5PdMwAa
	8BMLfu2OarNKNq9uS1plT7lgnGxgOE1nxlLDSCVBUwymL0ydI76/G7s7V32zJpg6Bu8E+2dB1Xs
	y4hhtQ7m4RPTZmPVYwTbTpOkkGWk7pB8peiLB7OInBKoXbYI4HLs6OubhS8GhMAKUGYm2CCrg8X
	okblKysjxdERg7UqMrPfpNSjE1gTGEq3IJ8QRMtO0faLhd7H1EAVd8UZXHOiyOKnFjth+qYu23P
	Z561gsqbvNVzarBsCe1FgYtCpdLfdqxSeI7WR2UUSA1YJbgyfKOe04UFAwDsYk8t6Ndr48m0SE8
	lm9W8s8gnCJtdSQGAYFEPqjhDAeXG7dUjx0AIHHKcloCSe+JS+tt3Un8vmJ1m1ElSB6FV8CzkfR
	DKKZi6rgKnfCzJA3HIDlNMtglrRgY1E8VM1IpqVTElv95TZAoo0ulKDPU3fhftcDzDvXSakY/BO
	jJeoin37MBkyOatyNaVkcOdo3DFJaCVSu53e+jbC8slv7ZAc3+zGNlqUER6x92NbRivySGT08CW
	AwB1e+9QBZwobRJSRQ==
X-Received: by 2002:a05:6808:10c5:b0:4f5:4780:582 with SMTP id 5614622812f47-55c0035bd31mr2611631b6e.50.1792926600380;
        Sun, 25 Oct 2026 04:10:00 -0700 (PDT)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com. [209.85.160.42])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c043115bcsm3007519b6e.15.2026.10.25.04.09.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 04:09:59 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-47b47de8b4cso1197185fac.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 25 Oct 2026 04:09:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxzoS55RXuwZk/hCgcgXWW6k477k+FZOaF8RnIAh1vTiJBuSA0QPbMFw7wmLQJBlV3g3FWUXZgydC8ygPFrTN6pMw==@vger.kernel.org
X-Received: by 2002:a05:6102:4423:b0:7cc:776:6c54 with SMTP id
 ada2fe7eead31-7ce5cd246a2mr1349167137.21.1792926141152; Sun, 25 Oct 2026
 04:02:21 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <f9de8214043ad4c8748fadce7fd2cc2fa95b1291.1792776697.git.geert+renesas@glider.be>
 <d870c163-8d90-48c0-bae0-5f6e0e38c5bc@mailbox.org>
In-Reply-To: <d870c163-8d90-48c0-bae0-5f6e0e38c5bc@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 25 Oct 2026 12:02:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcxDY2q7MK6Zj5MFi-4UVJe=i8L=gWSTCmLE4NMjdh4Q@mail.gmail.com>
X-Gm-Features: AclHuK8CaW_17mlyRa4Y7XpLgXIYuKk4YmAF6_as85fetPG-fOFZ1fPRmRtKgD8
Message-ID: <CAMuHMdVcxDY2q7MK6Zj5MFi-4UVJe=i8L=gWSTCmLE4NMjdh4Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm64: dts: renesas: r8a78000: Add GPIO controller nodes
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 24 Oct 2026 at 07:35, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/23/26 7:50 PM, Geert Uytterhoeven wrote:
> > From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > Add device nodes for the General-Purpose Input/Output Ports (GPIO) on
> > the Renesas R-Car X5H (R8A78000) SoC.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > Co-developed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Changes compared to Marek's original:
> >    - Use hardware clocks/power-domains/resets instead of direct SCMI
> >      references,
> >    - Drop gpio-ranges properties for now, as upstream lacks Pin Function
> >      Controller (PFC) support.
>
> Is that ^ OK ? If so, good, TIL.

Yes, it works without PFC, as long as the pins are kept at their reset
state or configured for GPIO before Linux boots, which is the case
for the pins on the PWM connector.

> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks!

BTW, looks like I used a wrong base for submitting, as the context does
include the pfc node, which is not present in upstream ;-)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
