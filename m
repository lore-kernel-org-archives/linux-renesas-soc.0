Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3F052120E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 09:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859542; cv=none; b=tbb6eskyq6W3GMhjhXTBXegrowCEdhtTK9h9CP30zf7QC8kNhJYsBvkDz2UBORmnvarH3ofAvo5Cm9upRO5yk3w9SztPYyVcIb1L/8OJVZw10o9h4lR1+A79CPBloYZeQxv/NAPCliMqK++ySrDqc7Re3AUYI5t9AJcqbttg8+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859542; c=relaxed/simple;
	bh=dElApXNmnOgx2LivlVvzaqjoFojUK7t4I4aO8fOopz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvu7ikSZJw9ozgY+hPL+lGDZWotgkLQuPtSJ4Dj07SXgjYHeMZT1owx94k/kM1VEOge9BNzfs8VRbRCuOQBu8kSQNjXBfJ8ALxMcLj8Tc+9QH8aMDxmt2EST8SyP1FjnEtZ0zeprl2fqsDjKKMMhygzzkj8Uy4drIsV+WU+nwUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-77bf3334d14so2950506137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 02:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859540; x=1789464340;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uNDZ4Z9RQ9wXrVcNuo/xPMTuBK+T4DwJPmnnzMm2S6s=;
        b=rcnx5poFTruELTPV2ZpCrjLsn2jyM9ykAK7alj+qlzvmONrlU/SW75YSnQK7drZVXl
         OHfZSTsSz3zktWwrG9Cfn6c0QcChdHZG9uRDL6HE6KWDUVpmSpr8JIGKI/HLQMfjH6/M
         waz9vnE1uCU92mIGYPOmhfxFDb+WtklDVS4QUF/SjGzN9pdEy3CyD6VV6PkVj4c9Oj7c
         sxOLrJMZNF1JxsSihTxtRe/BTn0VMbDSYvOR12Hhj6pzJbfxOh9qe6mjgolJNS8XMWMy
         j3gcxwHbYW9jwVIUjUUQzZS8CWgBnjn4XzMra68S6F9OnqR0BtIukIXn5E1pFiXNPyef
         Sdkg==
X-Forwarded-Encrypted: i=1; AKwUvBx1V8ScK8jOFeXp+VRlJYQ73+VgYtHlm8AGQYwebxWm4hnehfNv0NNcWw+C0iP0CwKZk4Gd5QVbdm+EF+y6GtHGIA==@vger.kernel.org
X-Gm-Message-State: AFuF++kLVSLS/+dLSFVgr6Z2WmFw5hqGuUjddSadkVRoGYicpyF7MQEi
	yCluNT9jGYqc+ArRIOXhHJQgk3UHTJz5GH/SiKCRd2j9ZqrJZR39F3bMBtwqa8Se
X-Gm-Gg: AYBFou2XulxHvtB9pQW5yL5WPgpazYCfOMJpryBa5gXjyb6SQ2KXantL41tyStOnDZI
	SCdFc441hRXCMgKkSO4ufGThETqGdRbRg4HP+aBZwkr2Y5Z9WYBTehFBAKKBaEICwIhEovgN/ET
	3Y6iPvZvLR5VummUM3oOHSVhGRSy6S61yR/Ok19A1VmtRGTPMPlo2HwmcEQAD1j4HRuWdCoUTXv
	h64A5HGEFcKZ6Ed2DK3SWW1XTzLNrINonXbUIknaG4zK2XFBBDkzDD16ILrjz8c5CFhlpqlgBlS
	MzW7D9VVI6vzixwRwWqqS3BYfa7xQGle4/Q6PNfHoq+URwN0YSJbIpXuKQejZClXxTCbnoD9XzP
	7zS8ThTMsdlhLK1QBhWB77nu6u8kQXRuK0Bnsf0UuBkVckWkKiqx2hSdLRidlyDtvICnPAGbdMM
	WW1qQRLItK1M5gsLyy0Nl0afRzZ2FebhyrOyD3I+Io43rDoRL2FRjJavZkVMXwzH8cwEzDGTef8
	LvksrUD+2bE1WxOrWToCzpL4w==
X-Received: by 2002:a05:6102:e0d:b0:789:5b58:e105 with SMTP id ada2fe7eead31-78a4a90fdd3mr12719955137.2.1788859539635;
        Tue, 08 Sep 2026 02:25:39 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ae301fsm8211986137.7.2026.09.08.02.25.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:25:39 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-77bf3334d14so2950499137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 02:25:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByLt1avO2v6gPvqVqAAUWsxkZD4gv/q7uHYk6Ca1NMQwXjsIKTZuL62YJnH9qakxK+mJj4cVWGzSZ7xBg/lpXiapQ==@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:789:5b58:e105 with SMTP id
 ada2fe7eead31-78a4a90fdd3mr12719938137.2.1788859539059; Tue, 08 Sep 2026
 02:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 11:25:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+PArWcN9Xc5UiErWNUeGDEVoM6DoLgZQJOQHav9GZ+w@mail.gmail.com>
X-Gm-Features: AcwNN1USGKMY7TKVnAkjjakrGwhuoyRY6EMfvN47yRnI9dkrkdtdSzBeKR52XOc
Message-ID: <CAMuHMdX+PArWcN9Xc5UiErWNUeGDEVoM6DoLgZQJOQHav9GZ+w@mail.gmail.com>
Subject: Re: [PATCH 2/7] pinctrl: renesas: rzt2h: restore correct pin mode on
 IRQ free
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

Thanks for your patch!

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> rzt2h_gpio_irq_domain_free() calls rzt2h_pinctrl_set_gpio_en() with
> false leaving the pin in interrupt function instead of returning it to
> GPIO mode.

OK....

> Pass true to rzt2h_pinctrl_set_gpio_en() to take the pin out of
> interrupt function after we're done using it as an IRQ.
>
> rzt2h_pinctrl_set_pfc_mode() switches the pin to Hi-Z, losing the
> previous PM value.
>
> Save the PM value before switching to Hi-Z, and restore it after the
> IRQ is freed.

Why is it a problem if the pin is in Hi-Z after the interrupt has been freed?
Isn't that the right state for an unused pin?

>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c

> @@ -170,6 +171,25 @@ static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
>         return (pincfg & BIT(pin)) ? 0 : -EINVAL;
>  }
>
> +static u8 rzt2h_pin_read_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
> +{
> +       u16 reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> +
> +       return field_get(PM_PIN_MASK(pin), reg);
> +}
> +
> +static void rzt2h_pin_write_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin, u8 pm)
> +{
> +       u16 reg;
> +
> +       guard(raw_spinlock_irqsave)(&pctrl->lock);
> +
> +       reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> +       reg &= ~PM_PIN_MASK(pin);
> +       reg |= (u16)pm << (pin * 2);

General remark: the need for this cast is one reason why function
parameters should use "unsigned int" instead of u8.  The other reason is
that the compiler may add code to mask the parameters to 8 bits,
depending on the CPU architecture.

> +       rzt2h_pinctrl_writew(pctrl, port, reg, PM(port));
> +}
> +
>  static void rzt2h_pinctrl_set_gpio_en(struct rzt2h_pinctrl *pctrl,
>                                       u8 port, u8 pin, bool en)
>  {
> @@ -1023,16 +1043,23 @@ static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>         struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
>         u8 port = RZT2H_PIN_ID_TO_PORT(child);
>         u8 pin = RZT2H_PIN_ID_TO_PIN(child);
> -       u8 parent_irq;
> +       u8 parent_irq, irq_idx;
>
>         parent_irq = rzt2h_gpio_irq_map[child];
>         if (parent_irq < RZT2H_INTERRUPTS_START)
>                 return -EINVAL;
>
> -       if (test_and_set_bit(parent_irq - RZT2H_INTERRUPTS_START,
> -                            pctrl->used_irqs))
> +       irq_idx = parent_irq - RZT2H_INTERRUPTS_START;
> +       if (test_and_set_bit(irq_idx, pctrl->used_irqs))
>                 return -EBUSY;
>
> +       /*
> +        * rzt2h_pinctrl_set_pfc_mode() sets PM to Hi-Z before switching to the
> +        * interrupt function, losing the previous PM value.
> +        * Save it so it can be restored when the IRQ is freed.
> +        */
> +       pctrl->saved_pm[irq_idx] = rzt2h_pin_read_pm(pctrl, port, pin);
> +
>         rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT);

If rzt2h_pinctrl_set_pfc_mode() would return the old PM value, you
could drop rzt2h_pin_read_pm(), and write:

    pctrl->saved_pm[irq_idx] = rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin,
                                                     PFC_FUNC_INTERRUPT);

>
>         *parent = parent_irq;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
