Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614205;
	b=FBDmFyI/fPX90I8q/eb1Req7W0FK7wtr84Mpt7UdQ3Cfyr7oFGAPCzwfjO/4FG+kzx3d
	 q5W8MWBeFh/eaWyOBPwtrOpKnVTS8Pe1zek9rj9rvK2HZEuomQ+Zzm5sJP8uBVM4GZ4sl
	 aJ8FFhSCp6rFD0zWvjcfbxr9fB36AxNk6ZP9CrDzPkxvhigu8Rv9EqxoIdKD52nR3EbEf
	 E6vkh+kUk7NaEFW/Q5H19ut8dDaKz9K0jAKKXsbRdzW5qhtCl0tKDI49tRW6WInH4ql6t
	 cAqjbYM2n5x2RASU7+mdOZVd4NJrmbiogUPSUM2A7MB30pIu750d9Dr2h4SVrcjArsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614205;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=kku90+qM041/ZsQ9tSwaVmVz4Dm8H3ilNwTawTrWwWg=;
	b=0FI1Mc5KkzI2UVMymRyOxkVU2y7T76xLP2QrYnknZFz1saqdcT+gJEq2i2ZPW0TBU66L
	 OQMLnaveyuh+kCTI/XSYagQmNNrh9Wy3AFN2BRa+9VztlbqYKLAIbC3Sdkp1lhfucoPc2
	 leeWwD4atIboZNHQe09r+sY5JjxRgRosksEwiijAfcBnevXVIum7JfkDNdIEFzL2f62Us
	 vAH8R5vRHbfS2punjY8HNzc641nlwA1hTlkIwA+itB0B62qOL3ajtG3axOYIJxUXg1LgM
	 MSLj7PxKQREcGVPFR03y1wWrhV2uf2t8MsAD1ZKPqDcKRoVjR2Lb5/6KIes9Iw8BEyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AD0606A326
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Nov 2026 10:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6AD0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9906034086cso594695241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Nov 2026 02:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614204; x=1794219004;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kku90+qM041/ZsQ9tSwaVmVz4Dm8H3ilNwTawTrWwWg=;
        b=Pm5/hwhYhjByYcpd+VVbM5JD1G+e0/x4LiHXvYsxNabK/kTmWAg4inUF6iCTQg+DAk
         D1mz/jwds8muqbqltS0CEh1rmmrWQobZGTu4rfuONSMqkg9hb1FAvJqWaM9ez5tHH+ct
         Z6RKtrf4NZ+4nr2qhUeaUWlVHIZtgx1jBvxLVvmUaMu8TmnWZYa/ovaHuQbYzzBsM/X3
         9KUE0iNyMjxuV7Si+vKJNXH+FkmaJ7qW3UCtjiQjQmoVrUBYTjZN2rULBU2MCWjPu7CH
         XsQeNYB/b1hXz0BmRSDNYA9LKFaRuq+iBCLqqpUjzoCScIkgOCyKLqTQGxvQ7LXRdPiP
         zJgg==
X-Forwarded-Encrypted: i=1; AKwUvByeOVYjR0ulxc51vi5OtOd/nYIK/31mv4yQDS1SuO4g2v3iUSxRN/hJqkfKtKedy1TTNLh2x+Vg2sH5DsXIoE664w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9CSST0CdgF58jhBmFoAqlr8zsuWsP5pBN6f6y5b9oGuOh/Zdu+
	oS3IOPp35mAh5J0qi433wG/gioJ4un1lIOpSRqg6+fzVxLj/DXZGIDKEbDjJXSoS
X-Gm-Gg: AYBFou2qq7YpSfuJtVtp1UyufYJvZdV0VMdoCrLihSGcMBHWEgIxR96mHj8xtJagEZI
	teUtyAQzHXga1xApbjHyaIt5wftIbHgkeleZolTnlaPEtPfs5RkQ6Klo8Erd8PYrW0M/G0IrddU
	6ofrcXsaPyizOlIigdvbfkxWDoM+hxJ59cjr6mXwq85Om+pNhRZWxF6HiKUjWHKsSrm3DwRY5eX
	TEXClQdf10zZqTnoXMrEehElc9rE0uzqdjouX3xRoQZv48uaWnUAtufefqdQ9pTKkSMOqPKgSdE
	jMlYwM29Gu0Mdyvc/DvS/GnPn4w9MyTm//w2Xhnk5YVr7GMen7kUhEKDTP6iFkLripsZlgPZtzl
	l7BPCzHg8dt0SAvVnmlePQ1Cvh1J/vLGA8BMOttNdAI+MLot8UarGQPLD8sjoQq1yK6PK65BnkV
	iJ++sZ6/A+ffy7v4kUHEy2TzRWR+/TXmg4dMD75tN342gy4+hmovADthTmeZz5IBTRdDP83OPa6
	rVNW8WxuS2snABNQBRQ8jLdn9kL+ZtZfwFSEcNuGVWjlQG/JRvzsDTlBS03s0oKsS5p1F89eDij
	DgYX+De/rgScurRj+essBtpEVo/ip74vU/0MammmtHzg4jkdP8BCPKGPJ4wanqyW2w==
X-Received: by 2002:a05:6102:fa0:b0:7cc:118e:7bfe with SMTP id ada2fe7eead31-7d072626940mr3407927137.19.1793614203806;
        Mon, 02 Nov 2026 02:10:03 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee509f58sm11374209241.12.2026.11.02.02.10.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:10:03 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9908e3cd939so585419241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Nov 2026 02:10:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx95cawECqE5nRHo4hdgcCcZbfTitFUtyUvAfoEqFV4rFaH0szqHze6aUoNdDbqO0F56Imwqs+2mDp666IGC0YedQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3706:b0:7c3:9b0c:a75 with SMTP id
 ada2fe7eead31-7d0725ceb28mr3125663137.12.1793614203445; Mon, 02 Nov 2026
 02:10:03 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be>
In-Reply-To: <fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 11:09:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhOu+1YU7z0WR=2M5OuGjdXmH6m5__F7TmhRGQx52jMg@mail.gmail.com>
X-Gm-Features: AclHuK8J4Hpof_2n20HSIIi8CLwkgCm2egqJasTQSM_ACF5dfMV0X89nwIyfFeA
Message-ID: <CAMuHMdWhOu+1YU7z0WR=2M5OuGjdXmH6m5__F7TmhRGQx52jMg@mail.gmail.com>
Subject: Re: [PATCH] perf/renesas: Remove remaining RISCV_ALTERNATIVE references
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 10:39, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> As riscv always selects RISCV_ALTERNATIVE, the option was removed.
> However, a few references were left, making it impossible to enable
> RZ/Five support (ARCH_R9A07G043).
>
> Fix this by removing all remaining references.
>
> Fixes: b924210f542e13c7 ("riscv: remove RISCV_ALTERNATIVE Kconfig option")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be applied to riscv/for-next, or folded into the original commit.

As the broken commit is now in v7.4-rc1, this can no longer be fixed
in the original commit...

> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -117,7 +117,7 @@ config STARFIVE_STARLINK_PMU
>
>  config ANDES_CUSTOM_PMU
>         bool "Andes custom PMU support"
> -       depends on ARCH_RENESAS && RISCV_ALTERNATIVE && RISCV_PMU_SBI
> +       depends on ARCH_RENESAS && RISCV_PMU_SBI
>         default y
>         help
>           The Andes cores implement the PMU overflow extension very
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index a63df28df3b5e7c7..0b6876ef6dca228b 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -461,7 +461,6 @@ config ARCH_R9A07G043
>         bool "RISC-V Platform support for R9A07G043F (RZ/Five)"
>         depends on NONPORTABLE
>         depends on !DMA_DIRECT_REMAP
> -       depends on RISCV_ALTERNATIVE
>         depends on !RISCV_ISA_ZICBOM
>         depends on RISCV_SBI
>         select ARCH_RZG2L

... so I am queuing it in renesas-fixes for v7.4, unless someone
screams.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
