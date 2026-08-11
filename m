Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2DA426EB9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439730; cv=none; b=MZaKY/cbQjgOxJJWiyoIGshnZGbiT4XarD5VSLA57umjOiDyFg7/uTpXbB1yGYDG+pAC2RwlcaOGzDwtd8SKrrXb1Y4TXWUYY5g/5qt2yjFZ2wLZmQ5LLWkQuu/hI3KFVgczkzIH5SIP13ve6B+JL3cfMewiQdITL8CmAWMT5pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439730; c=relaxed/simple;
	bh=/UkVbiyABCOWkQkk1ensSSE3l3aZFpZe6kVjhYLKH8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=utK2qKZEfjZIobbcjWuqVodM/apd2UQD5ivz97gXSnKT8xdjtDYNScB3Lhysnx1ip1twytIxrTIdwFCCmF2VeWzGkDWRtDXOHernb2zB3cKHWr8itfjDJwS9O7J4Woy+Y9+9odZ+RIQfcNhHEbCbVPOppuMnFaiibIX6taoFVKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9690c99c917so184130241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 02:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439728; x=1787044528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14plqPeyH6RsdU2VmFKnJtMB+pmrsGKI/JGoWS24hKY=;
        b=YFqpRst9H+D9QplZgJHJDkm+0hKokDV8ISSzGNqWeGWhhmoO6Dy3KfmCndDfenIMt/
         eKyX3O5GKzjVWOktfXJC/S2/gfu0XHvD7IbEsuvpTEmYjePj5UVIpxYyWzPA70gVXFiE
         nETf4+Qe/ehdXmPsq62QKZTv1v1p09PxCvgpUu96UvaJ/LXNaQfvjvMg7aUOgjKtE8Lm
         46gCAezDZEpNzylFmr81iHkqJ9gJFRSF8BEhbTrcE5ElTk1MGGkKPeNT2RmVXeNu/Fd9
         SZ5u66FZ7zJ0581e7+u4Cp6o/DkrtBAieptmO1z7oZcJhIo+On6OBThCYtK9iLvw4dsA
         wD1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrYgSaUTqMbQvSizBsknY9iGZXxHHg/dzNabovf6ypolE3eiHHjqGK3ye78GGwEOPC3BEFvSMmj/LMfgQH3bmA5/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEJGDWQN1Qpeet0bFsygJ4mhEPqWG8gCRdBtWYOhCTt8cMWs0X
	isjsGPX48G/lVXCs1+4aBerfvhKs3zo12Ey15FJNcQdh4MFy6v+VYYeicUINrX6+
X-Gm-Gg: AR+sD13XocPHdQquJUCOYInRYTrNMXaYuECONZ07QpOTd6HaZpclmNkOzP4UmLoYCv3
	H2CXGZ/kBB3y/PfUfw2OUAZdlsnTdk5Lrc501I8SPgLBABDR/hIkFB+vTxuulTnTEX33kIK7liq
	o+MacEg2P4JI3OFITM3gnGnH4aI4Sxm4FR7Ilhe/MGRzr5RFjhuzgyJzImBgiCxIXI2ZGeDEblQ
	+2gGOwQyp8Ibk4lAZIJOsIK36VU5M+60rtvIJ+ipnfhzdjcdbaZD+yb9XCOZ/C9knFu4H7e1vih
	YsfnhgjfYxhdUT2TWqkvYpVz3/V3gGzOHiFhSJOL76/OIPdK3WAJ2vmqpe0vtD5JMCXzD69POUK
	TIzPoYU+miGIceo1OvWD5KoRufcJ1PYowTjCGgTxlK+OyAikPufUA5M+KIXo3J3LsB5G1dysx7j
	huHgH5h7LeiUgLgw6Se8Mi/CDpw1yhz+aMjtCtPzdeObrRLWJ6SP4lx+8kMJVy1slvPvW6B/aDA
	Xlk0lOk4z1ZOvNGI8jE01KqZg==
X-Received: by 2002:a05:6102:4b1c:b0:738:9bf0:f80c with SMTP id ada2fe7eead31-76b576c23c9mr421152137.9.1786439727638;
        Tue, 11 Aug 2026 02:15:27 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76b6328b2b0sm310883137.4.2026.08.11.02.15.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 02:15:26 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9696319e14dso193788241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 02:15:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqs/GC2ewsjSawiKaRawXKKimH20VsVShOXivl1pIlkXY71Ac1jftiEwQym3wQg4axLLZQYMkT0xXm3DkfpVQ1Wjw==@vger.kernel.org
X-Received: by 2002:a05:6102:941:b0:738:1fcb:f276 with SMTP id
 ada2fe7eead31-76b5527db20mr448203137.1.1786439726421; Tue, 11 Aug 2026
 02:15:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785941595.git.geert+renesas@glider.be> <CAPx+jO87d7H92KSR7R7ObR05sM2JcHBCo+YuUf_1gE-KwhR7CQ@mail.gmail.com>
 <CAMuHMdW78wFHKP8n2P_MEVASO3MFHCjXkEWSFXfE3-mCjkhsgA@mail.gmail.com>
In-Reply-To: <CAMuHMdW78wFHKP8n2P_MEVASO3MFHCjXkEWSFXfE3-mCjkhsgA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 11:15:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV15qa+bntYdeEysEc3rJ4dNhQxiVJd-moAGTNyfPdDkA@mail.gmail.com>
X-Gm-Features: AUfX_mzrvqkMTS8THhoJKajeDFG8F23c6THOaD8Dreq76GI2rXJHX-LkuIBfF_U
Message-ID: <CAMuHMdV15qa+bntYdeEysEc3rJ4dNhQxiVJd-moAGTNyfPdDkA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] R-Car X5H CPG/MDLC support
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

On Mon, 10 Aug 2026 at 16:50, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
> On Mon, 10 Aug 2026 at 16:18, Ulf Hansson <ulf.hansson@oss.qualcomm.com> =
wrote:
> > On Wed, Aug 5, 2026 at 5:21=E2=80=AFPM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > This patch series adds minimal support for the Renesas R-Car X5H Cloc=
k
> > > Pulse Generator (CPG) and Module Controller (MDLC), to aim for replac=
ing
> > > the dummy clocks in r8a78000.dtsi with proper hardware description.
> > > These two components are closely related, in the sense that they are
> > > both supposed to be accessed through the ARM System Control and
> > > Management Interface (SCMI) on the Ironhide development board.
> > >
> > > This series consists of three parts:
> > >   1. Patches 1-2 add DT bindings and DT binding definitions,
> > >   2. Patches 3-4 add minimal CPG and MDLC drivers,
> > >   3. Patches 5-6 update the DTS.
> > > Note that this series depends on v7.2-rc2, due to the use of
> > > <linux/device-id/of.h>.
> > >
> > > Changes compared to v2[1]:
> > >   - Add Acked-by, Reviewed-by,
> > >   - Add fixed-rate clocks to kerneldoc of r8a78000_cpg_priv.map,
> > >   - Use devm_clk_hw_register_fixed_rate(), drop unregister_fixed_clks=
(),
> > >   - Drop fill_clk_map(), as it is not really needed until SCMI remapp=
ing
> > >     support is added later,
> > >   - Replace <linux/mod_devicetable.h> by more specific
> > >     <linux/device-id/of.h> in v7.2-rc2,
> > >   - Add a comment to document only always-on domains are supported,
> > >   - Consistently use /* sentinel */ for zero sentinels,
> > >   - Drop trailing commas from sentinels,
> > >   - Sort MDLC nodes (alphabetically, by label).
> > >
> > > Major changes compared to v1[2] (more detail in the individual patche=
s):
> > >   - Add default support not using SCMI,
> > >   - Drop everything related to SCMI.
> > >
> > > Note that this series does not use or rely on SCMI in any way.
> > > SCMI remapping support will be added in a subsequent series (old vers=
ion
> > > at [3]).
> > > Full hardware support without using SCMI could be added, too, if anyo=
ne
> > > would care about that use case.
> > >
> > > For testing, I have pushed this series plus additional work (includin=
g
> > > a rebased and updated version of [3]) to [4].
> > >
> > > While I know it is getting late in the cycle, this work (especially t=
he
> > > DT bindings) are a dependency for about any R-Car X5H progress, so it
> > > would be good to have it included in v7.3.
> > > Hence I plan to queue the clock patches (1, 3) in renesas-clk for v7.=
3
> > > (Stephen still hasn't merged my earlier PR for v7.3 anyway).
> > > Ulf: It would be great if you could take the pmdomain patches (2, 4).
> >
> > Patch 2 applied for next, but I left patch4 for now as it didn't apply
>
> Thank you!
>
> > cleanly (drivers/soc/renesas/Kconfig had a conflict), thanks!
>
> I guess your tree still has the duplicate "default ARCH_RENESAS"?
> Patch 4 just adds a single line there, and the conflict should be easy
> to fix.
>
> If you want to send me a new patch, please let me know.

I have sent a v4 against pmdomain/next:
https://lore.kernel.org/all/d4bd0cc7f26c1bcdc260edb994b4971cb5dd3a10.178643=
8424.git.geert+renesas@glider.be/

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
