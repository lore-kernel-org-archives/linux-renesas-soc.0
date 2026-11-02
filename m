Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634102;
	b=pG8VcNTZjueQhK0cYia/a84gSD4uZj8RzLZ9+xxQ7GTh4hvCIwT71SbyThs95274iUPq
	 LCWHENeei44xH138hfX+1bSUjV9qzRic+SLdk4feS+szWYLg0yLbwwbeoiuJjFqAcmQI1
	 2wI32itk8PX3VgQgZzmAM4zviqUW48a5qBq8YvbPZGBIlJpgxe+9XZiQoBhr6tK/F4kLS
	 wrCmyXaXAuyUIzr0iv3qFNLX6M9SacCLYeEmhAUTLKtQN4JcHR7NBdRY4PYP1vuPbj0fo
	 drbK1k6ZUgYLNXR/1pCAuttfMBCvJI1LPR3UkaaydE4fIVJD21cQPdSEVmZNSnLvPiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634102;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DPzzjXN6693zqek1Hiy4e6/v6L1e3dbPSTYAvN3gY8k=;
	b=1FP6ftNAUUKyy0LIYKwRwWQVaiQf+XHleR5CsymI476seW+4lVr3F4UdZdFNrjHrcz/A
	 W9bWBJFnzxuhGoWqnCkCVl08Ebnsrm6PDzUR8uKU6VQXM7vrKXxBG+tBufr5CLLUrG9TG
	 V15J7lUOuAk00ZKv8JmSRtm4MWNL7JGGHsIavNY7P1OiGN7rQioPhgwzG7AV0EdXcI3OO
	 sNcLjYtXuXmUOqXT1VZqQdQwdPMbdxLf/HLUFHBj5CjZqt9nKx3Htc5C7ojH7wvgcsCXB
	 mdv9K400Pb5ziYsLXmUENkTaSWhrShYzgiYuL1UW3idQ92YxImrgeMmZLzDimrDNDRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7FF6076D84
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Nov 2026 15:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E7FF6076D84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso1942260e87.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Nov 2026 07:41:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634100; x=1794238900;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DPzzjXN6693zqek1Hiy4e6/v6L1e3dbPSTYAvN3gY8k=;
        b=pIQ2JbR/bL9AN3324GHIFAUwPGfisP0bS+bvD7ONCROv7rMzH32WVet93clHy+tsEZ
         hfmPkICYEOaWOLVfvNG2LmH1JBzE8LVJyE2/Y0NqI6sdrr01nJB8cd83icrYOzxbS/NM
         PFInNFF+buwoFUY7LZaevvt+7J/NdK+t0pIHCAb8QWDG+wYDkhT7DsNaam3yltRExFxl
         i7ycd86KpIuwbLtg38M8SER6HDM8zUPdOzVbT9VPW3SCa6L2cPDzK2uVAP+H5QKV1bQB
         IHqpFlzNhqtv9fS/6ZB2LnoRU1p9Jeuzb1kZ/HxTdc0D9M0Q8GXeisx3Kg8tX0qocFOD
         +YFQ==
X-Forwarded-Encrypted: i=1; AKwUvByR9m+Hs09YmxDbYqgdb6mj00xHxSyKIO3m5zw7Pku9zCGzVhguHj6KgL25YSv+2fSo0w7SvhuBCAz+7vyGlL7sWw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+trQwsnkMs/8f/K54Ab4SqsKCzMt4QhI5oVDGM700HV7QXyMcD
	p3BL9wyUSqUd4n1N04ELb+qgg2eRnKEzMem8fJl1mInUKBc81FQfwBQcCrwP9Y6LX78=
X-Gm-Gg: AYBFou2Qk5GrogKb1Jw3nf+moxGaSOa4JP4Kl/AuV4iGcIb6yI+WfF9Oo/AkH3RlA6y
	IkRXfb5ObuFPnLU/3QjUk7eegQUR1t+6D8h7v+t5+D4kSKN9SyyKPns2qOpLa4eR0GQjaJLM4A1
	P3pMyP/n7IxNy0TQNKBlwXK3W5VjYEjj8PmJTsSejeC12ojxSStSAaSq1CJfsRzyyQH/tho8Sju
	r/VcDh96UM2hPoHXndqgAl64hSgeragGRmej7NNf9svR0+X3vlCuPbyJL3eve8TKFS12nOBQ9xV
	Q2z/s9iF+gjQt1KnXvtCFX37VgKB/nB3DBpkrg7NuXsrIKjt3Mi2ZlT5rWI7P6nPqMMiYxszfIn
	A7HTVTxv3ty+5ig4xknBj76Shjon2FoW/RaSSZehkYzKDLIammmifrgcFi98O/pixCYhdvg2FGm
	k9vPCuibt55+OpkSyOn5CIG7dNcsmmRWlSqpmtC01WNF3/TTqIIdfFcKR5Lg8naBZbVyfdHJOJy
	6PsRlAQUzbX+I58PkppP6juBoeTn4z5AFUR4b/n1nz5SHSuT4g79naBu5jBuG80ZDBfT6eHa2HQ
	j8WBRkIuQrJKhmBsnRkkPHY0VSoIynExfzM67lMBM2HZ66OxpJofM9JZZqBmPFBB/cADUQ==
X-Received: by 2002:a05:6512:39c8:b0:5be:516f:1b4b with SMTP id 2adb3069b0e04-5bfd9569cd1mr3263506e87.28.1793634099612;
        Mon, 02 Nov 2026 07:41:39 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04ee08csm1720856e87.2.2026.11.02.07.41.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:41:39 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab01c46697so32342001fa.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Nov 2026 07:41:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzJOuBY2kwcz1yQjYApgTrkD3xetVas9+KUep6eiauXfniy0Vj7OcGannb7VoBZPJ3+OPT+FDPiUjke51m5OIrM+w==@vger.kernel.org
X-Received: by 2002:a05:6402:c4e2:20b0:6ac:b3e7:2357 with SMTP id
 4fb4d7f45d1cf-6b4d468b065mr5425290a12.21.1793633677911; Mon, 02 Nov 2026
 07:34:37 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com> <20261026-divo-ssgrlpcsrc-2966-i3c-v2-4-2e76b87209bb@renesas.com>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-4-2e76b87209bb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 16:34:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqKB9Uci115CtDuiUZbpR=K7TM+Y+doQTBf1hK+LnA+w@mail.gmail.com>
X-Gm-Features: AclHuK-3oq7-ogrLm01J4yJ4YAWbiD82Sz0qQlli6C8IYRXs43BlMTULNtsTBro
Message-ID: <CAMuHMdXqKB9Uci115CtDuiUZbpR=K7TM+Y+doQTBf1hK+LnA+w@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] clk: renesas: r9a08g046: Add I3C clocks and resets
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 12:36, Diogo Ivo <diogo.ivo.sx@renesas.com> wrote:
> Add the P5 fixed clock, the module clocks for the I3C Bus Interface
> (pclk, tclk), along with the corresponding module resets (presetn,
> tresetn) on the RZ/G3L (R9A08G046) SoC.
>
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
