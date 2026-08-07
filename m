Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EBF3DD85F
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Aug 2026 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786095904; cv=none; b=Vw7XZ0oYiVAF6asLsHOA3Q35AepTOn3vnZTE5tF/dqJT1nit/XfDG9HfKFq5r3yvf2QI43V5Uc0clBWn7pKTWjwisyijbbZaeJaP1wVLI6XaZvD7ZHtqKpKbL1i7/NIMY+rtbo3E01KriI8AS6SbjckiuDxDjEDv2Slw+NGpbsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786095904; c=relaxed/simple;
	bh=/y0CGy24AiO46TgwxkbP1tFuV0C+/wk51xS5fSunajM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YM0j8SL4slUZMBAvyWdUvij29y+Oh5HoklS2AldGPta+vW+EyV85pxE1GkQcI1cWFmK+qC7Pkz5E0+uwA3oB5B+HrHzkeSuXk1TflLVkE1bRLqIm23MmvO44d7ehlaiAAT4BntPMY6QOjLt7DVipTXfCKcSQslu7/iBQ/yh5ms4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so1323847e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 02:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786095901; x=1786700701;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UAxJcsTBx78VxwObBjDafBX3xIovoIX98Z3YZn8IFUo=;
        b=dqmZrgzAU00lXLqGfOFwG8WSKENlSo11ileOFShjrUWrq/p0tiy+XQMRGRHq8kUEKy
         WBrcgZTlo+pt7MEZZD8DuY15xVH6TAANY2pIduam86Q4N/Ti/KHl4JIEYhe5Uy+lYF8N
         0dFWR9mNbz1IoQt67xsdvytvh0i5/P4dfMFlONzKf6DcyCNLKgzIsGHjSvHKECPqojla
         AuvgUGOgqN8rcBj9Jjqh8dYH8TrCrsNu0eNIqP3k+XN5N/X0jxbIjyBMf4n54RJd/Uoh
         G18ZKWqjTEtDmeMtUqFtbImy5POMyG+3ma/Xtm4AXZxH46ou8RDOhaNQKi6ZTSOHSNxy
         jpGw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1khVpF3QIFKqvrGr5knALf+ucWGJHRDm52lz/3qJXQupPBGOG0xOcX4s1xxFW7L1pHndUWJDsTDNCkBa0fdRDUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNVD13c4V/5zcf5tJI94hcQyt1eioVuySJLmrvljCKEDkrUH+l
	CHBSUZix0799QfPpkdzoRu//wSSD0xh7IoF2EZoU8RJR+EKOQu1SNfSTZaIWxrxA
X-Gm-Gg: AR+sD11qMvCxNXBbAOuYyi1hqqN87eYGLp41NlXE3E/UplIkVUmHLSh1NXOr1eaFuZ8
	rQdCkCnIuWdoGQlnaXNF78I6XvCIqYlxxaLHWqB4KwJ52+5YVXNrb9p3dWC09492nInNgb60BR/
	5Cpz7dKJGFkJURdj3NrZD1w1sOHYopgPugXfg+NMimaIAVNZyeoCugdDDP3xdGLdMpLUUhpNDQE
	3vurntyb92vc5CfBUnNXjJgCOaC/lBfJwtY5BEtiTg8E6tj8KQbBPh+LXhlMBn2BJBy1fwBqRzS
	Rr53OwXEDK6x8XURAe+/CwsSj+xy6MAo/U4uu22xPRkDHWDPbgTEMACu3drV3Jse9WDmo0TJFbI
	TzoH6wNd02gv4eLBCh0fAPA9KFvqJiWtntuuKZoAhiEVfabb2bG8jDWdUrpnR4cY2Sv4qYqO0c/
	OpyYtuUyA2F8snngpkVEwSnTtihrV2klirjoAVZqmdVtJSkGzxTMKK8Xv+ls+6/NwDmoHztrVk1
	sgEjQz7gDaqYiyn5nXO3Y4uFQ==
X-Received: by 2002:a05:6122:459f:b0:5bb:fa79:56dd with SMTP id 71dfb90a1353d-5c3f36f1e03mr1578635e0c.7.1786095901220;
        Fri, 07 Aug 2026 02:45:01 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b1a8f75sm264432e0c.10.2026.08.07.02.45.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 02:45:00 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9674d727c0aso1336915241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 02:45:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RovlDj9I5CxRmdhQMzBo1QhcdCmZPtekdTAw9WDVykopB8hLZrc/AOcXI7M3LRNQMEaaSRaYk02LzT9/I6YSHJ/Yg==@vger.kernel.org
X-Received: by 2002:a05:6102:568b:b0:634:2450:7998 with SMTP id
 ada2fe7eead31-762aea86b92mr1369250137.4.1786095899940; Fri, 07 Aug 2026
 02:44:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807093058.42840-1-phucduc.bui@gmail.com>
In-Reply-To: <20260807093058.42840-1-phucduc.bui@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Aug 2026 11:44:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJ3W2JKmxaKaa-A-Zk633cf4UwbESi+F1_h4tX1AhRng@mail.gmail.com>
X-Gm-Features: AUfX_mxQEzl3jQmvMQf06PTnHIHBcMyX38xj7RfXUAwYPkdJFJKwvIXHn2A4lc8
Message-ID: <CAMuHMdWJ3W2JKmxaKaa-A-Zk633cf4UwbESi+F1_h4tX1AhRng@mail.gmail.com>
Subject: Re: [PATCH 1/2] thermal/drivers/rcar_gen3: Handle -ENXIO from
 optional IRQ lookup
To: phucduc.bui@gmail.com
Cc: Markus Mayer <mmayer@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, rafael@kernel.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	niklas.soderlund@ragnatech.se, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Phuc,

On Fri, 7 Aug 2026 at 11:31, <phucduc.bui@gmail.com> wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> platform_get_irq_optional() returns -ENXIO when the optional IRQ is not
> specified. Treat -ENXIO as a valid absence of an optional IRQ, while
> propagating other errors.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Thanks for your patch!

> --- a/drivers/thermal/renesas/rcar_gen3_thermal.c
> +++ b/drivers/thermal/renesas/rcar_gen3_thermal.c
> @@ -491,7 +491,7 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
>
>         for (i = 0; i < 2; i++) {
>                 irq = platform_get_irq_optional(pdev, i);
> -               if (irq < 0)
> +               if (irq < 0 && irq != -ENXIO)
>                         return irq;
>

So the code may continue using -ENXIO as an interrupt number (and fail)?

Why is this change needed at all?
The caller of rcar_gen3_thermal_request_irqs() knows how to handle
failures, as IRQs are optional.

>                 irqname = devm_kasprintf(dev, GFP_KERNEL, "%s:ch%d",

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
