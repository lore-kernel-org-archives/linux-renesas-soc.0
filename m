Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39EA36E46F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 10:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220833; cv=none; b=avu8dTLWoLzzib/j0C8iB58+Fs8lWrbHb7oHNDAsEWn7kMOYG5Pl8uEGdDEe8u7mrf5LVB+hmN1KOVWx0Wx+SrHb1sIzzMPoEANVCStOQeqF+r4Q/IH7Wa4X4fd+5nyhl8PsCyuFtzzPxmllDN6pzmUfWburfR1FWvrtqtf4doM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220833; c=relaxed/simple;
	bh=J8SsCEbocsyTwxq3MZbYRuvps2cw72VJe49uJ1IGeUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhnTTcpB8kGGwyXst9DRRKTL7bE68pXfNJEwCcf7QQBhz/wJCoQjvPX0IjYqpPjNq3PpcIcSgO31dMe8MAtcSzB0jqeHBQ/YkaorEZIud8ar/9X47e7ZNF8sgwHZ3t1OCCvZGcUerOaql992uzdm86wM5w1z0V5WRl2sIXxTApg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bfb3347dc4so1473692e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 03:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220825; x=1787825625;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+W1h9goTHh77Au8749p4RyYvKYe3xrOhWg/p6R4W4WY=;
        b=SWtqAKjDh75bVU78SLNirk3YSbJstG6GUu45l4HRPS9gg4jZ8+p0EhC2K3kFITcaVq
         DVAgJRNDbp/Jgb8FjViFkfWyHO6gjHYd8ofVHF8OzGeBxUqdG0pGKSI2FQ6vggf3Y8Yg
         71CtUeeIfd/c1Ut7mRXReR0z1CeI94ZpCtlNuLBhIB2XdtQbfaCOWMN3SAQ3AttI+nFq
         q7ihtyl9eGKqicTNsqtU4uKextmMaoSCxSX5U7B3u9ls5wXP12hCjZFXNuwuHwATNTZW
         kJwiT4UBdXdgVMzlLP9SRvPnBGPBrzWmvUQZadLq0yJkq2j24X+5FIvbiBPIEGGTMhVM
         f6cQ==
X-Forwarded-Encrypted: i=1; AHgh+RoaaCeFYPy+EuGQdb58PusB1AT7s++xy+xxd98PKY9/N8RD7+HddmKB8YmWHKpaDiXyWpUoo2qP0yUjAIN+TysrNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdTlFu/RAM1dawIpjJWNjmMnAziND6/p+7lyz8ee3ZFP6G7oeS
	cgXp65QJvIDarPX9PMu75WoIg+81v4DGP1J/Sqybh1Cmyzrb9uB8SdKfsi1jaIE9
X-Gm-Gg: AR+sD11Gv4CKF+wCcgCJWQ2WcDHOMgkNS31W+V+/mlew7A0buajiObjCOgJ9M4C0cnX
	wKQrMd0+J/VA413Xq63LN4wTYVVsv8+hJRxzj1yd8J6R/gV8ThSMUCfe/iLyni6AdPVY3vHGZtw
	CdKT/crfTYDT8ZrZ39V7KRg0aTmUzJuxu9bckgdpnS+jyJVj26GaRrRIoMfR1kQNziyXnL2QqTw
	Ts5vjoLmTx6THltYIGzQnis8qbOyuhsgKMFUucwjTkdDlXAlu6vIf0egWcWbzcfIwRNDYAf1GBl
	MfTfguQ0yRljgW9r/5edm/Yt0VG0XjpKv0ut32Qb2uVeFmQOv7XJG1+T5bHfQV/BXxvJs2NXwdS
	fvqU2RZBz/qEQ7A7nvTv6DSLB9huVUvWdnpqxYvnlivTI01V5nzZsiKnFrOloXwzsRi9Xa3cmuE
	c2qSXwYFc2bNLyJTY9ht6G5xwpvynw5vLQcFJZLIpQ0IPdPnN+Lx9dywiCZYBrX4MTHqHcLAy7K
	0kAH+x9ZqCXYiFnz5R7DMeqTA==
X-Received: by 2002:a05:6122:78a:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5c5e3d73b16mr4642999e0c.5.1787220825086;
        Thu, 20 Aug 2026 03:13:45 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e25e3464sm5369233e0c.2.2026.08.20.03.13.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:13:44 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97c4fa7ba1bso881835241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 03:13:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoFc3Dklr6M3HWZD0gw8soXhmBpInaSpmrYBjMxqi4i6AYChOzNLTJ9Fl8cwO4APS60jV6+rblhrEvgDNeKdD815w==@vger.kernel.org
X-Received: by 2002:a05:6102:370f:b0:738:fd01:5b63 with SMTP id
 ada2fe7eead31-777f8f80ec7mr4599483137.4.1787220823887; Thu, 20 Aug 2026
 03:13:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820095742.3094558-1-tommaso.merciai.xr@bp.renesas.com> <20260820095742.3094558-2-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260820095742.3094558-2-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Aug 2026 12:13:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUu8M4Xjb27XLcMWGYFk6NdKwKB6WO2ZQ_FCAvMTJshQ@mail.gmail.com>
X-Gm-Features: AcwNN1VNatSgn9Gu7wVYSsx8Z9RP9z3QZYhaLomWZy8kncfpOIt52cycw16PoQc
Message-ID: <CAMuHMdXUu8M4Xjb27XLcMWGYFk6NdKwKB6WO2ZQ_FCAvMTJshQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: renesas,r9a09g047-sound: Drop
 #clock-cells from required
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Thu, 20 Aug 2026 at 11:58, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> `#clock-cells` declares the node as a clock provider for AUDIO_CLKOUT,
> which only makes sense on boards that route that pin.
>
> Drop it from the required list so that boards which do not wire
> AUDIO_CLKOUT can leave it out.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> @@ -298,7 +298,6 @@ required:
>    - reg
>    - reg-names
>    - "#sound-dai-cells"
> -  - "#clock-cells"
>    - clocks
>    - clock-names
>    - resets

I disagree: this is a property of the sound block, not of board wiring.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
