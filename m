Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D609545A29B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 13:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663447; cv=pass; b=ZVsWk9rYpff+LY37psaS2mxgE4OLM637qC+MUDjB6Zq/+5iMqAcPOIERp+/j9KXCk38Ol8o2LbTo611qv/EIQacfo8KyljEloumtc2v9K1W7XdpvQQkcsvI/t2PS/J8kgNvoz2hDCuHTRcNIklAoT7GeLNkjxJJXC/NsnR0CeVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663447; c=relaxed/simple;
	bh=02FhfIBqMMvQXAFc8ywza3WsDbF2gi0rUDQddC21ZyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dba7UMW+HxeFFvIBVrFjiOGC4M5y0C/XP/NV9uVSAPIXxXNEgvMtX9FmkmoAs44F/z4E0oZ7S210H00yikj9QGOhOWnCn6hHWjCOQ1M2t5/F6eJqbyZE9/pzBwaD5OQqwmGSgZ7ujOcXKCt4Z80M/oVKm6XxSy9opFKOTMdZmSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTD27K8B; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTD27K8B"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c197e7e4e94so827328166b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 06:10:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787663437; cv=none;
        d=google.com; s=arc-20260327;
        b=hgZ+pm+uetmnImHOBVYwQYR/78Sm4Os1fI942PGl/lpRKn4EHPhrjvRh54z5a5MQPs
         Rf5gduq3iwSk9vXmT9qK5oOlKDRaThXWFk5wkt3cOBCFsVe6drShjaqGHaK3eeve4IYN
         ZZpY9+XhMV+goyC+C36PD14fir2wc9kwb+ZbCpIXm0Awm1DCQW6wr4pESzqnRXaPjLkk
         jiqDlOsfLiCRi90eKNmbd6bXlucgCyD6w2lOUlaGNVYT/EIIrRPAZDUwvXzldgzv2zVw
         abTB7oxiCh6Rnfq4MJ9uRJ/h06AUZqVpNv3eR3YASDjb4JLQ2k7pD7RSxpN2OpJmyG1f
         ptVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iuMwj835HhD4A5CZXk1Hdm7IMcB4Kfutchy14lcyny8=;
        fh=KonOLcRasM8y0DcIjFw+Ec1QExVV/hZ3dsuqdPSIZs0=;
        b=PPdUox0yoe4W0El9zUxOsmnE3c8niM+0KY1sBQQmCFVGwb92Y5AA71Mx67hqLoA4XZ
         POAQ9/UY838bXgkSefDLAZy6j09XyEd/rLY754NrSux0EMOdA3JImPD01eCdgl8Oo/2j
         3ec85ZU9FrE5+bsF77uGj8qE3HN+MLEKDG03v2dJMNNzpVIB5w9zoKmbaQHkesk64xbB
         wsazn6vV6IvrjajCdsJqSDHPvGs0GM7VgzgdpBZ1kexsahCWpD1ny8JupZNa8KWyhqhy
         1LIFfUz72mthBWlbQFkO71vrEI55cidnf1C5iBxbctz5GBMM34aViPk2/YeOGJEF161Z
         +VRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787663437; x=1788268237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iuMwj835HhD4A5CZXk1Hdm7IMcB4Kfutchy14lcyny8=;
        b=DTD27K8BmV9EEBv7J3uEHqthV0pcKxDfi6PXr0088Ii1HelBk73k5HExF7IhYM1wW0
         HSCnVozStEGbBPwAN2w7njqTN3d0QQVZvpwWSTjPvH6zTUugMCMlMA11hXGHR2YNGolL
         HOA5iBtA50AOSOv7Vm3+AT9y4DXHRty1NkWEM7siAtLcIYVJD5NlmdaM/zZMhTjUVh3o
         hDdWF12VxHFziW6A9gFvjRolb6/o4FP19w7c9e3lUm6KJYBwUPDxLOjSNC4SDTzltnGt
         2DbKqsp4iHwsbxPZ/2VhUa6DJ+xDyTN+GoWmWLIrQ7Wown7JS5pFv6d+ABtVTKg6oR6U
         77kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663437; x=1788268237;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iuMwj835HhD4A5CZXk1Hdm7IMcB4Kfutchy14lcyny8=;
        b=qYeKMueZEMGrd5fZAsOkthe01zhlAinDO8XFdWRiLn905oLUV02VOPIrrSaae5MRju
         FrzyNydmiJOUircAW/H73r1Q8hwTIbi52kNMLh+4pcbKGjZW3ftjK8cNDNsQVTODxAhg
         6G0sKGY774QMV4VVL5h1m1Tq21dpljQXKAqAdTsrZ0khcbZ3N3hFsunYrzo8glqKp4Tx
         cIGeO1KX0YCMHIbaL0QS4Iv19rL8LPggo5E9r1yXJG+6huwbcwH6nKIA+LZkTv9JVqku
         Hhfh4KdT0CtofR7dtDx349D03kYQFMsplCHWcgpMrvEqV3Ej9/wo5KO93P9cVmguOJzh
         kwyg==
X-Forwarded-Encrypted: i=1; AHgh+RoyBAaehvB/DtnSbRnJo6G2CfbHuRk6vjIthJuPgHDogNWT91ZpIRdqdCCUHIi5d/YvlsXiwrMx7uPlSn88RBw3uw==@vger.kernel.org
X-Gm-Message-State: AFuF++npC0q0whRqt1PBkVQa+0EzPA/HALEgd1nHVyUcPo74pAExTKBN
	V/YBnNBk/y2PkmNNaAFGbRgvSishFrJ9k5JVncXZM/41MzD6hCzPDW5+qj9BwadAFVmB3lMdNgl
	9xzSYrBRLsdA8NfQxpWaA71FJ7i4W3tXMR/Ft
X-Gm-Gg: AR+sD11twU2ZpX0sP5eUXDsGEFAxccdT7m9LKq4XoM5IS5zpHiI6UYxaZBPSFpnfWGI
	+dorTB50/iq2ML1YvM+viOfYX8FZu/Cn9VILsS0j6JQnpfXTGn2dFtNetul5YEeLA59pRCaufoW
	Q4Jir25jUs5ENvtzL3zNSuF/WWShU54vKb5jryaY0aPKe5HrWu5Y6e8Hgb6EVk3sxA7Ng0YNJpz
	/p9kOy4JkRN2sKqLu1aBh/mQknkLwAbaoGFuD+VYQUVg/p+0lDMbdcA3HZ8rGL3RVG4EzkHqrzE
	s3LiKS8bcVjbOg1mo2yBGpQuLaPP4rRVPts2SenbHRUX6Ic=
X-Received: by 2002:a17:907:60ca:b0:c24:6985:d7a1 with SMTP id
 a640c23a62f3a-c24924b79ebmr3067182966b.7.1787663436768; Tue, 25 Aug 2026
 06:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824125523.131762-1-biju.das.jz@bp.renesas.com>
 <20260824125523.131762-7-biju.das.jz@bp.renesas.com> <20260824130453.D03C01F000E9@smtp.kernel.org>
In-Reply-To: <20260824130453.D03C01F000E9@smtp.kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 25 Aug 2026 14:10:25 +0100
X-Gm-Features: AcwNN1Uq7B_OPhhUOfAGvmbEHdK5dtPV8yVIVtP8a8LSe8nf83A3g2sBuIV4qcY
Message-ID: <CADT+UeBsPrADZdx34qS4YLyDwmO9Lq9qJMYWzhw0HW7+f_yZCQ@mail.gmail.com>
Subject: Re: [PATCH v7 6/9] dt-bindings: pwm: Document RZ/G3E GPT support
To: sashiko-reviews@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-pwm@vger.kernel.org
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Sashiko,

pwm.yaml  already defines this property[1] as required.

[1]https://elixir.bootlin.com/linux/v6.0-rc4/source/Documentation/devicetre=
e/bindings/pwm/pwm.yaml#L23

On Mon, Aug 24, 2026 at 2:04=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Add `#pwm-cells` to the `required` list. The binding omits thi=
s mandatory property for PWM providers.
> --
>
> --- Patch [6]: [PATCH v7 6/9] dt-bindings: pwm: Document RZ/G3E GPT suppo=
rt ---
> commit 9a7d174b7aaab1e8640a8415696ce9830442c765
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> dt-bindings: pwm: Document RZ/G3E GPT support
>
> This commit documents the device tree bindings for the General PWM Timer
> (GPT) on the Renesas RZ/G3E SoC. It details properties for the 16-channel
> 32-bit timer, including interrupts, clocks, resets, and power domains.
>
> > diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.ya=
ml b/Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml
> > new file mode 100644
> > index 0000000000000..cb4ffab5f47fe
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml
>
> [ ... ]
>
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - resets
> > +  - reset-names
>
> [Severity: Medium]
> Since this hardware is a PWM provider and defines #pwm-cells in its
> properties, should #pwm-cells be added to this required list?
>
> Leaving it out allows incomplete device tree nodes to pass schema validat=
ion.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824125523.13=
1762-1-biju.das.jz@bp.renesas.com?part=3D6
