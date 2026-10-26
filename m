Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793048604;
	b=0IFDXtsyawCIW8JOUogBX5UHghvzoz1Y7U2kQP7/kv4CtHl30zFBqSsWJ2Bs3iJ1CJVX
	 kgMxtsU8lK97KSR3mkFwf0eiQHbcuMqcC0hxQIAW2fr0yMJHjCU4L2nOmacY9k35Tn8VJ
	 C6thY8tKRlIrEA9gkRsTAnZ0nfkZL6Bj+rzBYO3TVx1NLyE0dpg4giedfqu74fJk1zyx2
	 6brTOWCemGLGJJofV/R+lpmBN79+lwvrk0RCgCBWcDagwFIjTpbRq6Kql4OxWaPrnlaQt
	 JQ0ehp2Wjyw1aanMA9a6ddK2jSjI7BPjPl18WCpNaQTnva+IvN8hGu6Mry3wltzFzEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dymsYL1VvcFeY1Miiq7ZnoIAQ+NOEvB3M/n82aiIv+A=;
	b=h4EHLe1qhGOiS/RVt+jpPUmOFbbM5x+vhh38uKNBu+HcTmPIsxvKkbLRfJNq2JdE7uBd
	 eZbRw44CC5S5WJI6WyDmUni737j7WxUyF5bgmGTl5FqtKFalv8xJLZowIf+cGZ5TVswq9
	 zhohCEELSuo8CVvFfz3rgRigPAodvWoI+Bc91bjIDSiBGn/fwCiaJtwsxxtYOZIYmMAPh
	 y+E/6R6ZWfW/6JCjKY5AkdI4xOMh+pxXBeAW7Lt+T7F6JFlkNBWIIPFINjyC6D97AcD99
	 au5R2bsrMMijLf8lbuU3FiA+dfMDjmJRek/1W2uoyafsReFmLkf1wjhbwAPkI6ni3kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J4mmIZEw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF75606A31F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 21:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF75606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J4mmIZEw
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so2373925e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 14:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793048602; cv=none;
        d=google.com; s=arc-20260327;
        b=YAYC36v/z9Y/Qyt9WlbSG8IBiVqnESU6I3qE87SNjF8qQj01P8KwOjXwxxjGL4S/mJ
         Vcti07tNcfQgzR7Yy9XyLPBtJKyo6+X2i7BTYT6iLhkezR8QsLctA7ghkQqVzWUtoC7a
         VKTCjXetxfrBOFSyqeZGALMlClFuC63E3WYKHzDf4GEevP4aiqqdZJA7UaaV5kh4w4eP
         iVjCfsLXy/mQTjepocWc46rFNAGp7bmXH+BTkcUSdO9ED22nOiuEGQ+gphRn2wvgiWRE
         N+5MfHGFSIAwZGUC4iDUfYvvgLbvIUS8mFdVwwqyDh06f4APMAWwHgq4bX7VeAHiSBwd
         vRVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dymsYL1VvcFeY1Miiq7ZnoIAQ+NOEvB3M/n82aiIv+A=;
        fh=bF4rBeRQY6FIezZDqd0tR73sRwxMbtEJgd+qQe+lenw=;
        b=U4JBpwlizMrqudxIS/T+cOFhhNf6e++UFt7U1AEpWuvqAxpyV3Z2IT6nBeHkCGloGm
         bhWcYEi4i03yDjJy/TokB9QsOCUaPWmQY52SoyEsM3xayOtLhzJPxceRXXjDiFMph8y+
         fe+QZDESPg0PMZe/pZs0f5T2vr0NlGYSD1azTmUZzD+64FrcHnIvLWHyeyw1+NEr4/Nt
         lEepnuSq/bqeyjiSqDSdeMBooaJlr6ce657/X0BoCIZdhiuO8wGnCzBsKJ+UmlUdSoYp
         3JCNTeRXaJX+P9KVVmj57Ou87wI/TPR7dnECjQku59o+WAqkSV0oXq3mu910Lhqe2spW
         f/9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048602; x=1793653402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dymsYL1VvcFeY1Miiq7ZnoIAQ+NOEvB3M/n82aiIv+A=;
        b=J4mmIZEwt4xAZc/sYfig3dP2HTPTMXUowFakzLhqmRtHDYzfy4fKcc/jKzgkWKUl4y
         kfxevcilcAXNLhls9B9ffl7fT5Bx6N+k+sMMLl0VJ/ERgGsWBR20PdjLpa95tLS7KHLY
         fKXBJVAne81Te2GZhpX722UgI2K7eI9ZkmTOXBE15v1e+T8ofbrEQoawaxeNwl86QhS2
         oyEf9TmoDNZmG/YJyOj6DjPD8zpNkbCicaUAxYDPB0gVWeryXW+t8ABqf4+6P/OyDMpt
         WnaF34wsz1SWka93dSpQAUhgd8pU4kECfewoMLk/3alh2NeAdwtZvSJJ75fTUIXnpZTC
         uqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048602; x=1793653402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dymsYL1VvcFeY1Miiq7ZnoIAQ+NOEvB3M/n82aiIv+A=;
        b=hL/2vshTW6r+HHFAA2tHYRZ4eiR2pKr/T5TK3iFjQuppDlQPdBDl5nFCuDVrrkxJA2
         KnVHK1EPW+VSr8YwkHfK5nSIWcyveCTi+VAlbTTuxR9f7C990a39Kf+ditg6PguK8H92
         nYorejU7JfCMDzTzY1QUs94mC7u9VcP8wAuVb1lzmt7RsEHvdb8VVcLutJzy7xrDV5l8
         jAKZrV1cOOGhx5pgs8WmuifR/dmVi/Hg0XTDfeI6r4jiZC5ssFHDWvEKfVpUbT1TWGTt
         eyMEX5OWqPK355fOmgiepjsSLfUVryBVO5E7qzPKCLwdngxPsd8dT51gHRYxW3IEvT6w
         R9Rg==
X-Forwarded-Encrypted: i=1; AKwUvBwsjUBX7GWOBY4zt/hOiO08b6V2wfdZC4eUOPqEqG6h6t3zrfQPhSAKjay5gwRsAJBF72Wy4D9Yz+mJXW6gR19ZHw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL4+ya8sXlK0Rdc5Q0UvI63Ze4b/gc087wl7DL1r9oY74O5yM6b
	WZG0ooyngi7AmnGxI5mTNvDOKWPAPVIXqD0revXD6V1+c/Ou771uVcboXjDwS9xcH6NwZdiCk3g
	rg2RRqEUac4osHFXaCRstSuvwxjk8u6I=
X-Gm-Gg: AYBFou3n3excxl4FxOgNojTfJiCqiToB6rLU9JIQl0UyiML1AZzZbFIDk4fqNPaf3vH
	AMBHefvSXv4J/k/6exn85+c4GSGgrKvMh27pcDwSGaX/k8a4INbbxd3jBYC/u3Bd4YLi5ADtVom
	NjOgkr9IPXGUhTj8x4IG0YKLvBCfQWGWadEKTruWS18RySoWkQRNR3UNHf1zWXvSOoZqLF8YyNk
	l1qL9Ftk5g1QMMQolMI54QbPFidLq9caopjOwT07MveQpR6hwByo0SrfexqY3p5gg4K0OecLnn9
	dAZEElwX7srvWl2tmXoSJp2yGgZHzjT3FHG8SDmM3B7TFj/R5qq4+2bMcrkNxjLKyqsWgqh7C6i
	2jVrZsFX50R9GDb0g+sP797TSe0bHy2Cy0nCZDAOS0gC5atvh5qaVA04biIYe2LLrM6qKGzEYhT
	SeJRc5jfLUHsZ9+uG9DTowWxhLtbO0Akft4Y3olR3CLiZucEvWtfeLbrKCGMGzpBDSNQEj/XO4m
	lmcxA==
X-Received: by 2002:a05:600c:3d08:b0:4a2:1960:6fa with SMTP id
 5b1f17b1804b1-4a7bfec49damr17336865e9.4.1793048601950; Mon, 26 Oct 2026
 14:03:21 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261023175919.160103-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <atyKo0pTYZyt5XJc@ashevche-desk.local> <CAMuHMdV8Q9UKrpoZuZfDUutrG=bOwcNWLnht1bufv0YVXJPNDw@mail.gmail.com>
 <at8uFFHk7DHH9e1l@ashevche-desk.local>
In-Reply-To: <at8uFFHk7DHH9e1l@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 26 Oct 2026 21:02:55 +0000
X-Gm-Features: AclHuK-DOQOqCxrYWenC1byTCwdE5LPCv_pLXEQMP8Kff__QGFt5Si6oKbFTyn0
Message-ID: <CA+V-a8tL+bqTtub1=nL51CJ-b6RGkRMYNttcvqGbXLRchPk6Mg@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy and Geert,

On Mon, Oct 26, 2026 at 10:40=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Oct 26, 2026 at 11:14:53AM +0100, Geert Uytterhoeven wrote:
> > On Sat, 24 Oct 2026 at 12:38, Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Fri, Oct 23, 2026 at 06:59:19PM +0100, Prabhakar wrote:
>
> ...
>
> > > > +static int rzt2h_adc_write_scale(struct iio_dev *indio_dev,
> > > > +                              struct iio_chan_spec const *chan,
> > > > +                              int val, int val2)
> > > > +{
> > > > +     struct rzt2h_adc *adc =3D iio_priv(indio_dev);
> > > > +     u64 req_scale, scale;
> > > > +     unsigned int i;
> > > > +
> > > > +     if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_RES_SELECT=
))
> > > > +             return -EINVAL;
> > > > +
> > > > +     req_scale =3D mul_u32_u32(val, NANO) + val2;
> > >
> > > But what's wrong with the simple 1ULL * val * NANO?
> >
> > IMO that looks like a useless multiplication, which will be removed
> > again in some future "cleanup"...
> >
> > There is a reason the mul_u32_u32() helper exists...
>
> I don't see that. The 9e3d6223d209 ("math64, timers: Fix 32bit
> mul_u64_u32_shr() and friends") tells a different story.
>
I'll drop use of mul_u32_u32.

Cheers,
Prabhakar

> > > > +     for (i =3D 0; i < chan->num_ext_scan_type; i++) {
> > > > +             scale =3D mul_u32_u32(RZT2H_ADC_VREF_mV, NANO) >>
> > >
> > > Similar Q.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
