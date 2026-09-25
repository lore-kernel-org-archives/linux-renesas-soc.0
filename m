Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367BD45D5DB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 07:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322202; cv=none; b=a/pPRD0gnDuSgUiOGklRUDV90BIqvbG717eUd7xlLeeTsSS549hlFY/6Dyh3dplotJXuVzdR2wv4BCqJ6jQFiTlTXbuJsUGt/Ir3aRTDNn2XiCH5xJS5a9S84pWTgZjfgfiRerAlVfQuIfXvvCQWCQpnq3NsCEWx3luCpYMg1lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322202; c=relaxed/simple;
	bh=LdmthTFaZ6Cx7odqrAcqzO4dhbSuBO/RNeKUn9ozC/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=unIv459agbkBUULJNEv7EstGKUwo1/6c9slMkhKMfbJbLfhGxWPT/Jgc2Ptofo/xaouSPRwfw7+OfYa6LF6nEwXT8puDd/s7/S1F68NbD0leYnOwDBWjkBCuoCszwq0H7/tTL4jT/5b5QEPephvxT15rsQhgbieMFLBGnY2/zQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-78a338fe106so1495653137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 00:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790322192; x=1790926992;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OHrY14evUZl7TkXTojoWr/b2Uu7Pe/dQ0XVSo++s0Jk=;
        b=Wbl8gw06Yt7dnVK+ZinY7YZCR+m0FHkMHeEDHXzco/vdtJraZ/0W4s4tr70o8gKsaH
         DWyzrcBo8Fn8BkOgUEbBRdnrhr5t2U/4InXFo4gFZyHAikNXLVwb8RPTiOg9a9d7QKv8
         AYgFEWDlZGb6cIZuPvpnXD0TjLP1NYctowCQCmsd0YBamtVnh6BJFsE4o2z7HU8x9C6Q
         mwdoxNAbPoPRo/IXW1ZBAV5xwog1X4am9nAx1yolVBwDS1WW2RxYYbdgeBznKJqr1ps3
         srKbHUiqJ0Mc1D7h8MrYNOqMQI3rmrRURHqSz+62kPFomdMu4pSFeZoPVYSt8yARylXX
         oA6w==
X-Gm-Message-State: AFuF++lh+L+Jjax988V/MvH4JOXtkjLTk2a23Zwro5EKuVt2MDBhnEH7
	kAinHkpfK9t4vTXrSR+pJqJAcUw2e+XieuqDGjrbO61wATFdD3AWNY6xc373gPfn
X-Gm-Gg: AYBFou2p/sKihA5TU/P4Ko++GtrCmPSJr0Kc7vjINJkZP1EGe6uo5+KC4bXZDHywV1Z
	nTGIiBwUyk3CYz9WvGa/B5YxPBC8yZ0gbmuEzO5UfLux+8Yze1BXknvWm4GfuCprgfTdyrlnudy
	dQI4O5fBy4p1D6y9AnZb5N0I3Jz/9u3rSu+VFTjbhTegXK7rAH0iOvM96Gy28u8zUCAKxmySd2/
	jQsk5cuDDUsaQmHrWlph2XstyjkcOVLGYqv7vk4OmJS0YYBxXkq4IxIaWmT8dj3l+W+xcZw9+v+
	ZQreziLW0pN1FXINdxpe50PkfQfrWuAVlDWMk9vTP6p2ihLkVvM08Sa9AHHb+em9KhqigGc+YYw
	4ABuE9pJWo7Z0zwFOkx6NGgHvPvfO6HBLAuRBhhRbSmALki5AHXfh2vynldvOU9+xHgnZ4D4fpP
	qv81iPSkgGmRzgfwdF0innfzLiya28RC7eA1kEWw6Cbb0nQx7CcPrgLB728zn3jSbz0cqCeHfd9
	ezq5mhqr50DX2l6Y4sEpPM0I6J2HOL/L8p9cFumig==
X-Received: by 2002:a05:6102:128a:b0:7a1:f2b5:646a with SMTP id ada2fe7eead31-7af1f825288mr1394190137.39.1790322192615;
        Fri, 25 Sep 2026 00:43:12 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9861b08f1casm1654205241.12.2026.09.25.00.43.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 00:43:12 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c675e64ffcso1402844e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 00:43:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3246:20b0:797:c1fd:9d87 with SMTP id
 ada2fe7eead31-7af1c68ce3emr1738158137.2.1790322191996; Fri, 25 Sep 2026
 00:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917111349.52250-1-wsa+renesas@sang-engineering.com> <20260917111349.52250-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260917111349.52250-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Sep 2026 09:43:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWy6ksspwvj8jRxf6_OATU5rS5p92KyG4+sEF+ag7S9NA@mail.gmail.com>
X-Gm-Features: AclHuK85B8akfPcq7Wm9lfgYaHe65iE3-4i39ONPSyetOTvniQxGh_v7KkpSaOQ
Message-ID: <CAMuHMdWy6ksspwvj8jRxf6_OATU5rS5p92KyG4+sEF+ag7S9NA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: rtc: rzn1: add R-Car X5H support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.csengg@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 17 Sept 2026 at 13:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The RTC on R-Car X5H is a bit special because interrupts are not wired.
> Future R-Car Gen5 SoCs will have them wired again. So, create a
> dedicated entry for X5H without interrupts.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> @@ -23,6 +23,8 @@ properties:
>            - const: renesas,r9a09g087-rtc  # RZ/N2H
>            - const: renesas,r9a09g077-rtc  # RZ/T2H
>
> +      - const: renesas,r8a78000-rtc   # R-Car X5H
> +
>    reg:
>      maxItems: 1
>
> @@ -52,8 +54,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts
> -  - interrupt-names
>    - clocks
>    - clock-names
>    - power-domains
> @@ -66,6 +66,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - renesas,r8a78000-rtc
>                - renesas,r9a09g077-rtc
>                - renesas,r9a09g087-rtc
>      then:
> @@ -75,6 +76,20 @@ allOf:
>          clock-names:
>            minItems: 2
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r8a78000-rtc
> +    then:
> +      properties:
> +        interrupts: false
> +        interrupt-names: false
> +    else:
> +      required:
> +        - interrupts
> +        - interrupt-names
> +

Sorry for missing this before: the "resets" property is
completely missing.

>  unevaluatedProperties: false
>
>  examples:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
