Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2446A26F29C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 15:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783957806; cv=none; b=BTzrat3bYGs6+N7RvnxqXjLmH6wO4/WfUELp4eKZUT697pFWLB5iBhkUtng87QwnJ7ASzLuweDo3qeF+B8ZixBhX2wEwTXV6W86bVaYOsqqSnA5f0eZuUUKStDic2CqJ9rOhx/ToWCU7dgRCQeACez51RsaK72zi/fykwIywhTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783957806; c=relaxed/simple;
	bh=SJLknyw1I7ZFIFDDTxB/kCFRzM1gjizB92r2iOvY5U4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DIkx/W+XIZVUYz/MGe5CnFl4usGYugzdl0Kte0CA3n4J4nPAGPpXIXNk41rcNTlwDXxO4swD+Sm3czq/I6RxhL23pcaKlEqqBiKk0XIBw9H2ZP4ooVuMnQvu3bHC2gp8NIiHpxQ1gDh1HaJGzWpIYJFJ2iBUeClnj3eVCMlivhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59cd803792aso2005866e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 08:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783957803; x=1784562603;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KSAbD3g9v/Qpert4xOPXdfLiWxHZNX0hf2rnp4eCCEU=;
        b=cyQjwR8qeT5IqBuL467EjYXgBEB+fxtyXA6wdROpoMXfzTmaYWd5LM3jcEtXs687T9
         tmd7L9/wjF2Et67hW2QJxEHuHABpXb762hKbouJXqNiY+btCAyPC2eB7m+Rcq42jf5V+
         N1Ghyopto9JPDcv15/PsRhNzlAXjYR/LmODs7coMVdlBQM3C29JRPlIZ0uSMZqx5KbW+
         +XiTLF8x7YBIh5tv1fiuzIQzn34EKbv68PBq0tNiqhSKzkezWJU2T+eg9wAYpmTo3Yta
         Y6tqSaqA+1qIp7hDnGB77Z9lDkW82/uG7bZbjCK69S8S9Rf+GWaVFejUkRGaBgaQaEWB
         EKaQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHerjfipYTRw7iz24N49GC/iDAm58rqZvvgN8oKZgMzdjh7UZGkpXtaWO4TyJxsl7/BV96DJ9KYUUnNokXBoj9wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzY+4iViccTyRBZ4CWSSCB4rc7Dy5fW8nD7fr6CPHHCtIVuhJvY
	np0kuHP2auWDAz6ioBGrDh22AkqDafPPwZxMsOoNSlgVxxKjEcBd90ux0o1e+0Q0Lzk=
X-Gm-Gg: AfdE7ckRCBOrt9mcpLI4A/P1x3r/MZg/n5xwVnLXx/s0/C/IQrUMrjA1gj/+OoZwDPY
	zNdwl+yIvAiR/xQkLF4lIP/tdMYn/NE+GCivk7aJsqDRJKl38ijLV9+4BlWqxcK8kBM1XPdNnWG
	ER6L0J2ea+xCdbfhS+24lB4vmw3HxSvVmmnRHmgMkIQ1qah5HS8tEM+10PGKKZA5roFVIn4jvPs
	nVpxelywNuELpfPW4gfbqa/K5fZYOSI+EFvoUIoaOBL3462cf23r6oCIKWl/UvRGSOH+eIyKqYr
	EhKM4og77dZCj8YdOK8fY7WmKtlFJ/aZl6vghz+RVRun6Slkij5NvbHy6JDFzaaIPQBwcjEmmG1
	xhhocX1riSYTSByF8M5Yub40hvneh2CRDriwK3AHNtReoFpj3T3s5gDjjFg02WOyoHsLltf2eRs
	f4zv0ps3u7LUYwruCVrwZ3cU+Qv6DY4iVVKdoNCSHGFW+RnFSFhI6ayPqihIsg
X-Received: by 2002:a05:6122:1816:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5bfbf10eacdmr5464829e0c.5.1783957802967;
        Mon, 13 Jul 2026 08:50:02 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f66eb74sm9256739e0c.7.2026.07.13.08.50.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 08:50:00 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-73b909fbb6bso2109158137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 08:50:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqDoKTGoydQtDZRkhcPw8GPHmvDe9WIE3Y1fDj8IvcV+/82iuyg6PT5XoeeV64tt0Njv3aAnMV/qPsXSQds4QA7hg==@vger.kernel.org
X-Received: by 2002:a05:6102:5605:b0:737:bfe6:3b03 with SMTP id
 ada2fe7eead31-74533bc9032mr5400397137.7.1783957799562; Mon, 13 Jul 2026
 08:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260702123112.161160-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702123112.161160-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 17:49:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU62updtKeBBk-vO3YP+qaWTGqHQnzKvFJbrz4J5eEPMQ@mail.gmail.com>
X-Gm-Features: AUfX_mzILeHyjNiTkrmAQtVDJZX8rJj_P5qd9dfYE_6VlS_CSrZ4h4vly_PscUA
Message-ID: <CAMuHMdU62updtKeBBk-vO3YP+qaWTGqHQnzKvFJbrz4J5eEPMQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/9] dt-bindings: clock: renesas,cpg-mssr: Support
 RZ/T2H system controllers
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/T2H and RZ/N2H SoCs features system controller blocks for low-power
> management and access control that reside within the CPG/MSSR address
> space. To properly represent these hardware modules, allow them to be
> defined as child nodes of the CPG/MSSR controller.
>
> Update the CPG/MSSR binding to support child nodes by adding
> system-controller child nodes using a patternProperty, requiring a reg
> property and a renesas,sys-block property to identify the controller
> instance.
>
> Restrict these new properties to the RZ/T2H and RZ/N2H SoCs to ensure
> existing bindings for other Renesas SoCs remain unaffected.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Updated commit message.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> @@ -99,6 +99,41 @@ properties:
>        the datasheet.
>      const: 1
>
> +  '#address-cells':
> +    description:
> +      Required for the RZ/T2H SoC to define the address space for child
> +      system-controller nodes.
> +    const: 2
> +
> +  '#size-cells':
> +    description:
> +      Required for the RZ/T2H SoC to define the size of the register
> +      blocks for child system-controller nodes.
> +    const: 2
> +
> +  ranges:
> +    description:
> +      Required for the RZ/T2H SoC to provide 1:1 address translation
> +      from the child system-controller nodes to the CPU address space.
> +
> +patternProperties:
> +  "^system-controller@[0-9a-f]+$":
> +    type: object
> +    description:
> +      System controller child nodes representing sub-blocks for
> +      Low Power Management (LPM) and Access Control.

According to the documentation for the PRCi bit in Section 11.3.1
("PRCRN : Non_Safety Area Protect Register"), the low power consumption
bits are in the xx28_xxxx blocks?

> +    properties:
> +      reg:
> +        maxItems: 1
> +      renesas,sys-block:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Index of the system controller instance.
> +        enum: [0, 1]

I am not so fond of such "index" properties.
And of subnodes ;-)

> +    required:
> +      - reg
> +      - renesas,sys-block
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -126,6 +161,10 @@ allOf:
>        properties:
>          reg:
>            maxItems: 1
> +        '#address-cells': false
> +        '#size-cells': false
> +      patternProperties:
> +        "^system-controller@[0-9a-f]+$": false
>    - if:
>        not:
>          properties:

As RZ/T2H and RZ/N2H are rather different than the other (mostly
R-Car) variants, perhaps it makes sense to spin them off to a separate
bindings document?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
