Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCD53D45E5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Oct 2026 11:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891721; cv=none; b=g0OCCXgy1Ia+TDrn3F62IUCp32goOkx+lfZIS54ejQNPCHHEVpDZIc/0MqYEgny6jJoAK2naxco65eQd9WcRsrUgdcZ/bkPCSm0mzzpGZq8kTEs7d7REJrrDgX6w1TZfN47XtzEHNrFxideu6oynoDJltdO9MU5rBHUpQl1LAIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891721; c=relaxed/simple;
	bh=k5veFeTTHtqbcVUOmk8kP3kRfVRBO7Pptciq5IbVpOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1C1sUA5VTWRfETxCookHdUzMKunJLGJdIGF/me3m//QNnffxtKicy0iysa8PmwRE9MchsKnpwsXBUBJl9U9Wqyu3u8ITnMH9MpiEfvbd9tUMy32X/G+IWEgaulOHo+adgQyucuQQFXo6p5OXo4AbrFoMiwXuvjZ4XGjxNsaGRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso477478266b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Oct 2026 04:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791891717; x=1792496517;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WEZ3XROOQ5wml3OCk98kzhYlw6diUWNF5eLEQIKJbBE=;
        b=T/hCbs+30IC54KNZYZSaVvAKccxZbVTtFx0GaGSXHNVLmK+XN8uCI4gSYvK227nuz4
         PqV0as/6WLK9ASzVpmz/OAidoXAIaTli87Lte7sWhz7UFk84Yq0x83WXJh/JYj7gKeAL
         8dY3gx0HHubKr2oyxI326P7ZSkjOu1J9j0tCoNUvJqBEOo5NgCYvjj/j+Bv7gF6zgDt8
         zKSzXHYcjToB3tDcnfYYaE/kaJxYFOW/PUL2bRMzzV/Pl5fXhJn+ZriPe6DOAjIy8mxf
         9V58n6eundXPo9Qqy/RXjCZiUkr+4qbII+tT7+CGwrRYHG+zQcU1EtfC0PIS9d3RxobS
         wk4g==
X-Forwarded-Encrypted: i=1; AKwUvBxvrCjNXLcjrarPIrpgIVozUDwxZKfj6CH6ve1kG5KREVQXPD7tQb22J9DxOWyB38n0Z0YvERRA7HS/efdqr77RrQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJx6pTVwcBec6J9QYyaGfFPJ4Vtpeg0DIWwCKeMYSiZ/MZB94aW
	WFTuHE56ol+srXLqxciQz8QZw71jtUyCMx8MIx5AswwFCrvRzyKHn6pRVpM8FE1dXAE=
X-Gm-Gg: AYBFou2r6Yadeh3LaBpMaBE6rbFobZw3ivK4p8JMWLltK37dujtj0z1UPBNxQCFLuii
	sRa77SnWjnDDFzrmbPWSR9z68KTsy328nkCGwuR0RtZOSPoyBQKLJ/rsUWA/lea7WTK3oE1Mmsp
	uMl1jMUtE4iqToKoJPJUD5RTjsilXBWZ5tt0NvMd28tA/R2JEOCO+ykwGllMhTQW1yNWe73NsWH
	tswRm3gYUEXVAYtI7FJy+o/nwC18ju89bC7R0x9H6Et1VcycP0AI8JIrZLCO241+L5HkpfcI1Sv
	whaRSenETkmd1EW4Kj9B4k5LlOvR1QBP/UdY4CHlQ8p3EbMa8bUF2NkCyw7YZhIEbw9VNOyZwrK
	Qf7lpg9SvUcKU36TiVpDjzzHWypIKemGC7QOlu6qFUnNn8wHcnhgtIeJNa9Ygtt+RXb97b0Fm2J
	b1z9V1h01Ke78N4gU5CA8LreKMw+OjiyqwcxpHF4oL5aGvH0u5z9U1rq8yWE9zEaz+558Wkp9uC
	lDiHPkeumz/rPb6bprWyVUSAaTPGvs9eaiW
X-Received: by 2002:a17:906:7948:b0:c2e:7fe7:288e with SMTP id a640c23a62f3a-c31aa082a00mr1102064366b.32.1791891717429;
        Tue, 13 Oct 2026 04:41:57 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c363d61243fsm134987266b.6.2026.10.13.04.41.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:41:56 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2dcbcc546fso342308866b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Oct 2026 04:41:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxBVpGkUo0rmO+mOHLdrQF8N/9Qt6TQGWU/6E9c+bLL1Ikx11DmetvL/5xJe7B6B032nNyInb8Jn0AeetAgAYZQXQ==@vger.kernel.org
X-Received: by 2002:a17:907:e158:b0:c34:e9fe:82ed with SMTP id
 a640c23a62f3a-c34e9fe8db4mr355591866b.28.1791891716374; Tue, 13 Oct 2026
 04:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com> <20261013-paul-v7-3-rc1-edac-v6-3-2f1d6f2f74db@bootlin.com>
In-Reply-To: <20261013-paul-v7-3-rc1-edac-v6-3-2f1d6f2f74db@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Oct 2026 13:41:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1nuiSAKbCrD0mWJX7rC4T=fxO5LC5ksRD440YSL_3cw@mail.gmail.com>
X-Gm-Features: AclHuK9GyhuxP1j4sSDne1XJEsD6-l0raq_tLn-7rYWcCt7pn2fMfEYbVEbwDsM
Message-ID: <CAMuHMdV1nuiSAKbCrD0mWJX7rC4T=fxO5LC5ksRD440YSL_3cw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Tue, 13 Oct 2026 at 12:45, Paul Louvel <paul.louvel@bootlin.com> wrote:
> Add EDAC node to the SoC base device tree file.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -164,6 +164,15 @@ dmamux: dma-router@a0 {
>                         };
>                 };
>
> +               edac: memory-controller@4000d000 {
> +                       compatible = "renesas,r9a06g032-ddr-edac", "cdns,ddr-edac";
> +                       reg = <0x4000d000 0x1000>;
> +                       interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&sysctrl R9A06G032_CLK_DDRC>, <&sysctrl R9A06G032_HCLK_DDRC>;
> +                       clock-names = "ddrc", "pclk";
> +                       status = "disabled";

Should this node be enabled by default, or am I too naive?

> +               };
> +
>                 udc: usb@4001e000 {
>                         compatible = "renesas,r9a06g032-usbf", "renesas,rzn1-usbf";
>                         reg = <0x4001e000 0x2000>;
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
