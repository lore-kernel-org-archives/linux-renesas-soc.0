Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB17D499F12
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Oct 2026 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539993; cv=pass; b=CtHtn7+OhkLBxZcosrBztwNWqoYOznIx2ja5Szv9ZoQbraSGbqVJB74KeyYQOljVXBhav//yNcY4AgU4D1dyk2vSLg9+lTeq8BJadQZDmaP8qd9h/m6r/WT9fqDC0ZWJWgKwMUv2R1YwuviRiK6VoEGtz3oT6TkjINhqUxAqDUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539993; c=relaxed/simple;
	bh=i7++zG8AWQ/7X1mmcKKFhfNKYOrusr69yRalwyg4/cA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VihUm2KVJx8eMwnq72y2twoTFZiLaAMfZQwWn8jIyvuBPAqAn7FJCe4it142ClRu6wJuaNdzKHwjROvY9AZ+mmXaSumVEL4NBnqyeNzJDrP0FnnWx4Fqc8n6JMSDFMERluJqycL8dbcfL4wh4iTcjVPGIy9GCxDrpZNuKqM10Vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvCv2CsO; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvCv2CsO"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so11240165e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Oct 2026 02:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791539989; cv=none;
        d=google.com; s=arc-20260327;
        b=sImlMdECdkPD7ClqHy6AWNWBId9EWxqhH5NRAJbAlN7jtgOCiwB+mKSjreWtGJ3McK
         V8XcmThHG2JO1EigQFEBv4qhx0NPR7yHreGOrfMyzB0TSsqULl4xEIYKeFB5eTVRi9jw
         neyWFPbK9b0aDWUlltbdf+/vgt5/DKmo1kB7ofi9od92xMlsDovL/WvVekkO2dddUIln
         4eofRpJImIv/KepxYHawUHxjYZqKAaCrvx5Z0H/990gLEt3REEN0ap5FImibDSoWdDN1
         5+WKI2UTDCgrKjrsAKop9/Yxd80hOePlC2tzcw+tEU9DX2+iitml2pmArvVbwZ6+mZbh
         3eQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DP8waD2qmyevQkHk4p1Bx+MKMco6/5BSdUOLT/BBidw=;
        fh=4E302vzzvFkA8+lWJVOA4BogEnrl3R+I6cBEE0pD+oE=;
        b=bXdFJkIDhsErNE12OVkoXCiX28VTS9v4tRzBAEDIns8Fi/DKi0Lidn6F4mzRW5Fo0L
         uv/yn3vaQ4bmxLOwbLE322ZYbDhfLWmSaBfQ8gmuKzpvqmvRaGkERUFzSuxFDcimqdy+
         U8mQ8oYui/U9RTWowJ5lwKmR42zLzn2Er/eRybKUBzPQH2X75E7PRl3JNldswIXcFkq4
         Uuh5+S7Vair7/VDPqytecEEZmbErwsK5Vow8kuuaZXlMav6MXy5pMMAG63havydSXOz7
         1NLDeWWwkWSTn/fglIKNqprZzhzfyZIj+IdTZtfQiouDK2jIWTHC8l22I9CpSwIMtb3T
         zMXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791539989; x=1792144789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DP8waD2qmyevQkHk4p1Bx+MKMco6/5BSdUOLT/BBidw=;
        b=fvCv2CsOwtAvcyKKRWNfjyCHHmI1iPWsTfH3EawSfSC10aG+ygccxRARgXoVva+/yf
         37OPSQaoOLgIOxIs1YgOjWvcA8B2daciBl4kN/jO2A4WsJyHEYrDcVx/mIZUwaz1Ac9Y
         HKRXnu5YYbTQ13q+9I2BtD0vgCdbNFWDHiTXLmyv1aI4dFzjiMIUWaKpLZFgVVZqaAIc
         PqbAw7bqmjsgP/QRoiCEATXLtRC/LYHq8IQHkyvCsUtI2d7f5V9fEtgT2Vr0bRFIjddA
         EaAU1wHKUfKRqF/3oU/Mrrat26aDZt6AgnHZN2D8V8A+b7qgDbXCAZ9ojb4RrQuiVLzV
         dQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539989; x=1792144789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DP8waD2qmyevQkHk4p1Bx+MKMco6/5BSdUOLT/BBidw=;
        b=bH71xUIgkuuAtx16SU2BspwebW/rU4iBpJoLYPeJ1sAny1DABclw7VVHjh9PHCOUWO
         xMHBnbG8MKXaBFynPXaJORP0GSma4Xgw19moJNEu2KtHUiwCQ1G36sZ8ab9g2r9MzREb
         567iNjkPaJvPnWG3ENEmZVcD//IozMOZoPHtsvRcd2f5vkR4jOdTFNOM+ubFK3auhVD5
         1R42VK0Ho4vLc0Ne5ro7CVV1kqqm6XXYFvoyk1MnvIzkFnNJIYeqivmQ279J55T1YR1M
         UZDPUJr45COBB1eCFI1uXDrEfZ9DtPGw0mW4+Quf2Vu4kh1CKlLC/1y6pGY21cXWEzJD
         KxgQ==
X-Forwarded-Encrypted: i=1; AKwUvBylV16IA8/1hkzaXKApdiX5/1zZamHsvTUV7KaqmgxSKll5KA4NUbxyNB267Z+VoNukA/jIkSzv0dvxMOLUKb0Pmg==@vger.kernel.org
X-Gm-Message-State: AFuF++koLowqAw9D2/JgZVb0tjoDXTyRfIWyGTlfzZClrc81CUGF9MB+
	9ZKc9aupaJ05BUCAHPqYw1Qg1v7vNtut42FoYG0aBw1du6KcT7eKmuwC+yc8usaTxnb01Uu8B0A
	222Zn+XVN3WKrByNQ8k/oPEh8oqkIn70r1ska
X-Gm-Gg: AYBFou1u5g95LT+wYXKDpLvVObAQPwapPXGAvHPF4bQ/7sOPyNGZeEdqEIMGu1o071t
	k7UYRyA+GfjZJMjGxjgUKUlq414EIl7qTg3Beoy62Klqm9Df2HeBjSMO3fewvUfyEkixr4ZiHSF
	YZkh34iBMpmV+roxecYa463RzBiAi7UAV7APCD1UvFxctOHa1eEUrccwv5dF9K486U5iK9qBrec
	9KhiwMBW3OWLUuTaKtEO8pA+my51Ykc3jybFz6fqIXmlpkuGXXX74X9696xMp35ZvdyxE584dxR
	5ds4o3ANJt3/Mtphmtx0z6ScM/uF2PWW6bIn+F8AqrzqqMU2Qt6EI2IoSDq16/aLXsYL4Q7SH/B
	kSC1Ldp5mOBh1tA9rKJOFuY7Cd7kdZZyFAY/sJQFfgQWC6GShf1xgSbs1mJhwishJd7Hjx4YA0A
	==
X-Received: by 2002:a05:600c:524a:b0:49b:9202:6f80 with SMTP id
 5b1f17b1804b1-4a18e4a4f2amr24783385e9.6.1791539988785; Fri, 09 Oct 2026
 02:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929122407.219448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929122407.219448-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMRc=MckUuLsgqjphOs=fiyz3wCaGbGWpt_fPKStZRAroPkE3Q@mail.gmail.com>
In-Reply-To: <CAMRc=MckUuLsgqjphOs=fiyz3wCaGbGWpt_fPKStZRAroPkE3Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 9 Oct 2026 10:59:22 +0100
X-Gm-Features: AclHuK8v8wJ0xixm3ryTG5vUqFvUu0_BpBhVKHGRmBMB2paMCe66RtJNZrKZm2Y
Message-ID: <CA+V-a8tV1uoBuRLyZHE_tqL9zU2hzZ9BNkwVMABL4aAEGEFQeA@mail.gmail.com>
Subject: Re: [PATCH 4/5] power: sequencing: renesas-pwrrdy: Add RZ/V2H(P) and
 RZ/V2N A/D converter support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

Thank you for the review.

On Thu, Oct 8, 2026 at 11:10=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, 29 Sep 2026 14:24:06 +0200, Prabhakar <prabhakar.csengg@gmail.com=
> said:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On RZ/V2H(P) and RZ/V2N, the SYS_ADC_CFG.SY_MSTP_ADA bit controls
> > A/D converter power-down. RZ/V2H(P) has a single A/D converter unit,
> > while RZ/V2N has three units sharing the same bit.
> >
> > Add an "adc" power sequencing target for these SoCs and match it to the
> > RZ/V2H(P) ADC compatible, which is also used as the fallback compatible
> > by RZ/V2N.
> >
> > Clear SY_MSTP_ADA when the first A/D converter unit is enabled and set =
it
> > again when the last unit is disabled. Wait 20 us after clearing the bit
> > before allowing conversion to start, ensuring ADCLK has been running fo=
r
> > the required time.
> >
> > Bind the power sequencer to the RZ/V2H(P) and RZ/V2N auxiliary devices
> > created by the SYS driver.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 84 +++++++++++++++++++
> >  1 file changed, 84 insertions(+)
> >
> > diff --git a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c b/drivers=
/power/sequencing/pwrseq-renesas-pwrrdy.c
> > index 0190e53913bf..ab20b7ba9b83 100644
> > --- a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
> > +++ b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
> > @@ -5,6 +5,7 @@
> >   */
> >
> >  #include <linux/auxiliary_bus.h>
> > +#include <linux/delay.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/pwrseq/provider.h>
> > @@ -15,11 +16,68 @@
> >  #define SYS_PWRRDY_N_DSI_MASK        BIT(1)
> >  #define SYS_PWRRDY_N_CSI_MASK        BIT(2)
> >
> > +#define RZV2H_SYS_ADC_CFG            0x1600
> > +#define RZV2H_SYS_ADC_CFG_SY_MSTP_ADA        BIT(0)
> > +/* Minimum time with ADCLK running after leaving power-down mode */
> > +#define RZV2H_ADC_POWER_UP_US                20
> > +
> >  struct pwrseq_rz_info {
> >       int (*probe)(struct auxiliary_device *adev,
> >                    const struct auxiliary_device_id *id);
> >  };
> >
> > +static int pwrseq_rzv2h_adc_enable(struct pwrseq_device *pwrseq)
> > +{
> > +     struct regmap *regmap =3D pwrseq_device_get_drvdata(pwrseq);
> > +     int ret;
> > +
> > +     ret =3D regmap_clear_bits(regmap, RZV2H_SYS_ADC_CFG,
> > +                             RZV2H_SYS_ADC_CFG_SY_MSTP_ADA);
> > +     if (ret)
> > +             return ret;
> > +
> > +     fsleep(RZV2H_ADC_POWER_UP_US);
> > +
> > +     return 0;
> > +}
> > +
> > +static int pwrseq_rzv2h_adc_disable(struct pwrseq_device *pwrseq)
> > +{
> > +     struct regmap *regmap =3D pwrseq_device_get_drvdata(pwrseq);
> > +
> > +     return regmap_set_bits(regmap, RZV2H_SYS_ADC_CFG,
> > +                            RZV2H_SYS_ADC_CFG_SY_MSTP_ADA);
> > +}
> > +
> > +static const struct pwrseq_unit_data pwrseq_rzv2h_adc_unit =3D {
> > +     .name =3D "adc-power-sequence",
> > +     .enable =3D pwrseq_rzv2h_adc_enable,
> > +     .disable =3D pwrseq_rzv2h_adc_disable,
> > +};
> > +
> > +static const struct pwrseq_target_data pwrseq_rzv2h_adc_target =3D {
> > +     .name =3D "adc-power",
> > +     .unit =3D &pwrseq_rzv2h_adc_unit,
> > +};
> > +
> > +static const struct pwrseq_target_data *pwrseq_rzv2h_targets[] =3D {
> > +     &pwrseq_rzv2h_adc_target,
> > +     NULL
> > +};
> > +
> > +static const char * const pwrseq_rzv2h_compats[] =3D {
> > +     "renesas,r9a09g057-adc",
> > +     NULL
> > +};
> > +
> > +static int pwrseq_rzv2h_match(struct pwrseq_device *pwrseq, struct dev=
ice *dev)
> > +{
> > +     if (of_device_compatible_match(dev->of_node, pwrseq_rzv2h_compats=
))
> > +             return PWRSEQ_MATCH_OK;
> > +
> > +     return PWRSEQ_NO_MATCH;
> > +}
> > +
> >  static int pwrseq_rzg3l_set_pwrrdy(struct pwrseq_device *pwrseq, u32 m=
ask,
> >                                  bool val)
> >  {
> > @@ -127,6 +185,20 @@ static int pwrseq_rzg3l_pwrrdy_probe(struct auxili=
ary_device *adev,
> >       return PTR_ERR_OR_ZERO(devm_pwrseq_device_register(&adev->dev, &c=
onfig));
> >  }
> >
> > +static int pwrseq_rzv2h_probe(struct auxiliary_device *adev,
> > +                           const struct auxiliary_device_id *id)
> > +{
> > +     struct pwrseq_config config =3D {
> > +             .parent =3D &adev->dev,
> > +             .owner =3D THIS_MODULE,
> > +             .drvdata =3D adev->dev.platform_data,
> > +             .match =3D pwrseq_rzv2h_match,
> > +             .targets =3D pwrseq_rzv2h_targets,
> > +     };
> > +
> > +     return PTR_ERR_OR_ZERO(devm_pwrseq_device_register(&adev->dev, &c=
onfig));
> > +}
>
> This probe variant looks almost exactly the same as pwrseq_rzg3l_pwrrdy_p=
robe().
> Can't you not just store the match and targets pointers in OF match
> data and keep
> the same code in top-level probe()?
>
Ok I will switch to the proposed approach and send a v2.

Cheers,
Prabhakar
