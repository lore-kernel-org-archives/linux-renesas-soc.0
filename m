Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345D14ACC88
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465994; cv=none; b=KA2GA5Drbd83Hfjysakiy43CWAOsjDNnZZu1AxlVFHg6LpNVkXQ3oRDmqf2Lu2/IWukHKMPvtLJ19G1HFVi6Px1O5erzvg/WN0nLBJ1IwWx2xTE3wjodDGmXr11/ihDDgtLDL9V9opN8idIZyT+hTdDvqV6zxnUiBYFHakl8oig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465994; c=relaxed/simple;
	bh=rHTgJInrraLbaAI9Fq7EqTpz1oTXGx96B7KGAkoD3WU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxGhxXgWFI7UR8Ar+I/oypm2bvr0+qeFvZ1x4O9KDrCcFFOREIttGaGOnmnDvHTB7a0vC2gB0rfqNmQtwWNgnG4DUhZpCxcqvJFGB5YU3A3ObiXq+sYxAVF2Dc/gwCXdOcaCpBvXE4xhTfoX0iFw2F+AMronjjSodvU36oXl4c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1q0YnhN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1q0YnhN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C752C1F0089A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 13:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791465991;
	bh=TI+5D22ueYdVZr31isBC+dn7ZaNBTi8w4WkTml9p8wc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=H1q0YnhNqujp+LmoTjllt5jjZ1EsPIkt01NfS1VlIu7+DDnh6ECRnhec3CJXsltzf
	 Bq457BpBwrIX9IZZgIb0csMJqOzemnTvLyyA9M/+U6W/+TJtml6vqaUgGVa5q4Qpia
	 GgB7sz08qxRJatNXdxNI91XviffAf5trzpnHaUx3QxG/3Pt5eE+DV9k01d+CWS19BD
	 JzO0GiL6YO3tIhJZ2CtD7vHMNAJkGlQ0cpMvD+vRULFOt05H38MPX38wnzKrT3ny28
	 +Sby/70MTPS9tQ/kVOQgMKddQdnUCHwJUVPI4/WLnsRPo3LX/QVah3+gj151MaVOqg
	 YIHpVOMlBsoOg==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6c1983dfaffso4302119eaf.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 06:26:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzL+HAG1osWAhfOW0bTkolMLKpXwTaGPQF6WmF95M2BTUuaWhtVZv0v5ujOZlGNQrGReOCF3dM3JRdkVAPWTGc/Jw==@vger.kernel.org
X-Gm-Message-State: AFuF++lkIzfVjpkQXDnqupzhQAcRe0U3c68krf1aBxuERjl9pAw30bXo
	A4DQGKCdUZDBEBu5og6sw1HYkQS4G6LgUExgWcO9LAYYlGuhlyPbuKOyC+9cyK+hfUeBt8v7753
	uCOMwfiCPrmLR7PO+p7aTqquKU7U8zXQ=
X-Received: by 2002:a05:6820:2917:b0:6de:9b73:3799 with SMTP id
 006d021491bc7-6e7a65d6ce5mr5784707eaf.30.1791465991184; Thu, 08 Oct 2026
 06:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
 <20260928-mali-c55-renesas-dts-v3-2-2cf7eb746ebb@kernel.org> <5bc1553b-465b-42d1-a4b0-66a514b897d3@ideasonboard.com>
In-Reply-To: <5bc1553b-465b-42d1-a4b0-66a514b897d3@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 8 Oct 2026 15:26:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLmBbMUjO-tbiQ=+G8tf=4RyKQ+=h2y=o2C+g+NY7HsqQQ@mail.gmail.com>
X-Gm-Features: AclHuK-IZevOrGcp4TO3XcH0yKfWCnAkoUReD-v7uxPQWatf-GdnKg5lWQK69Sg
Message-ID: <CAD++jLmBbMUjO-tbiQ=+G8tf=4RyKQ+=h2y=o2C+g+NY7HsqQQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: media: arm,mali-c55: Describe DMA
 line-tick interrupts
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 12:49=E2=80=AFPM Dan Scally <dan.scally@ideasonboard=
.com> wrote:

> >     interrupts:
> > -    maxItems: 1
> > +    minItems: 1
> > +    items:
> > +      - description: Combined ISP core interrupt
> > +      - description: Full-resolution DMA writer line-tick interrupt
> > +      - description: Full-resolution UV DMA writer line-tick interrupt
>
> As with the IVC, perhaps an interrupt-names entry would also be useful?

I think interrupt-names are only used if you have say 100
possible interrupts and only want to specify 2. So you can
look up the 2 you need by name.

I don't see any situation where sparse interrupt supply
would be applicable for this IP? It's just 3 of them.

(But let's allow the DT binding maintainers an opportunity
to slap me on the fingers about this one...)

Yours,
Linus Walleij
