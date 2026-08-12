Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0750D3E8695
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 15:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548255; cv=none; b=Engk3wQS2mYnqPfJ5ZqJeZqbg5ledoU3bKowGcjHcCQUR4f6ZisHEwr+OOSKvI3n8sb1gglTHIqY1kSY1LSMnv1mVeikYKyHZEliLIPRS1zkaEgR0IyryBzoTYIdu87HfjQxT8JVyh8RGjh/2qYRZ+EmnmS5fuGkIGaTaQ/BkpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548255; c=relaxed/simple;
	bh=9S6tG7eJZN31suWJE/BxcyW2TUerziSfMO+T7zlebuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AY841cj+sJlowEieRqIE6UIZIX+yh4D3cnzMyZ0fA+AbAVsT0Lom1EthPPV2EQKqdlgwhTEvuylx6eZcK5pN+0phjThmQqjcdNOaLadF7vk6rAUxjTDoCz3erdbr2ohh1FmxQWBSrWrJWoi4KDu4xsYeD5t1LohlcBxGQ5a0uE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9692373e0b1so315597241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 08:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548253; x=1787153053;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uH9hHAtONGrSCasVo64a/skQAyy7fg3fmulOYsxslps=;
        b=RgnlTt1e07RrsKWGIr0GD3h5HISKAdCUmW0hWcCafPNgVB8nqeho1XvvSEXTHGl5ou
         7U3DVmy3Pd7bS2NDRwH8dym6uxj/4lqBg9gK3AYoY11/zRpg1P4CjTIjFU2IN+Y1BHCi
         7Tc5b4hMaUwFez3+jTYMmJRxwqfMI4m7vNgeVYM33rFip1oowq6frIKMwC7epbH5cc8s
         dM4OADhpOQxChvgicLARZPL+sLdfUxW+18sf1OM+ZuRXqCzbHhqRzpaFJL4oNoOrAN0J
         +PFXgyxJXanFt1UI3gehzZCy9X3JKDueOQEfIu6/WHJs3RsywGY2C0JhvpC2XPTkCCdv
         pjIg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+axRkkMas2CJcFub8Fs57UJK7j2gkjKXcteSrnO9zC6Itcsq8DiyXSr6nGixsm4Ib826YAKRnxgUvcYYukEPZUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHXiMVVL6cR4V2KK6Ua8Iveqx35d8jrZ3zzjxJJCQ39NIyCISk
	ihEQXPWQCPL42i9wPu6AtGylZ3DxMkR72vXi/O2EvMzoMVwLcQRUZ77djCgvej6W
X-Gm-Gg: AR+sD12+3q3d0wkStyjHZpfGhPGMoA5eMqJp8G/nktEOn7c9XmeTJCofVsFTqQROgt8
	2KYfB8iVkb/sVPEGtec33K0g0HDV/BaqK+MzFnNCeKdfv2fVqqgyObNUyjPsJU5ou4UFsMgH5sf
	8Ntejjll9BCT1GYRUKq3XPoDdFpRrlCCBjVXWcIKwALRVPhCXYTCAEwqj20Tkgrj8UBfO6/0Ern
	fQhCdWhKKRkuM8hunPy6x0z3PHnh8CwplWnwmIrHUBBQWHrFm0Sbv+E4iX3YlJX/LV7yycJYy9r
	PniVb67dMJiBwtQsShEapFEk0tPiLG9zsxYVC+BD5AYCSNmqSAsT7Ri/vO03z3GJcuNYuIPe8lb
	PoXdJyM1wxFkea6zqOBb0Sy6EYehEYnaklDkvlCmth1hwJl9gh4sBqIFn+Hf8unUkD9m3+rYiMo
	7aL+QIRkvamAvFLMjT2bkP06dr0t77ic5xiMUZ9TjJXDR4m0qmx0g20IAeqOVZScoGsi4Qck2RI
	3eCO84VEyxF3iJmZRg2zUmoVgWY7A==
X-Received: by 2002:a05:6102:3c87:b0:737:f0ba:508f with SMTP id ada2fe7eead31-76c87872117mr1279398137.3.1786548252784;
        Wed, 12 Aug 2026 08:24:12 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76caefa01c8sm827900137.3.2026.08.12.08.24.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 08:24:11 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c3163a88a1so367498e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 08:24:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqnhc4pJCUKtFjyBXJgCeAAtET3omYx+9X2EkccbaC2IGtlxACsdEU8Hq7b0SwHipOTIaH8ZIBRsrL5OAD6Uov+mg==@vger.kernel.org
X-Received: by 2002:a05:6102:2b9c:b0:744:c068:438a with SMTP id
 ada2fe7eead31-76c87e76f58mr1085679137.5.1786548251491; Wed, 12 Aug 2026
 08:24:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com> <20260722085353.136986-2-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260722085353.136986-2-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 17:24:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzwAD58-cw+5zXhg-VBpOVV+FLYt-ZOSQKDUSn4VKNQA@mail.gmail.com>
X-Gm-Features: AUfX_mziju9ccGGEaVRv-C4Y24VRZU1VmvYmsrfRmau3nSASh2likHOdk95VE_4
Message-ID: <CAMuHMdWzwAD58-cw+5zXhg-VBpOVV+FLYt-ZOSQKDUSn4VKNQA@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r9a09g057: Switch GBETH TX queue
 scheduling to WRR
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 at 10:54, Ovidiu Panait
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
> Fixes: 050ee38d0002 ("arm64: dts: renesas: r9a09g057: Add GBETH nodes")
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
