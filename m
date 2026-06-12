Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7557B380FC9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781252727; cv=none; b=kz1Fp1gHFzRzjdgTslWETd57vpaRoP31FtRkgW3KNh0j2YVhwRl8t6bmoSHe5MdSJ/UZExQ7eyblpJpaDoko243HI9n9HTwo17OXIBglvKn78teNCCk7CHLr9D2zhh30fNsnWQEFVT412NpSdebrHh8GDsBN6EDAdEw8kM9R6wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781252727; c=relaxed/simple;
	bh=GBSvLNXoZdRqGrEoUil4FgbmYpylukIOLRE6JinfAl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFVFi+fD91JbLv1c+6Nbpv3di9yxBGr+AWq5FhIpYnJQw2Wx927iS4aMBpvxXwFUEYwfiGzNJ72RGpj88cPICiKefabLb1Jq83wFRN/y159YsEp1D3HypPBz+8XCKfSPJjN3Dp4TgA8K6RJqGo1NFWw2VjNm3AC/LmrigoMspQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-6c3a36fa9edso560278137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 01:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781252723; x=1781857523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BNgEMp+PgvikOQYQ6jo0rnxU2ZwAS3bRz4mmCmta0M=;
        b=PesxozRgA2AbbRN9qISFqhQikY2qa24tuR32PQ2Ib0ZJ7oxhVm5160XRcaok44Q3P+
         u0zk0VRhvpdtL//B1P3lTSqGe3PteU01keXvqWOItmgV8mLfraQQAHIjHNbZaDqxPT2w
         keFxRvX/51lkl5THp5sg5jQRwlM4GHN9jpXNneUVrEMmG5DxzWaz18zS6rR/Lj4Wkpqa
         qn1tM7aVfGnwYxxM1ZyI9x6r1/lz/58rQGbFviubfpqBKP4pllfxGGFAUHXheIpA0rmX
         I5fmynTp31MhksN4czGfBBMFi04/YjSuJsHlEP8PFKRKT7TtPtqHwvh8EvfT8rsZiy1v
         c7WQ==
X-Gm-Message-State: AOJu0YweYnwt5cInZAl0sZyjIB4R47OZgtXcOnFCs09dUWbJdlvioCG/
	bhjU6VthbVma9GhRLxUXbRj8Qheik+xKBI49yVeeFC8z8UGIkb0++aQgFlmgaiJo
X-Gm-Gg: Acq92OEpVN4sGevrlYF5u1T8kerGOZcLSW4rgAdW92yg5aiax00XmKMAhPR8DoSPg0C
	WeiL1uvK8S01Dw/ZXEBLIVzOxv198p+mci26UNyhMhb7pHfXZ4fA19xg1GNIxvIfucVp2iNpiAZ
	QuQYLZBbzj4kgWg8+B23/FOfT8K5a+lLT/F42rt9WJU3NWYNL165u/CxCsJXYwSAQiNk4sjhyVn
	3cskLhADeW2W9eBrjKl8WATXhNGAdFF81a076qgt8jGhoW3zfJisvE8pdy0VY6EVi5yJ119BuYK
	/bkwNeySgbIxaxkWdrBcmwLcFxr4ftWorrhYWYlPbIuD6L7FeL5eFCq2J5H64fpKvwl9eLD5Nbl
	sS5dLZ5fvQZ8aug4mukRwsKDySAcQWsmTz6WYpgTt1gnexHWwrSu3X/Ujty5RpW3NYHMUqLGlOw
	RTBkiUUgTJ/vQZQqDonC97E83tVm6PiDZuS3QVgKh7xFylRGZ5m2UaOHt1rO+Dq2p0NK0gPY0=
X-Received: by 2002:a67:c794:0:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-71e672dde4emr667847137.19.1781252723110;
        Fri, 12 Jun 2026 01:25:23 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9667407bbaasm851291241.11.2026.06.12.01.25.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:25:22 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9638f7e9896so1021735241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 01:25:22 -0700 (PDT)
X-Received: by 2002:a05:6102:8354:10b0:64e:3424:cd45 with SMTP id
 ada2fe7eead31-71e6550cd28mr656883137.9.1781252722056; Fri, 12 Jun 2026
 01:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612080354.57459-4-wsa+renesas@sang-engineering.com> <20260612080354.57459-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260612080354.57459-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jun 2026 10:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6tup=MKtoJBjU1u-3QW+S4zAwrKKngMNy9bqVkgpTFg@mail.gmail.com>
X-Gm-Features: AVVi8CclvQe54KnQjvARQQ5gtHuWL5zZjaw84bM3DVCNJETR3y--hTHuieZNGgE
Message-ID: <CAMuHMdW6tup=MKtoJBjU1u-3QW+S4zAwrKKngMNy9bqVkgpTFg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: renesas: r9a06g032: Describe SPI controllers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 12 Jun 2026 at 10:04, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add nodes for the 6 SPI controllers of the Renesas RZ/N1D SoC. The first
> 4 can only be controllers, the latter 2 can only be targets. DMA nodes
> are not added yet because DMA needs some extra code in the drivers and
> cannot be tested yet. Basic FIFO mode works reliably, though.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -563,6 +563,96 @@ gic: interrupt-controller@44101000 {
>                                 <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
>                 };
>
> +               /* Controller only */
> +               spi1: spi@50005000 {
> +                       compatible = "renesas,r9a06g032-spi", "renesas,rzn1-spi";
> +                       reg = <0x50005000 0x200>;
> +                       interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&sysctrl R9A06G032_CLK_SPI0>, <&sysctrl R9A06G032_HCLK_SPI0>;
> +                       clock-names = "ssi_clk", "pclk";
> +                       power-domains = <&sysctrl>;
> +                       spi-max-frequency = <12500000>;

That is 12.5 MHz (for all controllers).

According to Table 3.2, the maximum SPI reference clock frequency
depends on the instance:
  - spi1: 125 MHz,
  - spi2: 62.5 MHz,
  - spi3: 31.25 MHz,
  - spi4: 15.625 MHz.
As the minimum divider is 2, spi-max-frequency must be half of the
reference clock.

However, spi-max-frequency also depends on the target device(s),
and on board wiring, so typically it is overridden or set in board DTS.

> +                       num-cs = <4>;
> +                       status = "disabled";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };

> +               /* Target only */
> +               spi5: spi@50009000 {
> +                       compatible = "renesas,r9a06g032-spi", "renesas,rzn1-spi";
> +                       reg = <0x50009000 0x200>;
> +                       interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&sysctrl R9A06G032_CLK_SPI4>, <&sysctrl R9A06G032_HCLK_SPI4>;
> +                       clock-names = "ssi_clk", "pclk";
> +                       power-domains = <&sysctrl>;
> +                       spi-max-frequency = <12500000>;

spi-max-frequency doe snot make sense for a target-only controller.

> +                       num-cs = <1>;
> +                       status = "disabled";
> +                       #address-cells = <1>;

<0>

> +                       #size-cells = <0>;

Missing "spi-slave"

> +               };
> +
> +               /* Target only */
> +               spi6: spi@5000a000 {
> +                       compatible = "renesas,r9a06g032-spi", "renesas,rzn1-spi";
> +                       reg = <0x5000a000 0x200>;
> +                       interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&sysctrl R9A06G032_CLK_SPI5>, <&sysctrl R9A06G032_HCLK_SPI5>;
> +                       clock-names = "ssi_clk", "pclk";
> +                       power-domains = <&sysctrl>;
> +                       spi-max-frequency = <12500000>;
> +                       num-cs = <1>;
> +                       status = "disabled";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;

Likewise

> +               };
> +
>                 /*
>                  * The GPIO mapping to the corresponding pins is not obvious.
>                  * See the hardware documentation for details.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
