Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33516440621
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661300; cv=none; b=UNvm9bvChHy3HCcAmy7kOrb5jHdDVP/A5QqIUcRhlfS55CRX/HpZMCKrRZsW+WjAelRsdV1Fyx2GUWg9Js284mN/PpAZ5Zy0FW3/jGsSdCOCOzyIpmUWmBPzo/eqQsPvGItnLKHPzpGN8e9+Q4liFFR+mbAXwz+W3rQR44AAJ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661300; c=relaxed/simple;
	bh=BcysfHHMDstXivbjZE4dC1w6FzsNC+WZrmqLRhvz6SE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYggAK7NVF/bmnBENkXILgTC17rPGhCqQtmbZ9GgvBDcXLKDc3LaTsNpm1+8PWghA7lrdD+NXwD12tOvtNfOIVaRClxfgx1xC/ygnX8SDR9T6KBD7jPPZ8uImCVLrbMR1dWhig9QfavotfP0F8xCG0Sok8SqrdVxtZ9SaPtM6+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-74ab99038afso3116945137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661288; x=1788266088;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FAuCi43bXWigOjfK7f2CuiM69Vlx8oB8xWxV6AGHKlM=;
        b=Z734e9Ay4z05ootgZeQm3UVSb+QJKH3R0V+Ikrhh57yLfzx4YWyUjUIDpd2NgM0MPF
         C8baUD9qBvKlefwpUjCpjJd0PUbxGoVHloOZ9E1+AbpV4UVjjOtOcBQTWSqZYAGCNw0m
         E+45JpbaOAVsK2pDcEOsO+uxD2CAHEHfoZoabA8NYy2/1rV8P42zTLmXshWp83D5f6CO
         h97DM6REn9scwLIwJqT9b1yohqdz3HFtKV1W55wdVI5pEmqoQb5RHTDEXStsGtT0U34F
         XnnBoH5chXyLOdcKZtxBDh+eXVAB+/ifgpWfHcQbo/SOnLI0U3dlknOdzQAFpDIGtKVP
         PIhA==
X-Forwarded-Encrypted: i=1; AHgh+RojtIfIUGEv1Yb2ixDotx/tqVW8Hw80BsbeVsQzgZckPYxiZoFPmLYOtzxnd9O1AzhkXoLEmLBJjLxK9W+/gfXaoA==@vger.kernel.org
X-Gm-Message-State: AFuF++m1HSogv1vNzXrLRFxAgx4kLRwiGUVS+zBKBdQof59iraEqFp4k
	Mwm3sP3QV0xzzyR6ZFPmtHwQ84a5gjj1SXDIPA47sxlrnSSehUL3xHCHKKX4naQfHE0=
X-Gm-Gg: AR+sD11qHXQfDQhe0EIJ1mYPRuDKDtGhUDiJuBqfGTzJwAql7sgx0v3oFV/G8N1Km/M
	GY2l5UrjtWfPxB/GdudRdzoiM9FUuoaaFnyKXR1tUrlT1Xn4IifSSx/CFNUeKLBJEV8HWottGLt
	UM5QoypgjI4t2XMLBKGJiazHwlixqhr+3g+Dzx9pHYo6c7nTuAbpvRAdbjWSo4Aa4/y1jjfEGLp
	VLTmpyu2GfLCxZa/zRnv23Dw+RlxNdxRKNbRDsv+1ENgrBIPYK/jY5acMOJHXuy1hofP/DiqD86
	cbZC3SodceGwDvw3M1FiEv8gkqQoVoTnnZFxdMPXSSOHTiAxlulx9e76IJKUlASabgrIF9c+Pp8
	I1mjAuBGEvfdrNqw1j8E2UIz5uClCTsoUJShpYU5yGSIlQZmCxWadkKhmCUnPLPrCFmwwz+uqlJ
	lJ78LHzi9WB8P2IPLglXb+3buXw5m2nsdO+7TDwzBSD2VrlhnvOqeCMQjDSRYP6ptudBqECjLaK
	1M0BppA0ynbrK0DbdsgY55pNg==
X-Received: by 2002:a05:6102:570f:b0:77e:eeab:769 with SMTP id ada2fe7eead31-77eeeab1417mr4923571137.10.1787661288094;
        Tue, 25 Aug 2026 05:34:48 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-77d856d919esm5275553137.8.2026.08.25.05.34.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:34:46 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7542a2ee156so2657241137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:34:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RovnfXYHcEWzIK1iZwgKdxelSnIn8QSGs75gIV57V/HMUW12aiO9EHwkU1kMOwSk1Q4UYTNCEJZYD/sOGYdb2QQYQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3c9d:b0:77b:b14e:b6c5 with SMTP id
 ada2fe7eead31-77bb14ec487mr9899299137.9.1787661286517; Tue, 25 Aug 2026
 05:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:34:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWL1xCSQn4RxL0ZMbu-AK0LiYqE6auPte=JMjW7V9-Arw@mail.gmail.com>
X-Gm-Features: AcwNN1UVUdruDxPmpux1ubwC61QQoEBBzyg7nu52qu_lQAz246VJGDaKtvYgKE0
Message-ID: <CAMuHMdWL1xCSQn4RxL0ZMbu-AK0LiYqE6auPte=JMjW7V9-Arw@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] watchdog: rzv2h: Add syscon support for WDTDCR
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On RZ/T2H and RZ/N2H SoCs, the WDTDCR (WDT Debug Control Register) resides
> in the second register region of the CPG/MSSR block. Since this
> multi-function block is shared with other peripherals, it is exposed via a
> syscon regmap interface.
>
> Look up the SYSC regmap using the optional "renesas,sysc" property and
> derive the WDTDCR offset from the watchdog instance index.
>
> Retain the existing MMIO-based access method when the "renesas,sysc"
> property is absent to preserve compatibility with existing DT's.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
