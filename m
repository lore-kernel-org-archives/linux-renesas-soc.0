Received: from mail-qk2-f4.google.com (mail-qk2-f4.google.com [74.125.230.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9383476CE7
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Aug 2026 13:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109433; cv=none; b=nC3IkYaGRIhMjlQGZ/icaTjBPQ3GrE/noL72AboyLZenv4dvy/KOSoHaZzKRLyoDW4m54zBUq4OONQ2e4TFmJpD3uJZcio8M8n2YAQMwfrdhUuaj1O0sQfz+Wnz86kG5q19ONmHabdmzBEbuhOqUiNbdIykWicOYZUi0f8dwszg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109433; c=relaxed/simple;
	bh=lNRMCMZWJrIGh1fhRbztqbQIc9J7TxN7ZrtNGrtgNXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAntADJtLi2rXETl2SzaWKCs0TW52s23tUbJCqY4Q0irbztVLXzCRio+3if//EGu30F7CHoN/ZKV8ayDBqyyDp6e1tupALc3Neq5iNH2c6fIu3TorMMlH3tRekgPP3K/dUTKKecWOMsYuAjDGlZdl3JpNTlBnPX8W56i4eKCYWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f4.google.com with SMTP id d75a77b69052e-51c26eb5e81so9265911cf.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 06:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786109425; x=1786714225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/AAuSUTI9BlhHsMbAPbLkKHE3Mv88lOoxgJOEPTw6U=;
        b=qLTTvHhFHD8TDVj21z9emGpyjV9HdSJMVg4ho7TqasJuvkCuCj+hoJwlHfRq/Yr3iI
         K74xVGoL82onzAzG9zta5Nu382C6OOelAa8IaXWLJMPQB6Ja9PR5WQRyoOJiFlymfRho
         n7rcSIR3LAvGQbG6eF6ban08MXw98/oFWjfffHnj2Hf70yIMLyXmE+gr8YoAikSHfjBR
         XBgFH0EEdC1a91WmvJr5Vx5Y/PJvfvoD4ndOiVmK/d+rL6cMg6DzX7ZdOfx4lLnd8CeC
         cB/0nZm8jxf51nSQhTBeYAVnR2IUHbCw/Xzfh53bNCnAPNH0MiVOW2z5t0fy/whS3Rqt
         kCsA==
X-Forwarded-Encrypted: i=1; AHgh+RruZgmVNSNt1o7PqW0TuwvYxWenAkZ3Mrg+hp4RpBpqa1PcgWwlAvpXkGafiWY0RjiXuDuu7lBTLX8x8Sxu8GC+CQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvSWx7rMDavmPNRuQJwjxue2PGT6dlCBRQT2KXyYqAD8p0WrBC
	M9KdJ/vIbzrP6ouXBDTZAfhzhzIvFIKEdbxEZ1YFUOBY7UfYSCUNarymdN6+cDL/d7c=
X-Gm-Gg: AR+sD11YSg2Sb6jDgLMBO4Rgc/Sm2Cu/LUTHM3dXGmVi/509GzkyH3XX6nOyCyWjPiZ
	1e6cto2qTpW0qAsVg/+9UuBmbvKyc3oISDbieNB/OgI/qFQArJorAgGzG014BtHyq0ddqv25i+m
	vHnAqi4jLUg4kAm1WbJSprcEUjRBtb6LRBgHPbaLlBKKOVpKLSBOnryoO/h8r6a+iAAkzLErlML
	bngYXvhdC1yi0JNfeeJDHVzUcv083l6Br/WHhZts+9JOY0e62bZ0XPyDp5erNqMb1x6KivrTb/Q
	Inr0vk0y+Cu1QfASXgH4FWZGOrhSbyN6EKu/L/n1r73hfSsWfWkMHnjd5rtM0E3Km0PGlGNS2Rd
	1w+EZQMWAQLuZURTzPQ8WRQDC6ZIi6UlpSZ0Zi/t6vvbnnwhJKV8Zb7gz/x1FK1gf/QxIeW70ap
	Iz/q7Swi8Q4HA9jAxJ7VvIQpO+wbegmShAac92a6c0c8487iWmMebwZyFd5uUXLT6TTgBNzs5fM
	PJPZBzqLnvA3GwgPr8DWggg9Q==
X-Received: by 2002:a05:6214:21cc:b0:908:23fd:813e with SMTP id 6a1803df08f44-9088125edbbmr264825786d6.18.1786109424584;
        Fri, 07 Aug 2026 06:30:24 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a918dc65sm8881236d6.6.2026.08.07.06.30.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 06:30:23 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-977bbf2eb1dso1426923241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 06:30:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpLuZNw/ysCiI6nsaAy8kITTM5LeeURPgnalBorUuev6JvZTZHUmnYTVQX8r28wCzV19gQphtqtOsKRJjkmuJ46ug==@vger.kernel.org
X-Received: by 2002:a05:6102:1491:b0:740:2d40:a234 with SMTP id
 ada2fe7eead31-760e934083fmr7749766137.9.1786109422395; Fri, 07 Aug 2026
 06:30:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260716123434.2576253-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260720-fractal-prodigious-spoonbill-86f534@quoll> <CA+V-a8tfCL58j2TvoO1VhhDAZf=8LB89R4O0SycLghYGf7Rr4w@mail.gmail.com>
 <2323f9bd-0b1e-41be-8c8d-6906b66b625f@kernel.org> <CA+V-a8sHbc9WSqmzrONjWbLY1+SSEhK3kGOjL9zmVmhSttD31g@mail.gmail.com>
In-Reply-To: <CA+V-a8sHbc9WSqmzrONjWbLY1+SSEhK3kGOjL9zmVmhSttD31g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Aug 2026 15:30:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwPdPwKV++3GBvm_yEY0pqvT-KxBr==g8LQFRvZkBnjw@mail.gmail.com>
X-Gm-Features: AUfX_mxDi0guSe9Khaez7xiSfow3Ijch9zm2XE5dr_dyKyhIvomQpIBNYO4wzk8
Message-ID: <CAMuHMdUwPdPwKV++3GBvm_yEY0pqvT-KxBr==g8LQFRvZkBnjw@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: renesas: Split out RZ/T2H CPG binding
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, 20 Jul 2026 at 13:14, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Jul 20, 2026 at 11:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> > On 20/07/2026 12:50, Lad, Prabhakar wrote:
> > > On Mon, Jul 20, 2026 at 6:55=E2=80=AFAM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> > >> On Thu, Jul 16, 2026 at 01:34:27PM +0100, Prabhakar wrote:
> > >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >>>
> > >>> Move the RZ/T2H and RZ/N2H clock controller bindings from the gener=
ic
> > >>> renesas,cpg-mssr.yaml schema into a dedicated binding.
> > >>>
> > >>> Unlike the traditional Renesas CPG/MSSR block, the RZ/T2H and RZ/N2=
H
> > >>> system controller integrates additional functionality beyond clock =
and
> > >>> module-stop control, including reset control, clock monitor support=
,
> > >>> write-protection registers and other system management features.
> > >>
> > >> Nothing of above differences got reflected in the code, so I do not
> > >> understand this reasoning. Binding is exactly the same as the old on=
e.
> > >>
> > > A syscon regmap is implemented [0] as part of the RZ/T2H CPG driver.
> > > Since the RZ/T2H clock driver uses this syscon wrapper, a function
> > > pointer is implemented to handle the RZ/T2H-specific configuration.
> > >
> > > Also, as the initial implementation used separate device tree nodes,
> > > Geert suggested splitting this binding schema off into a dedicated
> > > file [1].
> > >
> >
> > I still miss the difference. Can you point me (can be short diff) to
> > actual difference in this binding?
> >
> Fair enough! You're right that the schema text itself doesn't differ.
> I'll drop this patch in v4 and leave the bindings in
> renesas,cpg-mssr.yaml (unless Geert has a different opinion).

Given you no longer add a bunch of RZ/T2H-specific properties
and subnodes, I no longer see a reason for the split.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
