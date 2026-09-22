Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA67851588A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090062; cv=none; b=QW2xuYkIuCXOC7+M/phsedKXoe/L7r4zfwOgbL6M+iX4t3bGriYRlcgpVIcFX+YifIGK1ppIb7P29KFj59qFPM0ptcFr/t8ARfMzk47QWVUYN/bIGzVXNtAUivLaYcGRDVni0ollSLoiKJcVKKCePe/0stPO1Uk/6enTRqLVPhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090062; c=relaxed/simple;
	bh=mKPAm9lSrRcV08N0bMDOn/x6I0AzKpQyWCO4ViNMFDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWfo33Aq03XiZ0SNJUaLa5qe/hXBjQwjvdWj733Fzg4j4ShUQBrX2yBXYYM2ZFfRALXLbLVArxRSkOy3fFAI8SGgnRkZG8R5kr1M9VLG9w++G+IlWOntdXhr5b3iWLkkcNwMMZB6hS8yUyAUjd6zlmUk8Xs726alF5Whkgkxb24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c72bfebso970307241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 08:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790090059; x=1790694859;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xGvRLKavNp07IDObK0x4MyNXPYCHC6J8E0NCLAikfuA=;
        b=yAwmu2uGDE/eItPbPgMq7q+od3GxoRUQCNmDcpWk+kA/2Qj7Bffe+5bYGiDC1DqzVh
         K1uedEbBDjOu4HpvfeUUi9RV+wt769nOgvgoG8fhet4QrqjIom69Nn1Ng+Bfptl/yjXx
         mXEXfMXnKT7JyuKY49MbrScReKIFs20aPb619IinFPhoS0MJCQlnh8SIDiXOX7ru2Ul9
         iNWKE6Yy0hv2G5WZcYiYBdwxZMIJ/61Cvzw0w95Mj9RuD236gK/Lza6uKcKYXwN1K39X
         hisjyFCZ8o/GEQITtJwUFedXbZqd9gF9GkJsIAxukUYgIMmtwscGVyQa9pp8WbURuJ8j
         kzhw==
X-Forwarded-Encrypted: i=1; AKwUvBzv15A1d6ZL4e0NP8nMMuRsmC/MA2iW5d4+/z9VBrDaHTNm7qRpoXS4v8sPDbRU4pYr+DpshCGLro6LGlsutNSr0Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mpNwOkVdMjWvRpDhMAvKYTfDfuEzU6a9Nj4+NSJg78c5wuvwPB
	tM2VcJh4CftsgT56SJdCT9vyE5KPEyokgoADPRtB1WG4HeRjfvwzyhILrVDq98uj
X-Gm-Gg: AYBFou3H7kuodq0iLsXY/JsyGfwjpCR7DUk6hUQRZ6BZJ0O8CN0l7KA4zT/WmrDvqc3
	/VRkHH438Wsvu+KhIAU+pd/y8TDpzF6dzOLpbZurNuyBJJAiAXcFizTBqBJpIR84FvMaqR60evt
	AYuMjJr/WFhX3avVlUbDr3YegxRTRjSQPDVs6H8HyPqKPfJqa5a2dnaeF79/+sXu0eLDrdE8rQR
	TqWWiyoA8MZUpE6aApK6vCHhgmkJK+GQjQIM66AsD7oyDLjXZaAOAnyTn2fJYsroYZ0GIqM7n5n
	iyRwYXlhLqZqYK6SSUfeN2o5aBYnoASHqtNS62IpFIowMfg8Rpp55Mtt98XbxFBX8+MMg5Wb53D
	eLlaWdTh4q+v2cUSDscJ8eKo3TFM3JnaOnsrLuAW67WllWhkhsec0DoSx+68ZD/Ra9tSrV6P/Tr
	IbQuObrZKC5WoD04wm/ytdgMFw8bbxPhzVeg974MCO1eecZYWXNwDCNBmIrBcVyNSVusCYuJY0u
	77eX11hdmL6N2PQQiwf04d+Ts73aeXQEA5JNIiSap/Xybw=
X-Received: by 2002:a05:6122:8604:b0:5c9:c60a:e9b6 with SMTP id 71dfb90a1353d-5c9c60af813mr7373275e0c.22.1790090059503;
        Tue, 22 Sep 2026 08:14:19 -0700 (PDT)
Received: from mail-vs2-f28.google.com (mail-vs2-f28.google.com. [74.125.227.28])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-985169f5783sm17533241.5.2026.09.22.08.14.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:14:19 -0700 (PDT)
Received: by mail-vs2-f28.google.com with SMTP id 71dfb90a1353d-5c9031e714dso1648947e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 08:14:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxNWYO72mNm62yy2CXyaFl5yZywSfn5vONhU7ciQ+ufMloy8r19GbadZ0e7FNk8/9xq0pPFNXnqr7gaGV08XcxoQw==@vger.kernel.org
X-Received: by 2002:a05:6122:6b0d:b0:5c9:c60a:e9b7 with SMTP id
 71dfb90a1353d-5c9c60af4fbmr7493050e0c.23.1790090058750; Tue, 22 Sep 2026
 08:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921131951.187981-1-biju.das.jz@bp.renesas.com> <20260921131951.187981-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260921131951.187981-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 17:14:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUx5-P97CFEH3Dif1g4K=NPfkDkE=3vrzjZB-TsyxqO8Q@mail.gmail.com>
X-Gm-Features: AclHuK-rCbm16AlWI6NRQzJvntZXC9gv_oZQlkAlsfHFavMScH5L1qYsY-ROQQE
Message-ID: <CAMuHMdUx5-P97CFEH3Dif1g4K=NPfkDkE=3vrzjZB-TsyxqO8Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: can: renesas,rcar-canfd: Document RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 21 Sept 2026 at 15:20, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document the RZ/G3L (R9A08G046) SoC support, which reuses the
> RZ/G3S (R9A08G045) CANFD bindings as a fallback compatible.
>
> RZ/G3L has 11 interrupts and 3 CANFD channels compared to 8 interrupts
> and 2 CANFD channels on RZ/G3S.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> +++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> @@ -47,6 +47,10 @@ properties:
>                - renesas,r9a07g054-canfd    # RZ/V2L
>            - const: renesas,rzg2l-canfd     # RZ/G2L family
>
> +      - items:
> +          - const: renesas,r9a08g046-canfd  # RZ/G3L
> +          - const: renesas,r9a08g045-canfd

I am not sure it is a good idea to use RZ/G3S as a fallback

RZ/G3S:
  - Selects receive message according to 128 receive rules,
  - Sets the number of receive rules (0 to 128) for each channel.
RZ/G3L;
  - Selects receive message according to 384 receive rules,
  - Sets the number of receive rules (0 to 256) for each channel.
These differences are not explained just by the different number
of channels.  However, it's not clear to me what is the real impact.

> @@ -270,6 +283,11 @@ allOf:
>                - renesas,r9a09g077-canfd
>                - renesas,rcar-gen3-canfd
>                - renesas,rzg2l-canfd
> +      not:

Can you really stick a "not" here? Yes, apparently you can.
Still, I find this hard to read.

> +        properties:
> +          compatible:
> +            contains:
> +              const: renesas,r9a08g046-canfd
>      then:
>        patternProperties:
>          "^channel[2-7]$": false
> @@ -292,6 +310,46 @@ allOf:
>        patternProperties:
>          "^channel[6-7]$": false
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g045-canfd
> +      not:

Likewise.
This one can easily be restructured like

    if: ... renesas,r9a08g046-canfd
        ...
    else: if: ... renesas,r9a08g046-canfd
        ...

to improve readability.

> +        properties:
> +          compatible:
> +            contains:
> +              const: renesas,r9a08g046-canfd
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 8
> +          maxItems: 8
> +
> +        interrupt-names:
> +          minItems: 8
> +          maxItems: 8
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g046-canfd
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 11
> +          maxItems: 11
> +
> +        interrupt-names:
> +          minItems: 11
> +          maxItems: 11
> +
> +      required:
> +        - channel2
> +      patternProperties:
> +        "^channel[3-7]$": false
> +
>    - if:
>        properties:
>          compatible:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
