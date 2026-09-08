Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7516E49EC64
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869790; cv=none; b=igiodkzS9G3NLvIesljDF8c7hggE5/3CoN7k09Rd91tgV0IBjIUzxC9ErL3neg63AUSNyR7DjbvVdXSxMRd+nM1gdPdArkCjhwOx3IEJ1Q4TCIbURJfi8Uj6URiNv5Ou5lNEANsRmT8CjOlP3xHf3Wl9NkuCgFERbEWUoDAh5WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869790; c=relaxed/simple;
	bh=GkAEwkhAh2GYIkLx6cCmw7o1fsF123JG5M31hDK1crM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hdg8+NciemtSstFk4G2Eg+zUBk5XnhcWhbxwspCiPYyVjg6DbsjJSo1kvtcpdIjFLDqSc+bXwBgqIWG6RZF7sYxw16g+h4mQIF93u+5J/5LuDY6XFuxQTAMcIYN4r8zKIwEqeINIMbgVCDqFt/YqBcyzttdDJmTDKZelEfInGP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c7bf03c4d0so3465555e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 05:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869782; x=1789474582;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z3ivAQedapV9TM2nRTd5rbGn+RixfFjk0mtfmMN+Qx8=;
        b=XSi8qvgTVrtx4yBZAEUW85SIEVPyFbSehw3Vw9Wh9SltPhr6vAu4VM5WxCq9R3wiAC
         amWM0wFZQtLYl4rHa4IIbkhLd6qWPanCLK3MHsTO1SNgpcdwawQ6Nex/ym9d1MJtZurY
         Ow1+hSHR6JVKkicsxv8uoHpqoDXWUxIp4IvEOQMtyzuoWTXcwrYpE/tD2zyx1zpPTs4C
         Lcd5ct4CFc9ibHGznvCRhzGZzqmA9gPLW3tC6rELrX+vYiC82+e33S1Hs1gmHrOziTHQ
         dWXZVPzo69zkzPooU2YEAu3FocvVAxY1QY4FUtBYUtGm5Xiac7YXhBfe7HZHpBUYzBPs
         FIqQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5nyicEpyHWirtAIJqyrkHlwYu1CeL9DiEQK5y2vXbvqxn4lO3zb5JaEO8yEfR4Hgn0gPev3kqEc5Su6VjuVFZcQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mX7eiS1eCD4JN+4Llkt+0ZShNAkUcBd8a2bWf3vvaXjPkRnreT
	z1q1jToT4XkWl30byPrOfvq0Fnmxu7pgVgKtcsJ9FfTBiASs8RXo4JdjFJ6qMb5D
X-Gm-Gg: AYBFou3gIx2xgQNyXvs8xAxCtD89lWKotfvF7XEuM3Hq6mwwsvGnwL4KdkMtWGpv/k/
	JEaSA/78CBH6KlWqfrkgsKrkA1UZXXF3cyjByBdaHrSffkEnXGztD5MRrQ6Kmo3/zGj6nU3DIC9
	nlRaLTYJlv5e52flf7DKItS9xhGG2/6R83ZBOWf+HZICpc3KwA23rTJedb9HQa4cHAtIVsghPgx
	lSWDscPnmmZ5UcXSPMvKLQr++pIEwvMARx/bN9g/YtkVL8NG0Ok6cLwKBH1z/NH/0g2kUGkopIB
	C+XJbrnNsHWiVvc1m9HFulmjTWTwpaMZJu9GtH/uURLt7amO8DZQe7/9ftYGNJ4rfqJUr0HBJt4
	ORvfdDnwLUIOBJavv3Yo7v2V0NKBrtIns+2L7Jez3+zQTdNZRbJdDRJNVXG6EMmgmpvhLXrHy2t
	i1nsxpelrnGingMYjUdvngfYMh1hvGNtAXb8meHkd98yGnxXjOr7jo3GdS8EFDaDTkd/BAA/fwD
	jgXgfOq4co0R9wJHNw97Nt3B/NQpd9Mh6mo
X-Received: by 2002:a05:6122:121:b0:5c2:bb83:462d with SMTP id 71dfb90a1353d-5c7ed78cf68mr9641030e0c.6.1788869777588;
        Tue, 08 Sep 2026 05:16:17 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec24254fsm9538256e0c.10.2026.09.08.05.16.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:16:17 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so2391017241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 05:16:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByx+bagH3DOqu0HgXmYFclCh7J6FeWF7FlAUvVtKSmrRP2yucFjC1OjH5bNKw2L8Rxs9do/hYfMXbRPg17ayCitEQ==@vger.kernel.org
X-Received: by 2002:a05:6102:1484:b0:785:1d9c:633c with SMTP id
 ada2fe7eead31-78a4a8436b7mr12752699137.7.1788869776751; Tue, 08 Sep 2026
 05:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260817185700.322370-3-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdX+PArWcN9Xc5UiErWNUeGDEVoM6DoLgZQJOQHav9GZ+w@mail.gmail.com> <TYRPR01MB156193BED16FC87EBE4B2008885B12@TYRPR01MB15619.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB156193BED16FC87EBE4B2008885B12@TYRPR01MB15619.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:16:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNzUJjvzkipZZY7EP+-sCUC-vDndFrjAY50j=HMNB4fA@mail.gmail.com>
X-Gm-Features: AcwNN1UYRmPMEh1uwkSa9mR-HbOhT0h9W6j5sM8pk6E_tmyyrP47WzL_coSV8xc
Message-ID: <CAMuHMdVNzUJjvzkipZZY7EP+-sCUC-vDndFrjAY50j=HMNB4fA@mail.gmail.com>
Subject: Re: [PATCH 2/7] pinctrl: renesas: rzt2h: restore correct pin mode on
 IRQ free
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@kernel.org" <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Tue, 8 Sept 2026 at 13:33, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
> > <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > > rzt2h_gpio_irq_domain_free() calls rzt2h_pinctrl_set_gpio_en() with
> > > false leaving the pin in interrupt function instead of returning it to
> > > GPIO mode.
> >
> > OK....
> >
> > > Pass true to rzt2h_pinctrl_set_gpio_en() to take the pin out of
> > > interrupt function after we're done using it as an IRQ.
> > >
> > > rzt2h_pinctrl_set_pfc_mode() switches the pin to Hi-Z, losing the
> > > previous PM value.
> > >
> > > Save the PM value before switching to Hi-Z, and restore it after the
> > > IRQ is freed.
> >
> > Why is it a problem if the pin is in Hi-Z after the interrupt has been freed?
> > Isn't that the right state for an unused pin?
>
> It wouldn't be an issue if it was actually unused once the IRQ is freed,
> but that's not the case, because you can call gpiod_to_irq() on a GPIO,
> and then request_irq() on the IRQ returned by it. If you then call
> free_irq(), you only free the IRQ, not the GPIO itself. After that the
> user of these APIs should still be able to continue using the GPIO.

OK.

> If the pin is left in Hi-Z after freeing the IRQ, rzt2h_gpio_get() will
> see that the pin is not in peripheral mode anymore, it will then see
> that neither PM_INPUT nor PM_OUTPUT are set, and will return -EINVAL.

That is fixed by "[PATCH 4/7] pinctrl: renesas: rzt2h: fix reading pin
value in IRQ function" anyway, right?

> > > --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > > +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> >
> > > @@ -170,6 +171,25 @@ static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
> > >         return (pincfg & BIT(pin)) ? 0 : -EINVAL;
> > >  }
> > >
> > > +static u8 rzt2h_pin_read_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
> > > +{
> > > +       u16 reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> > > +
> > > +       return field_get(PM_PIN_MASK(pin), reg);
> > > +}
> > > +
> > > +static void rzt2h_pin_write_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin, u8 pm)
> > > +{
> > > +       u16 reg;
> > > +
> > > +       guard(raw_spinlock_irqsave)(&pctrl->lock);
> > > +
> > > +       reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> > > +       reg &= ~PM_PIN_MASK(pin);
> > > +       reg |= (u16)pm << (pin * 2);
> >
> > General remark: the need for this cast is one reason why function
> > parameters should use "unsigned int" instead of u8.  The other reason is
> > that the compiler may add code to mask the parameters to 8 bits,
> > depending on the CPU architecture.
>
> Should I switch the pm parameter to unsigned int for V2 then?

Yes please.

> > > +       rzt2h_pinctrl_writew(pctrl, port, reg, PM(port));
> > > +}
> > > +
> > >  static void rzt2h_pinctrl_set_gpio_en(struct rzt2h_pinctrl *pctrl,
> > >                                       u8 port, u8 pin, bool en)
> > >  {
> > > @@ -1023,16 +1043,23 @@ static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
> > >         struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
> > >         u8 port = RZT2H_PIN_ID_TO_PORT(child);
> > >         u8 pin = RZT2H_PIN_ID_TO_PIN(child);
> > > -       u8 parent_irq;
> > > +       u8 parent_irq, irq_idx;
> > >
> > >         parent_irq = rzt2h_gpio_irq_map[child];
> > >         if (parent_irq < RZT2H_INTERRUPTS_START)
> > >                 return -EINVAL;
> > >
> > > -       if (test_and_set_bit(parent_irq - RZT2H_INTERRUPTS_START,
> > > -                            pctrl->used_irqs))
> > > +       irq_idx = parent_irq - RZT2H_INTERRUPTS_START;
> > > +       if (test_and_set_bit(irq_idx, pctrl->used_irqs))
> > >                 return -EBUSY;
> > >
> > > +       /*
> > > +        * rzt2h_pinctrl_set_pfc_mode() sets PM to Hi-Z before switching to the
> > > +        * interrupt function, losing the previous PM value.
> > > +        * Save it so it can be restored when the IRQ is freed.
> > > +        */
> > > +       pctrl->saved_pm[irq_idx] = rzt2h_pin_read_pm(pctrl, port, pin);
> > > +
> > >         rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT);
> >
> > If rzt2h_pinctrl_set_pfc_mode() would return the old PM value, you
> > could drop rzt2h_pin_read_pm(), and write:
>
> The main function of rzt2h_pinctrl_set_pfc_mode() is to change the PFC
> mode. Returning the old PM value as a side effect would mean the
> function does two unrelated things.
>
> The extra register read this avoids only happens on IRQ request/release,
> not a hot path, so I'd rather keep the two concerns separate if that's
> okay.

Fair enough.

>
> >     pctrl->saved_pm[irq_idx] = rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin,
> >                                                      PFC_FUNC_INTERRUPT);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
