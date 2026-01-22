Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6C7407562
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079575; cv=none; b=gLA2vu5EVX/EHAMg1PphM1fyx9cg+vHM7uZrMuymoly4p4RQPsASt+JQ6cwYc8KuTdA73DM46b+kkpzor3EmsaxKg1mmAL4bDUr1O/ddrFiKfVnbOYtO2CREAy5hBOr2RPDzPJBRqZsLhaNRKt8FkFg5Ai4tyaNnVY7J7a9XGQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079575; c=relaxed/simple;
	bh=ksDGpOXCJytcfazjq7qr0daJEsBAjKRTbOfGaNZY/zA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pQYZsQL0FucsmRVY2RdMXETDOa1Bzv7gebe40cGrTS+06Rzj73fOULYHkZKXxHXe1zRY+SugoNBxmA3mtgHqsa7ihtkp6oCi6P6r5Z2qjNNSf3z9FeKIiWm88uiKnIrt1edNHjb3HRRKhgugvzIWpI0mg/UQUHoo0K8XM/5bU50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ed065f1007so506461137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 02:59:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079571; x=1769684371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/e1/pm7FOREOhCEowWrv0t0/89zmVnX1GYt8i07R30=;
        b=Uw9OBbnTPgA09cu1ryvhuvQqAr/jYj8u3zEEUyd14Nxy/7QddTsNhL9B/dpOOMD7QQ
         CS6JBZ2aPJmqvj9iSFF6QnJz9PdBkp9fkJZ99krwkERLa3gAk4NUKteuWlaS8bxS7sIE
         wTbjihvimXDji+LZ5h66fnRoJz7MS6aB673elsFln1JZ99KVFEmAju378u1nj50EzDBP
         zTwgnZOBpbfRbmqvu5GMwdDr84tX6mFNmB5rst2NuMm9Q9rUGkCcsadc3dOnQ/EAYg+V
         KpKiHLseQq3j8fc7n+QInw8+Oa4EGbAYtPDx+IoYUDqhsgFapUjqNVvRIDLFbEns5uq5
         +sVw==
X-Forwarded-Encrypted: i=1; AJvYcCXc+hXuXBXlYyrsEKzXavR1a5WyX6mhSvkaUXkaAwT23mfDxkRkstKEHl9Rlz+0S7ONv0kLx88TgxtZqgvajoya8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOeYWI2DDaFQzeuju9y33ToGYAdVtdfmyLqfa+kXEBL7T5pPau
	Nt7lQTtvuLI/+dK0rsI2xvI0N1FBtDRcNVJ0XVxGI0RjcLnlnFiOP3lYf4iPtlen
X-Gm-Gg: AZuq6aJsl5mKvchaqaeNtM2ZVQxzHHkcd2WpPx5gNg1qvI5FD81I0fIyj0UTOYIAOzu
	KQpFNQSsUL6o8uNHdbHy4PkH62ZxSmXSLDJD8BWyKZSg/eS1CB/nbIMd1T3OZ6V1bGN9mUwLmo9
	of6v2PsUtP4ib9IP/gHaICLgSVKiolSBWOpaFD/RoTA8WufWm3rrdhRSerM4X6gNM5eOaLcdzCw
	j6uTEdH+GjL5i9y9WxhOuPAO5qlkjhvfz9jmNilDrSDAaWuoe3QDa+FGZ3zTzEW6m9iFJp2Yhgl
	RaCoBi5sactY3HVMhlrFPpaordCWytm8R5LPrxyY3QYAM2Ex1tO2vJ1l/uQyGR8Q/2ZE7Kdq1sF
	PvqzbA4+BpsG5/7V1d2kUyUHucEbOYPnpzHAxwrjekk8SdF7m8+/NmsTn0+CRSeV9VbJ7TQ/k8f
	DdfUOK0Ovx+Ti9qZ8dMC9gNe0UWE2fcjyCQwfy0CcQivoWMlMyM5giAIBDtYh4ke4=
X-Received: by 2002:a05:6102:4191:b0:5ef:49d0:5862 with SMTP id ada2fe7eead31-5f1a71a5ccfmr7665618137.34.1769079570847;
        Thu, 22 Jan 2026 02:59:30 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f5337d089bsm386702137.7.2026.01.22.02.59.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 02:59:28 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5636784883bso636298e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 02:59:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVvvDIttLWD+4/gXySWHCZ7QdF5aLCLs4e8c4rj9WqaKfHj8JbSVf/hFQBwg0kldOIAd939kxD2GCNhtWpcPP/Ymw==@vger.kernel.org
X-Received: by 2002:a05:6122:2187:b0:563:68c4:16fc with SMTP id
 71dfb90a1353d-563b73d9bc4mr7241710e0c.21.1769079568171; Thu, 22 Jan 2026
 02:59:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-schneider-6-19-rc1-qspi-v3-0-43e70fab4444@bootlin.com> <20260121-schneider-6-19-rc1-qspi-v3-17-43e70fab4444@bootlin.com>
In-Reply-To: <20260121-schneider-6-19-rc1-qspi-v3-17-43e70fab4444@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Jan 2026 11:59:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=Ynyf=7r0GBv8g+-xi_3=fojnsmOC5AGWxrhcuTM2rg@mail.gmail.com>
X-Gm-Features: AZwV_QhU4HozNdnPn6smEIMJwpT1ZjcHd77zCQWsK-t2ckEMR3Gs7RNY1xtm8Ys
Message-ID: <CAMuHMdW=Ynyf=7r0GBv8g+-xi_3=fojnsmOC5AGWxrhcuTM2rg@mail.gmail.com>
Subject: Re: [PATCH v3 17/17] ARM: dts: r9a06g032: Describe the QSPI controller
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Vaishnav Achath <vaishnav.a@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Santhosh Kumar K <s-k6@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Miquel,

On Wed, 21 Jan 2026 at 18:05, Miquel Raynal (Schneider Electric)
<miquel.raynal@bootlin.com> wrote:
> Add a node describing the QSPI controller.
> There are 2 clocks feeding this controller:
> - one for the reference clock
> - one that feeds both the ahb and the apb interfaces
> As the binding expect either the ref clock, or all three (ref, ahb and
> apb) clocks, it makes sense to provide the same clock twice.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

Thanks for the update!

> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -66,6 +66,20 @@ soc {
>                 #size-cells = <1>;
>                 ranges;
>
> +               qspi0: spi@40005000 {
> +                       compatible = "renesas,r9a06g032-qspi", "renesas,rzn1-qspi";
> +                       reg = <0x40005000 0x1000>, <0x10000000 0x10000000>;
> +                       interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&sysctrl R9A06G032_CLK_QSPI0>, <&sysctrl R9A06G032_HCLK_QSPI0>,
> +                                <&sysctrl R9A06G032_HCLK_QSPI0>;
> +                       clock-names = "ref", "ahb", "apb";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       cdns,fifo-width = <4>;
> +                       cdns,fifo-depth = <4>;

These two should be dropped, as per the updates to v3 of 04/17.

> +                       status = "disabled";
> +               };
> +
>                 rtc0: rtc@40006000 {
>                         compatible = "renesas,r9a06g032-rtc", "renesas,rzn1-rtc";
>                         reg = <0x40006000 0x1000>;
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
