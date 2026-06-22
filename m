Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F7D39A058
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 09:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121986; cv=none; b=nLjPW02C3ESnLBNkH/h/RsLTMxvtHKHiDDh4NFJCkim+Zam9NmoIgVQcKzKQo4pmim3dWXYtBlFrQ2IeKsB3oKB5oz8qkBt2vYxfONDb1YVYkc7LFlz60mZKSAA4uYGRtXX2B1K+cHzO+M3gsKjjd3XlAb+EP2yXQSb7L7DtuMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121986; c=relaxed/simple;
	bh=MnAXpId2QrsxBwStKm73em8Wh8kEZ3EOPZC5i6ugnWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVR6ANtPCqRkiy3TeOVJ8aUbqCJhkrzYUuoRXpYz/eQF3SBrFvnEAFWjJJQWHy+yOhHW0grRHpts1JNnOKQvdKpQ4vOiNubPXAQdBPMJkt8/Uj/+8k3tafP+uQdRnsnvSTfn1Ckf4MWwr2eGn5+zkCfUyWSVNPOOM0E07uUw6zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bc22d9977cso181871e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 02:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121982; x=1782726782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTo0C41gBRbYARs5bY4lNZzY8eziG+D7rVsU/ecROJ0=;
        b=RjLaA4HlPQnwAm8RHMjElFxBFTMFozIsIkdzv57kUY9U/HJ5LX+Ffz/F3yWWJBC3GS
         yxa6CfevT6VBlcz2QNViM/xVYGUIfaDH3vnZJGNPfWTyjaxnIdlzj+KSHot3nejCjVBV
         K1pZyhy6wZgswpRLfczIjsQjdGylERA2gLnsVnURFn6teCSqk+fTuC0sJlTYH/DxcPku
         nH08wIhzvu87ZOuiwAUB7R/oAnSlGPUXa89hxjbSQ4VT1kiTlohT4nFq7g7b8wTqWnN1
         eoaf6nrhIYmsDKIBSWwDZUZlZo+dihnEUYez+Bcjzo7ScQwOJ1yFUk4JcRvetO0KjBFj
         4o2g==
X-Forwarded-Encrypted: i=1; AFNElJ9x70/JenKWAqVhkADi6BWc+MVv4damkj1LgGne8VOBEeuY8zXxzLQmF6ipPQtS2P8Nf+JR43iice32FZbae8hb5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8vhkaK+K24eduEqtUn0bulQVACEeR5/grhf6A+0HNuYc+99rB
	+CqvqamdxNdXEHOzneRKPZeACoDzS9ltTc45HdnAiN15XBa5Lvy3rIxwzLA7KBE8
X-Gm-Gg: AfdE7cmMMcqV5s8yU3MchPVvDUZKm9PzvMjJg10S7bVCIFymb5PhE+lKbRHQGfSwwMK
	Cq7FoW2H062jmOJC30w9Gh+idjFK13XVOCzdnzN8OBvj/cyMbvEroaB/mv3lhe9Y5mfE3ypGfTX
	GggZNffsd+klnmK/8hUE+UAOFylzHuTKkNHHbdExow43qCUKwznrBzKbzKTpwHvCiUNyKGoyilt
	zYmwovX6r11yAd2XSwsdO08UjlFOoAEj8Dt7nTY3dyWY0fLP8rbEsCKadChsLER4/yybFDDX8ZK
	NWfqmRaPunMM78slA5bfEVdie7VRb9IA4GShIu44wU3hQkFQwD0RhzE8ocM19l4LGFzXszXokjd
	veMkq9mqXSlZJsGOrrXvIHROK+JyUmykepUvFf+onHqvLhsG8QCwT3dsWWKthHj5C6CdvX77lNu
	+EkFGK86qrn9twPNBRnf8J1HdfBs33yDDSW2mBeev1giX75UWp/g==
X-Received: by 2002:a05:6122:458b:b0:5a5:4166:67c5 with SMTP id 71dfb90a1353d-5bbeb9d208fmr5929075e0c.3.1782121982290;
        Mon, 22 Jun 2026 02:53:02 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfb89a95dsm6773164e0c.8.2026.06.22.02.53.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 02:53:01 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-96392241154so3197388241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 02:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/0QEWDLo+22S9vzB2whu2pH2rcE/ZzyUEctGoI99glqMSmnqvDT3obXWtSYIndLT65zhiOvYaVsK60naVM5HcnBw==@vger.kernel.org
X-Received: by 2002:a05:6102:c03:b0:729:affa:70fd with SMTP id
 ada2fe7eead31-72a1d8282d2mr7518654137.8.1782121981650; Mon, 22 Jun 2026
 02:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org> <20260618220427.14325-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260618220427.14325-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 11:52:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxT87M1oQvPP_h4YX4vXFaVbbG+LCG8EdmuLTuHNtybQ@mail.gmail.com>
X-Gm-Features: AVVi8CeD0QzByTLrjVPd1X2DDUj0G8mjwUUWpPVDpYqqWicL4mNi4MB1Xhj4X1I
Message-ID: <CAMuHMdUxT87M1oQvPP_h4YX4vXFaVbbG+LCG8EdmuLTuHNtybQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] irqchip/gic-v3: Refactor GIC600 limited to 32bit
 PA erratum handling
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Fri, 19 Jun 2026 at 00:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The GIC600 implementation is now known to be used on multiple 64-bit
> SoCs, where it has address width for AXI or APB interface configured
> to 32 bit, and it can access only the first 4GiB of physical address
> space.
>
> Rework the handling of the quirk to work around this limitation such
> that new entries can be added purely as new compatible strings, with
> no need to add additional functions or new its_quirk array entries.
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -4890,10 +4890,17 @@ static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
>         return true;
>  }
>
> -static bool __maybe_unused its_enable_rk3568002(void *data)
> +static const char * const dma_32bit_impaired_platforms[] = {
> +#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
> +       "rockchip,rk3566",
> +       "rockchip,rk3568",
> +#endif
> +       NULL,
> +};
> +
> +static bool __maybe_unused its_enable_dma32(void *data)

__maybe_unused can be dropped...

>  {
> -       if (!of_machine_is_compatible("rockchip,rk3566") &&
> -           !of_machine_is_compatible("rockchip,rk3568"))
> +       if (!of_machine_compatible_match(dma_32bit_impaired_platforms))
>                 return false;
>
>         gfp_flags_quirk |= GFP_DMA32;
> @@ -4968,14 +4975,12 @@ static const struct gic_quirk its_quirks[] = {
>                 .property = "dma-noncoherent",
>                 .init   = its_set_non_coherent,
>         },
> -#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002

... as the #ifdef is removed.

>         {
> -               .desc   = "ITS: Rockchip erratum RK3568002",
> +               .desc   = "ITS: Broken GIC600 integration limited to 32bit PA",
>                 .iidr   = 0x0201743b,
>                 .mask   = 0xffffffff,
> -               .init   = its_enable_rk3568002,
> +               .init   = its_enable_dma32,
>         },
> -#endif
>         {
>         }
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
