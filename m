Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D233399360
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 07:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433318; cv=none; b=c6avwL4/Ic9B1JA2dL91p7Goc9BYiGL/pj/1MF/DAAQoyCsadabyJjUIY69SHvD3o+yZt7PsTEaMNd0ErkHHwq0qG7DhO/FFCrgbzVPjB/C8Wg3zkJ5/ZfRDw2Ln0slZ2TkItuJkrjVwt1Ifx4rARGMpJyvd2H65752XCzbPm3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433318; c=relaxed/simple;
	bh=v2/j0Oj6p53ESVa3PLPBywwI9wRtN5XU+zJPWA/4EVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/c8QVAjeXbWB2uJ1scxfN6L9CNfLc5TvzNziT9nLvZrn0uNc6JgFGACGR0IYZHRexkZpWHicB0LewcWQCW7/IxnIM0dGkShW2rFRf3bYnM2OMsMxCegJG8BNH35En7uiZmQUVZM9Py5g0N41HDJb2NE7NUMPjLz+qTr72jKtqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bfa4c51c2aso784388e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 00:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786433315; x=1787038115;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bbDA2HJhRK7uccW2i/9tvYlKy7xqWbKNdvfK5Qlf1as=;
        b=n4oIBluBNC2wNVb0v9aIlfe4B37NbWuCerQFBZxjhFD0IUWwnJnwpGMh0YDk7NRu7V
         TkQUJ4sS5yaT8WWBeYWMKqeIYoJpwOCqHkHERMDmjvJKICrnjADHjxFlAiayCTH4Iiuy
         9pGtRbVi+RwAcwE2nGyv28Dd3mZg8Li7EYx6PsFo7wOewvUsK+cK1zYfEfB4TDJI+BLB
         j0vbXfvHLMSH90GO6ge2Gi6n9IQIGXG6aOAdWz8LR27yOmk08jJ06gjD2mkI2Ejs0KRt
         GnQ2W/iudj79AgY1dcnRqx7H7uoSZKGOYzEMkleHjBqRTvKLzBrdik1+qOTF7r9aBv/9
         HSPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIioCKvgbGXvpmst+k7OxJ9ufIF5A6vTHhFlxtuT1bqCzWAqqyrwM2jnfh3LvBw/8lNFQ+GensuyViRwCZdDGfVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV/z2UHtpdBH2CjvWV8TKjc00Y5ZZJscBk2uZwFjHrCoEaqPAi
	x7hgHP8rkKXiMI0fd/QsXJSZt3FQUjjpvAtiOEDy0LV6/9SyAZSVidYFriAkr3vn
X-Gm-Gg: AR+sD11H6T/9/idcJ3ljVwpFauDC876BMHKmybI5xIw3f1TayKQpUF1kc4Mdq/LSbQd
	Fdk5es6KpFPMBakJBh3ioHinhMqdZGj5SJ+P2YStt2DiGED71mX55Q0pQn8hdLYsolCap/BHw9a
	Xyl6gwgdVoHxR40lnKDIBdzGu2FgsuiSGB/eLzgeKm5JO8JUDpOnVXBSQV9K06P3nStHVyUXosE
	57HhcvduFG7CbBXH8jVhLumL0cIH8AIaS0waELUg8SwfDciOtmm20vbEsRNJ4gS6KIyXuCXbhb3
	J0AgKWT5VRMChiA1yZxc+jBZN9NWQ0Apqf4kDjxiTE3WRfE3VQmPsle55EYn5/L1VLtd6/Qnkyu
	wB9cED5dimCoXZVXj3m01UOyMPSNz83WZvPuG9n0Z94oO6SrtDhxcWr/+PQAJFRUl0XKXBoEGmO
	pf6MI+9Vdgt7kgnXmhcTQiFYVMqA1J7LkkH2ETMpQXldvR/LzA8bvnqtOFQSI19pwGI8LYEEaEt
	LRKBuEWVYs+WmMuqNfMXhe7Sg==
X-Received: by 2002:a05:6102:8008:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-76b55980f77mr309991137.5.1786433315298;
        Tue, 11 Aug 2026 00:28:35 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76b655b8285sm212707137.9.2026.08.11.00.28.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 00:28:34 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-977cf5cae50so482885241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 00:28:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpqy2WKFYpyPZ9tGwwJJswuszvZU5zZCTjUEkBeFG2vPL6Uwrq4mQH9SYpGiI2ERd0noIp4FIaM6HGwE8LxR+MKpQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4187:b0:75f:e517:ec96 with SMTP id
 ada2fe7eead31-76b51b25220mr340921137.0.1786433314033; Tue, 11 Aug 2026
 00:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810111841.77898-1-phucduc.bui@gmail.com> <20260810121914.GA2757863@ragnatech.se>
 <CAABR9nFkFyhzQO7UGsaiSDcZ8km9=nv-2+4xWo40EG6c555Lbg@mail.gmail.com>
In-Reply-To: <CAABR9nFkFyhzQO7UGsaiSDcZ8km9=nv-2+4xWo40EG6c555Lbg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 09:28:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXXR1GH7-nPmYv5i7ooB3kpqjOvY3A3vR36vYLVnv99Og@mail.gmail.com>
X-Gm-Features: AUfX_myuDTBVQLkzG41xoEKKZVf2OG_s5XczCeosvzRfItD6qUWkIcj6z1Z8K0g
Message-ID: <CAMuHMdXXR1GH7-nPmYv5i7ooB3kpqjOvY3A3vR36vYLVnv99Og@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] thermal/drivers/rcar_gen3: Handle -ENXIO from
 optional IRQ lookup
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Markus Mayer <mmayer@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, rafael@kernel.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Phuc,

On Tue, 11 Aug 2026 at 04:02, Bui Duc Phuc <phucduc.bui@gmail.com> wrote:
> > > -     if (rcar_gen3_thermal_request_irqs(priv, pdev))
> > > +     ret = rcar_gen3_thermal_request_irqs(priv, pdev);
> > > +     if (ret == -ENXIO)
> > >               priv->ops.set_trips = NULL;
> > > +     else if (ret)
> > > +             return ret;
> >
> > I'm not sure I like this.
> >
> > The old behavior is that for any reason we can't get the optional IRQ
> > the driver still works, but without hardware trip points.
>
> Regarding the old behavior, it was handled like this:
> ------------------------------
> irq = platform_get_irq_optional(pdev, i);
>         if (irq < 0)
>                 return irq;
> ------------------------------
> As I understand it, this is essentially the behavior of
> platform_get_irq() itself:
>
> https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/base/platform.c#L301

Except that platform_get_irq() prints an error message, too, which
we want to suppress.

> This could be understood as rcar-gen3 not actually supporting an optional IRQ.
> If you still want to keep the old behavior, then I think we should switch to
> platform_get_irq() instead of platform_get_irq_optional(), since using
> the latter
> could give a misleading impression that rcar-gen3 supports an optional IRQ.
>
> Incidentally, I also don't quite understand why rcar-gen2 supports an
> optional IRQ
> while rcar-gen3 does not. Is there a hardware limitation on rcar-gen3
> that requires
> the IRQ to be present, or is this just a difference in the driver
> implementation?

On R-Car Gen3, thermal has an interrupt.
On R-Car Gen4, thermal does not have an interrupt, but routes this
signal to the ECM.

> Regarding the benefit of the new behavior:
>
> If rcar-gen3 actually supports an optional IRQ, I think the benefit is
> that it reflects
> the actual state of the system. It allows the developer to know that
> something went
> wrong and investigate or fix the underlying issue. In the case of
> `-EPROBE_DEFER`,
> the benefit is even clearer, as it allows the kernel to defer the
> probe and retry it later
> when the dependency becomes available.
>
> If we silently ignore the error as we do currently, the driver may
> still be able to provide
> thermal information as you mentioned. However, can we still guarantee
> the correctness
> and safety of the system?

-EPROBE_DEFER should indeed be handled correctly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
