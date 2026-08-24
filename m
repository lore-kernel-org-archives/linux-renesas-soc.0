Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79B3377566
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582017; cv=none; b=kPSbcr4ltRYko9C8GbmX88PAPNK5+BuntB0SufQaTcLYYVRGjvhYs9udBse+r4z2OYfgfQtxqMZryXLS8p96yPCsuvAVFm4jfmkdPslY9VdDQ2V31/4qYfWThdIwSZBhcytY74STvFkf/J4LJr5O9SqZWxbOHWufEC05PBFu8U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582017; c=relaxed/simple;
	bh=9lOz/HheY/JgyQO68g2hJfw7pgjLIzpYJzoipc5Lkcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s57v+snhKvVr7q8nfzWa5sjbR+X4TGATzzowi/FkYi1XoSTNiwdfEgQgjKF6c4OOynQwMKFKiwTlJdlmhUzNmERrXdp69nxyPKBSE61UdxeVa223JzvZfPLfhN6PMrAQqwN50ELbP3csYV+QT62S/JhU8pxi9IMxmZhvY6UUj1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so632312066b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 07:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582014; x=1788186814;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3GPQezqjhBkpGCOBKEYotnOOM0fAmn0TURaAn/z0fIM=;
        b=lG/u8UHPTNnXMr6J3a25Wrwmfz3WXAIzOlm/FjlDLED3e4d6oCIOtyVtRPnzpw0NmU
         lyX60ijzVXHEYzvoL2/fkWmT45B+tFTWG88DLNzzCcfGv7Jgv/Kl5eoo/dfcXhRL8jWT
         7wUrbL57UmW3CeSG2V72q9dYDuMLJaqMulW+vLU/zUF8kEPwU8/9aloWxDTXetzaEQPF
         6T6KuV++o6jiznuapqOVlo3dNrojHsNrctm+EMlGodhitzube1Qxsc4jl6QLQJ0bZTMK
         Dx6hNi5Rtt4SaOO9cUq70twjA13GkAE6s/bRQhHUvGayPPDGoQ3IUDwJc3LHrV7V3q0o
         kc1w==
X-Forwarded-Encrypted: i=1; AHgh+RqWPTpkt5f68lQ7zdpvM0yMN/YLluyJukWx8V0DwgcEcg8h1dV0EQKULZbfQymHlgub8XJDKNcF+hZJhQlidR2JEA==@vger.kernel.org
X-Gm-Message-State: AFuF++knh9TdSFPGsAyqjPDBrf4pQcNKyF7i0siY40TDlnymcG6sWzSB
	EcnGtJ2Al0EL+83v5BQmcs9WMnoGCgT7akzcslh3e0ChJ+YLrSR2IkNH73OUUN/py30=
X-Gm-Gg: AR+sD11FfJki22a5bC4veHgt65AbfQXk5U/WybWYCcpqHVACcci3UM5Bngy3Q8WwuXL
	ALETAcdo7DvQb6akWvyQMta62EVui2X7TxNpS8+NkFB3nzBlVOJ13uEvWQdtTb3qL8Ifx1Qw8zl
	zZKjVImub1/QcIxzEQov9cnddLhOwSMhehezbUK4MkRkiqO8Ti81YeQzC9dvoPv2VH1AqUkr3SG
	sMZEq7RrV+yv1dVHEF9u0muOjsCEd5Vr8R8JmZiacMh+mQE9FCrys/f1pGpRL9Ajot/bI7Te7tT
	xFw49zEbXtm0t2GT9tOx8yLw1oKm9GQffNaL5y1nh8po+o7bOdibE7M4yS7ut5kESDvb176khoB
	1k8sSYbELcygQ5mFIdlXylopEUjbz3MdSctrR9iy0TXR9YlXX4wJcF6zuE9uPYeCTivY/xH7oKY
	5eLm826xyEnCx9bD/TOj6XI+xNPtROXUCHcNjvpwDcTYRJfbdlmYlqFWB6vVcfdVI6QqZuv/W0E
	/OOJRaEaB/DGWC2TSN1ia98Wg==
X-Received: by 2002:a17:906:730e:b0:c24:7cb5:d617 with SMTP id a640c23a62f3a-c249238c369mr2085187166b.1.1787582013922;
        Mon, 24 Aug 2026 07:33:33 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24e1adf5c2sm4972766b.28.2026.08.24.07.33.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:33:31 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a144c8eea2so6534339a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 07:33:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpmcFgtfCLh2S5n86bFNrArjvybAuMuFnUxbHNscqbNnyeywtXrZImsFGYTKaqfx+OZETXLBV/Ds46JL33K+U4W5g==@vger.kernel.org
X-Received: by 2002:a05:6402:50c8:b0:6a1:df2c:cfa3 with SMTP id
 4fb4d7f45d1cf-6a582b0b822mr20096659a12.4.1787582011648; Mon, 24 Aug 2026
 07:33:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819183829.3953529-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260819183829.3953529-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260819183829.3953529-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 16:33:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBNtK_W5PajM2-4gvUWWU05K1hh4a=Y+cfY93Q-P+nYQ@mail.gmail.com>
X-Gm-Features: AcwNN1VXBPFtA4Vecf3pV2N4hIm6QeQ_OHDpTywSlixoNeYKbAmedCU3SlFkP2A
Message-ID: <CAMuHMdWBNtK_W5PajM2-4gvUWWU05K1hh4a=Y+cfY93Q-P+nYQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: Add LCDC overlays for RZ/T2H
 and RZ/N2H EVKs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Aug 2026 at 20:39, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add DT overlay support for enabling the DU/LCDC pipeline on the RZ/T2H
> and RZ/N2H evaluation kits when fitted with an ADV7513 HDMI transmitter
> on CN15/CN20.
>
> Share the common ADV7513 and LCDC pin configuration between the two
> overlays. Disable board functions whose pins are reassigned to LCDC,
> including the affected LEDs, SDHI0 on the RZ/T2H EVK, and I2C0 on the
> RZ/N2H EVK.
>
> Move the LED8 and LED9 preprocessor conditionals inside the node
> definitions so that the nodes remain present in the base DTS. This
> allows the LCDC overlays to reference and disable the LEDs when their
> pins are reassigned to display functions.
>
> Configure the LCDC data and clock pins with slew-rate setting 1 as
> recommended by the hardware manual. Use slew-rate setting 0 for the
> HSYNC, VSYNC and DE pins, as testing with the ADV7513 showed unstable
> display output and visible flicker when these synchronization signals
> were configured for fast slew rate.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Renamed HEADER_IRQ8 to IRQ8
> - Added irq support for the ADV7513 in the overlays
> - Corrected the DIP switch settings for I2C_SDA1/I2C_SCL1
> - Added missing DIP switch settings for LCDC_DATG3
> - MOved the header include at the end
> - Added a comment for i2c0 as to why it is disabled in the overlay
> - Split up the du_pinctrl into a group of pins as only sync/de pins
>   needed to set slew-rate=0, the rest of the pins can use slew-rate=1
> - Updated commit message

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
