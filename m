Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929869;
	b=BgarP9wx2hfakbqlk5uwazTyEEIVuOF+qUXCYbhvaLAarwZaCd7RPo/jKpkgnnD1CcWa
	 sAOxRwJW0irP+6WY9jd12TZWM5DuD6j4vbhSYDTj6fqCkjoJA5ktdwqUwo6LJ9zIImBZp
	 4b0aGbMQjImRyt32Oc9zInJi9HKhf1+rZxbM5riTMbgCbTFZ/MoQ5Sk0zfrGHprTOStTQ
	 n5CZy93ut6lALoIavzj2Yws/x09gKLu172y+9EbRnlueuPdX1XLzGYWa6emPePmKO4j48
	 LMxKeF8IZZySWAXzBck1eVvJUnWclZspB2cziuYPbudqABZU4QQD8h8OSJK0txrEnlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929869;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=edkz8rhF75H54wjVaNZcUL3aDSKXaXqJ2SuZNB31jO0=;
	b=oICvLAeESQPtmv/Ypt9M++3u16Zmn6qkDHmunO7215wAMHmT/5DSH6dLcqowZ4vBmmPa
	 ysFd8DU4LhRJC0SZiac/72FZDaMfVOPdVi1X7sraHaxTKtsodusT0kWxhHBsGh82/903x
	 nTQs0JFq0BoImsCPMtPPu2rAetaA5rS87weTZbAF9Yx6fJ7+n/lfWiADRk9nrg8TvqBNR
	 IveG4K2NjBy1pTM1UuJg1TI63efu+lZkEmrVaJBO1WYurgGanJtAOgz3RxzPiCu5G5g/5
	 HO92gglcu1Yr1T6WJSHDS0b4eswI+b2rCoqdkbKgXDODUzAlI0AZPPTg0dLgvSB1L+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17FB606A330
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 15:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E17FB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so5034295e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 07:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929868; x=1795534668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=edkz8rhF75H54wjVaNZcUL3aDSKXaXqJ2SuZNB31jO0=;
        b=bpGhzgBc9zXk/W6yaSU9crvlRrJAcMJ0cLN+bb0AqcLh6ztv7uUDH5p4jUz1iFigYz
         A6EWMe1VQfDWG6Y0+7j5VdlHIhDqzFockC+zi8+QVUA57IQr9IJpGagvsQTsGovBa0mh
         yEZuq6SW/jXamVu8fPulP+g/L1L4toewJmYIvLI5ssg1970s0+Rkgw9oXuzhMzuqM9F9
         4x4JXKq+q9qwoZIF9dNRTCkzwlpDkxu8S9jyNPv0RjEpSdPVQ+dZ++sbJaqKB/lpEYI3
         EZ/MjIKE7xCO1C2M3Hjz+NuxE1y+eIGu+qKnhbYMkODaPZLVsoafyYZKjrqJO8aBbY0Z
         t5OA==
X-Forwarded-Encrypted: i=1; AL+hErEBATfy9Qi0EHgKAkx+iAxORB0coYcRC2pf6LCTrDVFkmY/i+QERYUrMfG53pT/+8d/1RS3z5kUGT7QElzixn84jw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+eePinVPNE6HGwfZn84Ezimv+ZsArnHmtbCxdLrTbDllj1ULk9
	7PzmA5C+yyRzY+n+9Gqn8iKQHPV9e+leshiXJyjePo2cgTxq0Z0/jnPbXRzr8eSI
X-Gm-Gg: AYBFou1F5qdIeS6vJHi0h6Fwsq4zwLJD+vC3Iro7zaWm9T+1iYc68tiZrKflGyijRBC
	/Tf9cvBcPmO/XySVuq8ymqx+fAQ82o/yLT5jgscKUUwLHuewSb2F4B7gDW+VSL9/Cjwx+AqITqg
	t5xX5nsh+NLYqi2voDm4YBkhsDhqBxfZWnmZynCzdfWUO0paBKDK1Zm8E5p+s00FePi/IlmLgHn
	fERYgYvgVy47dFMDCPNj0zTYmMliDF2jLWwOk1kKEd265Am34+SqpFZtcQp5Op0FKIPKexgyBP1
	XIGh8KDmwSyenp6YsX70juF3taTgZtvfHi7tzCxej+SyK7k0kkf8CSTKw4/+6IkPkp7LgjWAG9I
	0oTecC3XBHfHwpBC9BqBOHCGP6BSV9Ra16krkOmWAq2zEGym9OxukDCY9L7KB5S0tNFdYkG+/YB
	39DYFgfHxPRJ+Oyjv3CXdL0HRD24YeCGlkJfHRUr9PJYJsgQYc8WIf0hunwl0EkSPOLaHq8E0mt
	eNc1LMHZO/I8XMUkyDazu9nqV+jjDFPHzcroBoXxNnqnwk7voNmDlYYzY/RAvX3Sz97zkzajSQj
	Vdu7c5ttvYLBCHpcrFxNC7T/J47qTIjj3YKzOaUvdKfzkghYJC78r5kxjwzATzE+cYw1ULNC+5W
	I7Gpcr5ELFunc
X-Received: by 2002:a05:6122:54c:b0:5ea:a1ad:6376 with SMTP id 71dfb90a1353d-5ee346785f0mr5890632e0c.1.1794929867839;
        Tue, 17 Nov 2026 07:37:47 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34eb123csm8290493e0c.16.2026.11.17.07.37.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:37:46 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7d65662077cso3100123137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 07:37:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFijXlhAgDYLU8vb2nFFgC8xklQ/FfC2POI4+YuXa/p8uROmQZR+i2HAszIGtT5m1qOnwV0sSqOM2H5oy+XkkZpwg==@vger.kernel.org
X-Received: by 2002:a05:6102:c15:b0:7d2:8dd0:2eb with SMTP id
 ada2fe7eead31-7d64d6ed886mr5633979137.8.1794929866113; Tue, 17 Nov 2026
 07:37:46 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-b4-tm-pm-du-v1-1-507474331137@bp.renesas.com>
 <CAMuHMdXQjm9rqmKn35G9-CqGSuMO9nirDw2GmFfF2PBfsCvH_Q@mail.gmail.com> <avxy_u864ZT7vsLx@tom-desktop>
In-Reply-To: <avxy_u864ZT7vsLx@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 16:37:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLw4zYGCg5isy8Mdxfgub39CXbCNgFmNsv3XMj40U7dg@mail.gmail.com>
X-Gm-Features: Aa3M54qPbbFS8WXjl4rVfHsNDf_vt32c6X6we35W2mQ26XiZPauxobEfSjiOsc8
Message-ID: <CAMuHMdWLw4zYGCg5isy8Mdxfgub39CXbCNgFmNsv3XMj40U7dg@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Add suspend/resume support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tomm.merciai@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tommaso,

On Tue, 17 Nov 2026 at 16:30, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Tue, Nov 17, 2026 at 04:12:43PM +0100, Geert Uytterhoeven wrote:
> > On Thu, 12 Nov 2026 at 09:31, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > Add suspend/resume support to the RZ/G2L DU driver.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > @@ -140,6 +140,27 @@ static const struct drm_driver rzg2l_du_driver =
=3D {
> > >         .minor                  =3D 0,
> > >  };
> > >
> > > +/* -----------------------------------------------------------------=
------------
> > > + * Power management
> > > + */
> > > +
> > > +static int rzg2l_du_pm_suspend(struct device *dev)
> > > +{
> > > +       struct rzg2l_du_device *rcdu =3D dev_get_drvdata(dev);
> > > +
> > > +       return drm_mode_config_helper_suspend(&rcdu->ddev);
> >
> > error: passing argument 1 of =E2=80=98drm_mode_config_helper_suspend=E2=
=80=99 from
> > incompatible pointer type [-Werror=3Dincompatible-pointer-types]
> >
> > The "&" should be dropped...
>
> Sorry are you apply this patch on top of some other series?
> On top of next-20261116 I'm not seeing this issue.
>
> Maybe I'm missing somenthing?

Ah, I have your "[PATCH v9 04/10] drm: renesas: rz-du: Reference the
DRM device by pointer" applied, too...
https://patch.msgid.link/d5a97ddb346c5cb959b39fda45277afb1fa2ae16.179277096=
5.git.tommaso.merciai.xr@bp.renesas.com

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
