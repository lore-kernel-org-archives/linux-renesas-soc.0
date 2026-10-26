Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009710;
	b=mKxl63h8aPBaOjUaE6fDecOLht1z80+pBFTjZGj7x4ChLlQn93/ufhPhFgkvSFEycK7V
	 +zmefV41bYKmbgblbeZUZBzHUMFzrGaKMbyK3EygK45uqC6czEWpSXcuM4rCUlfuNR+Nw
	 k5AIfuwfLDqGsgCNoITM5e3POD1SvavA21l/Au0rpaea7/B0UdMs9+IKI1vO7G9M3jRD1
	 pOaP6FBXLFXWwVwaPuomvoSp8KUFlBaoiaXB9qp+05OLj1UgXsXqoyI6gUYAS5iLcwaRi
	 on8DM/++DsWXlUjnsvCctrxwU0FcAFOBb25jYAEozZOKEAvXlSoOi29UdzldMPTaXCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009710;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=xvHDL7X7nDz4fdHlD/Zd2vVTXXgNDrA1NXktS57i7t4=;
	b=ZCh8bQKIb31FTJ/zJbqrOPoKeEBPNZWuf9mXr72iZqylzPW45Djv2zHbP3b83AeVHnPf
	 HcVJadwebaytSA4Pw2pyYyMMsNA1AOyiJooKLdhGJzxdrIpk9Ui0TLfYQrWZVx5kdVN47
	 8puZWW3fp3a1nulmqGqzh96FLuHRjUZIo8lUyswpCx/zKr9fqJ8uyWto9Vl7zxz86m8kx
	 NmwyxHiTKZPZt0DCarr8QyX/dKk+V/VPsBO9F4g6J9GuOvxhleFoYwg/2QmIM1ogM0MmL
	 9ZV5iDQKbMKAGIQegjJvAcvIilJPO/qdtQF+LZu73Cs8T5YozjMr2uAgwzC7I/aPEIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F12F606A31D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 10:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F12F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7c33cc572e6so2449933137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 03:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009708; x=1793614508;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xvHDL7X7nDz4fdHlD/Zd2vVTXXgNDrA1NXktS57i7t4=;
        b=1cvZisucfZuxEGuRViG9gSaabQWWHMPDeqn7K+NaF5WFA9tUKm/Mx0WvPzsZZunmOv
         s/SxsTeUaFiAKbJNvCO0RkaJ8YVz94q/mxfYzRjEz0vQ5r4dyKZk9azu4I6VRZXPrvAT
         jWU6j7bXJ3s15P4qy+Jvqh/w8CBRI1ujVLTdZhG5ZBnnF8kJWntOWjlnsjfS8E3HhcX2
         KcU5OyyApNQoEfikqN75KU71khCCM4i4MYPG6qfSB+2OUvEBZcB8IXkwMeS9Y78hVb97
         zEMLKTpb3E8aUHsFBKJJOSaA96uDCP2ZYExNF+xplTfBGNyk8vKFTFX4i56fq+bRb68w
         GaYw==
X-Forwarded-Encrypted: i=1; AKwUvBz2hb+qvYI8dH14HkInc/+0NBbSqWrkUmRBpP1rl55i5fxHsFPXlkJI66AY4xc/6go6U//xlpH4FIJBWPNUFvlhjw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJAEMSkCqCtROCtGPm3TaQr7aiQKIjbZ54HcXO9vRPtdvV7oGWk
	n2o3xCPTFY2Wj63ioyQuxsQWuugz0MH3SlXqn4Lvxv7WmouUGgKwVOE7WVxSl11o
X-Gm-Gg: AYBFou0Qhyed/nEV8qRPI8DO6oVRKlzjp2lWJhJhFCKCJp9uNUktp1SnV3ffjRN6RUj
	y0xatg5Z0STj3LxeXRBnnv7gHvX6f2hBW77i46JRBs+8mgF680WDeKe/kEcEtqgMYe+PCNFpPhJ
	uqELspaqNLl94bZ4wXpCtue9zIKxJF0NK4L28Ze8udVpHY9e3QX4bAMI1kxUr9rGYrRMudn7kF8
	NTvdcQYo1R3+Ck72Ni9RmHeshysfP7BCYlHQ3KdB96orRlbJwU7qSHiJlYa6pWUqnTTER0jOKyS
	Dt3FzUsErsFkF2k7o88JaMYPP+DyJ6+MBZjLurFhpD4KhF9L68lX/EY3s0pMVK6iaS8OoMfONsW
	fBRB+0BnW+0JsX4Urj8CVnblKO0ZuhvLGc7p/6QnO/NSpI2KvUUDS9ITN+OgUenc8PFR8WWClAc
	E19LK4K0ZMMX3CGXXRl0pkA94qlLeurEkMBSqDeF+VwCo2ejthCl6ujbuotj3scdW4Xm1Rd/MXf
	7U/eee3YeddBvQl0Lf9NxVUQhb9X+nTY0BCf/eT8yzZPDW3K7lZw/fM9Ofc3tU0/A8RjQocRGcZ
	R3jAtU0Pm2AaW86kx2HV7Q==
X-Received: by 2002:a05:6102:4b05:b0:7c2:799c:9018 with SMTP id ada2fe7eead31-7ce5ccddc4fmr1235575137.0.1793009708338;
        Mon, 26 Oct 2026 03:15:08 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5df73970sm6907324137.1.2026.10.26.03.15.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:15:06 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so3529258e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 03:15:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzI5EymZ8FasnwMaySXkrGa/I7JGj7Rybw8qb+eRLeM4VtT3+i29se3iWx3HJopaTmCReGParEupWYJM8ACeVft3Q==@vger.kernel.org
X-Received: by 2002:a05:6102:6890:b0:7cc:ace:24ad with SMTP id
 ada2fe7eead31-7ce5c6c0026mr1500062137.0.1793009705218; Mon, 26 Oct 2026
 03:15:05 -0700 (PDT)
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
 <20261023175919.160103-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <atyKo0pTYZyt5XJc@ashevche-desk.local>
In-Reply-To: <atyKo0pTYZyt5XJc@ashevche-desk.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Oct 2026 11:14:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV8Q9UKrpoZuZfDUutrG=bOwcNWLnht1bufv0YVXJPNDw@mail.gmail.com>
X-Gm-Features: AclHuK_Zae-S6levySXX9MNUVg775ICficux5w8oZYwqHzeoFMa3QGI09OnmK_U
Message-ID: <CAMuHMdV8Q9UKrpoZuZfDUutrG=bOwcNWLnht1bufv0YVXJPNDw@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
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

Hi Andy,

On Sat, 24 Oct 2026 at 12:38, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Fri, Oct 23, 2026 at 06:59:19PM +0100, Prabhakar wrote:
> > Add support for the ADC found on the Renesas RZ/V2H(P) SoC, which shares
> > the RZ/T2H ADC IP but differs in channel count, sampling, calibration and
> > resolution support.
> >
> > The RZ/V2H(P) ADC provides 8 channels, has a fixed conversion time of
> > 20 ADCLK cycles, does not support calibration, and supports selectable
> > 12-bit and 8-bit conversion resolution.
> >
> > Expose the fixed sampling frequency as a read-only attribute and allow
> > the conversion resolution to be changed through the scale attribute.
> > Use extended scan types so the reported scan type follows the selected
> > resolution, and prevent resolution changes while buffered capture is
> > active.
>
> ...
>
> > +static int rzt2h_adc_write_scale(struct iio_dev *indio_dev,
> > +                              struct iio_chan_spec const *chan,
> > +                              int val, int val2)
> > +{
> > +     struct rzt2h_adc *adc = iio_priv(indio_dev);
> > +     u64 req_scale, scale;
> > +     unsigned int i;
> > +
> > +     if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_RES_SELECT))
> > +             return -EINVAL;
> > +
> > +     req_scale = mul_u32_u32(val, NANO) + val2;
>
> But what's wrong with the simple 1ULL * val * NANO?

IMO that looks like a useless multiplication, which will be removed
again in some future "cleanup"...

There is a reason the mul_u32_u32() helper exists...

>
> > +     for (i = 0; i < chan->num_ext_scan_type; i++) {
> > +             scale = mul_u32_u32(RZT2H_ADC_VREF_mV, NANO) >>
>
> Similar Q.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
