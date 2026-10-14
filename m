Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE6F23D7E3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970146; cv=pass; b=NLjJ+ZH2zPd0WNyNqppVIxnNTiIf5MPNbaJHyf692exxFOpaKszI42jLn9eNPP8aBqgWytEEwxsDxTl46c8cC5rIgPqtRqjv9z54KIfxAoN8vMphK1gsYgXCj9Bs07XcsU7aFmDQwzR/D3AxZZ/b/oxc3meNodbHJ7h9gSAtMB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970146; c=relaxed/simple;
	bh=WN/D2DKkPkAtwoVdUzfYLsH4nQOGe29u3pPkyYp+9Rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VuKn3HWzzIK75IuC+W0HhSzrht8F8I/ZnGxkw6MIkbGysHbDixTboplSsQYQmuZYpB+h/4DnjQC5V49IpDUuIX+0Pwge45P6NzqSSFimO6oSLPZGZzNaqgd8NPs3Yxp7tO7VUIGy+zoXCl8Y+KAI79Y9K1C2z9U43hCWv7YaY6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XESQWpec; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XESQWpec"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b060ec084so2521943f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 02:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791970143; cv=none;
        d=google.com; s=arc-20260327;
        b=fwFwefu2PM+AMtPmyKgmy2xjNoo7zAQe8rYpT8SDtUz4g0Zh24AwW0hQezTucEToHj
         RPhS63HzD5z2NOrXQ0fdvdpUeuN70W8l3P09mkQ+sVe4KkSE8lq9eLEmTGFLoIM1S4tH
         4hLirwfbHlKu1eBqd/610TRF2Io1S0tMT1eAuZNlV1EiWpzdbrzxbza53wSQVV5TBTee
         /JpkCG7U3UdF9ftJ8SF0kD58ZPmIqHyaVAhW2oxj80ZgtV8zUaLMqqvUvTPaDqNTs9T7
         N1jEugye4WcY777bTN38OTZaIpF0e8QRVYO30nVQMIILKGMVlio2M5XA0172wUHND3Za
         i+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UM4snv3HyBXCnT4o3yFHC4lEa74fiilyetDqdq6lntg=;
        fh=Zf9oWPxNQmRNRAKEFa0Fkaxq8176/Kj2/Brsvs7aIOc=;
        b=AA2ubJDov583paqTHbQEemS1Kf+vmGw+oJWYcIA9MN0dASS/+C78YssqvuQz5x7sTO
         1nPxD5qUJjzo28S2nJSO4RNEMVSeblaCvk/5GlOy2rRBuFYH1OSTawbd0i17P/IT848X
         J2krQDtmWiNf2FIptPEGpxYhLmD4KrK6MPlfdLYgvdMTG8H70ub5hZSU4Bw2aUgF6L5g
         gTHiB2e0/LYQo9wcqoLQUuDTvPXecBVywWirFqnOCjhoWSfcJaAQEEgnuD/YwV67agLI
         sn7ML2JfGwkMSLSa9MxBXJmgWlTsZ3vCs374PT3aMMzsvXYfISCKkMuY5O4Y2sihTiqD
         A30A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791970143; x=1792574943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UM4snv3HyBXCnT4o3yFHC4lEa74fiilyetDqdq6lntg=;
        b=XESQWpecQ1oE77q85jd7V07GxvA9TIdihTc+fZdR/N0Eja6i+3XLI9t+PS+fwAdZi4
         nbjT9oOMPJ5vPjoYrvueGYNYn9i8ePRypPbpQUVKlFpKrsgy0Mj+ZIYqAnGuGz6GhzQ3
         T6gdr2ywAMG+lvUt7ahcYlRWlSFO9TxJKCDQc+SN8tv6iTJmPsFSVQkvRTiL47Jt95j8
         81psHBadDQeZPY7IJUTfFljPpV1yz01QLJAVj3LcCsNyQNejzSAxGtI5uQteoTD/U925
         Eia+Yb3Ip9bRbUSe0U6JRCdMbhcBcbzPqO20sTTjO++jQxJzavd8vC79w76SYUzRM6Wy
         NTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970143; x=1792574943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UM4snv3HyBXCnT4o3yFHC4lEa74fiilyetDqdq6lntg=;
        b=pfEU5GVzEFtx0f15ylyQxCj7XrGKy3AmaApr66XxGbnin2BS6sPho3m/o2HwIQwkTR
         2skvpQ0hQ5j4EZHsZlpZUX3mNKH6iRyMq8aOPnD+mvkiLCBfvDa6rKBJbc6xL5sQWyIi
         igeuEkxjL0ag+3pxT23K7QX67wsw5c40g0Pj3O1EEunukHNFP/9Hc7+zPq2J7clbOmX/
         n+4qhJBU3zeG0Y1zF9SFo92i/8S7O+vDCPRqvL6MkN0PfRYHQv9eIXAZoxFC1CRYMMSj
         AaVay9reGP1aqd6A0iL7c0zyNKXc7m+D6urIfZvDHkC8VJgkFd4EBgXfwzT5g8tPVtpC
         c2mg==
X-Forwarded-Encrypted: i=1; AKwUvBzWr1E1ZRTujgKWdxr1IhFO2+k7vxsfW+H8eQNs/aGK92JqK0cYFWSy120xwJcWO96Bn6iqImAtKUvXNYhncoM6Ug==@vger.kernel.org
X-Gm-Message-State: AFq9FYKNfBLP12Ox6nWDGDTrhUMDHDHSoLnwpXk8de+DzCp9jL+FT8ob
	wdJH53AcKtWhTgEBNHavjE8TmPW7Q6CEifpUZMlu0tPtgZGrjZJ0noX/mb1YP4vR5BHDfDd1g1u
	nMPE+bm1p1F0757Lf1Slp12CQmD/brt8=
X-Gm-Gg: AYBFou1a1Ai4lWLzArUyZ71MU0cn84EqTpJJNXLF68rtOVIDj7UvioHz4zmgJuT/ZTK
	QQyKuv/y2kHEXnDUylaolQP9GOwMfL70OkPa+sRJLuGVD2Asy+9QUAHU80eEIWk8v1a2XNBr7Y9
	fKnx8/3XrYyg6An7IMnLHR4sGnol8ZcDw17nr9XkvSv0YXEdoWSY2B0kQ1L6HPPHoOWRW6UNA1t
	mfdjcMiJkepw+Dpyw9woyTIf8xkZ0AzAVBxkOVDh1cenOtgnp961Bvv3dpu6rNnriR1GErtN72H
	DOH6Nagio93HVTDIhlbPnQS+vWMvO/Q6zy89KzNEj7IOpwAmy3PKm7ilxV3HoJ50DkIpp+AH4Fx
	LYoRGPjgjlVnPKbHj9oG9PE392g+vA8hac5iRxTqh33c=
X-Received: by 2002:a05:6000:41db:b0:487:1c89:f158 with SMTP id
 ffacd0b85a97d-48dca3433dfmr21443506f8f.14.1791970143295; Wed, 14 Oct 2026
 02:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be>
In-Reply-To: <fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 14 Oct 2026 10:28:36 +0100
X-Gm-Features: AclHuK_hpJt3R0zDHjAZL75ikzTNtzzFWfnolY7PI7Bi35zqbWZzmjfcVJRiUWc
Message-ID: <CA+V-a8tpVEqJTKr4JS2aEcgr6yXzmh8j==x=+54o-rAyBwLrRQ@mail.gmail.com>
Subject: Re: [PATCH] perf/renesas: Remove remaining RISCV_ALTERNATIVE references
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:40=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> As riscv always selects RISCV_ALTERNATIVE, the option was removed.
> However, a few references were left, making it impossible to enable
> RZ/Five support (ARCH_R9A07G043).
>
> Fix this by removing all remaining references.
>
> Fixes: b924210f542e13c7 ("riscv: remove RISCV_ALTERNATIVE Kconfig option"=
)
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be applied to riscv/for-next, or folded into the original commit.
> ---
>  drivers/perf/Kconfig        | 2 +-
>  drivers/soc/renesas/Kconfig | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> index 245e7bb763b9947a..8cef4bdef76aecab 100644
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
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
