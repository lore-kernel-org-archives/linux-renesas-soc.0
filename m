Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A8D453A42
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 15:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548403; cv=none; b=hFUmBmUKrtNRFi9UUxTUiJC2GFVWi74lyc6GprVprs/DPMriqCdn7782y8blK7b3St6XCWCFEfhQObzax0chG+a31QHpLypbA+yNVXW5/UGU/GwczhzKesRTCNSZKgoOKqcHrSBHVifOLTobjGGqNqueCf2V5dvYzXGXj7rVc4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548403; c=relaxed/simple;
	bh=IXy5DziotZrnP3xg055ayXT4Mxk0N16bRUegjbNwk0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKBINxe5GKK10vCNmqfR6fuAaN7Ef/kYejO+TqHboquZi/jLdfxGLcSMX6YToKegv2nE8jWWcFFzZJQytYt0tLFc4E3LhHFLW4JmtAdyU3V69gGHORArdJuMwvk7rB+hFOECBm+HYz3P1QtDkf3V43a2sfju7DQYrCMsz5uqyd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c38565e774so337795e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 08:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548384; x=1787153184;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=InyvOkSvHC+uaKrmsdi51j5Kk51cP5W6a9/RFap+wEE=;
        b=fm/3aXCiOGYh9L7zZDSsl8SFNGTYSf3eG/rqMR1n8lDVJ+k+l5tea2sybxKL241Rw1
         Ao6/wugAr77aC0nWzX0WAVwxyNtZCj8iiRp51x3nmISpbe/1YhbvTHI4qWVup+BuKCqs
         VT5aCeQds88PFgG81roSwplrPuPsMfmEIG6SZ7ZG2wY4ztvz3f2TcyzjkIhVyuobnBkI
         e0uBiRJ/Bd9zup3soQfA7JyY/opwXEFgerym5Htpq6WP0HRCUtj1zmGA61oIv8bp8N7p
         dGvXu5ZDOA/X5GGBtz6Gv61+qcCJI0ON7fENzHotpkYjsrTmISMON0a5vWu34avKLWpl
         A3zw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4kKc5ENMwEeGqN9ax5f1VWaV79sD8ba6tdi5XKUxNi4LeHi51gCsrNT6YDXZhFerVG+VxhLkntY7BGjMH4yMRSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPG966OmxRPSilxm78L6N7j85iypao2n3QvApi/4pCH0wdlvHO
	jBpentL2oeqz90fksrJRKhO7HbQP6p7zmUdWde92BHwy/7T55B+g1gblROb+APPQ
X-Gm-Gg: AR+sD128XkJNx7egjuOYCWYq7lqbfh5h+JznaMGTcbHqyKhUdTi2pSbCvfJf4X4ml52
	t+nc0/qEz4xWOyExdV7wO0gR157YrsA08Df6hjlNrdUFYKed8QOYjt9bAsk6W9NFl1b89IigXm1
	7e07PEXSD0NqGqiMdOI8P5rtmoVtD6C2z37duU1+b6EozEcuEFbQkDe1uKSnEnGILV0NocOw+lA
	ertlGjsy6wUNd7waYpDSbxTh4vL7Gz0uhvK7Y9U2HTwHXK3rzk4T+Rrh5coJ6tJ2lnQkyV6y9hu
	sU7a08cf1AGS6Zv804EkMpO+EYW7qDUXb2SUamJO/2AHxsYWQAd+5C+r/MjyRISzd58elyujdLB
	8YoN/Adnv8HSKcjVk2Krfy7xS8qv3vgFgpy4kejTocl7pcQDRLlqsR9q80XqByIU22UsaMULtWt
	0eezRMF/vZyA4nUQnyz0jacrSB1wlgWE6B8ZrpKT9Ix27w5vphqAXbEBF/fqAoHC8TWxNW6fFAm
	qdncEXGH3jO0aDLBapoOe26Lg==
X-Received: by 2002:a05:6122:a013:b0:5c5:733d:fe69 with SMTP id 71dfb90a1353d-5c5733e38aemr176367e0c.13.1786548383966;
        Wed, 12 Aug 2026 08:26:23 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c45b45df4dsm1295028e0c.4.2026.08.12.08.26.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 08:26:23 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-963a722ed59so348548241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 08:26:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpB6Sw/OvQS8lVE5g9tYX1ssvVmdMGNKKndrSs7n8P0xt7Pyi6JrwasX0H2rbC0Wj/aymDEmrn3efgj6a9C6xNa9Q==@vger.kernel.org
X-Received: by 2002:a05:6102:fa0:b0:73a:128c:4e3d with SMTP id
 ada2fe7eead31-76c8886820bmr1088766137.8.1786548382938; Wed, 12 Aug 2026
 08:26:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com> <20260722085353.136986-4-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260722085353.136986-4-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 17:26:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYm6ZU0+v6E62_sHtLRccup7CC4OeNNXy8cW9PWobM_g@mail.gmail.com>
X-Gm-Features: AUfX_mxrfLcygKoGMM7oeIyAjWWTavZKJxRsupGsXRM-sGwtdaYErDEQ4J36rHI
Message-ID: <CAMuHMdUYm6ZU0+v6E62_sHtLRccup7CC4OeNNXy8cW9PWobM_g@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r9a09g047: Switch GBETH TX queue
 scheduling to WRR
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 at 10:55, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The GBETH ethernet nodes don't specify a TX scheduling policy, so stmmac
> falls back to Strict Priority. In this configuration the queue with the
> highest priority gets all the traffic, starving the others under load.
>
> Under sustained UDP TX load with multiple data streams, this starvation
> triggers spurious adapter resets due to TX queue timeouts:
>
>   iperf3 -c <ip> -i0 -t60 --bind-dev end0 -u -b0 -P4
>   end0: NETDEV WATCHDOG: CPU: 1: transmit queue 1 timed out 5228 ms
>   end0: Reset adapter.
>
> Investigation shows that only the highest priority queue is advancing
> while the others stall for more than 5 seconds, causing a netdev watchdog
> reset.
>
> Switch the TX scheduling policy to Weighted-Round-Robin (WRR) so that
> traffic is processed across all queues, eliminating the stalls.
>
> Fixes: 41ffbb1c42d3 ("arm64: dts: renesas: r9a09g047: Add GBETH nodes")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
