Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA9C5616A5
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 15:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967035; cv=none; b=LMHVE/8ROtl1z8nodxFvEraWeLNKrfH6y4i1i3c1lfxBoaiUv90wy2zwQBhSCj61OpLB3Jnu24K9Ay+4US0F0vIzTGYcc/SAfZnWv5AArft9UBX0CHGbEaGG9zCgUZG1Yphoz/CVYMHXxhux2y0BZtTHFH93C95cAMaXXbtQflo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967035; c=relaxed/simple;
	bh=50PWHOPz89VAgzShHbqe1+05LKceXOJguW/0waoh4rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAYCbIz292fYMxGpxHHDnJQRw7DLaB1j4mE9FsboyIY6WrJw9fBAeCFFVBuE3D2Qlvg/BIXvyv4BH5mwNFHJ0ICs2/sXOeIaOpihwRMH9dm3OBeABNiN2cCCxhw2mdW18EHnnoVVYdCeqCOshVjSGO8RYcXM+l5toOgvrOoIavI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e96a8ba8cso214184241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 08:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967032; x=1789571832;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xngvRGlem5QBe9w72ZS3ISg4Zt8dZwRC6gUDQpCph0s=;
        b=nAqnns3jzINLFlnFKDPlaE/KD9oA6abC+LlFh7XfYrbXyGtB/kx0QRb0nkejqACbaC
         c632ud2Ioy3q7zr4j8yPpFzVI3VkiyfFNyOeVLbuJb8+OvRE2MKOiuP6O43CeX0zqaoa
         STcSMDAE0iNmxhRJer1M4ee/DrsM6cbvL4W6GvujmrV0lG1/NM6vqbS257jlqkI4Ctxe
         nKB7Hq0FYUwq7rNmsa4XmrLmuVuI8gKDDE4rtwtsNxH8ylvwkx2kLjiW4N9U66ov1Bee
         k3UEAvXZjw4wMnoAWh60LOiwJCi1bod8mBBpaLCM7IaSxoX2wt0mzWE40tkzxitd5dgV
         al2Q==
X-Forwarded-Encrypted: i=1; AKwUvBx+rRz27AD+Thschn9kWaX2ZWXcHZzeuqJWQ4bw7vQFr5yhYjlNMEYnaSZ3jsyvaVmvv5cMQyxMriHNHlBE4yNt3g==@vger.kernel.org
X-Gm-Message-State: AFuF++nzgWgWGDGJO67yMylrMVO+3lYXjaILBYF4hZHazhKmppfdLLVT
	OOTitKtMD9RO/ep9Yaf0PHPvNulqxhsU0IN06AH2WAUqsoOycLFO5pAVF8hLCMzdL/igmw==
X-Gm-Gg: AYBFou3Y/AoF5YsDXXQ9dFkszQZ0yWbZpZVQEpXuu6vqzOLkxaS/J0wj8mDm7RgiQJK
	mtFCbmh2ZZ2xZkCDizZRsnBuHf0/cIKUaY2Pg2li77NWkm4MJDSkGiNxzzTfvJDenLXiKMHJw+w
	sRd576P4wVKZpmy65pEO5a0UHCOK3x8dmyUnT75Tg0TtTsjuwKK7Fnzq+tBdgmdADAfUFrStaA4
	l1feMWykjKzRGzt4aWV/UAZzNDHLmzoBUD10dFc3ejjCFrnXiM9kJYSenK8KYd7zXba+lc+JRLo
	XKrQ39AUwIYp+2Ah5fu9N3QT1svlq68+l0h7pJpgYi53KN/ypuGm4fTwbhUllPwUpIPRo3bWl1b
	dbvAacFpC/RZtEGCnxX+bt0HxFKI2AL5X3qAnECNdVuwZagFuvKOI1hAUJxwZJtIeLejrDYLXS/
	hcWa0plf7e+lT5vU8HmlbzQZZIPSrsmdWRMKoNEKBjZB3U7mp043HdyD15Q1Eauxy24vwWfvUKi
	lGpnn3u2YxVl3Itj5Xb2EC+PXxI7zgpVsrkYA==
X-Received: by 2002:a05:6102:4bcc:b0:786:dfa:c5ea with SMTP id ada2fe7eead31-79076bcad32mr929163137.5.1788967032046;
        Wed, 09 Sep 2026 08:17:12 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed7018fsm12335914241.6.2026.09.09.08.17.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:17:11 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-98296941f1fso236250241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 08:17:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx1mLePFosr6PgkARFTnaGTajaj++qmO7Xh7LN+qxjtUp7Ugo3MRRfquMG4GjBeRIRCKHPm3BBzhGL1D0BEGBvPEg==@vger.kernel.org
X-Received: by 2002:a05:6102:159f:b0:77d:e064:2dc1 with SMTP id
 ada2fe7eead31-79072bd65e5mr1021149137.0.1788967030503; Wed, 09 Sep 2026
 08:17:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com> <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:16:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYJ-XSe22QnBREpxJH_hDVfV1CwkVjBqPK9AXTGJE1Aw@mail.gmail.com>
X-Gm-Features: AcwNN1VLF1S9VM_rAd4lsusMxTGZ8B-oUTaocc800YUq_Bw4xg9-nPCuVEjF4tk
Message-ID: <CAMuHMdUYJ-XSe22QnBREpxJH_hDVfV1CwkVjBqPK9AXTGJE1Aw@mail.gmail.com>
Subject: Re: [PATCH 2/4] driver: core: platform: add subsys_platform_driver() macro
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 8 Sept 2026 at 19:47, Brian Masney <bmasney@redhat.com> wrote:
> Add a new macro subsys_platform_driver() to eliminate some boilerplate
> code in drivers that need to register earlier in the boot at the
> subsys_initcall level.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -376,6 +389,23 @@ static int __init __platform_driver##_init(void) \
>  } \
>  device_initcall(__platform_driver##_init); \
>
> +/*
> + * subsys_platform_driver_probe() - Helper macro for drivers that don't do
> + * anything special in device init and have no exit, but need to register
> + * earlier, at subsys_initcall level.  This eliminates some boilerplate.  Each
> + * driver may only use this macro once, and using it replaces subsys_initcall.
> + * This is meant to be a parallel of builtin_platform_driver_probe above, but
> + * with the init call promoted to subsys_initcall so the provider is available
> + * earlier during boot.
> + */
> +#define subsys_platform_driver_probe(__platform_driver, __platform_probe) \
> +static int __init __platform_driver##_init(void) \
> +{ \
> +       return platform_driver_probe(&(__platform_driver), \
> +                                    __platform_probe);    \
> +} \
> +subsys_initcall(__platform_driver##_init) \

Nit: The backslash is not needed.
Yeah, builtin_platform_driver_probe() has it, too...

> +
>  #define platform_create_bundle(driver, probe, res, n_res, data, size) \
>         __platform_create_bundle(driver, probe, res, n_res, data, size, THIS_MODULE, KBUILD_MODNAME)
>  extern struct platform_device *__platform_create_bundle(

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
