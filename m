Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609381;
	b=sd9JExQrUBux/Z4pIZWNPKS6r3Sty0z54sXgC0AipQsjzK3ai3umBvI+ah9gXtMCnhsm
	 AJxEXCHmU18U7lBIu/q1Qf7xtn+Y9MWMJmGFtWfie3VntAGhuYRiq2g0IqirpHDo1nZKh
	 /AfgaCg2+4lEXyBDoS/qkL2AMjd5F2qw3ols1lbDvqDKEZFajUnqoAh7lqumYjWkTEaHW
	 uHB2Dj+kvweVEOL3ZHdhC7TrFkWAPIWXNUVQpRJSJgufWex1a5bk/YZDlpvDYm9UUUCqR
	 4NnU/ffZc1o7sto8ktEaXdf7Nmd4Xx5sJNMPTLU2j5WeTNssiRaaGpV2dHxuBkaIR7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609381;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+YEAseZvXPy4rzi3ilmBCswmMdSrruj82r2UTnccKOw=;
	b=OGFiESAFcCrar9IkCLcskT7Hyn9+TvYrrDRum/CkzRzYwzSSbmt9dzl0IlfqFgbesIKp
	 j2nv4nddEi2Xpx5nObcSu3IlhsK1nMuyfX0QGlGw5RPwpKwop+QDbyRQkjSxZjhL8brpg
	 aDsywWZHeTQOGuqmBpDLviDXQ7r09PkOw2D/8ZBEvB0yYgPZw4KBn6cPQ1H3WgpStF4Yg
	 JhR7ptt8E16c55TgHZmB1LeMxXissLIy0ZWLiQStAxRRqROSbArLfSHXZXS45SZVihE85
	 v7HtjUQttt6L7pDkA9SqOfEgVaHqreLte4HPaaglS1G+rrLmW41mXUcSyAZPVTwUIOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A65606A324
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Nov 2026 08:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14A65606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso557417137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Nov 2026 00:49:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609380; x=1794214180;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+YEAseZvXPy4rzi3ilmBCswmMdSrruj82r2UTnccKOw=;
        b=EF+g8InB6hHGCjr8QfMNebc7hH1+8Dwk0JSvMGrnQ4vY/A5Xcz2yL4T3bien7gSIZK
         JIqM8UcuQOWrD7oAhZYlc7RcjvDm5hW9WfDAuPx9Lj2VwyUJvMNWQZM78QwJqnkQ7mJu
         ZpgERpr/GuE6do9VmSebV5H5tu8Yf37tPlyDXNcwA/RkMIIQCiI/vw9rtQwcQirMeEkP
         RY283tdc321o7FERZeXyy7lOQhNdCqO1K5rJ0chyJYlaqmzpc4pInoEvPcZ6ZIJl9CEA
         TwfHmFIL000GMq41h8P+rlomLZrQWWJMmf8sHmPAlSyc9hJv8VDJb5EVj6UTQafDTOKu
         vDLg==
X-Forwarded-Encrypted: i=1; AKwUvBxTBUNQ/XPOYjVwB9POXi2qtal9s5iAXD3wrsS58kOdxBYrYk+DceepQPm1FUbnPJPfChcfUuHGm+O/b7DqwXB7nA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ur7axPwLC6+BnJOybuuGkFULZhENjbRe+lAREpO05RH3E3IwW
	tIXdTtb8yjtbG+4WxjtTZM/7zTko93qw7ltV6NrhR7Fg8oOGk9yy0q8oZEAbsRND
X-Gm-Gg: AYBFou1Vu6mSBX09KIBTqlwenj6Hom2u6PBi22Ga1DPfxoFsjC+2VvCFqSaZ8CSqfH1
	g0Oh2ImxGJdj9bBLw7J9c545KZnb6agXdlM2gk5010RYXZiPQelT2+yo0Mvcff/mR3JDDK5srva
	IkTbg/Qr0kMucq49y5/Qq0VLFgfDR87RwbQvGA6rowFe5C6u2f9tdLLGl7SCYWN/XSismI37H4a
	HHW/clmQDOgQpyxV0lcuC3FNI+oOTyg2We3k8d5hS+qg4xFNNG1kbGw++7Zz8Qyp/z5UZvbURyj
	92dpmFmc1yzVhQ7e8mTMGo6njRbFZ2EWk2wR3pz6I2Kuo/gYXylzk7DiSsSsc+rFkJPG2AIIvv4
	imV+/6e4ZwjxQBhU4hMf2sz+48BTMAwhBalIXBvIEz1TlB+pm9QnEut4VD8A8bz6lWAw3amKKtl
	iZGUB2/jKCcrSpbU8pN2eWk94nVyjz50WaqZtaBZyQrrERfdbAGULf13J9dzLeFn3HJ/+9tT/ov
	jY9uWpENfNRhU2rMW7JDScELZnn1qsW2f6NibNIX5g/PUGbsDKLWdETwsl86mkYeFhOUfhq3m3C
	cjzwvTboPaI1GqZqWVxHx/mGcXx9yA59C8IAq5xIFuGGdpMXPywsIPxaGycVwMSPEQ==
X-Received: by 2002:a05:6102:3c83:b0:7c3:875e:593b with SMTP id ada2fe7eead31-7d07265c722mr3413648137.32.1793609379954;
        Mon, 02 Nov 2026 00:49:39 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d0775a716dsm9561967137.6.2026.11.02.00.49.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:49:39 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso557413137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Nov 2026 00:49:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwITDkW+tQdgjqL3j0Dyr1oaMnVPwyagKZuz3TVaprIxUG8i3aRG5rCkYTrguBvZiLdt4PI3VGfVyEUzAWcIH2ZDw==@vger.kernel.org
X-Received: by 2002:a67:e10d:0:b0:7b2:b159:98c3 with SMTP id
 ada2fe7eead31-7d072640147mr3163529137.28.1793609379443; Mon, 02 Nov 2026
 00:49:39 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030230646.709687-1-artem122novak@gmail.com>
In-Reply-To: <20261030230646.709687-1-artem122novak@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 09:49:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUacwihjpfJiGY486PT=tu2-jrSQX+ZTGAqk-iaLUzffw@mail.gmail.com>
X-Gm-Features: AclHuK_7cktGh1g2g1V-jYGT89r8njgV4UvXrWAUVy37X6WOtxJHbkDtb7srpgY
Message-ID: <CAMuHMdUacwihjpfJiGY486PT=tu2-jrSQX+ZTGAqk-iaLUzffw@mail.gmail.com>
Subject: Re: [PATCH v2] sh: sh7305: add TMU0 clock support
To: Artem Novak <artem122novak@gmail.com>
Cc: glaubitz@physik.fu-berlin.de, dalias@libc.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-sh@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Artem,

On Sat, 31 Oct 2026 at 00:07, Artem Novak <artem122novak@gmail.com> wrote:
> Register the SH7305 master, peripheral, bus and CPU clocks using
> the SuperH clock framework. Add the TMU0 module clock gate using
> MSTPCR0 bit 15.
>
> Keeping SH7305 clock initialization independent of the legacy CPG
> initialization framework, which relies on arch_init_clk_ops().
> Disable SH_CLK_CPG_LEGACY for SH7305.

Thanks for your patch!

> update: SH7305 TMU device tree node will use the
> renesas,tmu-sh7305 compatible.

I don't think this correction should be part of this patch?

> Signed-off-by: Artem Novak <artem122novak@gmail.com>
> ---
>  arch/sh/Kconfig                        |  2 +-
>  arch/sh/boot/dts/sh7305.dtsi           |  2 +-
>  arch/sh/kernel/cpu/sh4a/clock-sh7305.c | 78 +++++++++++++++++++-------
>  3 files changed, 60 insertions(+), 22 deletions(-)
>
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index 5ce7df11c3ec..315a1d6ee452 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -532,7 +532,7 @@ config SH_CLK_CPG
>         def_bool y
>
>  config SH_CLK_CPG_LEGACY
> -       depends on SH_CLK_CPG
> +       depends on SH_CLK_CPG && !CPU_SUBTYPE_SH7305

Why not add !CPU_SUBTYPE_SH7305 to the existing list below?

>         def_bool y if !CPU_SUBTYPE_SH7785 && !ARCH_SHMOBILE && \
>                       !CPU_SHX3 && !CPU_SUBTYPE_SH7757 && \
>                       !CPU_SUBTYPE_SH7734 && !CPU_SUBTYPE_SH7264 && \

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
