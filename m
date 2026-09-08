Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31865476FC
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 12:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871533; cv=none; b=jW+MZLa0p5HHRh6ExyLN7zuUvXdNYwMUvqmAfnxn/F2wrnOSpov7L4K+UMGmiP72vv70TIpHsC0OmVwzG9ewYw4v4g6cWxz8ILAMZoIl1zwYMdcBwwuMH/pAjG/XGKkiy30ldFCICHa+psUjuPIjzQk9hA4iPY4ioj5+ys/GT2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871533; c=relaxed/simple;
	bh=cefWH3zZ7K3vDSf+fLZ09nXocZembIWvzYOmUwp+oTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDCmAIkBMPKS9nFEXK7/mRNlzoWx/wKo6aj7aceVGfaDiGniNauJEpwt0L62/Yb/y9VdkHDY7jiP576qtKaimSQJIVCWlNfkqtqlOEa0yLIcxdz+j0QwUHqDRU1uzGLD3QAX6gZjBOtYqGogfU1wT1oHWLwkerKTeKMih/UnHbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97e9fb0fc58so1143981241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 05:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788871530; x=1789476330;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sWfYxxbbZLcnhPJrqJjUWtl71HlCnyMUS3wjMmJ9wMA=;
        b=cjIDkFWx3OdEz8c3LpgVNfN2I+G696GJkt4J8C5FEVK6MZjmyXAMOgfXp2YmQZEI2m
         lOj/Hv07XLOrxAD4BAmuROSc90KTWMJpFnHPeRZug6rbHOf89bGf6E9mNrobwp1Mrg3E
         mdeq2Bvy42hQvGNjB8LQL2GTxYxXicgFfsG2u9gnbgvWt2U0Nja4gpVTiP7JVz41nsdp
         w2Cjcgegnay+yZo9NU+JzAutGSXjslY8MCIVmc5BIWXZbopYujKap3J3iLqoGLWPJcSt
         WAcwS8j+CrAD7lRXexi25qEnkpPgTljNO6i0XKLDwEpt6Cqu8z2snj3HMSpkLWTF2+/7
         hMqg==
X-Forwarded-Encrypted: i=1; AKwUvBz0GQEDDrKYSF6e03XwA/eqQtURLhyGRRQ31B4zMLrB3bpUitYV0bdKsqYujgdwhPTZKYImYmouxjSREh+HrYRhrA==@vger.kernel.org
X-Gm-Message-State: AFuF++lhtJW+ZDr/wlY4Fz0AnnQUhg+L0i0CJudh85PPM8+17tF6JK+4
	FTeF10yG+xT6qSq9qzqAjS7GS6y0MDV7GbHB+2Eb/r8B3Ve8Il7scpp0d1yrnHbd
X-Gm-Gg: AYBFou3Xy+TQ+pqS1lBiHjIGhqLV78PGZBc50CwS086ARyOdB+W8frF+mHuhxJGPkTm
	Da89Skwi/6vOtVYvsjtBBmYUfoKJ4OFHq9q9yptG9fIQTU+FeD5UXDUIPdy7DqEoTjGZP+9NyWS
	gfOjk0Fw+pe0D5PlHjTSattmLoEt4r9ZWp2RqrmeLcKXTXOZ5SN6IJ8IEKGnpJ2QcqF+iF1p6Wu
	krtf6Z/kdnv2chYgowHoi/OKx10zur8kJ68byE7cAiJOk406be2SLH2B55/n+RSUK32/0JMDeJ6
	pcPXs1EBL2DJp0aqMpFX2g/BQIUzJUNr9LMlupn9edcczXPbkUW6rh5iL3e2eCfzjRsowAJnpoc
	tP55rE/d/82qia2no4Q1ocYB1VTbYAUnG9ny+qalcCnKZfMTzdR+Jj9YeRFNLdot/hlLHRztwYE
	cLyTVUPriLUy//qrDFWtTZ6nlPnZr4nBKUZA7DkzY2AuV92f2uQuV7wBGl+73oqvSGnD41N39v3
	x1zjTNq7HYkfwMMOBGcWi+spA==
X-Received: by 2002:a05:6102:4bc7:b0:780:c715:292a with SMTP id ada2fe7eead31-78a4aa630b9mr9753267137.13.1788871529565;
        Tue, 08 Sep 2026 05:45:29 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b56bd3sm8254983137.12.2026.09.08.05.45.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:45:29 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-963f63fe025so1248009241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 05:45:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz09mbs5htEthTJAfRM0mwSE7ikVJ/LbIBBns1bRHf4XwTz/6srp0gcb2AC+VzzkOWv86TCVK1Zzv0WUV9aksZOKA==@vger.kernel.org
X-Received: by 2002:a05:6102:534e:b0:77f:fb50:8822 with SMTP id
 ada2fe7eead31-78a4a9106f4mr9231211137.7.1788871528665; Tue, 08 Sep 2026
 05:45:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260817185700.322370-4-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdXfDRFz+zYj98GG=_jBhedh1+rCdWbyMSLOycAxzYWouw@mail.gmail.com> <TYRPR01MB1561960BD76ABAAAEF5AA13B385B12@TYRPR01MB15619.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB1561960BD76ABAAAEF5AA13B385B12@TYRPR01MB15619.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:45:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+qcwEd0r5_WZEb42DKgEBMWAngjD08BWsc2bZoVf65w@mail.gmail.com>
X-Gm-Features: AcwNN1XD1CUmhUYt-WGNvcOw7i9qN594qU3UZvFGN3lson5FhCOp_jfcJ-nsAHg
Message-ID: <CAMuHMdX+qcwEd0r5_WZEb42DKgEBMWAngjD08BWsc2bZoVf65w@mail.gmail.com>
Subject: Re: [PATCH 3/7] pinctrl: renesas: rzt2h: setup IRQ in .irq_{request,release}_resources()
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@kernel.org" <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Tue, 8 Sept 2026 at 14:23, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
> > <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > > When exporting a GPIO using the deprecated sysfs GPIO API,
> > > gpio_is_visible() calls gpiod_to_irq() to determine whether a GPIO is
> > > IRQ-capable, which ends up using
> > > struct gpio_irq_chip::child_to_parent_hwirq().
> > >
> > > When using the GPIO character device, it is possible to request a line
> > > and to dynamically switch between using it as an IRQ or as a GPIO, by
> > > updating the edge detector.
> > >
> > > The current struct gpio_irq_chip::child_to_parent_hwirq() implementation
> > > makes the assumption that it will only be called with the intention of
> > > setting up the IRQ permanently, and that it will only be released when
> > > the IRQ domain is freed.
> > >
> > > Since we now know that this is not the case, take the following steps in
> > > order to properly handle that case.
> > >
> > > Implement struct irq_chip::irq_{request,release}_resources() based on
> > > the default GPIOCHIP_IRQ_RESOURCE_HELPERS implementations.
> > >
> > > Move the IRQ setup and release logic inside them.
> > >
> > > Keep the mapping logic inside ::child_to_parent_hwirq() to be able to
> > > provide a proper HW IRQ number, but do not actually setup the IRQ.
> > >
> > > Remove rzt2h_gpio_irq_domain_free() as its only purpose was to free
> > > the acquired IRQs.
> > >
> > > Cc: stable@kernel.org
> > > Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> > > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

> > > @@ -1089,7 +1077,39 @@ static void rzt2h_gpio_irq_domain_free(struct irq_domain *domain, unsigned
> > int v
> > >                 rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
> > >         }
> > >
> > > -       irq_domain_free_irqs_common(domain, virq, nr_irqs);
> >
> > Why is this no longer needed?
>
> We moved from using struct gpio_irq_chip::child_irq_domain_ops::free to
> using struct irq_chip::irq_release_resources, so free is no longer set.
>
> devm_gpiochip_add_data() ->
> devm_gpiochip_add_data_with_key() ->
> gpiochip_add_data_with_key() ->
> gpiochip_add_irqchip() ->
> gpiochip_hierarchy_create_domain() ->
> gpiochip_hierarchy_setup_domain_ops() ->
>
>         if (!ops->free)
>                 ops->free = irq_domain_free_irqs_common;
>
> It will end up being populated automatically, let me know if you think
> we should set it explicitly.

Thanks, that's the part I was missing.  Please document in the patch
description that irq_domain_free_irqs_common() is set up automatically.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
