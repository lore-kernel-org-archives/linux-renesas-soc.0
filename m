Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA3A5172C1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790787613; cv=pass; b=Oz09iJBfOAvIjY1b3ZbYxTjAJDQuBtXARNR4PmBiy4l4he2ad+VsrpAsdE27ymrySehB+YSFgBdpD7xCyqwU7HSwj6gQ6+cv8a8Wb4Q9yBIVvWVA0FBCh76/vldtjCxfCQAeC4bTcjaQsLP/avmx7BOEnzJR3uWn3C4ucceEK+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790787613; c=relaxed/simple;
	bh=YwFLKTRtD485E9tMKuK2u3mAFkxgr0aAxTDkVA98D4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1dIRjj6i06tT8qbaP2xq2NSdu5GJ46IzSDDKhqnXi/8mO/7AVxplUw3V9RlotPui3YyNS0m/SDnT5IjsiRerGRcW2VImsA9Km3K4yYZsOPP6QXubny14C962Xz7LpVHmVIoxsD1O++K7dIM/hVJBfexALKkU2RiO+Cfp4B1mIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spahUrRI; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spahUrRI"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso42909385e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 10:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790787609; cv=none;
        d=google.com; s=arc-20260327;
        b=r83ZwZg6IpIbQfDmGWQn/rVz1v6kOZSNdMub/sZVo+y3XvNVvAn2DIYrGuzRQpoB9i
         8J6w8RdK05ECfKCQOSKpCyy2IWpiuCFXdbKZ+kHVlYRoJISNWJ2Sw5Pc5KPJx1ec2Y4C
         tGKNl3nCIOck9uyMdfc2EumkQ5Nwnmp2ZTUJnt5ux5z0wxcvYxK84Dn2mBMHpESP5CuD
         09fEH/CrraIizB1U7UpQfKhs9FCWIOcusiekIMAd9LDbuvZsfv+F1vldAcCIN+CTaBVx
         6s2j0rdiJa3WdCb7HrlK0ypLJV7mccM0qn+oWgyg6ebWl7M3COjkfnQjmx86kHLcdkNV
         2e5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d/J1exTPTWXkJiVUl9p6jDIEpb+9AWn6n19nTgbowZw=;
        fh=T698eUmyERcLWVLpgfP4yl8DE3rnNI2AjUtASujBhNE=;
        b=JNyA/daV4ZWixNLLehXi/GpVi+6n6wKztJI2hsJI/ZUAiBbLSpsDCPLDltVrA7Bmz4
         wx+VbSNa7yknn5jY6RMkXf0Bga89ylDjdobvl8MOBL3/c1u6MHTXEzUNKy6D8nb8Q+l7
         lUwnZa298vzgE06l9EJWaiOJPqNsyZLaLA8pWcTlGZ8IC90lYDe3B0VXyAylQigdHOft
         02Li+75kcb+RH/wH5F3ChLJBbOGkXb3Wa4201w8J8w2ZBNt8Al2KGWEIZtuBurHl0NMZ
         hQLDqin47WfgwhBEROcl8W/QrZnlQBdDzerCzuiCT0RpKlHdMYLbVzqsdzqR8WlzxmPF
         2siQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790787609; x=1791392409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d/J1exTPTWXkJiVUl9p6jDIEpb+9AWn6n19nTgbowZw=;
        b=spahUrRInjqDGGCVC2I/U7dc0ub9D2jo+Upg83f6FC+CFeNA2/k5Bk1+fJJD7FvFZx
         5ixDoCfl2yl8TVeXtKqWzfBhBkBNQNAuXT/ufFwt2Wd5jGOLOg22SWt/zgTycF1U3Mh4
         LysofWYUqZtBvTcvuzJdRdkPBj9JL/3xDEyH25hdZAG3XIope6rM/HDiqer5rXTjZVtn
         k4ZLvaF1jho5NXPSP9sKahqsdqS4eASzW3wgTvENPQHXfs+urwFvWycIPM3WLru1vUcZ
         eqjoVMg8TkAwaaHYxyepEK7itbKkk52yZjBOlJiLRiDJk/a4tWnXm6vZTialQtegKAUN
         6xxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790787609; x=1791392409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/J1exTPTWXkJiVUl9p6jDIEpb+9AWn6n19nTgbowZw=;
        b=NtWFl3XQUz/qG53zB4r/RHH7+dj4y47CeqDDHldoIB0jPnE+pwgbJKrlgaqaiQxi/b
         sLvHBj6Gg0Xsq1+AtlZaKEpc4LYUEZyUMrV4czvroMREvCyJr0GhyOUdGgk20WZZVyPW
         wcvDADZ+EsVSAd7FZSc0UK+Wuenq5Th+Aq60z4tAlYCxJzOrArKltNjSEOgLyqRml2Z8
         ys4wrf1sodtDuSMsQhjQh4SM/468bgPhwK2/SPYu+QjWpE6am9BwUAPE6l78Wy8PEFX8
         ZOVJsWWNdiX+jWvXo9+wuuHw2Sr03QZbAGpI9Wq1xf0XayvB5RrnITD9VL+1Re1wJsa/
         g09Q==
X-Forwarded-Encrypted: i=1; AKwUvBzZJbZu6dtjlM6yFtqyGjYZSzoQG+5US+mPv0E17yQbe2HbTCzwcH4ZaC4UIoMHphFc7U30tgxTU/NrgTs3D9F+NQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mcI2Z1OIQmKw8PVTnMcoYQUB/QY5i1cjmS5pDbdByevWpzHWS1
	WcuEhg01qJUUYO8Mc2vJJ68L92UTGT+eTHyjiVqv+KwvCr6pa/at0RAw+DMIwxgUeEuf92Yi26u
	5brfwftFkkNHnUIGKTw6aDMZIWj69ark=
X-Gm-Gg: AYBFou1MVl0IqZIVIUxQEr3mHYUnXbwmJUh1ha7+Wlffa0oSsnYZZrllksrdo+29izj
	QiGWFfFYXIa/VEPOJDshFc/jBTHU4yAL92u++8Zkq9yZdLXZ1AKJ6opECm3uJU1RBMc9QR5lRv5
	RL0CeAk/HeS2+hizDFWslNnbZHcsVUms3m2vNUF762T+aZwbJnBjOvcf7bwZqp9U/SXcIH32LxE
	qPkKuLknCndS1Eh95UtkgFZMBZ9vnIXOdeevAxNSChC8sVxdzvsEUQPMDAH5hLshI9iNPTh4djj
	CwPv4ZInkJE0R5iZNHKCGeUqTE7kFQmqIEyboZwHPpiYISOBi2J5qIYROpcx+KziaYJzrfX/HDu
	JyjaiLFaudXdO6y84iIsro7v+BbxFGdfJDpP2lKIIyyPEhoMmKR3i3iX3zir3qJkEhzUWPw==
X-Received: by 2002:a05:600c:3152:b0:49c:fc6c:be19 with SMTP id
 5b1f17b1804b1-4a01b12603amr36070955e9.31.1790787609394; Wed, 30 Sep 2026
 10:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929124248.237032-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <arzVw02dIqn4M-VK@ashevche-desk.local>
In-Reply-To: <arzVw02dIqn4M-VK@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Sep 2026 17:59:43 +0100
X-Gm-Features: AclHuK8eJrFqm5LeaZJBMYeX86u8m2nZ2ZLVvt1JxRR4ALOvCiQsOu3O-zn_iL8
Message-ID: <CA+V-a8uUtqBCDJC=Gy60Jx=a3au+9ZN1Dbbi6uGbzvHA3GJsXg@mail.gmail.com>
Subject: Re: [PATCH 3/8] iio: adc: rzt2h: Add chip-specific configuration
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the review.

On Wed, Sep 30, 2026 at 10:26=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 29, 2026 at 01:42:43PM +0100, Prabhakar wrote:
>
> > Prepare the driver for supporting SoCs with ADC IP that is similar to t=
he
> > RZ/T2H ADC but may have different channel configurations.
> >
> > Introduce chip-specific configuration for the channel template and numb=
er
> > of channels, and use it when setting up the IIO channels and DMA layout=
.
>
> ...
>
> > +struct rzt2h_adc_chip_info {
> > +     const struct iio_chan_spec *chan_template;
>
> __counted_by_ptr() ?
>
I don't think __counted_by_ptr() applies here. chan_template points to
a single struct iio_chan_spec, not to an array of num_channels
entries.

> > +     unsigned int num_channels;
> > +     u8 features;
> > +};
>
> ...
>
> > +     chip_info =3D device_get_match_data(dev);
> > +     if (!chip_info)
> > +             return -ENODEV;
>
> -ENODATA
>
Ok.

Cheers,
Prabhakar
