Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D61421A07
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Sep 2026 07:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767597; cv=none; b=RHHbk8Eq3tvVbCVMazNtdEiBGhPgbq1tkiq9wgp05ootbPP5VP3S9n/3kFODpan+D8KH5lZ9RGNHLQzi9Mu9hh379DcHeLK4RZ0UZjwgwaGmeTKHxF9xyp/FZxCQbPb088mXOrvazCKlb487rJq9lsglNV+OzM60m3YQ0XOkkfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767597; c=relaxed/simple;
	bh=smhBSOCgTJhbT/0tl4vdE8GcuFKDdQa/HesmddcZaEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJBSiYmXgAvTDsG6pjy2GUuUrMH4NINiV/yi1JBxoz3MTelj7+FVjVFvQSx6dlaC/NtwgZjvfG7k1NLDe4RlLh/XoVsnl9D2q4WJ5I/EhztWHj2X3ZWItjPUsTxb/5AKEAUmKmu00kHm1i/Qo1ORKSLZGNrIzRuM8bgVSpVWNxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-785d603efdeso1049231137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Sep 2026 00:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767594; x=1789372394;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xuQ9W/PlY4yeKBUrhKIeC1+yJYAlbcdcEFZm5XOVUho=;
        b=jBONW8nUzMN9HJakhn8GDF/DDIDA0TqTNxY5XDQyn5kDrT8NwnXceI9KR7vHv6s3DT
         mD/AgHw2bh6bFu1O77BqFnKbtMmWuXeEsbAhQ2s4gLZhKzAk+eGL7arnIkVHeL0rLgKC
         vZofWAJqcUwRloP1D0ulXOI+3Lhl4gnivt5Q4Mv14YxZFlG52PNq/mCgFIXDT41JYxPU
         MUjFrY+KQwHJ/vAVeOAL+xRecSN9wsCxDJG9JTp2liaPEb/9cJ8dfpCYdK0fF+pfA2dA
         yTVrSNaRWPmZuHWy3iNi86sJ1uty7gB6S1J0VV0PrWp+9Cg6k1S73L4LC/RWagWDSQXt
         6/Fw==
X-Forwarded-Encrypted: i=1; AKwUvBwL6JI0G32DP9RABX905HaBBmvyEtmdymyW/fbQD9NkLUGgqEint3jd575IayI2vzrZh3HQUaxlxVW2nN84FNSnvQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l76w2jlqC68WXY3t12TwJe+tAycO8i/QgdZ6lcjIp+2WhZIzDt
	65RPfJueP31KFY9ZhNQjHaErsSxf4ECqto3tkiMv72GI3Bskw1MqGNEAjboYO1kr
X-Gm-Gg: AYBFou1OyA9wmB/vfxitjEFdvdzkG10QiK6SeJb3ju+RKnxuWy/HPr0UjICYNIyGemG
	mWyPSeyWZTR3OH1P/SnMPD4OnZZNfdkx9Td/TrrWMxxB160z1WNvLwzU4LAsJuFG7eBObTZyoZb
	FY4n/ZvxC5RYQsU3NMQAa9WtXQ+1ZVjtLl2gQTRTh2oGxa0lLFwHhm3dRNLxaWAS1IvXCZauPo/
	yuUEqPyFt9EqMyuXAUWZ1NMawvC5suxZOO2CxtnRTu1OuXciUA7Ujvi4arMOOmbNoZ5WlO04pR/
	QidY4qAMFYorOAChLnjw1QbTFRaAB8es+ZL4meTJlnMZpGvZHzBqkBixUESY1k9aFMTXIBWz+Ik
	WqhSrjJOdrM8rl73UihjedcZYMw+ctlDzXwDaw4VqIj15bRE/3Wo3bSb4MTihuXErZJRQTJYFYu
	vCllq1p5F9ZDvGKZUuIiR8BCGgWTiMojtcqubaSPP/t6N776yn72WarbmDXnEu5yN1JLRphWmhW
	p5Nil2sReuLPz77u0p3sIuqzA==
X-Received: by 2002:a05:6102:441b:b0:784:d83f:2a59 with SMTP id ada2fe7eead31-78a4aa99295mr6399267137.9.1788767594250;
        Mon, 07 Sep 2026 00:53:14 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808eeb22e5sm6883161241.12.2026.09.07.00.53.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:53:14 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-785d603efdeso1049229137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Sep 2026 00:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByLLz6sVHnNbmiQRsjXZCoRYueMxvVh+rPD/F/hDt//6h0lauiSQiqlUDDb4GfMUL5AiQDlNV+lOPeUmWxgNDxifw==@vger.kernel.org
X-Received: by 2002:a05:6102:160f:b0:781:210d:28aa with SMTP id
 ada2fe7eead31-78a4a8be7c5mr7302331137.2.1788767593777; Mon, 07 Sep 2026
 00:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
 <b516bf77-fb15-41f2-80ac-b80c621fedd1@mailbox.org>
In-Reply-To: <b516bf77-fb15-41f2-80ac-b80c621fedd1@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 09:53:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWb2Qk=heWhwFh4TsEggHOmzTd4Lj-vG6kXjRVMDDUG2A@mail.gmail.com>
X-Gm-Features: AcwNN1WhmE54lrhOaJPOpMY7QFz8OZQIiZjO28-2Vei5FzrroiSGFpU4hWAgaFM
Message-ID: <CAMuHMdWb2Qk=heWhwFh4TsEggHOmzTd4Lj-vG6kXjRVMDDUG2A@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 5 Sept 2026 at 23:57, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/4/26 1:15 PM, Geert Uytterhoeven wrote:
> >> +++ b/drivers/gpio/gpio-rcar.c
> >
> >> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
> >>
> >>   #define RCAR_MAX_GPIO_PER_BANK         32
> >>
> >> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> >
> > IMO passing a pointer to offs complicates the code.  Perhaps pass offs
> > by value, and return the adjusted offset or a negative error code?
>
> I want to avoid that, since if I only return error value, I can then do
> simple:
>
> ret = gpio_rcar_remap_offset(...);
> if (ret)
>    return ret;
>
> in gpio_rcar_read() and gpio_rcar_write(), which are the only two call
> sites of this function.

gpio_rcar_read() and gpio_rcar_write() do not return error codes.
I was thinking of

    offs = gpio_rcar_remap_offset(p, offs);
    if (offs < 0)
            return 0;

which is almost the same, but avoids passing offs by address.

> >> +{
> >> +       /* R-Car Gen4 and older do not need any offset remap. */
> >> +       if (!p->info.has_layout_gen5)
> >> +               return 0;
> >> +
> >> +       /*
> >> +        * R-Car Gen5 register layout is slightly different and the offsets
> >> +        * that have to be added to or subtracted from each register offset
> >> +        * can be divided into five groups, listed below.
> >> +        */
> >> +       switch (*offs) {
> >> +       case IOINTSEL...OUTDT:
> >> +               return 0;
> >> +       case INDT:
> >> +               *offs += 0x10;
> >> +               return 0;
> >> +       case INTDT...EDGLEVEL:
> >> +               fallthrough;
> >> +       case BOTHEDGE:
> >> +               *offs += 0x70;
> >> +               return 0;
> >> +       case OUTDTSEL:
> >> +               *offs -= 0x34;
> >> +               return 0;
> >> +       case INEN:
> >> +               *offs -= 0x38;
> >> +               return 0;
> >> +       default:
> >> +               /*
> >> +                * This here must never be reached, if this is reached, that
> >> +                * means there is a catastrophic failure in the driver. Skip
> >> +                * any IO read/write to prevent further damage.
> >> +                */
> >> +               WARN_ON(1);
> >
> > A build-time failure would be better.  I tried BUILD_BUG() instead,
> > but unfortunately gcc is not smart enough to notice this case is
> > never reached.  __always_inline doesn't seem to help either.
> I had one more idea -- how about we convert the driver to mmio regmap,
> use opaque register numbers throughout the driver to identify registers
> to the regmap (maybe not a great idea), and then implement .read/.write
> callbacks in the regmap_config which instead of doing plain
> readl()/writel() for register IO would instead do this remapping ?
> Regmap could validate that the opaque register numbers are only the
> expected register numbers and reject all the others. Maybe the opaque
> register numbers could instead of Gen4 register offsets. What do you think ?

That's similar (but more complex?) than the array look-up
in drivers/tty/serial/sh-sci.c I pointed to before.
drivers/i2c/busses/i2c-riic.c uses the same method.

I.e. just convert the existing register defines into an enum, and use
that to index a table with the family-specific offsets?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
