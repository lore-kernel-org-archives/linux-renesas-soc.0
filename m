Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D62D369D6E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2026 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787937437; cv=none; b=a/z3p427SebXL8MAUo3HM5aekjUHK6teihGZ26Mh8phrjw1HFpofDNGEAeZz9m+D09F1KVNOKoSW0GNvBc73NQQJ1Q+HlgDTUd+5O5gVLfjA8m6teU1mSuk0KUkYUl5kJvk9WynPUENU1bYzkXGzn9U5jbmizC8/gShLgokVsNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787937437; c=relaxed/simple;
	bh=n+VYlEwI6ctI3pyKixI8TWm6nE2Lv/uB0QABZm26g/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LihrfqQDaY/zHH/VeapVB2PrgRPZgyypSI9A/WHXoUDozu0QA3CQbEPzcNsbSyp5AjYqKKp0tpsHUvdO9/00IiWZ8oZF9uakbhTey3byYnDU8gD+G/w+JBoRtJ/CvjmqmbCOSxODVArgGLIziRyAzebDutCX9S8vFky+PhpWUgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7868ca1f0d2so176682137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2026 10:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787937434; x=1788542234;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GJwmn2u3yEvtirjEY/Sfkzcv2VJy3izJDZbrh31Q+TM=;
        b=f609sq/FzV3EjjPu5ahfDaEP5LDjb763IIG7vrJbolBHAaTEbkj2vvoGMaV2cbRT7U
         nHy/asCfjqSm6xjgO2tqWgVn8hHMVGW/RfoBrNkdUo6Rzs4uYsGDtDCnql++I7D08irh
         /lcReVOugZhrmmlKm7D0DFMy2Ywou8GbE2GJMfuH+6IbvXMLFN+jIcCI6gesMKYcBsvu
         fxxZTg5ms7QOjyeTkNtSlDqOpuUyFoV5ubpSPSEuRmv/B79+aIgv8pi2JvsFixwcyVOB
         DpWl82x5aZ9Ak/YzygfW7W4bePeKdxJohlwSUt/d8Ln6XZDPUk2fCgu+YU4A2j/vwNQN
         Dd5g==
X-Forwarded-Encrypted: i=1; AHgh+RrSNcgOHQ4ul3VyBQ5JOg4HqKqxaDBEW1Uhbv1qrEqwpxJD2TxPowG7grAEwe9rQiaqrzgtlRExLnlKpF6te6ERpA==@vger.kernel.org
X-Gm-Message-State: AFuF++mJr+0C1jO8i08lHpZ/enpBCJSMlDXIv7ACw0PLnw7ZpE6bRhIO
	zlIp6zUxDNuUGPLAK6hd89WnqdNIlqNTK7o3yyYqnSAWpn7TMIT2dIKKqF0HXThk
X-Gm-Gg: AR+sD11HmpcqcwYu6Xe96KlKYe9Lw3BQWjTI01B20tiJ7boDSwuyiuMVdtLQsbv3C32
	twACVnrc1lvdR05deSyOF3Ty0qapDateM5miy1FcdnnPHtWKDAJ0kcOiZNXU4Exm7HcU/H+ekUR
	HJOni9Yiy4/pEeVWNzO31YHHJW0puZFq+09EhSFnewCEAPyVbJ/4QxgUNb4ojBJZxAG631U96Yu
	D8y7RP+iiEFYhKeBDH8Asd93kexHyzV/k5eqvPyEsGY+8Ix9WLReCg2HsAt3St6iqsGPEiZR3kE
	TzV3BnH4HNjCTaxHdN+fF2zDkg2tKTK9SWF0kSIA6u8QsPhkWuPSSuvST79x/NtWcXy4gMxOSb1
	uYQz1n7xwWXg/v9hr7C9pm8sAA1Hjt27wsJtZSOQaUSs0p+ALeDqcw9Z3T3kaDpCMtRJ8gl0s0C
	oLFbdk+AgkpJ0GPDaiX9Hc3fUMsA16UzeC/mU1ALvDsUIb66HIkZXVYfDSHlmrBJcJEZON1ZRvL
	b0ZZ6k+Q2V2WXf/UchmwAJDdt2tacS8IT88oQ==
X-Received: by 2002:a05:6102:3ecf:b0:784:5883:9cc4 with SMTP id ada2fe7eead31-7859aab00d9mr2499672137.11.1787937434391;
        Fri, 28 Aug 2026 10:17:14 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f532aa2fsm1611803137.2.2026.08.28.10.17.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 10:17:13 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7841b831381so274931137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2026 10:17:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrD84MXd0syb1pbAqm3jrYZSaNcaHi5HCdxlmhWE3E65mJL2oRiEkPnpimcapBCbjcGPjDKkcScNAIZuMvSmgyfUA==@vger.kernel.org
X-Received: by 2002:a05:6102:5128:b0:780:7e65:f0ab with SMTP id
 ada2fe7eead31-7859822155fmr2331935137.1.1787937432929; Fri, 28 Aug 2026
 10:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828145943.2077589-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260828145943.2077589-8-cosmin-gabriel.tanislav.xa@renesas.com> <20260828-stoppable-clone-db6c2fefe0fd@spud>
In-Reply-To: <20260828-stoppable-clone-db6c2fefe0fd@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Aug 2026 19:17:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUryFJFQ+NWRzXWTzhW5yWvUsXc9y1=wTS13BGOaKg+5w@mail.gmail.com>
X-Gm-Features: AcwNN1Ug-iBgmO0xBVDQC1ANygzOTknsYPhMGIIdZDUDE0bFwxADxDj-zP0M5Nk
Message-ID: <CAMuHMdUryFJFQ+NWRzXWTzhW5yWvUsXc9y1=wTS13BGOaKg+5w@mail.gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: iio: adc: renesas,r9a09g077-adc:
 document DMA support
To: Conor Dooley <conor@kernel.org>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Fri, 28 Aug 2026 at 18:21, Conor Dooley <conor@kernel.org> wrote:
> On Fri, Aug 28, 2026 at 05:59:40PM +0300, Cosmin Tanislav wrote:
> > The ADC can transfer conversion results to memory over DMA.
> >
> > Allow up to three DMA specifiers, as the ADC conversion DMA request can
> > be routed to any of the SoC's three DMA controllers.
> >
> > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

> > --- a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
> > @@ -57,6 +57,18 @@ properties:
> >        - const: adclk
> >        - const: pclk
> >
> > +  dmas:
> > +    minItems: 1
> > +    maxItems: 3
> > +    description:
> > +      Must contain a list of references to DMA RX specifiers.
> > +
> > +  dma-names:
> > +    minItems: 1
> > +    maxItems: 3
> > +    items:
> > +      const: rx
>
> How does this make any sense?

Each entry provides the same functionality; the DMA core picks one that
is available.  This was one of the design requirements when support
for DMACs was added to DT.

> If the device can make use of three DMA controllers at once, you need 3
> names. If it cannot, then just limit this to 1.

How do you expect that to work with multiple (the number is not fixed)
different names?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
