Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4F13890F6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853771; cv=none; b=Eie1Nak+jMdyX2WXysMN8eV38j/ae7+t/1cz65d8K4yGov7fJViSi+q89F/X99mDu7hWsqEP1NRu3OHzzvSWULYlxQQaCYjl+cOvSsRvGJarbhGcJAaSqCUHgR1/DK7CGw1HO7PdH59wMHRVM0C/UqsVTEUtDoRdS252vjw+5OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853771; c=relaxed/simple;
	bh=w/a+1msjGoAq5RLfsEPT89FQwvNcgfDXVDAMK+BH8PQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgrY1amcT8MMHMykHWplb5p2G9iQQWj0oJg+mnOyQP14q5pkpHSn7D3M3wtEpLRDu1+0LNyGT+TxVDSGetU2DrjhQfEqzAwJc9Lgcy3CjXmfxtpCal9lk0jL8w1vpY6f7FAgpY2j+VaZ1TvIys3Lylg6i5m/FVfIgyv1ko9okzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-97c7afa485bso2443528241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 00:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853769; x=1789458569;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jvWdv2bTFNskO/RaDsnSTq+0xZGM/I73gHnrYZO6XAc=;
        b=mfaO2Q9N/xySDpWnk6OaZT62PiKju8eTN2HyT4uM5qf1lfgLSK20WN5KBlIe/6oh6s
         iCAqWVYRPV4UOCSoSQ8gR4Z3x0fWf2sVPkRp0duO/scbseZFONZq2v2QJrd7gJBo9gV3
         XzTg0wOUSx1bWKgBDdJuw86NvO/klc5psd51DzWZzIGAKny/XnoIxJPai2cUa/8plB3W
         jpdtvOz06uWAfUzIkde2eql4ERH3w8hkipNfCHXQXixto4MipbILr2zrdjRTqZ94UB4b
         ploYmfeWd3+qRQNGbVo2BBcBf6T90Cu346ZI6aubj0XbA7dzCP9rh+ihCvrW2Mq4FSGe
         Vj2g==
X-Forwarded-Encrypted: i=1; AKwUvBzMSspV08IZ43McwquXXuKX0RcSmKFi/7vSHaQBJK1dsh6syzPdP2ann9ufc+Le4oxLvbhGK458EbCILT6TxdwqVQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kPe5lLKKkveN88SH5zCK4G6RUJWheVHRO+TW21EiwkCWJEIshO
	IARdIeDZ0xExuLwGChf04mtjkUMUv9XhVyjRctzWgO6BA4K9YonArrnSwSbBGm4+
X-Gm-Gg: AYBFou2WZRPHv1V7+Y6zyN1nX7NAJ4SJ1g4DE+eBF6ltDBeUNUK65vTxMrIXLRy0DB0
	vhUay6knJJ4v0E1vHyoBUHMLFqODN2OTTKyNLp5pHUQE3vaPCe3AnSSzZtvmzA1xFXPMuaeKpGz
	C9pRcZpAS9qSM00J8fSyYqswX6b8Pm3cLZflTAj69bBI6tCvxQA6pDdLkuv7O45sS96ELwrqZGU
	i7UhxxK7OiOPbRaeLf9RQJvlH/eLV7tZAcVuBz/XTW84InKvUV4BCZmTH0yuJTVuQvhHEpJpn5d
	fosn5OYzvj1iZIUwPRPNUzqx4g41xxmjlQECKiPDGReHFLdnAhjjeLG/uNvr/KyUSxUa81J8OvJ
	5ayB1xhpjW5oumDLWWNHpypkrhAtjTb3tn9E8bqT6fWWDJTth3xAbxSw7qMsnTb3mPz9ZODhpc9
	X5nXGpbnMYFLSpIWEiREZYd0/A9gbInMx1761hof5KsvECbYTNAJvXY2v1FPphzJI7Ru8gMQYKe
	38mI/xNF1HtEsjaw1poKG7KdQ==
X-Received: by 2002:a05:6102:5126:b0:785:5a17:739b with SMTP id ada2fe7eead31-78a4a4944femr12023524137.0.1788853768972;
        Tue, 08 Sep 2026 00:49:28 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b32678sm8245472137.10.2026.09.08.00.49.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:49:28 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-783fffcfb96so3302379137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 00:49:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByLFsaWGkIJsff8Pa6bn4OYxz54P8bJbG9P4smbO99g6ZG5Dr4CYf5BrNyYTNekzm5FMAKxhbedMWFb6Iq2C+1UAA==@vger.kernel.org
X-Received: by 2002:a05:6102:1481:b0:784:b9ec:9144 with SMTP id
 ada2fe7eead31-78a4a9c3a45mr12132706137.8.1788853767856; Tue, 08 Sep 2026
 00:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
 <b516bf77-fb15-41f2-80ac-b80c621fedd1@mailbox.org> <CAMuHMdWb2Qk=heWhwFh4TsEggHOmzTd4Lj-vG6kXjRVMDDUG2A@mail.gmail.com>
 <43eccc85-fca3-4c69-9114-b45ab5e1b487@mailbox.org>
In-Reply-To: <43eccc85-fca3-4c69-9114-b45ab5e1b487@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 09:49:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWm1JzmXx1++dhvHbnBbVqQnVVAANfmH5Y24bhJU7pXQ@mail.gmail.com>
X-Gm-Features: AcwNN1V14nvpkxMTS1YJ9lEZFP5Wka8HrashHqoyW3yt83iI5VS79ckl8xfvtwY
Message-ID: <CAMuHMdVWm1JzmXx1++dhvHbnBbVqQnVVAANfmH5Y24bhJU7pXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 7 Sept 2026 at 18:37, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/7/26 9:53 AM, Geert Uytterhoeven wrote:
> > On Sat, 5 Sept 2026 at 23:57, Marek Vasut <marek.vasut@mailbox.org> wrote:
> >> On 9/4/26 1:15 PM, Geert Uytterhoeven wrote:
> >>>> +++ b/drivers/gpio/gpio-rcar.c
> >>>
> >>>> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
> >>>>
> >>>>    #define RCAR_MAX_GPIO_PER_BANK         32
> >>>>
> >>>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> >>>
> >>> IMO passing a pointer to offs complicates the code.  Perhaps pass offs
> >>> by value, and return the adjusted offset or a negative error code?
> >>
> >> I want to avoid that, since if I only return error value, I can then do
> >> simple:
> >>
> >> ret = gpio_rcar_remap_offset(...);
> >> if (ret)
> >>     return ret;
> >>
> >> in gpio_rcar_read() and gpio_rcar_write(), which are the only two call
> >> sites of this function.
> >
> > gpio_rcar_read() and gpio_rcar_write() do not return error codes.
> > I was thinking of
> >
> >      offs = gpio_rcar_remap_offset(p, offs);
> >      if (offs < 0)
> >              return 0;
> >
> > which is almost the same, but avoids passing offs by address.
>
> Is there any benefit to it, compared to keeping the value and return
> code separate ?

Naive me (I am not a compiler writer) thinks the compiler may have a
harder time to optimize the code when addresses are involved.

> >>>> +{
> >>>> +       /* R-Car Gen4 and older do not need any offset remap. */
> >>>> +       if (!p->info.has_layout_gen5)
> >>>> +               return 0;
> >>>> +
> >>>> +       /*
> >>>> +        * R-Car Gen5 register layout is slightly different and the offsets
> >>>> +        * that have to be added to or subtracted from each register offset
> >>>> +        * can be divided into five groups, listed below.
> >>>> +        */
> >>>> +       switch (*offs) {
> >>>> +       case IOINTSEL...OUTDT:
> >>>> +               return 0;
> >>>> +       case INDT:
> >>>> +               *offs += 0x10;
> >>>> +               return 0;
> >>>> +       case INTDT...EDGLEVEL:
> >>>> +               fallthrough;
> >>>> +       case BOTHEDGE:
> >>>> +               *offs += 0x70;
> >>>> +               return 0;
> >>>> +       case OUTDTSEL:
> >>>> +               *offs -= 0x34;
> >>>> +               return 0;
> >>>> +       case INEN:
> >>>> +               *offs -= 0x38;
> >>>> +               return 0;
> >>>> +       default:
> >>>> +               /*
> >>>> +                * This here must never be reached, if this is reached, that
> >>>> +                * means there is a catastrophic failure in the driver. Skip
> >>>> +                * any IO read/write to prevent further damage.
> >>>> +                */
> >>>> +               WARN_ON(1);
> >>>
> >>> A build-time failure would be better.  I tried BUILD_BUG() instead,
> >>> but unfortunately gcc is not smart enough to notice this case is
> >>> never reached.  __always_inline doesn't seem to help either.
> >> I had one more idea -- how about we convert the driver to mmio regmap,
> >> use opaque register numbers throughout the driver to identify registers
> >> to the regmap (maybe not a great idea), and then implement .read/.write
> >> callbacks in the regmap_config which instead of doing plain
> >> readl()/writel() for register IO would instead do this remapping ?
> >> Regmap could validate that the opaque register numbers are only the
> >> expected register numbers and reject all the others. Maybe the opaque
> >> register numbers could instead of Gen4 register offsets. What do you think ?
> >
> > That's similar (but more complex?) than the array look-up
> > in drivers/tty/serial/sh-sci.c I pointed to before.
> > drivers/i2c/busses/i2c-riic.c uses the same method.
>
> Those do not use regmap (drivers/base/regmap/), do they ?

No they don't.

> > I.e. just convert the existing register defines into an enum, and use
> > that to index a table with the family-specific offsets?
>
> Are we back to the table look up discussion instead of remap function ?

Yes, I think that's the simplest and best-performing solution: one
extra table look-up (array indexing) in gpio_rcar_{read,write}(),
compared to an extra function call to gpio_rcar_remap_offset().

As a bonus, storing -1 for a non-existing register in the look-up table
would let us get rid of the four existing .has_<reg> booleans, e.g.

   -        if (p->info.has_both_edge_trigger)
   +        if (p->info.regs[BOTHEDGE] >= 0)
                    gpio_rcar_modify_bit(p, BOTHEDGE, hwirq, both);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
