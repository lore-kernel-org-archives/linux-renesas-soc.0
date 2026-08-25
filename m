Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D36F415B76
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660907; cv=none; b=iR0jQ/TmSG6+YOspZxLzXlkNPC+qBBrLzmkrOtRCNk3bsC2B+iZAk5u+lgTdKolaifBJA88yRdPYqhLdvsZMQZlF4DsLhU2FmVZtdhEzY14OB2HD+vJuNe0cDoLeOKoegaBLpSxUYHJVIdaSqszalQnZzh6fZc+ymWkeOaChWaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660907; c=relaxed/simple;
	bh=ok07ERH/NwgqhzqDl0baL8HLrodhlClduOLX6Z5TrNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PuTVaUWbp6VoNFyaicKzky8hlgjz5ovcvCVVUyTgD6hNWKOgJGCtwZjedmmC2kaGgjL1oKfXjf0XbwFcSJfe5v/bOrqg5B0dXN5OswXVAdEMfU/t+hPVpMtAB6y2qTjfKwsJPpWifq27iTK6NqXv9e+PEa5Z19Hjuwe10bZojDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfb3347ce0so1812257e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660905; x=1788265705;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PcH15y8twR6KC4dsUQbRnnIWb4o2clyuM/4NKdId/5Y=;
        b=VCqoIOFRiVctiMdvgriSS2tHzdNaFGIS+JUAtrHZ8g9FzwySqpm30dBCPrtFTbE05H
         TIqszkyvbwjAlmyNg616c718SnPKcFn9Flvbe1b/TQuIyAQ3jXkHSnnDjCPJOn2+UY2B
         F1CI6SQ/98sBxxzPuC7QrZUkylpQ8CoQLuqIQv1t/WkDoJ4AonLdIM528NgfoUgrGgc5
         YbSJcmDjzJnGPtXq7kJzxy0kJcP935QRpuiv3FqR4ZmGPgn34yfLrS296OvPgZb8ZZeo
         fkkuEnzu3uLXLnT5F5L39oQFBTlnbTB2b77g45AQPY3koAsQRver+MRiByjhx+g0h6+s
         +j0g==
X-Forwarded-Encrypted: i=1; AHgh+Ro4K6aepVe7TNd/VgKRMbhMgSRr9UlRQVSV9+G04eJTAodh9PkrwtxbUyZYwKlb3n/+HliaY7ah5gtui2I1Lb9Spw==@vger.kernel.org
X-Gm-Message-State: AFuF++kW5KulyY8C8CxOJz2a8ngFefk93dwhghCPCqthDCf/pJ0QGm9Q
	MQKxS8nIj7AUoM+3CeadW43kSW6CwLeNONSENYv9MEgg0qugFrRsJJmd4f/rfNXLAYs=
X-Gm-Gg: AR+sD12TqAnh9VF9+GPu2guCjkZr2HP2lfBGcS3NZOLkBvmSssXhJhhYTtGAM6oUyzI
	2PAUOpFSnBECqptNfD0e/ueaVowrv7zaffRp7hdRq/avahLTTIWAwtVZVO659i4wnKfj6/pEm3P
	hSvCkOQH66GOHA2UKAG+vSwrFSzUkJiJtHLaRbXOjqqwhH2JxPjjeTH8nA85rXKfCEK2kacvIlJ
	0RJP4GqR841z4M8PmkBwXvOWDUibgLjb9QSIKzkQWXDYKdvYnjEBGaVjpZ1pi+H/GH7pfve5/dr
	6uPKZGr1QYNbiaEgOm31ZNhscNBuiDWIlRTdgM0oA9JYoXUEB7GhG2XhcJ78O1rkNxyY4lQMkye
	EHMlEn0Ag74n7CIkWu+3w00HlYnYcZBtMwZYsrfBBXQ9csh5k/sVPCTly/iSvnr2r3ngLgRtAdH
	8JMO9S1MNCECBUQIKBIzhHKh7vaBIyw9XdLkvNP6E8EG3WlYzrU9QM2ktbI+f9iV66DY55Vn5uy
	/3n+ABP0t6EqpOXZ3yVf/rIfQ==
X-Received: by 2002:a05:6122:488f:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c5ff7bc547mr13264534e0c.3.1787660905251;
        Tue, 25 Aug 2026 05:28:25 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623ee51d2sm5928972e0c.13.2026.08.25.05.28.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:28:21 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9696319e14dso1540318241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:28:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RofPjVzWORzDIR4MvOn7KsZJZdEJ45c2W3UAza/rV98pxkRQl33PNrSvUnC8Hu0XGcH3WlLDyocH42VA+UAcBwnpw==@vger.kernel.org
X-Received: by 2002:a05:6102:5094:b0:781:7ce2:1896 with SMTP id
 ada2fe7eead31-7817ce23603mr428191137.6.1787660899827; Tue, 25 Aug 2026
 05:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:28:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWmoHO2BETYFrKT68D8+Ma_t4NYiFZ=DyXnT-HeCJq8yQ@mail.gmail.com>
X-Gm-Features: AcwNN1UWpDCFj0N_VaU-Rs-_PsGCZWtHQVesPIowDRB6pC65FgGL5i3thBl2XoE
Message-ID: <CAMuHMdWmoHO2BETYFrKT68D8+Ma_t4NYiFZ=DyXnT-HeCJq8yQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] dt-bindings: watchdog: renesas,r9a09g057-wdt: Add
 CPG/MSSR syscon support
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

On Mon, 17 Aug 2026 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
> resides within the CPG/MSSR block rather than the WDT address space
> itself.
>
> Previously, this was handled by including a second register range in the
> "reg" property. However, this is architecturally incorrect as the CPG/MSSR
> block consists of two distinct regions (0x80280000 and 0x81280000) that
> contain registers for multiple peripheral blocks.
>
> Since the CPG/MSSR block is a multi-function block, introduce the
> "renesas,sysc" phandle-array property to allow the WDT driver to access
> its control register via this shared regmap.
>
> Mark the use of a second "reg" entry as deprecated in favor of the
> new phandle-array approach for SoCs that require WDTDCR access.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
