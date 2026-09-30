Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB2251B168
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 17:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788506; cv=pass; b=rDM3g9lhZfpt0wsK+uFPj4RCNhrmSaBKiau5htXHjOrSt91OSnz+4ym7iZa4dZppszqUXBwByTECfs+LnOB8xyurV2FNANN2GiaVg+TbMT8AF0xxIaky4bV0TPuYV/Cju7leqfQkCjIG5mu9UJNcPzB7/j5YPG0UQnXVKoSNJZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788506; c=relaxed/simple;
	bh=flTa9IPUvO2Wfd7dxpZCg15j/sd3TNn9DagEWKcsB10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHaVZ8lqji/PAF13iZwmgZVqGPipj4q6F9GYp4YtaD60PxzV7aKoh53AzjaIbj5ReE1olLlgKmvBDdpKN+E/yOmypJt8os1c0TNTSTSs7qzHZdkUxxCfJfjmPqi9Sfayt1az13mj8i8RBwRg8cqW+2Vmjt7ah+IaqsLvGqP2MG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iciufym2; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iciufym2"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b02a2359aso2777f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 10:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790788502; cv=none;
        d=google.com; s=arc-20260327;
        b=UenHfXLWxBzYI7gvTSQ/e2OFptgN5+sGxoHKQklVPeAGqPqOSHqEnGJkomj5Oul+o7
         UOXgVuZr129rXpzjVzcTqkWoZbRWHDmZZzClTbBPeK3ze/8C39tR0uARuZJjVRxInx7A
         FyeW6VoDL2pYWhIF0wMLygveAdswTqo6PNjWHD+8usw34rilgZA7n7dDW+hca8DleM5K
         uxrlswoNm1LU6yYsJyRgkhlmh0nboKAJdhrAKfgNA78Rp+T7C5w5a7OhJJK0deB9MTrm
         0jEiqgF7/8hI7Kzy2H9L3DHWhfCPfTzWeu1af5rcMp9wSBNURjeb9Fdctfz5nD7govRY
         XBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wLIs5aSN/ephptBI36FGk5tlNNffSxw7Odm4ILpRBMY=;
        fh=KDlbiRfoHcbb2srMT9JuuAJaz/TdXlKbeoVRYDwPgS0=;
        b=CfGpxstD38MJouWCgJuN4p8SWiUjC8kiS9yj2fKRYpywqQHb+2p9QswtGXyjf64htu
         xG1DT5UWPkHSFgBkpNYNi8Z4RZmZCQzw8AROSXE33Q16twOd21hi2GR7VoojxqYrlAy3
         AMy6yTmlazfFe0WeCCrJnHE9C5JFJUUCJZHr/EewJNatPHnXiVU+BfbqTofUHTnjYBjQ
         iP9fEvLCp+sSg9l6Tgx87LtVjWnrssTxcIO1h5lhDNuCdpYA6JEjCeOlJNa1+bB1CJyc
         fOJyhAxWEu0ovgvxZ44HMW9RR/AC6nkUqTha78Hx54UBj9cU4frukqDTXne+rlR6HD+2
         AkGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790788502; x=1791393302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wLIs5aSN/ephptBI36FGk5tlNNffSxw7Odm4ILpRBMY=;
        b=Iciufym2ZntFU/rJrlRxGAKWnPBz4YIbIEpD1bz2y+wMSFnwRY1Myb6KKinax40CqJ
         khQtMQvl55TCfWcc3pM2zNJaYrgC8c8k7pDPSsuAa9Mm5i8Mqqsb1Rbb3dHuh+yZRtVP
         le8mHNP9vWHXtQXtZXOHjo9NuYHrmXUfu3HLmhw8EJWbrmhMouJDehXY86RyF0XqbiKJ
         d2VqNYa4LUIumHLrNadrRiPtQ2X0VpbuO2T59KrO0iHwaNzeddTHb2RCuZyjPTrQrwQM
         iPxnJNVAGItU7YVR0E1OrDPIlm6A37u+/4ZncWNwgzVMeX2wOoOo8Pp/8LvVmrsrzpBL
         PiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788502; x=1791393302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLIs5aSN/ephptBI36FGk5tlNNffSxw7Odm4ILpRBMY=;
        b=FBliMZfY6e/snDBSPrArGWyunB/7WB2mGdtV45Cl47Pt+nPr+lVH8yjthpelJnnmLq
         KdWKTelSIbdkGyG9+cO17aDsw7BXPlA2LCxVK91EAa0oMXvaC8kBVkLCL+8mpUgb4OL1
         7xWbkMglXTzpFkodoM0hXi7uO4Y90wJg2VoXtyTTclEFH9DdGv0HhzVSWUrCV9NUm8m8
         B+zvQJ/YmEecqqt8x0HhdSDb9OjPpfgmXJASu2kfZ/bU4FSJfBdMcBx3Kl5Jp7MB6Qj+
         mQmoiRWjE8bVFX9Ds2ITE7aA/v+pQeC3gRK6iTtcx5KYCRu3LKIZGWUcTqGQSNaCItra
         VH9A==
X-Forwarded-Encrypted: i=1; AKwUvBxvS38FLc11IPvpvfa/HuGT8Wehjy1nDy97XCCnW2j01qHKf3YLSPEafkfWwb21Dq0Abr727uM+K/W+Q+uGSkMJ0g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJUTEPGkZCV3shn7iN13Zd0w3ivjPCv8H0MpaWPtu60u4VEi69k
	67Anhf6/mUeCDop0f7XfeUs7u/iHEoTocfuw2N3nyj8C2CROzsBJ3coTlPTNjVq6ji2UTMmLVWI
	UC7SaVkC4K2RNSfQrOkFfN/Abcsp5iAo=
X-Gm-Gg: AYBFou1Y6okErfitdSYvwpPLdPQmM0S7kSUsmXftZvOAl82DoCoE28WaPmTeHBv/oKr
	MGmgD3WsRutrun70SMj0MSqf0aKs8zvHrG6EqdgGU5DrJjLtlpRe++DpCDx6Ln6yzOwpkbAcsVp
	e4coTVruRBjHTe862qY/Eg5I91y2WmADUrGB5ilKAr6SPMAd8kenvlK63bwFjkKe7AWYHFEl2sj
	1hxsEbmymsroDAZXMz0AhHoNoVGO+KtGunerz7LS32wTNIuzndqcRRjf893ZagEC1fIiPb1GE6X
	EUhOY32KGZG0CxcJ4x9h9xHVVeujGMSqLfrbe8UwPPIyVQRFISwbGj+25TTMBWZB6kfjrl0gigE
	nNv3cO4ldP/bREyEeayxWcTn29PO52XszOq9BCuwcoyl5wb/8Cmr8IuVZSmf73iBlU/0OFZSC3i
	I=
X-Received: by 2002:a5d:4acc:0:b0:487:342:eb28 with SMTP id
 ffacd0b85a97d-48b068bf31bmr477202f8f.24.1790788502254; Wed, 30 Sep 2026
 10:15:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929124248.237032-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <arzX2pzq_0JreVJe@ashevche-desk.local>
In-Reply-To: <arzX2pzq_0JreVJe@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Sep 2026 18:14:35 +0100
X-Gm-Features: AclHuK_nTopzCs1JxF_udaLq0aHe5Q5fBvI6nb69CERob4o8SQmK8yLw1zzL4tc
Message-ID: <CA+V-a8sj8LnuHGYOV7Et9KXtcKYrSZgP5cgYqxCiE0VCSH_Lkw@mail.gmail.com>
Subject: Re: [PATCH 8/8] iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
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

On Wed, Sep 30, 2026 at 10:35=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 29, 2026 at 01:42:48PM +0100, Prabhakar wrote:
>
> > Add support for the ADC found on the Renesas RZ/V2H(P) SoC, which share=
s
> > the RZ/T2H ADC IP but differs in channel count, sampling, calibration a=
nd
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
> >       help
> >         Say yes here to build support for the ADC found in Renesas
> > -       RZ/T2H / RZ/N2H SoCs.
> > +       RZ/T2H / RZ/N2H (and similar SoCs).
>
> This wording is good for the summary above, but here please list what the
> similar SoCs are. Something like
>
>         in Renesas SoCs:
>         - RZ/N2H
>         - RZ/T2H
>         - ...specify "similar SoCs" here...
>
Ok, I will update it as suggested above.

> >         To compile this driver as a module, choose M here: the
> >         module will be called rzt2h_adc.
>
> ...
>
> > +static int rzt2h_adc_write_scale(struct iio_dev *indio_dev,
> > +                              struct iio_chan_spec const *chan,
> > +                              int val, int val2)
> > +{
> > +     struct rzt2h_adc *adc =3D iio_priv(indio_dev);
> > +     unsigned int i;
> > +     u64 scale;
> > +     u32 rem;
> > +
> > +     if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_RES_SELECT))
> > +             return -EINVAL;
> > +
> > +     for (i =3D 0; i < chan->num_ext_scan_type; i++) {
> > +             scale =3D (u64)RZT2H_ADC_VREF_MV * NANO >>
> > +                     chan->ext_scan_type[i].realbits;
> > +             if (div_u64_rem(scale, NANO, &rem) =3D=3D val && rem =3D=
=3D val2)
> > +                     break;
> > +     }
>
> > +
>
> Blank line here is not needed.
>
Ok, I will drop it.

> > +     if (i =3D=3D chan->num_ext_scan_type)
> > +             return -EINVAL;
> > +
> > +     /* The scan type changes with the resolution. */
> > +     IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> > +     if (IIO_DEV_ACQUIRE_FAILED(claim))
> > +             return -EBUSY;
> > +
> > +     adc->resolution =3D i;
> > +
> > +     return 0;
> > +}
>
> ...
>
> > +     case IIO_CHAN_INFO_SCALE:
> > +             *vals =3D rzv2h_adc_scale_avail;
> > +             *type =3D IIO_VAL_FRACTIONAL_LOG2;
> > +             *length =3D ARRAY_SIZE(rzv2h_adc_scale_avail);
>
> Check if array_size.h is included.
>
I will include it.

Cheers,
Prabhakar
