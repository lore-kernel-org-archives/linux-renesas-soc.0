Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0BD4503EA
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 11:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436232; cv=none; b=DbzXBY7e2CYoQz8u3B7GlpOyupTCVKS/D/KeFiTOn3U1pw/W/UyOo+68FXFqIsK6U89D4tOf/9VODK/JOh/DOP/daRDGIkXJIme26tYwecO6tWQ7cASq3vBcHiqYg/6/1R3oxVUNOMfFibh1Zaji3T/pZoExQYWBtcj8B1cLkqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436232; c=relaxed/simple;
	bh=AZtEdIaPPbhD4/A0ZGd8Qn9yHBYIYPtzbMktiQmSNLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MT5ZZvkamwdj5bQ8plfmt+/rCWcU9nCPG6e/aiFKnva1gjbuTx+36ZMLKm35LFADxvg5dXVoXSog0zWUErzvBhh5pH5fjF4C3+xDTUd/BuQlhHeNsl/vB2ea48XaMpi41F3BKIy17YjipLX1P9GgUVeUl8Lprc1DE/Fnc9otEaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52f1a320162so20175411cf.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 04:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436217; x=1789041017;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8/u6qCvNI1eNvTKcm5+U1ybbBEt77cvtW8ZuFisi1PM=;
        b=SDoFazdhNeiT4v8b5r1cCf+DDMGlePdQ9vQLi5xHSj9Y++GfitQCmshY0jewtCkHaK
         ZV1Afl/cESqiu5qq79rH3v19+26bS2B0/AaQ9ZXalT7mGcUSB8t/kmSAWtpZcvvb2sBJ
         oz/YPYFxRgL1F+yuoLYc+kAHkhpnyOvFzch2t9LFnFRRsDFPB14eKL37VGQzMWnZHVaF
         mbuMx6vWeqWAhpMfGmvX5XzxGHhwYQX+PwZNUHfgpOjixeQhRJTKEHxf71lH9jaA6x2+
         //rJsKbnhInVSmyzMEIJgKSHki7//A4S1pDWvkwEEZvXuuEZbs+3odSA4RztmWUsfPBU
         LR+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxlaJo7x1bsoacB1T3ntTjBwGAr8vJ92QSGmhFKW5iuOaWItdjdHSTPGwvaMHpu3dtg+yXRhKMdOgk0KqDit9msRQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l0hIeiv5s5yEGfCuehqZvxc/V8dDZLR0n/GUlDu9JX07p66ZeJ
	ZiPisKOUB3Dn3a+K0GWhPidfWLa8SFJhu+D/BpmpDc7gy+vhUQJxv8AgSycq7fLD05A=
X-Gm-Gg: AYBFou1Bw/B67WFxqsQiP5c+FWsgfCizNRG/95wsTcT25oP3+zwWX0nQ9YLvqRSUQH8
	krtrzO480rzVUzBxdtoF202yT2nZrfu2vRbyIHTsg0a9J1ibhvV+BhcZY1dbzw3UryYJetpKeDw
	BqHl35q9gJeLJk7t33vDIBAMH4SJYCgkknqY1um56J5O+5fIrKjj61DykBbS+KumQGrN6P6LF2J
	xZLgFkYzLwJyOKlTLsqTazBoZoXz843hS8/PCW7tZsZSWte+FfNJjXFasvBjFI+tlQRsfCofNIV
	kfleVexRAG45xmMU4PMnRVdWQpd5YSBgqyRukWcZhPS56TpWjnmC0dujCemVjX1GIz5bq+m7ll6
	R90uc4B6OBkvLDLdHedbmFmPKcofAp8XTGO8tqD/sAR7MPWE0kjwd2urPYkQQJkk298btdxcdhN
	sQEQXujGiPdCJtE50Mdr8VjCzrfsnF0oEjqGiimh0xkBfNmjcME3rx3y/DGBAMGKhhFhu5tBi4n
	PvuLxH2v7nISml00KM5Ptxcsg==
X-Received: by 2002:ac8:5949:0:b0:51c:c6c:9d65 with SMTP id d75a77b69052e-53036ba3034mr115335661cf.1.1788436216918;
        Thu, 03 Sep 2026 04:50:16 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331dc460sm41103121cf.18.2026.09.03.04.50.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:50:16 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90e828b309eso28505066d6.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 04:50:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzYSY/hqEStF/0CgQm37d/AIMb/RfEdjypho2OYsR2eYAp0SQqQrorQThWD2fqmOrxIOqh72WA7G/3ypCGCUVWfUg==@vger.kernel.org
X-Received: by 2002:a05:6123:2c5:b0:5c7:a844:48a with SMTP id
 71dfb90a1353d-5c7d2801fd4mr5329323e0c.8.1788435872300; Thu, 03 Sep 2026
 04:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828122113.1426778-1-tommaso.merciai.xr@bp.renesas.com>
 <20260828122113.1426778-2-tommaso.merciai.xr@bp.renesas.com>
 <20260902-heavenly-ambrosial-trogon-b7ab03@quoll> <apgsOubuGuvw_0rf@tom-desktop>
 <CAMuHMdU0y5Dg9tW7fAM3QQHKpAw_+vmjj7v-XeZmrushQgQFAA@mail.gmail.com> <aplTgBjpPX9d6XEh@tom-desktop>
In-Reply-To: <aplTgBjpPX9d6XEh@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 13:44:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcHN9ndLyNCpinRDZpeX-qRQhfiL=Qxxh6gJhp9pURaQ@mail.gmail.com>
X-Gm-Features: AcwNN1XZ3OM_lakDx5H4wW1FhegMnSx1x5XdKbO9842TU5e3GqmmMjZwi3rTP4Y
Message-ID: <CAMuHMdWcHN9ndLyNCpinRDZpeX-qRQhfiL=Qxxh6gJhp9pURaQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Thu, 3 Sept 2026 at 13:01, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Sep 02, 2026 at 04:20:51PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 2 Sept 2026 at 16:03, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > On Wed, Sep 02, 2026 at 08:37:06AM +0200, Krzysztof Kozlowski wrote:
> > > > On Fri, Aug 28, 2026 at 02:21:04PM +0200, Tommaso Merciai wrote:
> > > > > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> > > > > Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> > > > > Processor (VSPD), and Display Unit (DU).
> > > > >
> > > > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > > > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > > > >
> > > > > Add new SoC-specific compatible string 'renesas,r9a09g047-du'.
> > > > >
> > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > > > > --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > > > @@ -21,6 +21,7 @@ properties:
> > > > >            - renesas,r9a07g043u-du # RZ/G2UL
> > > > >            - renesas,r9a07g044-du # RZ/G2{L,LC}
> > > > >            - renesas,r9a08g046-du # RZ/G3L
> > > > > +          - renesas,r9a09g047-du # RZ/G3E
> > > > >            - renesas,r9a09g057-du # RZ/V2H(P)
> > > > >            - renesas,r9a09g077-du # RZ/T2H
> > > > >        - items:
> > > > > @@ -35,25 +36,51 @@ properties:
> > > > >            - const: renesas,r9a09g077-du # RZ/T2H fallback
> > > > >
> > > > >    reg:
> > > > > -    maxItems: 1
> > > > > +    minItems: 1
> > > > > +    maxItems: 2
> > > > > +
> > > > > +  reg-names:
> > > > > +    items:
> > > > > +      - const: du.0
> > > > > +      - const: du.1
> > > >
> > > > du is the name of the device, thus calling items "0" and "1" is pretty
> > > > pointless - indices already define that. Please drop the reg-names.
> > >
> > > Will drop this in v8.
> > >
> > > > >    interrupts:
> > > > > -    maxItems: 1
> > > > > +    minItems: 1
> > > > > +    maxItems: 2
> > > > > +
> > > > > +  interrupt-names:
> > > > > +    items:
> > > > > +      - const: du.0
> > > > > +      - const: du.1
> > > >
> > > > Same here
> > >
> > > Same, thanks.
> > >
> > > > >    clocks:
> > > > > +    minItems: 3
> > > > >      items:
> > > > >        - description: Main clock
> > > > >        - description: Register access clock
> > > > >        - description: Video clock
> > > > > +      - description: Main clock for DU1
> > > > > +      - description: Register access clock for DU1
> > > > > +      - description: Video clock for DU1
> > > > >
> > > > >    clock-names:
> > > > > +    minItems: 3
> > > > >      items:
> > > > >        - const: aclk
> > > > >        - const: pclk
> > > > >        - const: vclk
> > > > > +      - const: aclk1
> > > > > +      - const: pclk1
> > > > > +      - const: vclk1
> > > > >
> > > > >    resets:
> > > > > -    maxItems: 1
> > > > > +    minItems: 1
> > > > > +    maxItems: 2
> > > > > +
> > > > > +  reset-names:
> > > > > +    items:
> > > > > +      - const: resetn
> > > > > +      - const: resetn1
> > > >
> > > > Drop reset-names
> > >
> > > For reset-names, I got the the following comment from Philipp in v7 [1].
> > >
> > > Dropping reset-names would force the driver back to an index-based
> > > lookup, which is what that comment explicitly asked me to avoid.
> > >
> > > [1] https://lore.kernel.org/all/8382e2b9fd07fb1132c26e228b3899336fc1fdd4.camel@pengutronix.de/
> > >
> > > Philipp, Krzysztof, could you agree on which way you'd prefer?
> > > I'll follow whatever you decide.
> >
> > Until we get a variant with a third interrupt (or reset or reg),
> > which is not related to the number of channels...
>
> Just to make sure I follow: are you referring to variants like R-Car H3
> and M3-N, where the position in the array no longer matches the channel
> index? From renesas,du.yaml:

Not directly, as these don't have any non-"du.X" resets and clocks.
But yes, these cases are similar.

> [renesas,du-r8a7795: 4 channels, two resets] [1]
>   reset-names:
>     items:
>       - const: du.0
>       - const: du.2
>
> [renesas,du-r8a77965: 3 channels, du.2 (channel 2) does not exist] [2]
>   clock-names:
>     items:
>       - const: du.0
>       - const: du.1
>       - const: du.3
>   reset-names:
>     items:
>       - const: du.0
>       - const: du.3
>
> If so, I agree: the names are what makes these unambiguous, and an
> index-based lookup could not express them.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
