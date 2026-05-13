Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3FE43634E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 13:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677950; cv=none; b=gVI47XDRz72upPtsrBfBcJPTmjNGT7tzqX/RiT/L6J4i+PXF/veFCrxwRDLIl4k6Bon6b8+GBXYNbC48e/1CDjTAu7eOWkR+O/+o5OdQQ3YmZihXFLM1B3xIwZ6U6u2QdgyRSPSRwOInUaLR8KaY8ypRwkm8HyZQp9kFKwU7viI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677950; c=relaxed/simple;
	bh=OUQHmjb7UkllJEpUp8KQM62kjPUwPzi6de+ciaj5zDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGB6fVcqAoM3UqIBeg5QCxR/39F9fGad9YhRXXiHUA8HPFy+ucXQKas7Dlqd99yAkEsRC+zGNvgB3Bqc4tBX8kelSZDQzpv6g69rGgkk1Tl4glHu7ojIRIt1VeKyOlLK7EHKEFFvQZ9F7VtEm9y7vQdTTy4T9yg1vDWL+KuIjwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6312b8f8e47so1997849137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 06:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677948; x=1779282748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GE5Sc3I5fhZDV/Yx4xguTp5z/tXd0Rx77uBwtmUCg9g=;
        b=bJvxd6J6mOpm0zzWAtPMIwPRbK0dadU0qyItLSuRnAMe9ePVJPJc5KPrsYIsiwKXiv
         SuHrU6xH7zjqw1NHPfZ3YqdTCeIDRC/lJsSj1ii+x+RtwapJQtEEl+FZj57IAk+nMcYt
         uWtZWYc5OYhu38GzVU/lQ9atd3cXwS3/zoMoZ67r4KYnS/PApe6/dGR+VmFFqGab+Qxx
         fdcGptE86LJkcjXN97YaH7ev+ljFaSI+Zdm/CTeAeEjt4zssvQzUF73thMpr3SkT5kwd
         iekv2Vsoh6EmrQxQPe6Pmd6t1tdjYXW107GMS1aGj7IvA0F7npBd5s1Ck1JBjjuq98kX
         UuSA==
X-Forwarded-Encrypted: i=1; AFNElJ+Y/G/D8wh15MaYwOO9X4/B/m9MLXvxxOGGWtLI0YW/qktTjBM7EdpEs3kwXWop/8h7bW6LD6dPdVxmhZRL8w/0qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW6+FQoTMHqHAN/NaXD7dpjVkM94rdpysln2DbyyyXXKfnlDag
	dF45/2r8Ls8X+dhIm/9VYRyFY35gfrWR5NgGLz/TSFJ0htwmZ4lE/F0Sl23xU3Pf
X-Gm-Gg: Acq92OHg0YV0WYsUqekXCaa6c8Gp13lOCcrLPv+zAvM4HVLqHqCns/WXS0hFI9gew+F
	gqlyX+tTGES0npc06pa2JwnIc9M1QCNvaf+tTCmprgCOvGmGsu00Hs9VEiNxUjg3fbPhjn8yAmX
	ALNerxYWJ9CQLvZXS/Eqe9ZWyiP5cs6As/Hkgj/CBWNT/ZjnkKlMa3kCaqZKrWBh/I8OfZ+B9nA
	Oocr1g52LH5rAoy/+e8EvI9mqX8MDh1sqEsGEnISrAYF9UgWnwCPyssLK5oCKRNuHa3WCMjiQD6
	WL71Cm2eJ1OutytAbZhjDHmJ57t8fXLEYw0CRr0IiR4XMRT5jaRbuhQVtnf/s5YEsG6szFHEt2d
	MXUPEf68Q+4/qSpi2Y4Nl7rThIQuJjxjc4LAdnVYr+C5/1bTuWEuAueo0/1cdPw4s4jw7j2Fq9Z
	mnPz/XLQ7BjJ6nBLKkZwmiVtAv7NEqelulsXhm49CyYa84nU9uJPRI1r7IfrCu2m1L
X-Received: by 2002:a05:6102:a50:b0:631:3bbb:f268 with SMTP id ada2fe7eead31-6377422fe0fmr1345861137.23.1778677947593;
        Wed, 13 May 2026 06:12:27 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95f21ba2c2fsm9109705241.12.2026.05.13.06.12.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:12:27 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-57524e53749so2068845e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 06:12:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9mvCU3P9K4yxe0Wrk8vRr3mUDvROVBFKxUUXo3AYvBb3E/8b3SoE8uaEwSpkUmUIZbL4woMe/w16eOeFDvfY6IVg==@vger.kernel.org
X-Received: by 2002:a05:6122:6992:b0:575:352f:eac0 with SMTP id
 71dfb90a1353d-575e6fb88e4mr1415729e0c.7.1778677946052; Wed, 13 May 2026
 06:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org> <20260502185557.93061-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:12:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGGEXa+S7DZABv6_VjzgKaFR_dgEt6HMsoLWE3vtpduw@mail.gmail.com>
X-Gm-Features: AVHnY4I1ueP8c0lbfl8GeS1mAQp1h1WSM6acug8SaPsOhckX1RLhaKldCR-pmEE
Message-ID: <CAMuHMdUGGEXa+S7DZABv6_VjzgKaFR_dgEt6HMsoLWE3vtpduw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: renesas,cpg-clocks: Document
 ZT/ZTR trace clock on R-Mobile APE6
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 May 2026 at 20:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document ZT trace bus and ZTR trace clock on the R-Mobile APE6.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated. While this does change the ABI, it does so
> by extending the existing clock-output-names, therefore if an
> old software is used with new DT, the coresight tracing parts
> will likely fail to probe, otherwise if new software is used
> with an old DT, there is no impact.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue for v7.2 in a branch shared by clock and DTS.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
