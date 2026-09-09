Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3C63D5C1D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 07:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937827; cv=none; b=fqE60FTI4laM6WPerh0n9Nz+jq9Q9VZVB5EzoK2WwKmNHeJuWMlFhtGEKGtj2m3jrxcT5XuAlxIT50X7rostuhrASemTzezJuOfQxNkeW/VNZKlld6kzquEuWZT+csjJKgdGFgFOAhJn1S0pq6abaUENw7N2Yy44cTw80w5UH08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937827; c=relaxed/simple;
	bh=xtvAdc18ghBTpVdh52XHh10xl6bE+yFY3X/qpW3LJN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fK+07aptwW4CJoJZ1KMUrL6N8BY+7wpuKA6viWUCxUJTXUt5XGGRL1nykyjG/j7vWP+XKFcH1qY8OdHcUfGYxyAv60kcZn0y6B55CbiyjVyF6XwNZ4qD2ZqZ95KwOmQdX0tSIeF4WLTE2Vuo8YhYxQ8rlB4gGhNNk93BG7sGM3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-78a66ef3468so2783850137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 00:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788937823; x=1789542623;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MbiU+Gmg7tt4Ds22WMmgVMp5D6+AnMt3i1Pvl+3BP1U=;
        b=n52tiKet1soDtL74fZg378s+miXrOQCq4k4TlQWj3w8NmabWMuZVVBaNvryXYFXxpN
         oFnS81g7eEAxj2mK1CaOcNhTQtPfhw1QoI8JlXuagS7Sgrl3gXr3VaLwwJeaS9+64ukL
         gRWqkAsVhiqwN+YUSaS1XfplSKmxOandwGzimB7TxSGw8XOviVD0sqPshLy7QIxgG0Ob
         D+NYbyzq0Ngvycz6Ir+l0kvwzkn1GwWsLIsJM6lFc+t0iBlqMcJ9xPzb+MqPEYhEwIMB
         /kJrSWoqCvnRvxTpnZ7DiU/lI3zA8rpDoLmbM2ClKwBUdmwRx6wrQPLQDat7gDUP4GaT
         2P5A==
X-Forwarded-Encrypted: i=1; AKwUvBzeou/JJxjJuaCxPa2k56nikinW6KXOvXJR8pu2+Ozo0byHm3hdXElAkYw+ocha2P8zd4zK9SFBLvVWHwA6J/w2PA==@vger.kernel.org
X-Gm-Message-State: AFuF++mInNbefmtfEasY68WCuRT4ef6XzKo13WywJ+3asTEt3t9bT8oY
	Zam0/HV8+8TlNQD1ljiurpfyimdFVwDYOz/fsafZ5B5CRCYLFz3Hg0F7OWe4sxtl
X-Gm-Gg: AYBFou2Cg4vfrcsm4fPT5CTMy12fQknKJZoxx/t235UAAdbBe1RnicF1SPhKgbTHboE
	nhsJyDmhEnIDac/r8yA4VIYjy4HBl8dnU8NYVvvDgFCC0mioM7O4LepftHxZFoalSie5h90dks7
	sAkBvaiU8D4yHIY+haLQRyWGG0zmT5cDT43FglaEDSGPIVjmDEZDqiWlbADyowbO4WmR5Y35geS
	Jow1vNo5Cvevs4nkaiEksreS+ZDDoWO19bubzMo0KlHW2KF+Xe5M3Ndx15jM47yyXBosXrskWhO
	c6R0pD0G39GxN9bPtuUCF58sss80SJec2O2oQzGjwO5odRr01Tw2maUdp/QtJOFW2D32rPkiFBc
	S4clvoBE27F4PYfN+TE7CQaGi89Mue5hKq4us/2Jap08MOatLn0EAM0OkwOnOcXHdAo+gsxFBnK
	55xOxkt8v98c/PKIwpJAswhvXF69Xmupe4i3ekWJybwNZlI5cJ1Y55lwrxdaqHGtYPqSIVXQxxg
	6QjXav+8Lzb5gTsEaLKfSBDaD/8jmfEyQTJRQECxRX7Klw=
X-Received: by 2002:a05:6102:1676:b0:785:6719:abb1 with SMTP id ada2fe7eead31-78a2ef7b044mr8007602137.11.1788937823441;
        Wed, 09 Sep 2026 00:10:23 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98097de57d4sm10062311241.10.2026.09.09.00.10.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:10:22 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-78fb1fb9508so319406137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 00:10:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzDWIA0X61mSn//nHAPNLPdc7lnNbLekG8BKpddJeRBSIbOAtfFSNs7RWm9ChPvCJzJ8yk6Eav4P4SgAhW/JzRxhg==@vger.kernel.org
X-Received: by 2002:a67:ce08:0:b0:78f:efcb:23dc with SMTP id
 ada2fe7eead31-78fefcb246dmr362053137.13.1788937809146; Wed, 09 Sep 2026
 00:10:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
 <b516bf77-fb15-41f2-80ac-b80c621fedd1@mailbox.org> <CAMuHMdWb2Qk=heWhwFh4TsEggHOmzTd4Lj-vG6kXjRVMDDUG2A@mail.gmail.com>
 <43eccc85-fca3-4c69-9114-b45ab5e1b487@mailbox.org> <CAMuHMdVWm1JzmXx1++dhvHbnBbVqQnVVAANfmH5Y24bhJU7pXQ@mail.gmail.com>
 <b837e41d-ba6f-40bf-89db-b62ccd2be467@mailbox.org>
In-Reply-To: <b837e41d-ba6f-40bf-89db-b62ccd2be467@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:09:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVt8LQbpXfPB_MVhPP0Ro_n3L8VkOJCs1oF=WNe8MkcAQ@mail.gmail.com>
X-Gm-Features: AcwNN1VSSE2fLPvAgm84NJgnwSpTg-UVtPnuSPQuKoRSOCrHArKIFOH_BqKYQOA
Message-ID: <CAMuHMdVt8LQbpXfPB_MVhPP0Ro_n3L8VkOJCs1oF=WNe8MkcAQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 9 Sept 2026 at 03:34, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/8/26 9:49 AM, Geert Uytterhoeven wrote:
> >>>> On 9/4/26 1:15 PM, Geert Uytterhoeven wrote:
> >>>>>> +++ b/drivers/gpio/gpio-rcar.c
> >>>>>
> >>>>>> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
> >>>>>>
> >>>>>>     #define RCAR_MAX_GPIO_PER_BANK         32
> >>>>>>
> >>>>>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> >>>>>
> >>>>> IMO passing a pointer to offs complicates the code.  Perhaps pass offs
> >>>>> by value, and return the adjusted offset or a negative error code?
> >>>>
> >>>> I want to avoid that, since if I only return error value, I can then do
> >>>> simple:
> >>>>
> >>>> ret = gpio_rcar_remap_offset(...);
> >>>> if (ret)
> >>>>      return ret;
> >>>>
> >>>> in gpio_rcar_read() and gpio_rcar_write(), which are the only two call
> >>>> sites of this function.
> >>>
> >>> gpio_rcar_read() and gpio_rcar_write() do not return error codes.
> >>> I was thinking of
> >>>
> >>>       offs = gpio_rcar_remap_offset(p, offs);
> >>>       if (offs < 0)
> >>>               return 0;
> >>>
> >>> which is almost the same, but avoids passing offs by address.
> >>
> >> Is there any benefit to it, compared to keeping the value and return
> >> code separate ?
> >
> > Naive me (I am not a compiler writer) thinks the compiler may have a
> > harder time to optimize the code when addresses are involved.
>
> Will the compiler generate code that is worse in the end ?
>
> >>>>>> +{
> >>>>>> +       /* R-Car Gen4 and older do not need any offset remap. */
> >>>>>> +       if (!p->info.has_layout_gen5)
> >>>>>> +               return 0;
> >>>>>> +
> >>>>>> +       /*
> >>>>>> +        * R-Car Gen5 register layout is slightly different and the offsets
> >>>>>> +        * that have to be added to or subtracted from each register offset
> >>>>>> +        * can be divided into five groups, listed below.
> >>>>>> +        */
> >>>>>> +       switch (*offs) {
> >>>>>> +       case IOINTSEL...OUTDT:
> >>>>>> +               return 0;
> >>>>>> +       case INDT:
> >>>>>> +               *offs += 0x10;
> >>>>>> +               return 0;
> >>>>>> +       case INTDT...EDGLEVEL:
> >>>>>> +               fallthrough;
> >>>>>> +       case BOTHEDGE:
> >>>>>> +               *offs += 0x70;
> >>>>>> +               return 0;
> >>>>>> +       case OUTDTSEL:
> >>>>>> +               *offs -= 0x34;
> >>>>>> +               return 0;
> >>>>>> +       case INEN:
> >>>>>> +               *offs -= 0x38;
> >>>>>> +               return 0;
> >>>>>> +       default:
> >>>>>> +               /*
> >>>>>> +                * This here must never be reached, if this is reached, that
> >>>>>> +                * means there is a catastrophic failure in the driver. Skip
> >>>>>> +                * any IO read/write to prevent further damage.
> >>>>>> +                */
> >>>>>> +               WARN_ON(1);
> >>>>>
> >>>>> A build-time failure would be better.  I tried BUILD_BUG() instead,
> >>>>> but unfortunately gcc is not smart enough to notice this case is
> >>>>> never reached.  __always_inline doesn't seem to help either.
> >>>> I had one more idea -- how about we convert the driver to mmio regmap,
> >>>> use opaque register numbers throughout the driver to identify registers
> >>>> to the regmap (maybe not a great idea), and then implement .read/.write
> >>>> callbacks in the regmap_config which instead of doing plain
> >>>> readl()/writel() for register IO would instead do this remapping ?
> >>>> Regmap could validate that the opaque register numbers are only the
> >>>> expected register numbers and reject all the others. Maybe the opaque
> >>>> register numbers could instead of Gen4 register offsets. What do you think ?
> >>>
> >>> That's similar (but more complex?) than the array look-up
> >>> in drivers/tty/serial/sh-sci.c I pointed to before.
> >>> drivers/i2c/busses/i2c-riic.c uses the same method.
> >>
> >> Those do not use regmap (drivers/base/regmap/), do they ?
> >
> > No they don't.
>
> What about my regmap suggestion ?
>
> >>> I.e. just convert the existing register defines into an enum, and use
> >>> that to index a table with the family-specific offsets?
> >>
> >> Are we back to the table look up discussion instead of remap function ?
> >
> > Yes, I think that's the simplest and best-performing solution
>
> The performance benefit of the table look up was never confirmed.

You think a single array element retrieval would be more expensive
than an out-of-line call to regmap, involving function pointers and
(oh yes) a table look-up?

> > : one
> > extra table look-up (array indexing) in gpio_rcar_{read,write}(),
> > compared to an extra function call to gpio_rcar_remap_offset().
>
> The function is inlined by the compiler. The table look up will likely
> suffer due to non-locality of the data in cache.

It is not inlined by gcc 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04.1).
The table needs 13x2 bytes, which fits in a cache line on anything
but m68k.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
