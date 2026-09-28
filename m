Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com [74.125.226.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB69244692
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598683; cv=none; b=bGuUxqAPxhSXqxaybK1G1zKHYwPTGE+c04vrq21Zdd10y1hKXK5Rb9OJd+rfJJBskFqT4u0OmRDOYAaVdwBVPUuESjmShZzbSr9AbRmkctxGDzzCveGWpRsUZmrsYRUbg6YElqydMf+ubqmrJn4qaJBr9fqmpnLRNp55aIToQ4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598683; c=relaxed/simple;
	bh=dAzrEI9839gxqP34NL2S4L2PwWrSAB87LlgLNLgpMmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIYcM6yBJ9fHmCGAaU/b4LeIaWfbQT83E/B4ff8ja6uqEhOFmXV/1uC7XhYPzFuX8zUzTcbIl74TJ86kcu/M+JuNxBMcfrBQZEf4i84j+ISQAEud9NG+4Gsit5MihnIMFaYYkugCGSDq9WUa0r7khGRZHbuGRBx5QhHxlPaVVx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986dfb672d8so1320375241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 05:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598681; x=1791203481;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vX8fnci6iFn6CHmX7sG+fk0Twbr8n5Wsj89p/Y2EOqw=;
        b=grBh8sECoxw3sDjOMhoAs7WZd7WjH9lejXu9t8Z7SDfS0GYRwny8rSf9kKO9V0HFqS
         uVoamQWVSD6ve9c54wDZuoUxFGUSTepRUfRGwiDDoUW77rrd5uBm3Vk1Jaz1SrTQidDG
         OoLyG+OVvE6SdJu/sUeg8/rM8GsUOvoEvUbtvS2JAKoAb7Xl7toSMOAaeL2TxG9V51OU
         /wz53/ZpTtWZfHiJLkepSKD3g8awal5Nh37hOZ4gI6AV16ACeMWH3szyGrsKMYot6K78
         HI/00DTRsKwbsyV6upo2TWpI7/huOvAhV0gFlXKBUaQOYS2rP1YmA1iVsptuxtFxSV7/
         dcKA==
X-Forwarded-Encrypted: i=1; AKwUvByXER10oN27gkIvl+iBSuj3kudzlOh87YDcP68cAByhDd6gHP8jVzid4gl0xaEhOI8i5f+hhY9PbUZwKlV1ZTXVqg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJH4gLj8JNzhvxPimvEvVpzlYoOGHCILiP/9wBR3xhoFhTKKmzV
	Bb13LiNfhJgQVQN+lXCw0CBX3mAm2tNH0wRXYu9Gch68FXjsIFF3G0zwFtzC96Sz
X-Gm-Gg: AYBFou1kqceueWu8rKwvGyLz/oDclBrzKRCt/kzDrTQAhH6s4e6rWsnydQldd72InCz
	lneQVarfFm7irgSn2cOhFTVlQnDi0h6LDrKMDvMrr/3GPXtsoEvVsZauRgGFp5EXDeY6Z9R4gT0
	cOVuUs/CAz75mbM0EeewfHiRYgDEBFbc3m5ZnlHrhKubBxcxdW8VIFMHz6hDKXr61yxHV4uO/+S
	bfAIOkjOl9+1QADfKUg7m05hZYYktaBI4PyRdtBGL9qw5KfBEImbMHtkVQaWvzrbupFaY1VVcjG
	RPJY2HIUmdJxb7fvLQKT2PSlFky/PK9qp5MntqWQypMwmfa3FFh5llR/myxWuISGWzCxVCHZT1p
	UdAY5mEPTZzZJyRybVY4nMomhsiAIwEOcEaDfpdUfjEDbvO9326/hiEl99lMhhW7CJabfsOzWRK
	68rAI8fHxZUgmS1Jc0BlTfwe2RSpEA9yAauroNN59ZRtGHsnJoq8FljslS4Bq7khSJcHChsyTdF
	3fRkIm8HIrbcPHbbe5DPMeoB4ZCl/E+/cE0HDpuOklMhjPA
X-Received: by 2002:a05:6102:2928:b0:7b2:f832:49bf with SMTP id ada2fe7eead31-7b2f8324f4dmr2352320137.14.1790598681260;
        Mon, 28 Sep 2026 05:31:21 -0700 (PDT)
Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com. [74.125.226.234])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889ae9eaf9sm6753230241.0.2026.09.28.05.31.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 05:31:19 -0700 (PDT)
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986dfb672d8so1320343241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 05:31:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxKVv48/emnTTY7CRqGAG0CNYNoLte3QW1S0YwhgAg9eBafeZsf6VhBeIAnFdw4OF2QLL1mygBRwlW1qWzA+NT05A==@vger.kernel.org
X-Received: by 2002:a05:6102:4422:b0:79e:373e:8216 with SMTP id
 ada2fe7eead31-7af1973fc40mr5087011137.0.1790598678847; Mon, 28 Sep 2026
 05:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925224927.14951-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260925224927.14951-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 14:31:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTm-1cU2d3qp+S6BQ4u4n8uOTWgjiKUh0iu25j-wgcHA@mail.gmail.com>
X-Gm-Features: AclHuK8Y7bvMXweSx6eMM6II_gls33bh9_LjqJ-ADdLud7pCMby5J_qA5oVEsFg
Message-ID: <CAMuHMdVTm-1cU2d3qp+S6BQ4u4n8uOTWgjiKUh0iu25j-wgcHA@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: Kconfig: Enable ICU support for RZ/G3E and RZ/V2N
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Sept 2026 at 00:50, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Explicitly select the RZ/V2H ICU driver for RZ/G3E and RZ/V2N, as GPIO and
> IRQ interrupts are routed through the ICU block on these SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
