Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5309B41D226
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576047; cv=none; b=QBlFh6rLW0V2m4Y+FGnRIU8A6zr7+U+X8jqOFk8+iI2/DHu66AqljTop1inbNbPUEvrtdUXC99rc3AjTvAuIQ0i+tHpu+FR97UXj8/fprKt8IluTyg6/QmYuz1vLOAEgsp2x7ryFtgll8Wd92vKyOuYCr/GKQW4eonKB+AQXHYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576047; c=relaxed/simple;
	bh=22qCBYveRKFJxcMmmUW+ua4eXWAmfuygrtGmmXgJgbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VpKzEIhPJu/W0sSfLZTUR4WY/79tSMDEVn1XBekYeYXWoWW/DfKNaOsNemj0lpocsJwOOdozPewH9AM2XrWMvsn3hn3N4OO7tltLuyYdg5bYW6wxBebBdl4CiIu80PiPKR7hDPpyMQNRUltrI38UmJzN1cZuNGAAcwSB8+RjhGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7542a2ee156so1868376137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 05:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576045; x=1788180845;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Eom/X8opTXnjGOdU2jJfg3a1DGcqhjQm02nKfziCp2M=;
        b=dHpCYb/XxhAeTvasIA7wgGZ3AfRRQvoFCqGhZeA3rS6ihxR3z+M9bB18MT/l4/MX8h
         MJF+9oHnhsKlBytE/WUmaizUJXaW4LsFcK6l6IkDu080//X/aio+JFTO8O12qMqZeWYf
         4MpDd5QvaJCcsMwr48KnZ3PFQ2wXhkYhOMeCSq5a+vuUw8xsgIxjmBIqvEnz1BmehTjQ
         MK7iFwGDP/IqMKxQNU9CZCcUQuKUs8Dln1l1KwgrWV4m2Vd9oUxJeCUzy31AP2uvMsD1
         pPtqgpqS1fZ8hfwev3P6rcOD9WMm6ASmNPv1xTmKlLGw90f2FsAChx0brMd1ATUQNMwK
         9+xA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2zjUYyVgoMXoZ9Vy4HQgjNwasFvih8xBlDr0giHV1U0ARsg8KylpcO9g21BFH4A4aLqEjnqoUPX9MlunqJz4YBw==@vger.kernel.org
X-Gm-Message-State: AFuF++nroUdYr1Xn26TCvR3huHnbKLdAHvh7YLt+HhBw6eQPR+AXhITc
	laZeqrJ+ayOM1rAg8sPefT7dOoftyDQnmYklBA9aPVTGVAiemy5qqwPgRRyQGO2G
X-Gm-Gg: AR+sD10tXMMPNbDYbMtngu8S6XYLJBU6ZxAB7JW3mpLxhD28eaKj+GSzHMOAmhZ6q07
	ccdnE4QjSGUZBv2HUTIVWe5cQ++dkNUyZkS5QWtSDPP6EUcCA8asvc5U6gbgEGPkDjUGTKm/Kwx
	yNoUCqjpEeF73yFvTo5jPfLUvbej8r5aivUg6RClr9d0Ke8RmrAwXwF7OEBeQYQUK8Pf0baiamv
	ENKBo3owatiAtJDH/y284sqfbS1aEGUKUrJl7zRwk8XvOwGFfhXbGq8EiTsxC6wiDCEluQ/slIV
	JyJAC8N/FeX/zNDc44BEDuPTXCH9zZE/KeqMrFPUsLMjCeMf/jQbpWV3AfZcGvD/wpfGsS18MTA
	3EPVW5BRq626FFjAWkEyfjrUAz/4vELg9thxyKEV2RaieAGZQezxs5nIWTr7OUUHx/eyeCOR2kH
	w2pQmh24W243l5VXCjiWgpa28UiAVeFIyR7YyHq63Mkq7CaekxFLW3BJtF1vznQEVHsnVFUoq3h
	x16JFo044EwXkbaQpiIefxPrz6M7vqW+dyG
X-Received: by 2002:a05:6102:3c9d:b0:77b:b14e:b6c5 with SMTP id ada2fe7eead31-77bb14ec487mr6712731137.9.1787576045100;
        Mon, 24 Aug 2026 05:54:05 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c834c0accsm7408864241.5.2026.08.24.05.54.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:54:04 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7542a2ee156so1868366137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 05:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpwL7SwVL2ggX5+ze2IjyNylhC2IZeyK2sYoXl/7Zn2car0+zggDu/WnHYnCeum0vb9xuySTzGssvg3BNekiEBzrA==@vger.kernel.org
X-Received: by 2002:a05:6102:3c9d:b0:77b:b14e:b6c5 with SMTP id
 ada2fe7eead31-77bb14ec487mr6712686137.9.1787576044162; Mon, 24 Aug 2026
 05:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150940.75282-1-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150940.75282-1-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 14:53:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUAWhwybqECDZWyMXNR8cv4GXvFe4BQV-m-Wax+j6U5hw@mail.gmail.com>
X-Gm-Features: AcwNN1VBZ53Z8AyT5wwWA02V_hOL4uH3XypVon522o3KZn9AAHsHiFE4wR9dg0U
Message-ID: <CAMuHMdUAWhwybqECDZWyMXNR8cv4GXvFe4BQV-m-Wax+j6U5hw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: renesas: rcar-sysc: Update description of chan_offs
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Fri, 21 Aug 2026 at 17:09, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> The description of `rcar_sysc_area.chan_offs` does not clearly document
> how the field is used.
>
> When `rcar_sysc_area.flags` is set to `PD_ALWAYS_ON`,
> `rcar_sysc_area.chan_offs` gets ignored, therefore improve the
> description of `rcar_sysc_area.chan_offs` to make it clear that the
> field is set to 0 if power is always on.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- a/drivers/pmdomain/renesas/rcar-sysc.h
> +++ b/drivers/pmdomain/renesas/rcar-sysc.h
> @@ -29,7 +29,7 @@
>
>  struct rcar_sysc_area {
>         const char *name;
> -       u16 chan_offs;          /* Offset of PWRSR register for this area */
> +       u16 chan_offs;          /* PWRSR register offset; or 0 if area is always on */
>         u8 chan_bit;            /* Bit in PWR* (except for PWRUP in PWRSR) */
>         u8 isr_bit;             /* Bit in SYSCI*R */

The same is true for chan_bit, and almost true for irs_bit, too.
So I'd rather correct all three comments at once.

>         s8 parent;              /* -1 if none */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
