Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ABD3F4DE9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372619; cv=none; b=SsDTVh6YLhG8TrGJ3V1R+YyjnTzjoajCS7dIcV7XCj1OoLX1YKqb69pB0CVCrZvLQGybvYdNw9zPiU2WywwUJJ8lTRfmXNamdXyAf/JxA05yCx6MwELUIRTcQ/rG/CUPJ9YdqEPddDzCftQbLpp67HqLEYG68BB30MrPuVMW3W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372619; c=relaxed/simple;
	bh=uB/V/Xhwg31kLJGNDAMpcVbvCMFk1PoC6Tb+YOPqJRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCirmGDZu56EMDBb4xTqygate47Bsd76OnpOXg85IUnUt3Pb2gMB3vtxPcLaTqaVc5TSgcL4goQfDAo4899yVKgx35/V7M/1E0H8HXn2L7o/if9fNO+N8ucPIsP8QC9fXyc9K5/ZPBitlpkJWHZtYyYJ4BkTIcivDw2FobBcvlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-75609e844faso1191643137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372614; x=1786977414;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=r94n0vzua/1UZahvN4jqc26Ogu/WR4RiCq/SwY+n7Ol3QPo/f7egBzSNWMof427RWG
         +K8u76r43E3WxBgEwwmFmauRp6QsQBO6z/tUcsdLXZu0C80W6D5Ixp4j0WG29udQppp0
         tsdSVJEZjUb9d12vTZ+rW8OIwaWJIqzeXKY0G3DqQfTgGDCAYXObBeLlEXHRhKUYLOrt
         io2wopo7s34GlioM09m75E6/2gdb6M3EsPgCZ7S2/Q9LIbu4XLhQErdoVw9rLFoSHKZ8
         y3ya8v7jYAB+zaMx9tXYNNTgZn2n4h5WvsOMZ0+lK8g1hysRPtVN9wHq57fJIVWwOXDg
         vbqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5+zzG5mhfFN02DPGCrCSlAPqG6Zl48WlZ8h7rIGxhdt6gEjX99gebsfSRtirRZZ9VUrNGjXTJLE2DMO7qs7nabA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8eCj7v0a7v3mrOq3ns7MBwIygzukTKoIca0WndEiP7wJmPgMu
	aNTmXMPcc/y7lpxxzmW2Qt3tLIayvoP86HzdSr5MBCoiE0kq2NA+deFuVfHPWUr2
X-Gm-Gg: AR+sD11g2JSZ+1ia2GBT4bKLP+6SuaMj5X9Z3UiSkKW3CMHd781HdLL6vrt1FhIQCpZ
	F9NdzGZfRjAa432f7FOYVLCE109T+vEPniKwS5kQe73/TMADoMD0nhJbgbspJ7IkIvH/OhSsC0S
	s64wypjEYY1m1Eqbs3Br7Ps6Eg2zBxtLWv+pd5tuSdB/lESM5Cv/KbZiC3v8DZ39NvLJgh5cbt6
	Zm/xHJ8jEPv9bpk0eblhxYdtjRtrWbRtHdnwq4SDEkk3Fn7/DcjcuczoVuTp1ri4kpsQKI5pDJf
	D2RswICNpUrswL2dqV4NVmVfXTQmjKebtpFFgmDU1AmryotwhPy1FCM71OMz7z452mSEfIQ2Weq
	KeiyFUbgyqcPxFf32BUZJUshIVOQ+hswmOw0C4x477cGM+ZKxR5D9v7nAJeqsE18ajTw6WTJGrS
	6/GBeSZWx+vyrTx/ZRVXJabnKHEYg0J+GS8ZqVsk7tUZz5IXB6swWK7Y7GpPHZ/NJ+cmvsJgK+4
	zgLWTEYt5aI1HtOWgxZSyZ+NAQdNg==
X-Received: by 2002:a67:f813:0:b0:744:e453:b1fb with SMTP id ada2fe7eead31-7652079f78dmr1671004137.9.1786372613793;
        Mon, 10 Aug 2026 07:36:53 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979ffd28f6dsm3187697241.4.2026.08.10.07.36.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:36:53 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c39cb2115cso3084424e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:36:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrUiOR4MYLxXe5k4fPdJWn1DB0E6zppgW4MkqobMOGXmZFXNDS1zxf7cawziPFekNkgDPpAaRXrPtaMsXohyJ8byA==@vger.kernel.org
X-Received: by 2002:a05:6122:3b8c:b0:5bf:9b0b:5b27 with SMTP id
 71dfb90a1353d-5c41535b76emr2107981e0c.6.1786372612728; Mon, 10 Aug 2026
 07:36:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:36:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNWH5P9gb5oknZx1epwxromNv1YesG2J3yVqnqm7ZZaA@mail.gmail.com>
X-Gm-Features: AUfX_mxCJ0ZS0nGlmcMm8LzPuT-W_y3qMEElgtPtAf5z9mDwsGw7FQLMUFJtO10
Message-ID: <CAMuHMdVNWH5P9gb5oknZx1epwxromNv1YesG2J3yVqnqm7ZZaA@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm: dts: renesas: koelsch: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
> the system wait after deassertion of the PHY reset and before start
> of communication with the PHY via MDIO. Opt for the same value as
> used for KSZ9031RNX, which is 300 us.
>
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
> reset high is at minimum 10 ms. Set the DT property reset-assert-us
> to 10ms because the KSZ8041RNL RM does not explicitly spell out how
> long the reset has to be asserted, but this at least covers the worst
> case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the URL corrected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
