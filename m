Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E77F296BA9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152862; cv=none; b=pIiA+c5ly3zvSfvrjBXS2h2+5+zYIVEqb+etDQJd0OQA4B0B0Ltnl9wSSlVI/DIsIupj1c9LUXy1mxUkOdEuLQgUygwb6Ber+EjWd7l9EmMswt0IsCx7HgKQM2oH6a7GZmQX1ixiQnuHKZtpv6Tpx/rGwSNa6Gzzr65HP4rYFZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152862; c=relaxed/simple;
	bh=2sF6HcEmIN6i9YfzqHKDXrFIWEywko+HERAlV6bYON0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNxGVPfYZgmte4DeBKfX6R+Bte8sQ1dPopzspAD/oRdMM14w0iBkKvP2rvOTvfnka6zQQ8bmHN4RDZurJ72WPag4E5/QiM1PxfjIDI2TcRe0Zlyg3tuMqFOPsFlNrp9u7oh3fwP5hQlfvvWSp6w9g8rmDfTxTEZfmVKdzvOKT6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059fbso239271e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 01:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152851; x=1790757651;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WH/722tAMbnl/tgB9xRugJRNbibX3vChJ1sMrdmR3wo=;
        b=W4DfnmoSgRo0joZkF89P/7fnlgfE3nvCCBiYHY1eNKRJUb2/jRNpRJncRVbjjf0WG9
         ShTl7Dxg8sF/TNpeFcBXNI7hswpGHZwK8aYWN/Kho5mFnfyjWuFq7GM497dMmYLJEoEp
         aolbZbBDPQQ0Wvm1Te7o0+iB5PX5AoG1zhiIeCL/x5QIp89AQji0II5gIg9XCpMHas3h
         BHOas9Yz5squYJ06yQc82aPOwcNQi3IvjeBsCWXqbMQ3NEoKM3a/FNV9S1Ay4QpTRX5o
         ILhoXxY9DR24Bs/UruVkcQNQgM798Aez97HEIgEEm06snVcNRCudKN/wnGgV1NeiDPVs
         hrug==
X-Forwarded-Encrypted: i=1; AKwUvBwaaXoWnlmRkKLnWDOrCdjZHzSOaYZbrZb4DGZrPo66PxGJcbu9eAgEghmdB7Q4Eks60tGdskUp+NZbNvMYXpSoBw==@vger.kernel.org
X-Gm-Message-State: AFuF++kYA91VVKyDaFzgFd8SvogyFJ7d3wNCQUQEFeGzctSquce7XpUe
	xYIbwNvCQQ3zJfHcRVQpnh+Ct7axS2zoEjvE2dlfKeeuJlkdGJY4sO4pBqTbz2RCrAw=
X-Gm-Gg: AYBFou19gnDHgdN6oGLng6Gc97/kZ0pG7tJicLTMYNF9eFBoGYmAOae/yN1ePTrX/Z9
	Dpk8d3yLyyiKPLDaHsso+DKbnwyd0wiIRePcmrb0QFlnSEGBgeMlRagmcCzmC38vCCza3omc3lB
	lI0bKyB5lg3XdVg+s9AsbhUnwf2BiH9J7Mutm3gr/irOz8nBS3d2nePn+/bCInYkGX5rvKbosu7
	ZKzpojjolXoaxxDfbZpmnDMwUS9m79rUl0Hdp0hNgX20HfV8g2ZVHabjTHWh5mxJsrJ+BliKOjK
	E9TwPP4u/yFvyUFqM1bm6nk4gyJzzUagJR/FwlQ+I0kXnpZpj3/mib2lTKq5hJXtaEjJnWqPohJ
	9AwKULBefSt5wm0/cMureszsRJce7W3L/8AHR1ZtiNkmO3ARSTasYBA0DU3b42VhxEOldDlemYS
	/WmCA9Vt2m55Fw2q1RDnP678jex0q/cSi7CKbC42NB0EtxBur3ilghOPxQFKBrFbL5c3Dt/XnPA
	K2JD2KVecD82L3fhcwf+VtlecimVg4qKzR0aevKZMuV4wk=
X-Received: by 2002:a05:6122:3d14:b0:5c9:a617:5811 with SMTP id 71dfb90a1353d-5c9f1654403mr2265698e0c.14.1790152851108;
        Wed, 23 Sep 2026 01:40:51 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f052e2basm2344560e0c.11.2026.09.23.01.40.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:40:50 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78a53fe85easo247983137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 01:40:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwSml40OJ80XKv1+QT3r9j/oUt71jDQJjh0FFtyXiO9Zr0mbL9ijeHTbM/IIYdQX6stmgPwBR6LvcRjKZxOiZaKgQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4b12:b0:7ab:d3f6:6225 with SMTP id
 ada2fe7eead31-7ac17ad2eaamr2011675137.0.1790152849573; Wed, 23 Sep 2026
 01:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921131951.187981-1-biju.das.jz@bp.renesas.com>
 <20260921131951.187981-3-biju.das.jz@bp.renesas.com> <CAMuHMdUx5-P97CFEH3Dif1g4K=NPfkDkE=3vrzjZB-TsyxqO8Q@mail.gmail.com>
 <TY3PR01MB11346F23E0C28056BC78DB36B86822@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346F23E0C28056BC78DB36B86822@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 10:40:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUEv6721mZZ4k4hNoGViOMH2-MZjihUMMD3Lzgjx3ZXA@mail.gmail.com>
X-Gm-Features: AclHuK9ykcDd56aG5463bJ4OIjALo7IIr4gtPS0DT59s2kcKIHbEZhe-4TowiIQ
Message-ID: <CAMuHMdVUEv6721mZZ4k4hNoGViOMH2-MZjihUMMD3Lzgjx3ZXA@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: can: renesas,rcar-canfd: Document RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Chris Paterson <Chris.Paterson2@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 23 Sept 2026 at 10:19, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 21 Sept 2026 at 15:20, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > Document the RZ/G3L (R9A08G046) SoC support, which reuses the RZ/G3S
> > > (R9A08G045) CANFD bindings as a fallback compatible.
> > >
> > > RZ/G3L has 11 interrupts and 3 CANFD channels compared to 8 interrupts
> > > and 2 CANFD channels on RZ/G3S.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> > > +++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yam
> > > +++ l
> > > @@ -47,6 +47,10 @@ properties:
> > >                - renesas,r9a07g054-canfd    # RZ/V2L
> > >            - const: renesas,rzg2l-canfd     # RZ/G2L family
> > >
> > > +      - items:
> > > +          - const: renesas,r9a08g046-canfd  # RZ/G3L
> > > +          - const: renesas,r9a08g045-canfd
> >
> > I am not sure it is a good idea to use RZ/G3S as a fallback
>
> I am also 50:50 to go with either separate compatible or as a fallback.
> Looks majority is favouring for separate compatible.
>
> So, I will send next version with separate compatible ??
> even though lot of differences which are scalable like
> "renesas,r8a779h0-canfd"
>
> >
> > RZ/G3S:
> >   - Selects receive message according to 128 receive rules,
> >   - Sets the number of receive rules (0 to 128) for each channel.
>
> I believe it is a typo in RZ/G3S HW manual as RNC0[8:0] it is 9 bit
> Field unlike RZ/G2L which has 8 bit field.
>
> Since it is 9 bits, it should be 256 receive rules.
>
> > RZ/G3L;
> >   - Selects receive message according to 384 receive rules,
>
>  256 + 128 = 384 for 3 channels.

OK, such a typo would explain it.

> >   - Sets the number of receive rules (0 to 256) for each channel.
> > These differences are not explained just by the different number of channels.  However, it's not clear to
> > me what is the real impact.
> >
> > > @@ -270,6 +283,11 @@ allOf:
> > >                - renesas,r9a09g077-canfd
> > >                - renesas,rcar-gen3-canfd
> > >                - renesas,rzg2l-canfd
> > > +      not:
> >
> > Can you really stick a "not" here? Yes, apparently you can.
> > Still, I find this hard to read.
>
> Other option is
>
>   - if:
>       properties:
>         compatible:
>           contains:
>             const: renesas,r9a08g046-canfd
>     then: {}

Hm, empty block, Perhaps it can be combined with the other RZ/G3L
check below?

>     else:
>       if:
>         properties:
>           compatible:
>             contains:
>               enum:
>                 - renesas,r9a08g045-canfd
>                 - renesas,r9a09g077-canfd
>                 - renesas,rcar-gen3-canfd
>                 - renesas,rzg2l-canfd
>       then:
>         patternProperties:
>           "^channel[2-7]$": false
>
> > > +        properties:
> > > +          compatible:
> > > +            contains:
> > > +              const: renesas,r9a08g046-canfd
> > >      then:
> > >        patternProperties:
> > >          "^channel[2-7]$": false
> > > @@ -292,6 +310,46 @@ allOf:
> > >        patternProperties:
> > >          "^channel[6-7]$": false
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: renesas,r9a08g045-canfd
> > > +      not:
> >
> > Likewise.
> > This one can easily be restructured like
> >
> >     if: ... renesas,r9a08g046-canfd
> >         ...
> >     else: if: ... renesas,r9a08g046-canfd
> >         ...
> >
> > to improve readability.
>
> Ok.
>
> If we are taking separate compatible route, then this is not needed??

True.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
