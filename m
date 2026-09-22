Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CF554EED9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 15:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091065; cv=none; b=THMT6XvVzUStKv5voBzIyPv+upfTDfLai+EdFTwMLnRBT8rRNJvTpjjgKm0btdiDfWor2Jh+lbsX9uENeN/TElUuyvgvc5f+6Jmrv54rkga9sN4LVeN4N7fCyLlX0HwglH9YBvB589orRhn3EDazKapB7ere+KEJg823VFikROE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091065; c=relaxed/simple;
	bh=0IK9+EwvsBoYDJYGUac8cxaRSG01Rz8fKvCBOkF5H0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwfREZcmN4YgvHO/b4MdVxHYp/L/wYZ73g/RC4jb5bsGZLhkedbWqvJQzDfVw1nFLvHIj4/vsEtpgaVlpXxr89a3tH4xPONTW2BHhrDItmFHxYOJqoeDZFnMpg7JAa0bNgceYbqW6SoryCq1j2sfZBbCk7PB7P+TT4y9NW7tm5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e529da9so1592863e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 08:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091062; x=1790695862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Ivia3s8tcpv+jz42ruOpNgJ1iPkEln4U/VwumY2Fss=;
        b=lmMCvVr7q+yM4fPMbfZHikYpCCk3lR0P0zaZGnCJmPdccWm+t5U5P76yqwGAIry7Bn
         SViZi93nCknrNK0rqR038o6F7G/d9pCw3c+DSe/lloMTPewFSF/pZM1t98zH6V8bUpX4
         QTAKypQEKMlKoHy8LCIOIVJGdmMi9UhuTlbkBzdZZr+mjqsM21rajpkMCXT0I8RyFs94
         DngJf2jqp74fUBuxUfMuRyKxQwieBvKKy9BEBoIpSbKKlLcGNUYfWcEqBrr6syjf+L7y
         T2E8OdLmOWuJCNFtOm+VYnLCrfQNzhJG/sMj6BOP+8bPdeeV4Tucl7r92BKpGR8iJRPd
         Aj9w==
X-Forwarded-Encrypted: i=1; AKwUvBwH3IVI7nFISPOHO6w8xVHSxvVtILq43T1kcvBRbUJkt5YRWK7MK+gsTefG37Do8U6V2IiUKOYqzwFpYT38b0jUvg==@vger.kernel.org
X-Gm-Message-State: AFuF++k2by0saQK7S7aR02ujOq7+Skh1Zzgnl3NL7XoIIowjSAViwWsJ
	MIb6CMistXSJO/7VaAjDDXHEBz/8xrvPcZcNl8KavNfX4qjYaApOfQeX7HIuJSmZ
X-Gm-Gg: AYBFou203nXy69UYGU6TWGBZp9MeNTSDYis1DxEaDIoACewummbwTYBz++bVLnl4Lj/
	Zb/QMil0E5ab5hhCURBQtY5uMM7M/ykBufJvImj2ND+lBpvXagOkkvJA0taYtB+jdFMiHfa/0Dp
	drr7VM/X7qLyNH7gTaeP5dKEPKNbwfhY5595N9e3jqwdWjyx5mgNUTvlyq5xHybR9Sx3dAG7U1v
	DoRGLNAvNP5AFUpcixymqA7Au472NJE3lIOBp6IFMNJAAxjm3x3/krLksPlb9NeBfU1NZ/Z3ZOV
	VXyPGaqO+zdvyHN6rP8zgoFASF40Fz5Ke6adPSxK78GXdkUm89IAkR3VQDfYQvx99V+6JEU6XUD
	b4+7N9olW+bSyNgDslt/9Ok5k1nTRY3HD+zSp08aq5Zl/j/wCPtEZJSXqeOkwhJAEegbXMmmJQX
	Amy/xHXS8Dp0+naRP2aTk5draq8Kf8Tk5tXgAbUqgq2wKXweterSm+gmA92wz3/mZ9JX2tJUoD3
	l4mk/GunmDVO75/bNQjOatSmIwuqhqcU5TAOg==
X-Received: by 2002:a05:6122:2898:b0:5c6:81c2:5496 with SMTP id 71dfb90a1353d-5c9b58f986amr9526617e0c.4.1790091061778;
        Tue, 22 Sep 2026 08:31:01 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-985169f62a5sm64581241.4.2026.09.22.08.31.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:31:00 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e80579b7dso1136840241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 08:31:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwY0KAaw9J9Qn5L6FA7tRkMQHO+J1pWlnNMJjLv3+Ll9DPMMe9Fpm9GMxmFYCAOvLHVoRbdUu1eCOo9nVYoO16P4Q==@vger.kernel.org
X-Received: by 2002:a05:6122:e230:b0:5bd:b2e1:e1f5 with SMTP id
 71dfb90a1353d-5c9b58fd54cmr8860951e0c.2.1790091060069; Tue, 22 Sep 2026
 08:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260921110144.44425-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260921110144.44425-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 17:30:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUX9s1q6SdrgiMciGfHYAvCp1kFzGYL4pHf7PzzipEPUw@mail.gmail.com>
X-Gm-Features: AclHuK_p5w8PzHnOOSGm4t2QYnyy-nd81aSQvB28I4MJvz8KTxnmCW8kHjNnqd8
Message-ID: <CAMuHMdUX9s1q6SdrgiMciGfHYAvCp1kFzGYL4pHf7PzzipEPUw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: renesas,r9a09g077-adc: Drop
 unwired interrupts
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

Thanks for your patch!

On Mon, 21 Sept 2026 at 13:01, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove the compare match and compare mismatch interrupts from the binding,
> as these interrupts are not wired to the GIC on RZ/T2H and RZ/N2H SoCs
> according to the hardware manual Rev. 1.30.

These are indeed only wired to the DMAC and Event Link Controller.

>
> While this change introduces an ABI break, the expected impact on existing
> users is minimal, if any, since the interrupts are not wired to the GIC
> and are not used by the driver.
>
> Fixes: 4d8d58987cb5 ("dt-bindings: iio: adc: document RZ/T2H and RZ/N2H ADC")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
