Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4EE496D4C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257482; cv=pass; b=aFj8C1mdPZU7PyBjyJhOTMlbe0gHNfKRq8HTi2je3ilBeCA8hZqr7CDHoWhFO/A82ZfBNuIE93xVG/WJaSb+n7gUIMSFIpTXu3EXV9U/eO2CDTgbTYqrGGyx5123FS32HSiTWR4Cxu1RRCFjSBgwqiBpnq6/GBojtDh+imtlVf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257482; c=relaxed/simple;
	bh=srpUlNZOrzAYgQzUQn9udJrV5U4zpQZLaeztMl04WB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IvT9Jq7T7yLWof4H1RjuckPktsGxV/HqKRbaKm5iWdXKcSvm2yBasiDz0SlDXCSumLWtPKDa1iGzVTptm3x1Lsqb/0fmgUmUImNi9SH+oA7BiCo97xs30CNg8jEki3tO1rF0NRLmMYiniGY90KFCf82IkcJ/wuRuA/UggIRDrZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anxL7Pzb; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anxL7Pzb"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso1374215f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 06:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790257473; cv=none;
        d=google.com; s=arc-20260327;
        b=YY4BsjSnCqxW1frrk11FVF8Wq4RWGJmRBs9Lh97sha4VQyX9td19dTtDv67U4I369A
         TKon9RWS4O1iVKOhSJ9ILfl1CuOZ0pICr5+ySX9KQx5ayALfrFMorbxORyRc3DctDxKk
         kqZyLOp/mbzZqIL2kZ6nGRVXAp9sTF+gD2wya4Gza+aYwPoRkZ9DYdPt4idDVhVsfATQ
         uxXPrjFahRj/zgeZ34W2l6LZeBYkSu2JiQW2gWKrOFaYRG56Zlp8qUtcGPz1p+OK4PbG
         XEGscvsRbmDgfeWJkQiPFqdnSEnzu2hOT+F1fkyoNk+1HjI5zrhJqG1JS25ueCdBJHOU
         bJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1vA/7F7T4hKWXEqYJVanQp0Khdd6KmZi7BaKquhMJvs=;
        fh=zbwkHCGHLWnRe/+knXpsW5D4AiL3QitYncBRrq407B8=;
        b=XqmFNiS/4XcQ8rOXEDqYNw7cjQLaHxqQrGgpMtFNmWCXphFsTqDnFOpjNKEYIX+Q4z
         4pKuXIy8ww50n/rQ0AYceyBLE9TnfSTS9cCezdUb+d2T/EXA9UjA1q3WvFEjIMEbRXNk
         kw7Jc+R/ayFSmqBijfP9QKz6yQzYx24O5ldFZ6w5CbELZi8gJgN2dYaDVpHQ+5EC6qvh
         sTHyRoETSaEb9qZNzRFdxc5tuckMpWsZ+GaV4nA+1SLW1FCnG+NxB/IarY+P0uquZEPo
         ESaq1Z6HM/SxYiLUvMrYPNhlIRlMlrLRBLb5lFIeQoXqgvGHBRyRmX5QnzEIMhQQuZXY
         BJCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257473; x=1790862273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1vA/7F7T4hKWXEqYJVanQp0Khdd6KmZi7BaKquhMJvs=;
        b=anxL7PzbC+Glj0675LuiLX2EL9/S0omdW6sjEjFXfdLxLktXdt4fRsU8E2yTvcubGL
         xx6Th8xAIppIlgHDda/ncRZXSc4pX4BFrhfyTbpBRkXHGBQJT3vTPG5ekMNBsKsq56AO
         KnfixPD1mQlvc2FrVJSKzO/4VIw/KXnRm2OhL2VMyQEx3oHehLEjtJO/R7tUVus0Kb6Z
         9tepv+ST7PoCEPjrWOOL5ddjTImeqa62ItJKB+1Or+ikMJariaU04DK8AXjLcEhq8TzG
         b55NGZFFY/iyZQxik9NF1/UXKAXUqsPk7JlolvyalrkIeJCvbBekFUeFLkVRoDD9gzUc
         q1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257473; x=1790862273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vA/7F7T4hKWXEqYJVanQp0Khdd6KmZi7BaKquhMJvs=;
        b=KA6H9ZIhFoImAZpjRGDsNjRLaWjAdv8GLTZg96mbHzUMJdzt2wOdOHvH2nKwoa1C3W
         00S6gE4DW+iw94QU64Sbq3QugTef475AyVGTbFuHfOOTCx8I+HYJTq2OFe5w7WlPSIzc
         yplcdLUcTqyWv89du8p3Fp7MIPHBhKDTdkL+vLD9s1LBrZfEJ1VU4Z1a6qy6a/6V2nP8
         nypwr4Z9G3zhfJwc4XWHS+cuIEnA2PU/NWhzJLhW1VjXTKErCgobB8AN//62+MOX6VU3
         0+U8wkmuwZHG0+OB7kG5mUppbrkttYyXr6ajStlgg/Amp25k0a3rmID4A5GF86VamIDX
         GEJw==
X-Forwarded-Encrypted: i=1; AKwUvBzGny2GkejFQHXRExqY6/Q7wOreHbiQdrneYiPamqPQ64oNy/SaZ692XIoQG8Pk7HMHfIbNXBHhKdMXKu/x1cn5vQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k0lGg1Bm4R0EO/rlsFQPWNea0r2s8+QaGE08T0vbp4shJ7WGy0
	O9TbMTjTBX/snx6Vi2v0kwbydMj9ZTYPGerpWVOSJ6YNdj1yYxWIv9hoA6jmumtqi3meM42aIRG
	/p089b5M8HlPf7X36L13Nj1iVvTuesdM=
X-Gm-Gg: AYBFou3tKZLeo0ibGOgyQ1epLHWEWzcctpc4/iu/tHLzaLNlt93pkMHJGelxIMB75/X
	ID1OModMGBD9QvJoj7EjVCtvKsMc8tpPOqUpWNwL1PkruhS3LUcvmIJOzgZQOjfv4drpkAqNwhn
	/h+hH7as2mbM/QN0mP16b9Pvu/ZsNWmneDdp4mNyXl+Hdc85O2ZJNYfbPyXBsJJwHn0vm29ZwO0
	s38JhfFymAvC8pqstw7wxrNSfdMZG1t5pUh6gzK9CUtn9yh9Uig/REklVxoiNwkljnc6rQ6gMWU
	KLrIF2geEb0ZWHTCIxAdVf7AjqjW9xeH0g+8/EQGqdubJfjPCtHPH+Zw/mZEGKOBImU+M3uQ2uf
	/g0P/acBC4qzDf8KnZZz/zcyks2AO4M0LmGzyisvWHiQqLeEAxpgUohYJxnnISeIhte2sXRaofw
	==
X-Received: by 2002:a05:6000:41ee:b0:487:71a:be5e with SMTP id
 ffacd0b85a97d-48871751e7emr4423057f8f.28.1790257473544; Thu, 24 Sep 2026
 06:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923104054.3324830-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260923105237.7B87D1F00893@smtp.kernel.org>
In-Reply-To: <20260923105237.7B87D1F00893@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Sep 2026 14:44:07 +0100
X-Gm-Features: AclHuK8zM1ciyUvzD6y496Uq1l_AhIJFVnKp0Rhb2IMAuf1s6F4re485NR0FU3Q
Message-ID: <CA+V-a8uD16uG8cc9m7NHVZXT5bU64TYfu+_1POuXeioRAy6Z+A@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-watchdog@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Wed, Sep 23, 2026 at 11:52=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] watchdog: rzv2h: Deadlock in restart handler via syscon regmap l=
ocking
> --
>
> commit 1e1b26069f70735a537750b22a51257bb422c2e4
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> watchdog: rzv2h: Add syscon support for WDTDCR
>
> The commit adds support for accessing the WDTDCR register via a syscon
> regmap interface for RZ/T2H and RZ/N2H SoCs. It looks up the SYSC regmap
> using the "renesas,sysc" property or falls back to MMIO access if absent.
>
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index 76c1d315b0e77..30b0b70fecaa9 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
>
> [ ... ]
>
> > @@ -93,18 +104,22 @@ static int rzv2h_wdt_ping(struct watchdog_device *=
wdev)
> >
> >  static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
> >  {
> > -     guard(spinlock_irqsave)(&priv->regmap_lock);
> > -     return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTO=
PCTRL);
> > +     struct rzv2h_sysc_wdtdcr *sysc =3D &priv->sysc;
> > +
> > +     guard(spinlock_irqsave)(&sysc->regmap_lock);
> > +     return regmap_set_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOP=
CTRL);
> >  }
>
> [Severity: High]
> Is the external sysc->regmap_lock still necessary here?
>
> When using the syscon regmap returned by syscon_regmap_lookup_by_phandle_=
args(),
> the regmap has internal locking enabled by default. Since regmap_set_bits=
()
> already performs an atomic read-modify-write using the syscon's internal =
lock,
> this external wrapper lock appears redundant for the syscon path.
>
> >
> >  static inline int rzt2h_wdt_wdtdcr_count_start_nolock(struct rzv2h_wdt=
_priv *priv)
> >  {
> > -     return regmap_clear_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTS=
TOPCTRL);
> > +     struct rzv2h_sysc_wdtdcr *sysc =3D &priv->sysc;
> > +
> > +     return regmap_clear_bits(sysc->regmap, sysc->offset, WDTDCR_WDTST=
OPCTRL);
> >  }
>
> [Severity: High]
> Could this lead to a deadlock during a system panic or restart?
>
> This function is called by the rzv2h_wdt_restart() handler, which execute=
s in
> atomic or panic context and must remain strictly lockless to prevent dead=
locks.
>
> While bypassing the driver's local sysc->regmap_lock was safe in the lega=
cy
> MMIO fallback case (where rzv2h_wdtdcr_regmap_config disables locking), t=
he
> syscon regmap has internal locking enabled.
>
> Calling regmap_clear_bits() unconditionally attempts to acquire the sysco=
n
> regmap's internal spinlock. If the system panics while another CPU is acc=
essing
> the shared syscon block, the restart handler could hang trying to acquire=
 this
> lock, defeating the purpose of the watchdog restart recovery.
>
Agreed, the syscon regmap lock cannot be bypassed from the watchdog
driver, so the _nolock variant does not achieve anything for the
syscon case.

Rather than working around this, I think the right fix is to not
register a watchdog restart handler on RZ/T2H at all. On RZ/T2H,
system reset is implemented by TF-A through PSCI SYSTEM_RESET, which
triggers a software system reset via the SWRSYS register. The PSCI
driver registers its restart handler at priority 129, while the
watchdog restart handler is registered at the default priority of 0,
so PSCI already resets the system first and the watchdog restart
handler is never reached on this SoC.

With the restart handler gone on RZ/T2H, WDTDCR is only accessed
during probe and from the start/stop callbacks.

Is this approach OK?

Cheers,
Prabhakar
