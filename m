Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC452441B8
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jul 2026 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914928; cv=none; b=bUYmrqNVBnHdhnJ0xcVsEr3MFZ2RDg3eTgMDq18XeqbcQOT03iOB/5BXYWbAMg36frE0pbzVlf5Xws6o1MpW30GJMBmAyykR/eDdxOfXpWN/E/sg0xAwNsja4oc0A+xAioMH8xTOd9pWjL2lRtrr47i2JPsEWlsiMql7D3qtOyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914928; c=relaxed/simple;
	bh=kNtTO1INuRHYWt6yzqLSNxzy+LAJmIkn/k6NL9upXHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6hNaw7Juw+9vWh7axnFgg7Qdz8inPm+pXnOcmvvJ02/8y9AdWwLejuSKqzmNBR6P4bvcvRoGulN53gBelQRGwPIzzRmwCSLzXc84GSWDXZOtzvw2vVOVeSPS67SGkK9Epdrkyi/uXNumM5pQx0QEINu4CoSQMlp1HOsO4cQGPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bdd0779366so182817e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jul 2026 07:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782914927; x=1783519727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFL0tXfq6K363hDxIcn9nBKOJixuNA4hvLi7p3y+LRk=;
        b=GUWtlFBhSV3DV1ZrKTs0dB9T6ixigTqG8YRRpJ7LsS0oZELdvevlCsY2dVQPIdmAjv
         c+G4xyNveVLD8S0uR3Ve83CjpMVjR1R5HLIErmuf749H8o2HxHXbhJUDQ/iyeFNw8DAL
         uoHaokrMAWv9SnLPhKkG6vS6som/oUuMBxRy2nO86qMPv0DgL6FGxs+s5vX+LdLkHSPu
         ICEhsqwHCYF9wSAAWDZdbg8Sl9PaNLzZL1miNg8oa5cEzcg9NOf1U0TYJKJ9JOWzbUAU
         1DCN3R9UPi5x4ixKVa8QWHzX4fhyf4NJuT4463YfkVQxhxOlj01ZKQ/2hcu5mupVkn3A
         IgPQ==
X-Forwarded-Encrypted: i=1; AHgh+RooKCZKWrHLpz9M/v74ebcGWJF+8i2MEBO5wr53lLxOx0mgDjQWzcUu2r3m+xJVOTiqB8XbrmNndWr21kfHKHwzuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcU53s2sj7SIH908PYJwMyxXAplkcbwP361mOClg2k9m7oDZTW
	me9wxy7mPyWTCMQDVhZ5uCGxrWiRicIEsYoNxhqJoeS5DfCBdtUutlmV7oLfbi7Hg78=
X-Gm-Gg: AfdE7cmzsDR+ilVhneMswOydJ9+BCAFg7FpC4Tdg79wJsgI62b45voPOzHmtae6q2xw
	xhBUdqaYBvTJOF1gAu/JpkE/29VetYlmZcZI0xRP1o+0cwFilERjQtROSKrCCf1jDD3G3GAd1rC
	xp7dmXJf1UUHomZZU9FNZiWxH4lkjTi/1PZ1bl3DLA14Z1PuC5HuLcVGOnopAm3TyHswyT4iPw9
	uDvGCDbS3W817Em7jwtBDfNxZSqBDOpYnLJqzenDAnUdN3HnD/FmfxlNSRbOzHQgnQXFNQxcR/Q
	TAlEkxHyt7WOJ4TvuJuAAZtFK4n8gApMNj+jBRI5ps33BfZmNnvxw1rgd0pWXKUfRntSKNucis1
	HsUOrtgqexcvHtF/o1yZL6K4mQ5sP/sxt8b7l4ZvIG8XZyF+3+loAmbT/glYAA5AfgHLq6aEkIR
	ViT3gBO1k6oz7OUIM9yLakktDzFBsGNgwWtaA8hch2rffBHfMOqw==
X-Received: by 2002:a05:6102:54a4:b0:736:e617:b4f7 with SMTP id ada2fe7eead31-73dabb35dd4mr736802137.21.1782914926669;
        Wed, 01 Jul 2026 07:08:46 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969668c59a7sm2326983241.11.2026.07.01.07.08.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 07:08:45 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-967327a0c7dso140674241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jul 2026 07:08:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrWMobx79DoM/hJdXw9m7zojk62XiON+yEq3LeFE4JsfEaZp6+pEnMbEDzqjejrHkx1ElaAFQ1F/taUZ+NzgmluCw==@vger.kernel.org
X-Received: by 2002:a05:6102:3581:b0:738:befe:8f7e with SMTP id
 ada2fe7eead31-73da98ca868mr783407137.11.1782914925090; Wed, 01 Jul 2026
 07:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602204707.1920839-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260602204707.1920839-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260602204707.1920839-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Jul 2026 16:08:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX9S18T8fou_pGGYFGPbMSLohfJp=QS-LTHA0rFbL6zpQ@mail.gmail.com>
X-Gm-Features: AVVi8CdfZF1yWLhCxDdc26YNvQVH2ivJvmcjIMBdE0JNnn5HxaUZcvezjp7UyKc
Message-ID: <CAMuHMdX9S18T8fou_pGGYFGPbMSLohfJp=QS-LTHA0rFbL6zpQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add PCIe nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 2 Jun 2026 at 22:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add PCIe nodes to Renesas RZ/V2H(P) ("R9A09G057") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -1025,6 +1025,146 @@ rsci9: serial@12803000 {
>                         status = "disabled";
>                 };
>
> +               pcie0: pcie@13400000 {
> +                       compatible = "renesas,r9a09g057-pcie";
> +                       reg = <0 0x13400000 0 0x10000>;
> +                       ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>,

(kast cell) 0x08000000, for better alignment with the next line?

> +                                <0x43000000 4 0x40000000 4 0x40000000 6 0x00000000>;
> +                       dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 4 0x00000000>;

Sashiko wonders if the first cell should be 0x43000000, as the window
is 16 GiB large, i.e. larger than 4 GiB.  I don't know...
If Sashiko is right:
  - RZ/G3E is also wrong.
  - Should there be a second line for the 32-bit window, covering all
    low 4 GiB RAM?

> +               pcie1: pcie@13410000 {
> +                       compatible = "renesas,r9a09g057-pcie";
> +                       reg = <0 0x13410000 0 0x10000>;
> +                       ranges = <0x02000000 0 0x38000000 0 0x38000000 0 0x8000000>,

0x0 and 0x080000000, for better alignment with the next line?

> +                                <0x43000000 0xa 0x40000000 0xa 0x40000000 5 0xc0000000>;
> +                       dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 4 0x00000000>;

Same as above.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
