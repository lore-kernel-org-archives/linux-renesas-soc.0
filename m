Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACE243F08D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 07:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938698; cv=none; b=jcvUVuxk8ud4sgM3mPtm1u4pE9HShtxeRm/5jaj4AWGKUpZpCz26J9RV4xfdyTnUhduthusNZPrraEmBd7RaIoRjWs58p9cMcJUN8RHbI9UqGnyDi8+2AAG3mq9DVTLTk4yqJpIHZd4BIAJsDmIRLSRnl0dnF2wDcc05NupZvsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938698; c=relaxed/simple;
	bh=ArGUM4EWHCEJAPbMFplmlG+j+5FUg/R6HSCILtpRD50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aztoJjMYAWY1S0YxMuqvdQaMYa1/jmJIxiFZ5ZbBQBsu0FFZf9/CAxZVPI5/OgyihF40xyzjWmTlvaXqaJs22ID1loHuNg1I4Pw7pqCjPu3PcL9COc6KrGIrgxX93q20Pq0waMPrqPmoLSEY4XjciKkrSSbg94olJKNAobNXtwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-78fb1fb9508so326412137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 00:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938696; x=1789543496;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2MgyCyfPa8QdumBUXGZFVv9KoFPRiHKDsH3R3M+FtDc=;
        b=dJ3R4GYYbsZt5C8qTJl1jZmPd96lpQl0JcGMQE8hDcrTUQfXoyVUX8SMp1g7aZvcLV
         QAbjHvG8NCyaW90bYQGsti6amWaB0wnEZf9G/Z5pFsb4NLYyFLl0Qw9RhmfDa84VmbtB
         xS9YedwI6KbwxHt+Hv7kfeQTMlpfOkfTqsK8T5E44PvX3MCbzdpRj+ZIToA9Ylr1NkRt
         zoyAl3TWT2C73dJcW8wth8TpaDYedgYL35NUBiI6ACYC2xCCJht4DsqBplwebfCcNhGo
         TYiwyzszh2ZjKSalQEkOH/prTmWRWEEc88ddtS0rx8cEqgZwYof4tCL/1I06TE1+V3Mi
         VdMA==
X-Forwarded-Encrypted: i=1; AKwUvByTXn/4T1CpMkzdCYYQs04RUeKeSrMN16j5VbykzyJnt2q27J5knJBYniytt0MFvIUEyuAPWGv12TLIXZmONilCUQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mI+RSERvQQzqt6ERVH10zy6JeY4xAFiduViY9ochyRqdbPAr+m
	KSGjqV35cxJpmJGB/+tKIYBrFWhCCu5DP92jDeWU976Y9VGJJYFZT5R0PO+CmLpf
X-Gm-Gg: AYBFou32FMzMpUTeKFMz13zHdAPl+gAmdDr+k1FttBgxqVjVcTEm+bMWRne824MKSch
	QMr1Q7YlZAkVqh/MY/6go8RBqdu/ACuan5kgEZ6J1lgSiuuog6nSledeHC1EClfnLIFtplPz6vB
	NgEpFHoHrKxNEEGJyD/u9Hd8tDYbR/LRZBAZGc8psf8NU9Q9eXw9dF3bJt/IiMeKqQuQ616q0g8
	5+u8iKk3JkJcC0VmHzwjYfDWG6pwVBqMbzq5hl0WQAmOkPqJt9CSYIQBQMZ5zN/jk6N2ZZfDHnX
	mnCtULRitc802pQ7IW7ceBXXmnZhyJRAQmF5hzu6vzgGzYgBaJBoougeG3JZp1Sf6rMkjm649MH
	Mcyq/iH08msNX/FCFoNiiwJ+laA1cg3R/HyQthwQxCmMYU+zNpL+z6OrAtRP3ewLcr11PaoMbMn
	CvYZI86GAs5skirnUL61lGPCowKBIah5Hg9YDGQwIbbt2o/7b0DkMhk5AiOG8QM4Xjb245gLHlf
	gn0PMDa01jnJFpLbFl4p1uM6wdcrRR5NDJl
X-Received: by 2002:a05:6102:227b:b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-78a4dff7edbmr6252954137.15.1788938695901;
        Wed, 09 Sep 2026 00:24:55 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed7018fsm11371692241.6.2026.09.09.00.24.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:24:55 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9809ce25a29so2978769241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 00:24:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxXCyRUmJm+ijPamjWK9i+YQ7NENblbOqmys09fxlMKAwiyDSqfBXSk40lcCzLWHOr0Dt1jjZIznk4tGCyW24xFVg==@vger.kernel.org
X-Received: by 2002:a05:6102:cb:b0:784:a925:3f0c with SMTP id
 ada2fe7eead31-78a2ea9acfcmr7265518137.0.1788938695217; Wed, 09 Sep 2026
 00:24:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909021354.135899-1-marek.vasut+renesas@mailbox.org> <20260909021354.135899-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260909021354.135899-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:24:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhCf00CWba5hjNpSM1BGZix-DuVtGKBZOOshGm9oS2Hg@mail.gmail.com>
X-Gm-Features: AcwNN1X-NF44ou7FYcKcKHvL8TOawdQrAM7HFDb_w67a6oZ3uHtHjht2RmO_OIc
Message-ID: <CAMuHMdWhCf00CWba5hjNpSM1BGZix-DuVtGKBZOOshGm9oS2Hg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-gpio@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 9 Sept 2026 at 04:14, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:

It's getting late/early ;-)

> R-Car X5H (R8A78000) is the first member of the R-Car Gen5 family.
> Add support for R-Car X5H, which has slightly different GPIO block
> register layout compared to previous generations. Introduce offset
> remap function which performs 1:1 remap for R-Car Gen1..4 and a bit
> more complex remap for R-Car Gen5.
>
> The GPIO block register offsets on R-Car Gen5 changed and the change
> can be divided into five groups, registers which remained at the
> same offset, INDT register shifted by +0x10, OUTDTSEL register
> shifted by -0x34, INEN register shifted by -0x38 and the rest of
> the registers used by the driver shifted by +0x70 .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> V2: Rewrite this into a table look up

Thanks for the update!

> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -49,31 +50,48 @@ struct gpio_rcar_priv {
>         struct gpio_rcar_bank_info bank_info;
>  };
>
> -#define IOINTSEL       0x00    /* General IO/Interrupt Switching Register */
> -#define INOUTSEL       0x04    /* General Input/Output Switching Register */
> -#define OUTDT          0x08    /* General Output Register */
> -#define INDT           0x0c    /* General Input Register */
> -#define INTDT          0x10    /* Interrupt Display Register */
> -#define INTCLR         0x14    /* Interrupt Clear Register */
> -#define INTMSK         0x18    /* Interrupt Mask Register */
> -#define MSKCLR         0x1c    /* Interrupt Mask Clear Register */
> -#define POSNEG         0x20    /* Positive/Negative Logic Select Register */
> -#define EDGLEVEL       0x24    /* Edge/level Select Register */
> -#define OUTDTSEL       0x40    /* Output Data Select Register */
> -#define BOTHEDGE       0x4c    /* One Edge/Both Edge Select Register */
> -#define INEN           0x50    /* General Input Enable Register */
> +enum {

enum gpio_rcar_reg

> +       IOINTSEL = 0,   /* General IO/Interrupt Switching Register */

You can drop the initializer.

> +       INOUTSEL,       /* General Input/Output Switching Register */
> +       OUTDT,          /* General Output Register */
> +       INDT,           /* General Input Register */
> +       INTDT,          /* Interrupt Display Register */
> +       INTCLR,         /* Interrupt Clear Register */
> +       INTMSK,         /* Interrupt Mask Register */
> +       MSKCLR,         /* Interrupt Mask Clear Register */
> +       POSNEG,         /* Positive/Negative Logic Select Register */
> +       EDGLEVEL,       /* Edge/level Select Register */
> +       OUTDTSEL,       /* Output Data Select Register */
> +       BOTHEDGE,       /* One Edge/Both Edge Select Register */
> +       INEN,           /* General Input Enable Register */
> +       REG_COUNT

Not needed (even harmful, see below).

> +};
>
>  #define RCAR_MAX_GPIO_PER_BANK         32
>
> +static volatile void __iomem *gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int offs)

s/int offs/enum gpio_rcar_reg reg/ (everywhere), so the compiler knows
the valid range.

> +{
> +       const u32 offsetmap[2][REG_COUNT] = {

static ...

> +               /* Gen1..Gen4 */
> +               { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, 0x18, 0x1c, 0x20, 0x24, 0x40, 0x4c, 0x50 },
> +               /* Gen5 */
> +               { 0x00, 0x04, 0x08, 0x1c, 0x80, 0x84, 0x88, 0x8c, 0x90, 0x94, 0x0c, 0xbc, 0x18 },

Please use C99-style initializers, for both readability and safety.

> +       };
> +
> +       BUILD_BUG_ON(offs < 0 || offs >= REG_COUNT);

Not needed.

> +
> +       return p->base + offsetmap[p->info.has_layout_gen5][offs];

Please store a pointer to the table to use in priv, so you don't need
to check p->info.has_layout_gen5 over and over again.

After all of that, this function has become very simple, so you can
just inline it below.

> +}
> +
>  static inline u32 gpio_rcar_read(struct gpio_rcar_priv *p, int offs)
>  {
> -       return ioread32(p->base + offs);
> +       return ioread32(gpio_rcar_remap_offset(p, offs));

return ioread32((p->base + p->offs_table[reg]);

>  }
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
