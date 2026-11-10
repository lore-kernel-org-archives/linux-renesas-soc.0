Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318459;
	b=efwv5uYLoI60U4GUOLhDgne4Aq1DJZSNhq+r/SY/SqHvXKyIYI8geYveGnFsDG5rKez0
	 2CZpy0sgFF+ITgfGqRdaRUZ2OgbrMhDiqBTp+5R/LqFf6LzqN8rJd/zXdV9qnEUchtCJa
	 jXr/WE9G9GSnE3trzQmi+ok28iF5r9mB4vIg9Y+doFo/5vJXH26266pf0wSDDP1KJQK+X
	 6pwChhnguIhM1iOcWc9Ilke2GDjZqbJnSFrmQeGBrhryT89qJd7h9allROn08r3xxLKqa
	 DoNZrVOm6F/VfbDDEL7LA9K1vBD5c1X0KExxBpyV+hOtkuXrHxbhktwgL9f3pFaKIZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318459;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=/zr6HB2j6XGAxPk3jcavQ57LeCRCQYxGbLMlTz4dBRY=;
	b=j0t1yTYtJ5ufAJpvKSJAB/Kael+v97nBa2vb1jlfKhySspqwma6s5IWGV8OmMpAInwn7
	 Vgaf75N349jp9whylpWbYNr83MVOKR2mF/FXKVnfQPNmioJDMFunDneQ78FBSqqqviXsA
	 e6DaQST+qIRMDgbo2QO9ScqUl8tdXj5AMNmQS0wPo/eo72DZPbNcb29Hz4wMi9Y+FLXl9
	 oCqifbttlAYHzPIeNbnHA+Ji7+J5nAdMRq+dgPG995MkBmJrI5w7ydSUPZy+M8ispHVbA
	 6MIxiT5JYdApPcogt4UT55U1gQ1XxCaxIEL4oEs/QLpRSPykQXEhrW0odk9wVWTZRxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB84606A325
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 13:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BB84606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so1101279241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 05:47:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318458; x=1794923258;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/zr6HB2j6XGAxPk3jcavQ57LeCRCQYxGbLMlTz4dBRY=;
        b=1WISf7yECCr8xmBPWIuc8+ryAKwT2pGF8HgdRabxc+5EGK3YG+R95dFFWlOoiVaR8f
         dLTkG469fgIMnCZNFF7c3zHQZWYcd7KmP5PGdC4HjOvi/fKqv4HVc5DDeRUG34iT/J4Q
         7y6ZRmx1eK6Bj2ypFTJS3kOyYP9h7mlmm12CG3LL0PmYH73SX1xAHPU4XsQOfYjSwMTN
         sAZ43LhmH3lA/sEIzncRhT1QgUHFzIDXqE2nkXg4YCkGMFjLrx8oPcriwQXoiX/lKhd2
         b5kUPa672nfCujiDAgteLUA5AGcxnBJ7icwSWkSny/z1a821JsqI4a4OF9GY4apdC2tc
         /jWw==
X-Forwarded-Encrypted: i=1; AL+hErFeUZnehJw+MmCUmSFcCzMBnbYNwxn1CFpEp4tPzQzdqQEwkzKciCZTz5kLmLUYB7B/UeWmVBkIFS7IaH1jQ6kfSw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZJnGEROnq1V+MGYQ8IkQVSpGW6KC3B11QqRRpOUPQtwQAXbRc
	UySml3uCtYEEWL0KaIAmC8tGUQOHeQmPLEKxpA8JqvgD5v8bDchdADF70ydkqrz1gdM=
X-Gm-Gg: AYBFou1BFtZUFrlGX65BpH8pF2dJTzegGaO4UMZ89rmQ0LA2Nwz/XFy9V9Wt4qWZEpV
	7QqZfYRJCnIxdjZJwTHSuV9+quincrCRAAI/SFyjnbhEAKR4vsReKqkKDoZ9+LX8dzjl8FnWkMX
	hz3WyC443qF9G+kfSodKrWAtQRcQ6+YZyon8/0dE6goymP1VTzcdfHUVWlYn6jZcXD4nVZjUnfj
	YrMs8A1qwbAlnj2YKGgo1wcxn7meR0kyCNByLQUg8KpObbjYNLBi59RCkHDU2ovf//kdF9srzMU
	l9CuArp1T8jKZyqB8KhjNBaS8r/qG1G8LTZfWNNdnELKEvLAvacLhIVhWsRSFmblaVJFYND26PR
	pslAKU+NUlBMjkxv7kCPPohytOdOBN1fYOMyFapz+f2GE0VR+jtvUT15QxW128ZpRRTSmdVLFW7
	nablBGq9J+55ftyjfqKIUCR+czUMVbiV6GEPYc6GL72xpGJIjAeqgAeVTmDDCEohxGhtR5jtx0X
	j3hVtQWgQiCMiMYAqpsizl88CS0smDOOk+8rc/Ke7seWAT115S+ENprPsFYeK8XbFEiSRsQBSNh
	oIhDnK9cSAaxSPtAB5d1D3XIQPGwacKpqfJe1KCP/SczZowpFm5bmNWHJGNFrUsRDrE=
X-Received: by 2002:a05:6102:6e88:b0:7d2:d873:d59e with SMTP id ada2fe7eead31-7d301c17d5bmr716388137.23.1794318458019;
        Tue, 10 Nov 2026 05:47:38 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d302359221sm1714745137.6.2026.11.10.05.47.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:47:37 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7d2c8141dc6so1133110137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 05:47:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFKn778303QhKZitz2k4AtEqVKM2h15KvPQjd1kyP74f5gJxKxC4sMKUoJPrsricTEgFnSBLev2iIWFCupQnlAX0w==@vger.kernel.org
X-Received: by 2002:a05:6102:d90:b0:7d2:7c63:5a06 with SMTP id
 ada2fe7eead31-7d301bac8f5mr991679137.6.1794318457177; Tue, 10 Nov 2026
 05:47:37 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109114123.797741-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261109114123.797741-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 14:47:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXc=DRkGOhc75Zq524X9Rcc7OOMs6dy0rj0-zm+iFP1wg@mail.gmail.com>
X-Gm-Features: AclHuK914gRsTQ8u9qxzNcN_mT9zJAXVqPcP4tOWw_JxX2hXDz9ZvkW2czHkSw0
Message-ID: <CAMuHMdXc=DRkGOhc75Zq524X9Rcc7OOMs6dy0rj0-zm+iFP1wg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable the RZN1 RTC driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 9 Nov 2026 at 12:41, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the RZN1 RTC driver as a module. It is used by the Renesas
> RZ/T2H and RZ/N2H SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1393,6 +1393,7 @@ CONFIG_RTC_DRV_TI_K3=m
>  CONFIG_RTC_DRV_RENESAS_RTCA3=m
>  CONFIG_RTC_DRV_MACSMC=m
>  CONFIG_RTC_DRV_S32G=m
> +CONFIG_RTC_DRV_RZN1=m

I don't know what happened here, but this is not the right location to
add it? Moving between CONFIG_RTC_DRV_PL031=y and CONFIG_RTC_DRV_SUN6I=y
while applying.

>  CONFIG_DMADEVICES=y
>  CONFIG_APPLE_ADMAC=m
>  CONFIG_DMA_BCM2835=y

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
