Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794326290;
	b=oMjUcyBmY0UC6sY7NZ2IcBP+tm3bZvIqHFGv17lhvO1DoiWN1vaOByFWZ+wSbss+31F4
	 OiF60mJnNndFre/KFCcGrfX8rBxMci6X0Vj/iy0LGMZFMA7mdgTlMDHKeUoUiS+d0huT5
	 UeUrI7mYewZtcMSDhuRyEKxX71RCj/lAJtEGKd9JfnOct2mrWIliGo1ny7PaTq61zse4t
	 QoTGacNThQBztG0f9SIf/gpTnAAadwE50LnOdqMrNmL4BEDQejd3+bwYjB94RdB60rts2
	 sdR0ApxrtN1b7dKDRNuCRX6xkcqfUtPrN3tPV5fr5uMPEg7vBKGffLcppzIVKu7Y1Xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EsbKpFcuLMq41Elq3siL6Ogks64uU5Zyr5ZlrtXoBoE=;
	b=g3dq6T9U5BFInUZxVhwIqzvBBa5L2ej764cEC7Krb/ScApn8+Lbz/l7dsrq9tDodGEb7
	 VSbexI/uQYqt8AX51FnqwGO1HmCL66na1hR+PoDa7tSOqKTj1sWur8MSL7dFcCUels1bm
	 v3uehlRA5k6tDV0yHK19895vvDM7GziCNG6u1i6qyGdfVecebMhw/Fcs2nj/F0xLBhpb/
	 1foM8h/egZYvXcw4gTf7FBpzjpXYfOU0vjA9HIlbpo2axjo4GuYdhKmz7eZyCGxuRXR6k
	 JR43iupOz/mLjD/6VFHXgPj390qLDrIFd1gTnJEWSBAAGidJhpl3WmQuUWMmPblNzAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q79zNSdD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA63460A2600
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 15:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA63460A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q79zNSdD
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4910b863b84so1381941f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 07:58:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794326288; cv=none;
        d=google.com; s=arc-20260327;
        b=Q2Iy172YcxiXgUhYDP2QuMtnvFxlmCGqlmEbW39RE23vqKddNZocqIbrkdKHXZ8cVO
         krHVtYUlt315eSlrbnIsVZ05JT+YvUH1m3ts0tDF2dRRFkQQl/KjLZ9zWEEfkkINKKJL
         /boj1KxfNEzV84pRugrYK57OpAMON8NWhvN6UZhxo1FnGnYZl7RSYnJGK3OmxhhxZcSn
         2zK5M6oUCSwZ9lreUnwECiXhfHVHM3f6Fh/aLag5QBQRVzPATalWjtk/SkTuBkP89tCr
         QcAF17RPy8SRqOuaAhEBp9T5+tmgsdSLXok5b+6id/M2JNuuD424VDkEgMwKxaj14A9d
         FrNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EsbKpFcuLMq41Elq3siL6Ogks64uU5Zyr5ZlrtXoBoE=;
        fh=6T6uO/SzEInB7IfEJGRHffN7STPl8Uq46cLm0C9oSXk=;
        b=AWNF1y6LoVHwBDSijQRj5Xqimli0SbLrBTyyoqlKfWXuXJkBr+FmppEL7G5ubZWcGV
         /RXz+auAHNczE3xvZtlAsqogHhbUNaa+razCG6m37kGbd6j8H6Pore4rhoYz+9pCGJAS
         nk+MgV2Gv3A2uFbgzgbCSyhTrQdcjLVyHxT1IIhULPYy1wQNoECrzRoUanTSAzNO99k+
         LTJp6SZBlGcS2seAAsUJFkj6JsxGW2676gIJdWZs53A0SOJxfNaYqB6cVhwygE8CVXAb
         TvX4JfaqzEHGfFL7m6TFHPMf7f94eH9NoyZX6tR/DsSF2XEbfdzGge9CezhEW5/pPQWO
         i8zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326288; x=1794931088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EsbKpFcuLMq41Elq3siL6Ogks64uU5Zyr5ZlrtXoBoE=;
        b=Q79zNSdDUkIkW8QYnHL5dRfVZhyo3YrEKQe0HL6dhmDyhzaUk/x/kN+quabtnbkJkD
         05Jgvk/OGWba/oWsoXLOBAgR0aFnwUBpoItFY5UBERV9LY8mjnQ5nCx/tq9yOXdfD+N1
         qi87NmiMuLPmMsXvnnAVYUyr7h/hqDbpRr+hUTi3QbMIKNPzHAOPdqbXWF4BHvzIo81w
         3kXNcutCo7dJlu+8O+oPjQdjv/ZbNI5dNQXvbF1Nt5P8drlD5WmIDqN2yK88iDdwsJS+
         R/OAziKpJhTgLqQzRSaXm0y/4MzpZDfuD+0xpncEE+gWGkR6YGzKtxniDUCBwL7MMd7g
         4z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326288; x=1794931088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EsbKpFcuLMq41Elq3siL6Ogks64uU5Zyr5ZlrtXoBoE=;
        b=j+VAp9hzD8PKzY9GLKTJ9YeFQzSR0Mwk6UWYPI7njMVnJMxfiAmy5FnMfzqHeG3iT3
         Qt05gFekssloDzpo6xxzl8Fjv7qKAFU07q3hmARqqFxwYZ0fvS/3SpOJFtFl4uVYiNRI
         yaSNolQi9TgiVLy20zJak9QpSexb7tFUgilX5hlQ5owOjS5e2eyAG/0dsT/mq8wHXxOo
         hK/I/UQnJLR6mkPKFqw5iHyCiDwZ2vPNNgeLKLclYaIPFvKbsVe/QDm9+s8KQXeyVoKO
         fHTHjoy/BE8rcK7qU6oFqs2ac4kSYqfP3pu+nCmkYkw5E9q0e9meQTyTKgyHvqMcJaWR
         j83Q==
X-Forwarded-Encrypted: i=1; AL+hErG2zRVcZiYjW0yH34tqXVWt6EWdSMvGK9nhfDk/ps6H3jkh+qt5vT5ga8Gsky1EI4wLFoe/0pVXUWFmx1pAYZ+MLA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9KZJT40MT/mJR7VYg/O4LDMY2l4I8i4Hq78jumPYRn+yQZB96G
	xFx4w/If6rp8DRtkGqVWo7bJ352sZtdhRPeqDqUxvOnwXJj0bg/kLTE/Q5QnmyLkxCPM6qAauv7
	4OgF6fxK2v7UQrUVOBeLgd6iRZeVTSzw=
X-Gm-Gg: AYBFou38Dp8fw9dIAOM2PAt/ojy9dnTggS3MHF+wYC5KCV7Ty6xWsfA0ppv7cPRWeXg
	jdFo6WH+dLiKjRbELaYpPhRGcoFtMfvNmDsMxoBvLMZmurI1lGq41CNORF7K65+TUUOWW+ymQei
	OiLglmd51S/FTv1auIMXM1IgWUDYl79GEf7Ob/L8dgYOTT97cszZyRE5/5ANF95omdY917NjJ2s
	yqaLw82mOW7YlxNVsqFWTi7Jhv6fZUnKs9iVZuVBQ0YEJcDTf0DmPYb+VqBhB3MwDhKFdzu1z+i
	/ko2r94BGcqsR3+Gyf/ZuJbQjj7kOBz0PjFZ3fCqZ8Q/pu20dn3D7VNm84XtK5wfGnS7lNnP+Dh
	ov1cK/BMx09byj5fEIv+200A+5uU+CsLQ4Q3WOK2quQxuvFe4Mi58PibXBOVaKcXj5wTyOgLx7M
	rmPJkVxJpHc4V1/tQRHZVm3R8wg1Pq8IDEVQn8y5yZ8h7dE3jl+eyV6tX1xg==
X-Received: by 2002:a05:6000:1acd:b0:48f:bbb5:61c2 with SMTP id
 ffacd0b85a97d-49835e20dfamr5690481f8f.4.1794326287951; Tue, 10 Nov 2026
 07:58:07 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109114123.797741-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXc=DRkGOhc75Zq524X9Rcc7OOMs6dy0rj0-zm+iFP1wg@mail.gmail.com>
In-Reply-To: <CAMuHMdXc=DRkGOhc75Zq524X9Rcc7OOMs6dy0rj0-zm+iFP1wg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 10 Nov 2026 15:57:41 +0000
X-Gm-Features: AclHuK8VhXmMiM-0xoy1Quk2mtTjBlhaN-fEKwHUTOUmC_0XTYG3Vg7pF9M9bxE
Message-ID: <CA+V-a8vtcZA_51PmDVWMKsOWaQB+CVDe=qh2FG=6iH2Rf2szVQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable the RZN1 RTC driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, Nov 10, 2026 at 1:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 9 Nov 2026 at 12:41, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable the RZN1 RTC driver as a module. It is used by the Renesas
> > RZ/T2H and RZ/N2H SoCs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1393,6 +1393,7 @@ CONFIG_RTC_DRV_TI_K3=3Dm
> >  CONFIG_RTC_DRV_RENESAS_RTCA3=3Dm
> >  CONFIG_RTC_DRV_MACSMC=3Dm
> >  CONFIG_RTC_DRV_S32G=3Dm
> > +CONFIG_RTC_DRV_RZN1=3Dm
>
> I don't know what happened here, but this is not the right location to
> add it? Moving between CONFIG_RTC_DRV_PL031=3Dy and CONFIG_RTC_DRV_SUN6I=
=3Dy
> while applying.
>
The configs weren't sorted, so I added it at the end. Thank you for
taking care of it.

Cheers,
Prabhakar

> >  CONFIG_DMADEVICES=3Dy
> >  CONFIG_APPLE_ADMAC=3Dm
> >  CONFIG_DMA_BCM2835=3Dy
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v7.5.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
