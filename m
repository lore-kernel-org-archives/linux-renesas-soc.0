Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569764A4F17
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2026 07:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716944; cv=none; b=Wn9d1gVErxtqLYmSKIEQDWR9Q1kJWOfh1sxTzT55dNZgxOyGpdJTHcG183l8d19cbBr7qfIg//1tAlzQIiER67zXUknRGQHjJim/S9P2WWDdqpvHDSueuCgXk6gXDde2OdnJI1s287tK69dWCNLBTbOslfUhj/Y+fj7Qwd+VjGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716944; c=relaxed/simple;
	bh=cHVPOWKKfhZVIB7cWuXyuW2OrGOIzBYJeXQE3IvAcLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pr3O15lkBaIGrUIvU7A5M4zMRKCZLzhhQyYYCZqGm5UCcvp9qp+W7bObRDmCKpEqYqHVHEZhYW7ODlHae4RxFTNyXoLsHJ0FT2f04xK7WVsVu5Scf0Xoc+prig3rae+f9a52w/KBV7qNcK2vx9SS8bg9yKr26g40wHCkjwGu2p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4d8d8aso268674e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2026 00:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716935; x=1790321735;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0WtucTJYH5u+SsiRL/3DRg9hQeKGo+JDwDdtR43iO30=;
        b=OnTVRwJmkx3N342fkTPPsX5lyfBSZsncyCV3adj+4we/4qI/4q0a5iUGcKll6c0IPA
         mTNPmrwtXLsOHhYBgppCe5Xh9M6eHyiA7QuDPaRVnf1iQhj9bZjmINs8eRXDy4gm3Hvb
         jc4qZZgAWbDZ8f+SjB7I6V8P0yKITYqDttKfMNiy91nsAgG8kHB/5+8HrXpSSGQctNXc
         VTx5rO1y4Q6xp3mecNQkAddurf1Y7GGYK4TwCbleNHJ9hubyEwvxaLmr6OiTetauwhoM
         DtJzkkb2nNP/6ovjK9UKkymr1TPNpGArQKG6pKG5yC4f0uNAVo+uxUY3Od6UNtOVmGRP
         jGQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbB9D3BoWdcp3iqiXXj25LJ6gnBrmBcBj2/DxGVYukV6tsf62eKleVeeBkcqBriRqCMLC/jShsgcz3afpBmJ+ayw==@vger.kernel.org
X-Gm-Message-State: AFuF++k4i4zOwvCieRV6pHdbAse5SURbYUyTcuf527cPuVcx7wdeLZ1N
	hxmLM/PlmusPNLkmcjPlgK7wJXvUS+bpJp52/M49qzhVqW2+muqyamxtlzCS+DMF
X-Gm-Gg: AYBFou17TjogSsm8oIHICR9OB4dtPdKrCHg64lKAdzxfYfnVKvQiNw0Kzx+fUM1vy/q
	T81qFshvyYYXYRFcvGMJouFHOMJ7xF8M7ajGgUEJINQdhafVvj+qGDoLRK3sEj5Xjr3mOOnq4+S
	I42utlhy4+2KopbQhp59bzp5en+V4QCt6bC9/ozqPKLgnGPWye/R517TPzfpJi3yLUMord8/y2X
	S1NZVT/N8YE8p4BtjEnxN4QhcrDbKG7VeHOYJbL2gSx/d2edpq0f1fXxzANwc8ezTFqHghJn7HB
	hEnTryXCrt1valQrblaM8msefvRoRH0IoydnmWh1JE3sl2o4kx7FahcennQElWgExQ69T2ctSyU
	kN8jfDKiTJFXkt+ooAEnVf6F9vABX3fQMtq2j5JIXdv7l9j166jfV8SBTe+8H43Wnk6JaIYYUh9
	KwRVnauBN4LL886hhHYxepGLBp9x0ESFLnc+bjZITM/W7uAYucUPObYlRIe9tZ4V36B798Nlfa3
	xfciFXz1QddEgiaYdBkatkJrUFfKARwW+gg
X-Received: by 2002:a05:6122:400c:b0:5c9:a60c:273f with SMTP id 71dfb90a1353d-5c9b59f02c4mr563864e0c.23.1789716935125;
        Fri, 18 Sep 2026 00:35:35 -0700 (PDT)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com. [74.125.227.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9b8367082sm804955e0c.10.2026.09.18.00.35.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:35:32 -0700 (PDT)
Received: by mail-vs2-f42.google.com with SMTP id ada2fe7eead31-79028ca939aso236270137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2026 00:35:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzVQyjHLKRRLyLeQSbJoWh4omZuGn9UGL49IKyQ2PH+s/bnJGG8r5igAeGUXmyknYZue3CVVh0DrcAqFdRkx1CkAA==@vger.kernel.org
X-Received: by 2002:a05:6102:91c:b0:7a3:2e52:1163 with SMTP id
 ada2fe7eead31-7a55da9b0damr516237137.26.1789716931735; Fri, 18 Sep 2026
 00:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-0-4c72d4e086dd@ideasonboard.com>
 <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-2-4c72d4e086dd@ideasonboard.com> <20260918011156.GB145152@killaraus.ideasonboard.com>
In-Reply-To: <20260918011156.GB145152@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Sep 2026 09:35:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWwCLiQASDhr3yY6XFY1704W3tAWEPgYw77evrK9ECRg@mail.gmail.com>
X-Gm-Features: AcwNN1Uhv0ZzlOO0pTf4pD3p_OGSBmogWfpHa_8PkhuJrVnrMv3c15ALo4pMZkM
Message-ID: <CAMuHMdUWwCLiQASDhr3yY6XFY1704W3tAWEPgYw77evrK9ECRg@mail.gmail.com>
Subject: Re: [PATCH 02/10] clk: renesas: r8a78000: Add clock for FCPV and VSP
 for SCP FW SDKv4.36
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Fri, 18 Sept 2026 at 03:12, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Sep 17, 2026 at 09:04:41PM +0900, Paul Elder wrote:
> > Add clocks for the FCPV{B,I,D} and VSP{B,I}. They each have one clock
> > from an option of two: a 1066MHz and a quarter-divided 266MHz. As we
> > already have support for the 266MHz one, add just those for now.
> >
> > Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> > ---
> >  drivers/clk/renesas/r8a78000-cpg.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
> > index b820d09e1a195068debe8a6eea7a01c534a97b23..17792ff6ab8ae2f7eb5c8f7e3d581b43177e195d 100644
> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> > @@ -326,6 +326,8 @@ static const struct clk_map_in r8a78000_cpg_fw_4_31_0[] = {
> >       { R8A78000_CPG_SGASYNCD16_PERW_BUS,     FIXED_CLK(66M) },
> >       { R8A78000_CPG_S0D4_PERE_MAIN,          FIXED_CLK(200M) },
> >       { R8A78000_CPG_MSOCK_PERW_BUS,          1667 },
> > +     { R8A78000_CPG_SGD4_VIO_DP_TX,          FIXED_CLK(266M)},
> > +     { R8A78000_CPG_SGD4_VIO_DP_OTHER,       FIXED_CLK(266M)},
>
> Same comment as for 01/10. I think the two patches can be squashed
> together actually (unless Geert disagrees).

DT binding definitions are shared by driver and DT sources.
Please keep them separate, so I can apply them to the shared
renesas-r8a78000-dt-binding-defs branch.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
