Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B8B4156DF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 07:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298653; cv=pass; b=MbwqOCyQbbVHkxha36+bb91TsBXdkulib9rIvExpoof71w2Imortt3erw8z6JJLOiHkVapvq+CP/fcKxIIXbX8/WI5a00jdq7nHCBmyzrBVgddSSRJ72VlKZzpr7X22TBDGlXrGXLuFc9yGXAioGGqgHaANTKk+3ssUJCYr1Qok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298653; c=relaxed/simple;
	bh=Ar7dl1WOm0eueofGyFFcOraww8SO8wyju6lWFB7ENAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUEDCEGzvG4sh22aKMIraAybgbSYX7jBmfzPTwil0O7mxHXGovulSxXCiu5NkXDwKXpdubA75tPhQ6gCmCb8VUxNtmYqIdCKM+Kh1I5OfKmh8L2wRupxJjCSy5IjzJjvFj7cgIyxK93SsXd7qBv5KsAiwJeZkFN1/18xaXLwkfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tf2VjWPC; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tf2VjWPC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fde295992so495068f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 00:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787298649; cv=none;
        d=google.com; s=arc-20260327;
        b=Cc80DojMs5ceGlz1yB7patIEZ0Ai9XfCwn2KK5vwMJeSZ9r5AQ1dot5T8lzAt/we0l
         yyaTxOluKsZzpzPTuPHCUk759CyCKFIHOWYv6knRoSnDllDoXDeb/qV8ALD80UE6Mbss
         tSCQI/xKMdRX6w7KpuUM2mBfRCGMTf2kQ6xTJGEQROlIFftwnI02iGgQnpO5lyDiq19z
         GoufBhXByQPoN1YdauPoNZmjelfnjnhVV/uiI95XWOBU5Guckn3L0gzNW3kVjpdJOt5v
         0AXWSWVl72U4m5GL2U9cf5pSfLanKjE77RcFjM/MUcARGZoKOsiMLOnrfY5RPJFx73K2
         kpTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pq8cs14CPosYQ8esPWunZ9jxmDxJEbeMDQbryhvhdwk=;
        fh=8PxkMip8ZXDolb6A4X5yDwocf5raa4YcQGD8Sk4xeuw=;
        b=Sx2HXpBgcwGH2zHmGFH+Gp9Bopa6v/ujhI10Zsxitse30BoksDCHRrI8qHmKgUdKax
         phN87ChslTBvMLIyHNZzkQ+QF9ff2ZGVZRQGRIXEn5wOYojymqDJxRh/T22FaE59fU4u
         /pBcJq3Py28UXf1FG8kJX2QAS2KkBkZt3vyY/bUmRqvptKwRVL85kgn2q0CQ8QikIN77
         OXs2eoFWonbHyd0VY2gTByuKKIogTKsJCSkLiYrim3QWbfABquN0yI9T3hglbzPS/5Sn
         k8iTIoh6mj21ka3rAZO7NKK7nvLE/KG6ldS7RBQgs+q+apH7SoAMuJopsV5syCDWeUcs
         j+lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787298649; x=1787903449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pq8cs14CPosYQ8esPWunZ9jxmDxJEbeMDQbryhvhdwk=;
        b=Tf2VjWPC1g3e+ax6WJguxRrDugAWU8CKvJInvdeUBxnFnA2wWsPl5Udgk82RvAZCo6
         dyHpFY3DnKxuBRmY3iAc3jXmaGGKZXVq7kzyF5/AvFceuYeWALuD4vNIARuiCVVADSXe
         8uZMRYNU5Ll5OQ5Eeba01okdkAjMyqhhevQBAP2NJg/98FQd4fGPRVa58MiPHrLTG+em
         y4NBrYZ9YIzmD8Ee6sYZAqwJmV51annif3djiL8HdI/menmc+f9jCHmvHurk84aNUa9t
         Z+ERU1salpIaVwR47esX1bFxEfwdB7yUKcNewXhWGa6sMgGNgV5XXhESJXg+IlvJ4q8L
         DROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787298649; x=1787903449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pq8cs14CPosYQ8esPWunZ9jxmDxJEbeMDQbryhvhdwk=;
        b=YuxTZzVM00SgM+z+/qv0ef0E3C2eY1mO8LwDIbjj/rbklklYjaeW8x+roZ9mZ9qXOO
         YO2gS/RzKlFnZ2doTy3dlqAMf9FCLlxPHovnb9q+V1std7IgOApdtUSBlLo24IwcJYxd
         HwYbm/Eyid8eo9ib+QknNgdlPS1rb6McYIOqx3bAd9XdKQZPl98X5yjYop7kyyRo/dJ7
         aegMBPanMO+brm1rmBa9PnZrBNtfVibK0MSFjX0dM4TdAFsY6EBFx92jsSmsidunlZUo
         7mgBL33/c4Jxdc2IIA7wDLaWlZU2/7/O3JE2ALsEHlzaIsb+4Q8ydIvBpd6D4Z1ToMAV
         Z9og==
X-Forwarded-Encrypted: i=1; AHgh+Ro+gMwVm2LTf9GT+Wby8oOxdUBo//xPDYcm3RyP3glWlTw+XSxwdhj+6gFLlO3E7BMOD3nd5YeaQXtXslvQnl7Z4A==@vger.kernel.org
X-Gm-Message-State: AFuF++nMvSEZXPtcdIlvCsU53vJq1Xc7Y94B76llcFsz5kD4yDc7L6Qp
	dW9VXlgE/7Ttl3ivbkySE7KTg+vkrSvPJXaNM4b8+vUkAQGwJ9kQeaD4aX8rpHq0wBPGK/ErQTL
	J78mgwztAgfkJ2KchFPuOG/+UC5wFEyo=
X-Gm-Gg: AR+sD137A4gxXNidYzXwd0o/xxVonrrIgDl53z0xFvxRKvsKfiz41K/bAyOypu2ELar
	zTTZqOscrxViqD6HxGgo3dieceAH4cfYpXQogrx212WT2qfiw+0n+DRZUimd+T6Vlk4Kdr/gahX
	ca1rgNOI/lZ4+QAkPf1Q9mMQqXCG7ET49LE2zdCVPTnuGO/ADEWyuLccpL7E/GFv5YyFQILI2tv
	AbMmpMRJWSn/pzlzYtyogN+eEzqTI48q2pFJLh628vzrxH8decyTaUwOrlqCVNROuqKcKiVeJKG
	+zvWDKRygqWOIPwqT+WlqBTf17u4gW9VniUWxLbtd1r3GHWA6HNuccUc2fLTdhIHk1S+LgURtMv
	+M+2XvqMRUgJfYnbEHvBz9ZkqI07lJQ==
X-Received: by 2002:a05:6000:643:b0:47f:ec53:1d2d with SMTP id
 ffacd0b85a97d-482b781c048mr16263716f8f.7.1787298649421; Fri, 21 Aug 2026
 00:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260819103926.2136712-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260819103926.2136712-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Aug 2026 08:50:22 +0100
X-Gm-Features: AcwNN1WOW3ki891qZSZZpzaaCiMqhO323D4bsoSUMUR3ubUggwI4WxPSkV9zeXc
Message-ID: <CA+V-a8s9s-SZskiamnw3jH8OWE1DgT4Y56V4n9rgyeuB7=4afg@mail.gmail.com>
Subject: Re: [PATCH v4 15/15] rtc: rzn1: Add support for Renesas RZ/T2H and
 RZ/N2H SoCs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Aug 19, 2026 at 11:41=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for the RTC block found on the Renesas RZ/T2H (R9A09G077)
> and RZ/N2H (R9A09G087) SoCs.
>
> These SoCs integrate a closely related variant of the RZ/N1 RTC IP, but
> do not implement the RTCA0SUBU register. Use variant-specific match data
> to disable SUBU support for these SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Dropped RB tag from Wolfram.
> - Added OF rzt2h_data
> - Updated commit message.
>
> v2->v3:
> - No changes.
>
> v1->v2:
> - Updated commit message to drop reference about RTCA0TCR register.
> - Added Reviewed-by tag.
> ---
>  drivers/rtc/rtc-rzn1.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index 6097563c5f13..32f6464fe7d2 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -508,11 +508,16 @@ static int rzn1_rtc_probe(struct platform_device *p=
dev)
>         return devm_rtc_register_device(rtc->rtcdev);
>  }
>
> +static const struct rzn1_rtc_data rzt2h_data =3D {
For consistency I'll rename this to rzn1_rtc_rzt2h_data to align with
rzn1_rtc_rzn1_data.

Cheers,
Prabhakar

> +       .has_subu =3D false,
> +};
> +
>  static const struct rzn1_rtc_data rzn1_data =3D {
>         .has_subu =3D true,
>  };
>
>  static const struct of_device_id rzn1_rtc_of_match[] =3D {
> +       { .compatible   =3D "renesas,r9a09g077-rtc", .data =3D &rzt2h_dat=
a },
>         { .compatible   =3D "renesas,rzn1-rtc", .data =3D &rzn1_data },
>         { /* sentinel */ }
>  };
> --
> 2.43.0
>
