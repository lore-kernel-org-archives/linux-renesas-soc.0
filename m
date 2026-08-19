Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F6A426402
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128925; cv=none; b=nIkdKuHB1ldQpsLnX0aS9DsSuJWY6AkDKvCmkaDKbF6V8EqMJeoWbaKyuiHcwPJVB001qcgXtCIlXom1ybLdDq2b8rZcoqbtCeYasNgMHRHGuCryujwnnhN+QuTxf59kzq0dg0Wa1aW/wWKk74MfqmTvNZfPxT+4pb3LHQ86VUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128925; c=relaxed/simple;
	bh=+1jwVbFxW0XLlovd1xlFsqF4mv3a/J7TGbtos8pkWHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X9LJWFdc9aKl1Bt4f8rKZsAJCj78NVARDaPK8P9/7j8l8z+X+Knir8XpXcTgbvi+rtefTD6txV4Hhu1IvcvDsn3XL4turJ/J3sudENxlV3AAfP/200EKi4H7u7UJwQ4fmm0ncM/MvzbUFUKf8VN+4bDJ3dQhiPJvjaKiV2g31iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7542a2ee156so463805137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 01:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128922; x=1787733722;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mkSyFl4tju91Z3EtUpcu+YMXfyGSyMxiBe3tnse0SDE=;
        b=lWS3tieLUDXsXQdpR1mz6cO+M1nnLNJqVf3BbppK9uHF8ZOV3bYtEQ8+4UGidyId5m
         h+/UTgMGNodeHvYkBjtzQM4i5JCvcvAJRJ9qCVOROlbYfp7/E3tGzARQkgPctA8nALSe
         hsPX/efccQshUxRgNMyAbmOrBsHpbsD9fVxfc7To2UJitKdlsR1Fby4UlrNROKNHtubD
         ykRRFBhVSAUCqM5gPy72Y7RdSIvf32ZnM8GCGfa3IrhnbyzctOAC9Cxyvb6NMmYSSi/Y
         Icxj0NGXz0S/n03vSDHzGHGwZz20Ft1nf50wtmvl1YrEVv+VRVM2+s1cnW8q8zRDl33q
         Ptcw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8XPXhau4PxM+MH8f08oFjg0pzZxZz73Agnxe7TCikYV61lN0jm2gG0RqX+MqNK3hJfwmexqaqNOptBram62245Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG7oDDeLemQFOLzQqd2mAa98lhwqgkQLgcqwmweWyksklv8JfX
	yir6UvHN9NdarxaW1WcLa1mtdHqvVmjPUKsTeqZ3d98hL07sUd1OaTwuZm0b/K0Qdnc=
X-Gm-Gg: AR+sD13ksQ/SMlGKEpbcuevQHJa3GANESRGGuGzNU0SgjealSdEH175PYai+xl7k5Ba
	akPTF67Oltnqffxy+JP1CtUsNquB1CR1o+Zp09Q7OPREzghOTl5PMaAAX0FzQuUB5/IDgVZjQ6A
	XRLPIyWvUQK9jQqaKT1fm7nHnS+J9yV0aa+iwxDzLam4Uh0wHGS/Z2hO1LFfoK7OyjC2sKuoFm7
	Jcf38iXjlOYbVymGDB1pzdkm6JVSasLdeA7XzX36lItJ4SA9C73v3Fbi0i1cyS+kpT2Z8yjU+ZY
	D0vNp8qCBUWEE16QeGdNOyBC9cdntBU8RBIKZZ78NQPrwzOBil+uzDp3FjeTbOWdzc42Y7cSHUB
	XiRtAWV4/E9rhTA35LR4ZRxjbRzrm4j4wLMxLZOBvhEhafGlQUUz05hu+Wt3fAQrOB2yUAbNboW
	HWCezbqPR66XcZmQNqTRet0j78UPQOzojmVkavCo161siBFyRhQGPkGZng+Ei2HyU0tvmK7U2P7
	XALx3VX+D1KtYt+yalCOMVx3w==
X-Received: by 2002:a05:6102:8099:b0:764:ff65:fe5b with SMTP id ada2fe7eead31-777f8f8f722mr1019489137.5.1787128922561;
        Wed, 19 Aug 2026 01:42:02 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777db599306sm1530064137.6.2026.08.19.01.42.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 01:42:02 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7542a2ee156so463792137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 01:42:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpIwLOFLtIVjPpQ/RSfqXK2kNK11TQAaB1BdVIhObur5YnKinDlLORAa9OZvaZxGJU+Dmm3MnKJcJgrRaw33OhTDA==@vger.kernel.org
X-Received: by 2002:a05:6102:5cc2:b0:775:3925:9d21 with SMTP id
 ada2fe7eead31-777faba5e6dmr972550137.9.1787128921299; Wed, 19 Aug 2026
 01:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812115010.108322-1-biju.das.jz@bp.renesas.com>
 <20260812115010.108322-3-biju.das.jz@bp.renesas.com> <CAMuHMdU+asd-YNYx_supbAvYWcEJYQrFKqBVv-emeN0Jy8ME8g@mail.gmail.com>
 <TY3PR01MB113464399E7C6C5D6B72A423B86A52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113464399E7C6C5D6B72A423B86A52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Aug 2026 10:41:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2tP-V9H0QthQ8=orDMxXSsLmzv=krkpn7YgYXCR7+Tw@mail.gmail.com>
X-Gm-Features: AcwNN1WfYoDYq5jMyxRuvnD2LhmVxHJ_oTDz65LLltJ8ov67AVHcAz3vnT9l3BA
Message-ID: <CAMuHMdU2tP-V9H0QthQ8=orDMxXSsLmzv=krkpn7YgYXCR7+Tw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] power: sequencing: Add Renesas RZ/G3L Power Ready driver
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 19 Aug 2026 at 10:18, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Wed, 12 Aug 2026 at 13:50, Biju <biju.das.au@gmail.com> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Add a power sequencing driver for the Renesas RZ/G3L PWRRDY module,
> > > which signals power readiness for various IPs (USB, DSI, CSI etc.) on
> > > the SoC. The driver binds as an auxiliary device to the parent SYSC
> > > driver, using its regmap to toggle the SYS_PWRRDY_N register bits, and
> > > exposes {usb,dsi,csi}-pwrrdy pwrseq targets.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > --- a/drivers/power/sequencing/Kconfig
> > > +++ b/drivers/power/sequencing/Kconfig
> > > @@ -27,6 +27,15 @@ config POWER_SEQUENCING_QCOM_WCN
> > >           this driver is needed for correct power control or else we'd risk not
> > >           respecting the required delays between enabling Bluetooth and WLAN.
> > >
> > > +config POWER_SEQUENCING_RENESAS_PWRRDY
> > > +       tristate "Renesas Power Ready sequencing driver"
> > > +       depends on SYSC_RZ || COMPILE_TEST
> > > +       select AUXILIARY_BUS
> >
> > Could this cause circular dependency problems with ...
>
> You mean this to be fixed as??
>
> depends on SYSC_RZ || (COMPILE_TEST && AUXILIARY_BUS)
>
> So that there won't be any build issue with COMPILE_TEST for
> Auxiliary bus API's

Sorry for being unclear: probably the three exisiting "depends on
AUXILIARY_BUS" should be changed to "select AUXILIARY_BUS".

> > > +       help
> > > +         Say Y here to enable the power sequencing driver for the Renesas
> > > +         Power Ready signals. This driver handles the power ready signals
> > > +         required to power on the various IP's on RZ/G3L platform.
> > > +
> > >  config POWER_SEQUENCING_TH1520_GPU
> > >         tristate "T-HEAD TH1520 GPU power sequencing driver"
> > >         depends on (ARCH_THEAD && AUXILIARY_BUS) || COMPILE_TEST
> >
> > ... e.g. this, due to a mix of (a lot of) selects and (only three) depends?
>
> I believe this should give build error if COMPILE_TEST enabled for this driver
> Without AUXILIARY_BUS enabled??

Possibly, as the auxiliary bus doesn't seem to define dummies in case
AUXILIARY_BUS is not enabled.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
