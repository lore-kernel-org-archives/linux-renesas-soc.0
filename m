Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2153A544B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005424; cv=none; b=GbxjUfGoFrQ/sYMQwxcUXWcx9PVuK/MbwDsyEbgXM59K1BVHg58xbhBXiur0ftjgay+xTCn4MdWO5rLYmJIISgKAPBT7K0SZ+q8pSuDJ+/vM9N2mOPuskehF8Z8si6jikWWfD5TTQb82aA3FpYZnDUy/0N9OroRitiVj07cVgV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005424; c=relaxed/simple;
	bh=9ovGQYlOjYxK3plbHA0lDCx38GOv5tYaaRGjIx9Ah74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WH3kVHcJsCegxHH3UvfncbpwCOC2Lqa3ep34EudwBM8/aEj8LgJGdONtnKklN7ghhGkY+Z7OnSkAlHcjg9oZgxgZD0uau1ERKIyoXsl6uITnxeFmAMM0jbmV3hNEAaXsUkxV82hRuIpDMU/2ChHpBo8dBD6Csog/qlqHbsVGRns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso1990059e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 04:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774005422; x=1774610222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BS48mKiSSOgr/13p71hpFJpaqE1/Y7kt2W9Pgmdu1rI=;
        b=bDM7u+Leqs64V3NeKKl4IcZyCY7oQ07Onfz+KUpwMPU1x1faxvcHMiXqBm343KM9/0
         1t+pblF76JTv/XxyQn82oIge2BNqN3KTb4qtGXL26zugNEscXRopqoa4UfS3zp6XILpW
         NUCLw5OYqbx4pQenbgSv4ssPUPhMLKAmNQ2i9YJBJIva0Z4UpgY/bnluiBWo3cgPudbh
         nNyiGQCYdhurF2yNoZ3v/Cs6x4nDV+U0w+63QUX4FXi4eVGPn1lzNoW3px1fNOqhuwGH
         ZwjnU1gIlY1302GxD9yCyRHDtIZzuxgCZ1EvKBzTqSPtoM8BL2XriqR+l5+aoWe3eGVH
         x1nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxe3YEyeeIv20slbqeoz1LjG+kUnCkj5L/M8vRVLs9etDPFdvzZykGkecIlULlSVj+xrbC920vK4Y9g6QlXHJZ3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRLfyUjofVN3EhXUuwGnhzyOW3LeLrT6yVs/kAZjsn8Ha/ge+A
	TjPIFwQwMOWbVd7um5l9h3gcoCfF8yMVJwmgGGeXqwfvdOPLt9nTg4IX/PUgLNY/SqE=
X-Gm-Gg: ATEYQzwu3H+EaNh9Y8l35fNKaCYmruQv+FI9DrUabdltuOm8GVN1fRu3R4oE1vJ52CJ
	Vb/eI/Wrwu/6ER4PnK90u+CDr8Itbu2+qrwHaIoinRZWX2hAnfvMZzdfDQ54U1BLRrAIXNntSFv
	ia5d7V6LbU8s8ypuEa6J/ZPF2Z0lH+omt1jAayMcX9TbziRSO5qhsT4/X9ALAd0b0gVY+mxG4iV
	qZoH9c7cZx5EUi2x6VagurGM/SBtnWFifS3OTNPYYgTi/lhG3GihZ4rp8F6i4v5RGcqt9gXA9fY
	suyeE2U/DEv3t8pwc+IxBNHUwazexeqT//YlGfpn9jZCwR4MJa6DYDvYw19X/elcABhlZLb20ka
	XFtnEbr9TDYZfwwT3rMZSTziVgDk4/BULmRhpgjbLNyDaxSTD/8LAjRcnGcjvkrcrPQTXPRB4Rd
	8oovUuFD/r2VGrxrCJyn+IWInZkWlrCqaNVpeOmLxp/nSws/WLvtGnv0i2ZnGK
X-Received: by 2002:a05:6122:2885:b0:56b:a534:42c0 with SMTP id 71dfb90a1353d-56cde43deecmr1386659e0c.15.1774005422183;
        Fri, 20 Mar 2026 04:17:02 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddcf1554sm1420084e0c.17.2026.03.20.04.17.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 04:17:01 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-950b8124974so1017406241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 04:17:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWO3W1olhb+WuovmP00XssnVRbjhBNJhAcJGt3r+fdwLw9TvoWkF70LaLvq16I+09B+tunx7X9rTveFUCvJpLcO6A==@vger.kernel.org
X-Received: by 2002:a05:6102:a46:b0:5ff:b8d8:b40b with SMTP id
 ada2fe7eead31-602aeb16725mr1396805137.11.1774005421334; Fri, 20 Mar 2026
 04:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com> <b634c10e632fed07b5652c11de060deca27ead90.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <b634c10e632fed07b5652c11de060deca27ead90.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Mar 2026 12:16:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXxUzTbABO4LXMKV3EVxYhBhFRnM4haxkhryypmaCL6xg@mail.gmail.com>
X-Gm-Features: AaiRm51HNwZDCeJmEpbXlgoq873Qn3LQLzzhwtaltybEWlaMXE_ceM8X-KrNbxY
Message-ID: <CAMuHMdXxUzTbABO4LXMKV3EVxYhBhFRnM4haxkhryypmaCL6xg@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r9a09g047e57-smarc: Enable RSPI0
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

On Tue, 17 Feb 2026 at 17:25, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Enable RSPI0 on RZ/G3E SMARC EVK.

which is available on the PMOD0 connector.

> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -167,6 +167,13 @@ rsci9_pins: rsci9 {
>                 bias-pull-up;
>         };
>
> +       rspi0_pins: rspi0 {
> +               pinmux = <RZG3E_PORT_PINMUX(M, 4, 2)>, /* MISOA */
> +                        <RZG3E_PORT_PINMUX(M, 5, 2)>, /* MOSIA */
> +                        <RZG3E_PORT_PINMUX(M, 7, 2)>, /* SSLA0 */
> +                        <RZG3E_PORT_PINMUX(M, 6, 2)>; /* RSPCKA */

I will exchange the last two lines while applying because of sort order.

> +       };
> +
>         scif_pins: scif {
>                 pins = "SCIF_TXD", "SCIF_RXD";
>                 renesas,output-impedance = <1>;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
