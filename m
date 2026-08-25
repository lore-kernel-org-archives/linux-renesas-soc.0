Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEC0481AB0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 14:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668568; cv=none; b=vGl3XmygjtsqnOKnMKE/1WH94hFXDCrkVhBIYsdnes1rFpGmYWOYtAfQqTjtECZgH4hSPui1UXL2SIIV+Y0y4C0nMJC32vxFDQSzeksFWi2KSuMosN9ZuYc3P3aCaoeIfIegOfG6MotQSj0DBIY/oC4QkG+E6KqWOeq72DCdCrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668568; c=relaxed/simple;
	bh=SCzinYuXLvjSrigmXaPRDipldJ+Qb902vZtP+PB/9Ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehvsn+uMWd8/6g5ES38UwsSsPAk2V9PazmtKM8uRAxyqSG8umxgvkHAcwPBO+YP8qYkmlvjfqS2YjDkedXEx38KU+n0yau6yqLUledeG+cwc23QS3pPtZzmFmNtQv95zRiaLUgadUz3dd+3S69TAzqbeOoJzPeEsS8j5a42o9rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bfaa014978so2131353e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 07:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668563; x=1788273363;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S/BSqxIsytWuTzQX94wx9xNgvPdt0/g546s6RHG6Obs=;
        b=otEzRo7xLMiY5tUPgrrT4T0gjB/99UmTlMXMlYERTo/EXFCUta0nmSbXEVbzDXIeta
         MZvMvLxG8+MXtsKuw3vRQmqbFomI0efJS8fJrG1LnnOQRt2/B9aOPeAFUhx2C7cBiQVF
         fP4X2xwMMv/cx/7Zb13UO9a4+jDtrRTqp/CA4uGk/zMZ3m6SFUK9Th2w+GW0C94f1WgK
         jdeHVoFg6l+xQtb9xV58ASJqdO+7tbpyqrHx7x7aOO1wgWJYUtAgiT/FUuB0MG67wBh0
         Gapj5Ly36PT0rjzleeS2eyo69VpeSAPzCZhYXD/zCYD80T5EAx2919PPJQRu5+ZpQTqS
         1m/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpvCQE+NyBmy3RBRB6P/EHKSloeThe6GV7pV5fi1tZ6Z3LA2jmo6jovw+93qMkJl36cYYb9jg3nvtDHyxf1dWve0w==@vger.kernel.org
X-Gm-Message-State: AFuF++lpbdhosg8izmPyL1mp1hY8LeBmBLDfXGBxza/RsxWE8NouPbwJ
	VHmKIPPG6iY1poZjO22NcyKg2dgmaXwC/1LuMDDzxGgXZcI3jJrHA0RsObqDzKPDSBc=
X-Gm-Gg: AR+sD12grl/FraZ9pZ3FNpRisJyjIRI7xkVA9vdwYjeam62SMNMvr0ffjBUxOFnka4h
	rHVCRUP3lsEJSGXpn9Jy2/6GA2xywuY5r1SM11b1JN93blbMDoGT68pSrSIctPRUjv3ZV26/izh
	mk0uWbC5XTF0cTfiEUzfmvLEZF7KH2E+pJcS8mOXc/i4bhJ+7VkYJnvxP52PPp9HEMxxj/6PJXJ
	D6oV5BkhgbKntAfykEEtqJwjZCSuhUFw8/DRk66+3l5qhllkoqIWxbCYz/CC5asOoHEz97QWKcD
	A8GNMJges1kcO5AkAVi0iAV/wBaPx9ujwLDgmuF5FIjplMLFlhkHlgVE1r67Z9oDSJ09bqQNE93
	UU6zVwsYqEAHf5xV9RmgTbbXGCy7veXZzZ1TC5Tjm4M0lEQnPodwUZOjl5E4sQNQdrR9o9YHWPK
	ZRCHEVhI5WqpLDwp6hjKE2N0ateBRB5Uz7jJMbnZchNswSIcVRFXmRpHG9tFgNk/tRK4ldxLMI5
	s7hYefBP3+USeKxRxvDkv6PsQ==
X-Received: by 2002:a05:6122:4b01:b0:5c1:2b9a:7cae with SMTP id 71dfb90a1353d-5c5ff821cecmr12655218e0c.6.1787668562860;
        Tue, 25 Aug 2026 07:36:02 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623d2fab6sm6254022e0c.5.2026.08.25.07.36.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 07:36:01 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97bf8f6a31eso1344785241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 07:36:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrP8uW2KgLEiRUUvNP9w6yQF1nWeMyoav3FJgnksvvLyrFsmyqd9zvH9iFMJLhOD2QLGYs1mJEu2HOGR3gdB4ocLw==@vger.kernel.org
X-Received: by 2002:a05:6102:2b88:b0:77a:3431:669f with SMTP id
 ada2fe7eead31-77a63f32c5dmr11778556137.7.1787668560584; Tue, 25 Aug 2026
 07:36:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-3-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-3-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 16:35:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXc_0Gc0-m1RytTSv9w_B4uMjPe87WQHg0QFP8LamD0yA@mail.gmail.com>
X-Gm-Features: AcwNN1Ukmh5UKBc2zk9wzu2Sw0eK218Xlo9LtqimuxAbEuTVVRxy77cCcK4Llmw
Message-ID: <CAMuHMdXc_0Gc0-m1RytTSv9w_B4uMjPe87WQHg0QFP8LamD0yA@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/G3S SoC
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The CAN FD controller found on the Renesas RZ/G3S SoC is largely compatible
> with the variant present on the RZ/G3E SoC. The main differences are:
> - the RZ/G3S provides only two CAN FD channels
> - the RZ/G3S supports only CAN FD operation; the Channel n CAN FD
>   Configuration Register does not implement the bits used to select
>   classical CAN-only mode (bit 30) or CAN FD-only mode (bit 28);
>   consequently, bit 31 (CAN FD Frame Distinction Enable) of the same
>   register is also not implemented
> - some bits in several registers (mainly reserved or status bits) are
>   read-write on the RZ/G3S but read-only on the RZ/G3E; their behavior is
>   otherwise identical: the bits read back as 0 on both SoCs and software
>   is allowed to write only 0 to them on the RZ/G3S
> - the RZ/G3S provides 256 acceptance filters, compared to 768 on the
>   RZ/G3E
> - the RZ/G3S can use PCLK clock as the CAN FD clock source through an
>   internal clock divider, while also supporting an external CAN FD clock
>   source
>
> Since:
> - the SoC clock generator provides to the CAN IP only the peripheral and
>   the RAM clocks
> - when sourced from the peripheral clock, the CAN-FD clock is obtained
>   inside the IP itself by dividing the peripheral clock
> - the assigned-clocks and assigned-clock-rates properties are specific to
>   the CAN-FD clock
> the assigned-clocks and assigned-clock-rates properties were dropped from
> the required properties list of the Renesas RZ/G3S SoC.
>
> Add documentation for the Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
