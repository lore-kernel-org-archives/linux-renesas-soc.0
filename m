Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52DD400967
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 11:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547960; cv=pass; b=Bbm7iGA5y2SI8SpFJWYjYXijwdTGsgGxXvWR369yhrRTaLiF0YjrBjfbvHhYDA3AJug6Mmar/64JDBmeIYQ062z3061PfAuZelm6t4wLNVKGsBb2WZiiEVWDC0vsUwrw4aCM4U8QrYw8OAKSVZ0vTrKmnJVrqjq6ZU1jqpTIp5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547960; c=relaxed/simple;
	bh=O7GkuCmMPHFQEK9+vFlexZsM1aV7dbx4/uIBOAgzkVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bEW/Ps6yqMDg4/+54rcs7OL1uDyZR9gwU5r/ZCWB1sH0jd0apIdAj8acs/WnIrGXbW97FieqBV6Kb93dO37atGlE2DGjI1/KSPsivI3duQABw+MjkXDMYsZDVfvKyTlEweYFnJswatD5XMq12yf9zdqF3MANIbAJNOlMivExhe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQCnKn/Z; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQCnKn/Z"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-472326ca506so7712016f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 04:45:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784547955; cv=none;
        d=google.com; s=arc-20260327;
        b=kd+2SqAQU09EEC422Q/5n5cOw1goz9u7XcSq8bO2QwFmhYczfmrPg8MJnLngES0y19
         SU3VxohcQtujLOCI4iEqwnIpCYhRd8tdTP7DUmAiZAVviVc38gC5m4JyLytYo/aIx4j3
         pgsTFnW2MlVK5pfyKessYBlQw4OcmBf1n3Ho/kn1e00I4oh24utDY81j753c4GbU7V+W
         jxCgAwcl6sRyqzo055iONzNtOhZ7NsOxMQj41WMuFT1zTcCysU8EQqFzhg1mN4dXvchE
         c7+CwZaJWKonknJFShLCCMoqdMysLuOh/i9dQ2xPEYxIzAz2k5xVDuMXL1KeOda7qzda
         Us4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O7GkuCmMPHFQEK9+vFlexZsM1aV7dbx4/uIBOAgzkVQ=;
        fh=vB8suIwBfPw6zh/3QGv6tj2U2QucX7tc8UEdmb/Lvy4=;
        b=oG7EWdIDkxMP+spwDtfPyrxAvd1qy5C4pbSCWlwdhSijkGJaM29P6s7dL9HmEQpBNr
         J+ZjBcst/sSoXtw3/cAjIRnCiL37h9qX9L14RZH7DkOkFTcBmB8vrWb8lviroQIdm+0v
         3BQYxZeGuso1vBV+pGMe4n3xzFf37XrKPD2YtPjv+5T+qsKIyn57ojHPcSh30dcrLqJu
         Qv1Mowuth8vrYq5JLZUu7R7IFPwwOr5ubz6/cfx47pUdKMuotacFLiBJPXfdkJKOvPhD
         u+4pVIQ8iAEcAWITFnHi9f1BcO/QGHhz8qBxneU/oMcjYnZbskiGJ6Uw6zhdEQbvckSI
         ermw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784547955; x=1785152755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O7GkuCmMPHFQEK9+vFlexZsM1aV7dbx4/uIBOAgzkVQ=;
        b=IQCnKn/ZUMiaoiw7n2A3OQ0zL9Oi8UGNmcOlHjdVNZuIjzGsrMRjFID8v9lmKsNLzc
         Kz8ROHOTPSC9F3OgLDtexAVxGPJEjJy468C9I7xfltEG/qT8wH2LnL3QJn7O7YPDnm63
         54nZz9zlpcwvuxnJz2y0aPvLOdy/gr7YdSOseHIw5fMy6wIEEXwd7UXWMhN+ikMIn3hq
         OuptsuCsSbbScdqTOBW1YYFkXIjwNpON14+vQt3d5y/6cwkwKcqW1fiYAAUx3IIFj6TB
         aHi2L7s+VLPysLEr66dq5nA7Matf8QVQVknnpTxD+onqXlutwiQkqkvAvy2hwLJSNROl
         tagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784547955; x=1785152755;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7GkuCmMPHFQEK9+vFlexZsM1aV7dbx4/uIBOAgzkVQ=;
        b=dpbWbPSnsFFaECPxyUqvNI+SI+g1CsiroR5yAqw8ooghEC69If61TVDgfI5VQa45yC
         u8lg56Mv4XEj12RQYWF/Za4ntTIprKuKo2jaPCQs/WHSAwdQ6/OC2a91eM5hlLT408ZV
         BOIbYJd1XzNfXPgDux+/j+uaMU4tprgc2qslT9e5R3x5gz+VobVSJ/V/XLWIrAiyyaIJ
         NO2zpJ6klBocG9JEx/pDHRpxXV65hQWxMBlHGeykMJ+r+4Ew5pj8snuT2kCXk4+HbE42
         0BeGi+OUIUtnslTJAiueFe75BPK5hy/ppN/eh+RNE6oAiVlndBgwumKt5F+/FyeAvM31
         fuRQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9qND+kdTSMGench73R7mCsiewONraxYLcczg9RxuHmAFxWzDGD5ECGGghelbD6mKUjgkKMGxCNrNEc1Ogh70raQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxepoVHAdW7UyBMT6e1D+iRCs6NcRiZqhWimCr8m38njsCL/y4
	B2oStPMza7BYYcIbQ9EohmPiQfR+lSBQqlrbK48hJsuYjbtOjb5/FNeQtvlxnf9Di4WGVxozz7a
	/CeI8qAZ6hz4DYntzUoyzsaZ8QLy6RtI=
X-Gm-Gg: AR+sD12+I0fN1csq42RBjVeNYlc33EX+GwQU2ZezptcTX9qQKuVA9J8s25YN4+l8vvl
	ppUWKuJrhr9/8/ywraD/5OOcnAqCwJGrpgnf8HPnrB0ptlEAiEQ71YPWKQTz2eJlYYVr+KE/Jen
	wBUyamhDyeoPUFWPtdrX2o/EPQkAZMIWawpc/BAvDOn+JplB7xTmhZEg6eodDqbhnO3pFuEDs7v
	HSfDLeOWmsXre3U+MBrPzoVt5O6HfI7SG/6kYUl+c+qW306VbmAm82gBR76+zwrHXVwvDYHITEL
	MoQwm3g1y90KzT9TbR80vx0cEoGvmcVFPlRkVxRptrjoKLE=
X-Received: by 2002:a5d:5d82:0:b0:47e:9f16:c0bf with SMTP id
 ffacd0b85a97d-47f62326f0bmr15817313f8f.30.1784547955341; Mon, 20 Jul 2026
 04:45:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715222417.2997712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260715222417.2997712-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <2a5439f1-11e3-4194-a1b8-f00d0a8333b5@sirena.org.uk>
In-Reply-To: <2a5439f1-11e3-4194-a1b8-f00d0a8333b5@sirena.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 20 Jul 2026 12:45:29 +0100
X-Gm-Features: AUfX_my1Bz6eT87w37fWrzlXt1YHwrR0JFt9wOo0WteIhJRrlaxYxVnCyVuhPH4
Message-ID: <CA+V-a8vdrhnZs+1WyVxWJ7Vr+2A2_3zsw1z6bNUqvGi4OGHH0g@mail.gmail.com>
Subject: Re: [PATCH 6/7] spi: spi-rpc-if: Implement 200ms runtime PM
 autosuspend delay
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Thank you for the review.

On Sat, Jul 18, 2026 at 2:14=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Jul 15, 2026 at 11:24:16PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable and configure the runtime PM autosuspend infrastructure during
> > the controller probe sequence to safeguard chunked flash operations.
>
> Acked-by: Mark Brown <broonie@kernel.org>
>
Since there is no strict dependency between the rpc-if core driver and
spi-rpc-if patches, Krzysztof asked about the patch order/routing.

Is it OK with you if this SPI patch goes via the memory subsystem tree
along with the rest of the series?

Cheers,
Prabhakar
