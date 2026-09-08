Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE6352120E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860460; cv=none; b=hO2SiL62cB5ViPfxDoXynJgLsMbFvazAmTqgon1mDsYg9pz1GTDW54KE1Z1vF3eUvGvLtkWA2QO/tErmjzI6XkrHiL2Q/jHtREDSHcWrAHtSHYlLHhE6d2bYbc89s5pK6NK6ljs/cSlvdHMRX02LSqHPh3lykcxHMXTfi+OT+Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860460; c=relaxed/simple;
	bh=NAEH1LGodnG1P0/a4VARquMQLIVHTsxhk69mCU/AOnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpTlZ2YU6vmG7DvJdnER+YgBgBkJ045pNR5dv7qT4ZF1QYq6f8+U1WyxN4IdcMIO1D4vPzbTyXGUoWY/BJSeG7BvqDZr/FOTAqywJx9WvzmhBF6vyyHBjHRK6Za5cSZoNh+XMKvPkrCrBi0PtE+uodSiJtVLz2s2c/CsSJro1Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c652293bcdso4874458e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 02:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860457; x=1789465257;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PIOsCtPZXn0hdSTkUCaDFtOzu6+1hWf4W/ZSKS9qN6s=;
        b=sNEIMBP3XOsLMZgES6IYJNJqKCzVEKojdZQ1ldO3s4PXHeJ4AXoVHSjQQ1MAhaZKSW
         36tlRtbYzW/Bc0s8Mcwj+8R1yWT66L+JyLVEfbwdF/Y5HQaIpV0buwMWJuHzegi6nyTd
         uQrB/Q7Dy20ni20Uk3xhoX+BlH0INSUYI4i0pEw2hcJDxFFFQ+dIFnt+6P3ug9Z4Xy+O
         +f0ejI3sQQXsAT45vVPJGNog8B763WsYIwbgqN6QQZL8wQeonM80AWB0X2FxyBjUpWox
         jwO/zFFnnl/X1jXu5wGN4qIXpTTLnTde0DleQS4Pf4YP+XCufpNrO78DhIqd1mhCewHJ
         2PuQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8h9I79mRgo+1swlsddoeQZr93cB00UtuE3MTTBKPqSVUeVLJM5PEb6n6+PCzi5bCgKPhTuVF06WYL0Dku4rGWWQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lTq1Yc0VPxtaPvRa2tJUzNwR1SJ9Y8JYCM8Sm4hMWwu9OKhO4D
	t+HmsDzm2zNBHsfLcxc6BSxcfYbKvejWUVyZt4J1ja4oNMY5FyAkkWndS6+mDEBH
X-Gm-Gg: AYBFou2EhTb/K8o7KMCxVts1/Q9I1JaDo/kUOUPlyS2uwbNoWy5lIWa3aCu5mHSzNoF
	88Vl/XEHh78Nqt/ecnN0tuMVatzTLm9Vfsxiqxj0nDNq5gmRZnpx8ffhtrmTuLFtCo70kYtsb5E
	FevsbX/y95K5oMOs8coAHaj4Ll33/Tq17CL0S5CJZgIxJhSNbUx1q7woUApc5UwMWaVUt9YnjVo
	51kkePLBxaPX/+jwpDxX1GWsmpaso0/BEHMPM5RDzruhyPmkIP8/eDkQfhIEKSUgRAOY0DIy3Bu
	gkQLtfh/xBBKISxTryN8pihkvmbuDCnbwZO/J5lcbPF/jBRsK8HLgx05u3RHnotDBckoEObBa2Z
	qCCDCdhnDPA20eHanung6V/arf5SA8ln4bFRJj0OvX3vabgUuZkbaBrUkXRHyX+KKaLT7ATRh8f
	ZAQ2D7hwysZqsGOhWRE6OctVHmI7b078JMKv5j23+j+otBvp08C080rUPldaGQXzLY2o9oEs7O5
	tVKWnHjZmO1eSj/yjp548MF6g==
X-Received: by 2002:a05:6122:4685:b0:5c6:58e0:b2e0 with SMTP id 71dfb90a1353d-5c7ed7dc638mr13794906e0c.7.1788860457475;
        Tue, 08 Sep 2026 02:40:57 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec219c12sm9393887e0c.8.2026.09.08.02.40.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:40:57 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-74ab99038afso2939546137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 02:40:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxFPCkRpGzgTp3ztkGw+ukiKm0vn/vQJSY2aO8F108htBJ5Cg0shQO/NkR6OTgc0caHKuAcBWQwWp+AanWBFvN7fg==@vger.kernel.org
X-Received: by 2002:a05:6102:5803:b0:785:a48a:e3b9 with SMTP id
 ada2fe7eead31-78a4a6a93d8mr11547770137.4.1788860452072; Tue, 08 Sep 2026
 02:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-4-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-4-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 11:40:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfDRFz+zYj98GG=_jBhedh1+rCdWbyMSLOycAxzYWouw@mail.gmail.com>
X-Gm-Features: AcwNN1VVehwPBkszYyC_fDFyLf1R3qYKa3cv4jfVhnkMYrB4AMGqyjOV460-Z5U
Message-ID: <CAMuHMdXfDRFz+zYj98GG=_jBhedh1+rCdWbyMSLOycAxzYWouw@mail.gmail.com>
Subject: Re: [PATCH 3/7] pinctrl: renesas: rzt2h: setup IRQ in .irq_{request,release}_resources()
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> When exporting a GPIO using the deprecated sysfs GPIO API,
> gpio_is_visible() calls gpiod_to_irq() to determine whether a GPIO is
> IRQ-capable, which ends up using
> struct gpio_irq_chip::child_to_parent_hwirq().
>
> When using the GPIO character device, it is possible to request a line
> and to dynamically switch between using it as an IRQ or as a GPIO, by
> updating the edge detector.
>
> The current struct gpio_irq_chip::child_to_parent_hwirq() implementation
> makes the assumption that it will only be called with the intention of
> setting up the IRQ permanently, and that it will only be released when
> the IRQ domain is freed.
>
> Since we now know that this is not the case, take the following steps in
> order to properly handle that case.
>
> Implement struct irq_chip::irq_{request,release}_resources() based on
> the default GPIOCHIP_IRQ_RESOURCE_HELPERS implementations.
>
> Move the IRQ setup and release logic inside them.
>
> Keep the mapping logic inside ::child_to_parent_hwirq() to be able to
> provide a proper HW IRQ number, but do not actually setup the IRQ.
>
> Remove rzt2h_gpio_irq_domain_free() as its only purpose was to free
> the acquired IRQs.
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> @@ -1062,18 +1047,21 @@ static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>
>         rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT);
>
> -       *parent = parent_irq;
> -       *parent_type = child_type;
> +       ret = gpiochip_lock_as_irq(gc, hwirq);
> +       if (ret) {
> +               clear_bit(parent_irq - RZT2H_INTERRUPTS_START, pctrl->used_irqs);

irq_idx

> +               rzt2h_pin_write_pm(pctrl, port, pin, pctrl->saved_pm[irq_idx]);
> +               rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
> +               return ret;
> +       }
>
>         return 0;
>  }
>
> -static void rzt2h_gpio_irq_domain_free(struct irq_domain *domain, unsigned int virq,
> -                                      unsigned int nr_irqs)
> +static void rzt2h_gpio_irq_release_resources(struct irq_data *d)
>  {
> -       struct irq_data *d = irq_domain_get_irq_data(domain, virq);
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> -       struct rzt2h_pinctrl *pctrl = container_of(gc, struct rzt2h_pinctrl, gpio_chip);
> +       struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
>         irq_hw_number_t hwirq = irqd_to_hwirq(d);
>         u8 port = RZT2H_PIN_ID_TO_PORT(hwirq);
>         u8 pin = RZT2H_PIN_ID_TO_PIN(hwirq);
> @@ -1089,7 +1077,39 @@ static void rzt2h_gpio_irq_domain_free(struct irq_domain *domain, unsigned int v
>                 rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
>         }
>
> -       irq_domain_free_irqs_common(domain, virq, nr_irqs);

Why is this no longer needed?

> +       gpiochip_unlock_as_irq(gc, hwirq);
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
