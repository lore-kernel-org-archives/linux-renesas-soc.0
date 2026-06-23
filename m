Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4043638AC9A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 17:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782235617; cv=none; b=RXL07HHHLxGz38C9OPS9t8g5OQaElqZM0VKoxhJM3Fj0PX9Ljv5cYwQXFf7QYsU3W4bwA4AT9cAdjglV06x49c40Vm6BCunere1RurZta6/d4Qxhnn0fSXKyXLNoIJ9HXrM+0HEiis9BVDm4QNZFpO2Kp19Wa4XVj61pq0md8DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782235617; c=relaxed/simple;
	bh=GifLv6VbkW0uOM9UEPBjoIdkV5T8mnTOhKeo+Xt8w6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IgVAqlxx/G+MM818+eQ43ovJAQ45yTzccpp7wMNlr35lSWT6+8D9D/hKJ75gCWa7vQNQAoz06Rf0vIaSEzjJwKK4piYmmQbIZrTtbWQJrGtXhQSNMyOnzosdfa9z69vW9ZvV9xxmdx9ZX9O0gVJwRh9Mnjl+pPfFMeyLbH7dR+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-730ac3bec38so51745137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 10:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782235614; x=1782840414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RzdKjSYta5tjcNjr9/Abor343Aou4yrGvt6wBxNMIg=;
        b=TvDQh0Oj16vlbakE0hzUxk3TgPsHCxWlWd+/oLnUmR2OKANU4zLZr0+eV2BX528Hid
         1MB6Sai/UWsq1njmvw79uvDvW6tdZw77UF3DoH2NEQ3cd3jopkZXbCTKYHo1d09HDCrd
         neo/V7Qf0WD8PN35bi+yvxOzFmFOeSnEAQ7hP+QSwhiewYQBSqg7c2fGErOYGIB4/jx6
         xq7EMKkhR8uihBxdxEhnxRlnxTp4sImVmr0/bGRJ5cRhqoMCsgJPmfVO6vcXSyU1COQ7
         vGxiU0ejg1javffzWxhfExonGO7ga5ii8UYkB7MmO5PPWwObmHG71FGGHJA7RDFlq9W1
         3yDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hyp20C1b6XLDOWKBfOk0RzSxOm9hA1ALOrDsc9Ao9LoG2uWcUlXAIyFwVcWH9fjeBH1kHx98aKePcNVbarQvKFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEEBYAik32g9jGfEiZhtBEgGgRYPOMWeai/nVw74HuviEKsrUl
	Tum6lqay4uknKb/nT/Xyupmsn5UjaUXZjCAXl54nbl1w6rCU26LMEcZaiQZadCPy
X-Gm-Gg: AfdE7ckYpEXzYu9omL2k7AYJuhTS7ca0j+yBdqeRWZGgAIJ+e+MglcJAy4zPJ5ADexX
	zbQKyvWE08UNpeeP3DsPqc6IqgzvL15Hy69nKXh7ZooEZ7PI/wcsaO3DpDp21uveQ+bSfCQldSs
	nsgYpFSLwqzMAw9hNh6ShJH/CfHJ7kHE5+kKBdHBfqLCjFzQjpNNW/lZVu4tPnfPmxJ7XEgRgaI
	yG8pdxYgjXbxh7jDQd4Pwy6yrnqk2vw3EmOYuDv+JPCfm6OCM7OasJxDgi89e24NcT0X248T1FM
	w5nkcBknw97xJbH+YbtCk2HdX9g1iJn9+AQhlcKNsUA2yQBVPIWa98IxjuRxoefEdAv4fCXALBZ
	/vC6lMi3zH2iqVUdK17vxPAx/yxVPMPGq/UBpsiB77DPKYPssh4oS+V9WUI3fRPH0LDdPGoQcCU
	5cvFK7QMHoHovd4c3U0ocquJ17irPAfeRcVsLMGeZmCPYfGSKTOQ==
X-Received: by 2002:a05:6102:3f45:b0:6d9:a0bb:9095 with SMTP id ada2fe7eead31-72ff618df16mr2239393137.13.1782235614114;
        Tue, 23 Jun 2026 10:26:54 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba2dbdc4esm8190551137.5.2026.06.23.10.26.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 10:26:53 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6efdb57d98fso43843137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 10:26:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9oscI8qe4HxOXXqFWaaExVnzH55/bozk0EEEvj1w2aPQyMiso88Y14kRnW4YY5CwFQ7rLoMpijVV0Cn7BI+GrAWQ==@vger.kernel.org
X-Received: by 2002:a05:6102:8028:b0:631:28c1:154c with SMTP id
 ada2fe7eead31-72ff4a61af0mr2203779137.9.1782235612910; Tue, 23 Jun 2026
 10:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905143441.7082-1-biju.das.jz@bp.renesas.com> <ajqWevofEJ3fv856@redhat.com>
In-Reply-To: <ajqWevofEJ3fv856@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Jun 2026 19:26:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW0-WsZuuc7PoVNC5DBUoY9dP+ULmGTQ76VWMO_SjpbuQ@mail.gmail.com>
X-Gm-Features: AVVi8CfV9oO-VEB9DNAF8jeSn4UaKILwicbcd5G6FUfO6MMF8a0RAeTv3FappaI
Message-ID: <CAMuHMdW0-WsZuuc7PoVNC5DBUoY9dP+ULmGTQ76VWMO_SjpbuQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add entries for Renesas Versaclock {3,7}
 clock drivers
To: Brian Masney <bmasney@redhat.com>
Cc: Biju <biju.das.au@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 23 Jun 2026 at 16:21, Brian Masney <bmasney@redhat.com> wrote:
> On Fri, Sep 05, 2025 at 03:34:38PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add entries for Renesas versaclock 3 clock driver. While at it
> > add myself as maintainer for versaclock 7 clock driver as Alex's
> > email address bounces.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -21704,10 +21704,12 @@ L:  linux-renesas-soc@vger.kernel.org
> >  S:   Maintained
> >  F:   drivers/phy/renesas/phy-rcar-gen3-usb*.c
> >
> > -RENESAS VERSACLOCK 7 CLOCK DRIVER
> > -M:   Alex Helms <alexander.helms.jy@renesas.com>
> > +RENESAS VERSACLOCK 3 and VERSACLOCK 7 CLOCK DRIVER
> > +M:   Biju Das <biju.das.jz@bp.renesas.com>
> >  S:   Maintained
> > +F:   Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> >  F:   Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
> > +F:   drivers/clk/clk-versaclock3.c
> >  F:   drivers/clk/clk-versaclock7.c
>
> It looks like this patch wasn't picked up last year. I got another
> bounce from Alex's email address.
>
> Geert: Can you pick up this patch?

Sure!
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
