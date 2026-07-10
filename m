Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035273F8235
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677329; cv=none; b=IMT9VuCWZKMLbBdes1oma477CC3TVQaZhBWn7Cu6LZSoPMi6sXeFjCmqfUaiS5yLcZ8/wHQi1HmkVXj1NZptVK5WXx3JlHyxscnak8c2GV3TC+eVaKL4H9GMLmEH5FoLB1oSUot+STwSrd0Hb0E7nYUkEHNvwfP6CG1lKNkeO6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677329; c=relaxed/simple;
	bh=IQCTtQNW/hKXRkFnI4RcyXAnrgrs8DL/pT0BVeExKWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAfMcDc7EddModBoeV2QBALKrhUzlykmlIxaXIDWxb8hdkqnFEF8nbVfnKkF0841UNDwKYxUfZwllF+DIMgEABDHVMJ9XTe4yT1894srMlqMWiodL+CZ1g9Yu/vhXFmm+/Nl7nFwBXkposzJkpf4S2IzuYoxVHKYKec/DOjPIV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-96925a563b5so607878241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 02:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677327; x=1784282127;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xjx1ETi0pE66yaW23Sda3TmvYDKWG3Oq92tmDl3ve2Q=;
        b=ELB+N3dN9GD3h/DdKkXFN1Bzqe7nnT93mYZy4ob9twagrD6FR4xFlptXwzs0BMq/fT
         wIkqCn5KJbjoQJVcEdrBFR45ZcpcIwUIrxP2CHfyD4BsyKqCXLeu/ALc+3lA0DpVugEa
         vonO089iD9vTu1MQVp1te6Bu72JE1X+xfZgU9duv1FwBMDPdDS77TseX1WHLB+cb5Pwl
         cKcCYKBOAjlrqiYmqiAkwoEyVbT8HQom7CRDxtoHly+PI1C2YdsS4cPKjKDDAT5JXsup
         8zDpdgyAAIyI+trA/mSx24mLdxLHT7Aut0VQCbCEkEVXM+sckrCFyT3GCicF4ivLLGpI
         2fsQ==
X-Forwarded-Encrypted: i=1; AHgh+RojJtlK62ks8SlB4MID29ofq3UMsyLBeiKhKHsBpJzoyp3D8Fe9QUX6GmRJ/oGnE1ZEWvAamy4ggoRyHFjpf2UDog==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxl0XjF6CR9HrxpsmDc6jZlSAiZQTJyX2+kLZjceBojFO1qUT+
	Zk/C1cZIxFNErC4Ec7vQvLgIU3iNyxJKMfCsP2paSoZ1gpRk36YB0ZrVWydX488QZMg=
X-Gm-Gg: AfdE7clGeLLXA318W8zjIQRdYqlVxrcp4Mp2NFc5ahKiaD0lvjUKzCvEbKYGo8m4hnE
	Ddpq9DLIunReKDfwST0snUv72O8TR6aAWTvm9hHZ/7PBsfb8DfxTHdz2O+Ffr+5V/RsjO4XknNb
	M4R7G98hYLm+5dPj2Tj4rBz9PupWx3KSqTLOKXVv2RI6JlWLLakS9szzej/G1p790b90Z7OxNFM
	PXWCQG5PAGDyDxoCCimeIXyVhyroP4pqLbRoI/e2OyqLaJHr7GCaQqFSMv0kasgWIPLKjV4W5El
	Sus1F0bsYTkCLzaKdhQUqiY2sO8nKZxojHjgyvq+sUjKr6wNFPl8Ib/+MWNl+IcGmRxYp6HyVEX
	1jn6vbhJ3k0U6FPoMSqy/XxVrr1UXn/123m4zr/nGHeLC4oJ+3GmwxlyHhfFnHbZJ1/wux1qE0T
	4/EWrglKaoyYz6hG+GMGWbL4rhDC6JgrWcECCfeBYrIhbqRymv6vsbIQOfRqIf
X-Received: by 2002:a05:6102:14ce:20b0:738:f27:43fc with SMTP id ada2fe7eead31-7450c6c1a3fmr1267585137.2.1783677326936;
        Fri, 10 Jul 2026 02:55:26 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ecf790293sm4181070241.0.2026.07.10.02.55.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:55:26 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-73a8ac9cd52so484308137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 02:55:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpt/FEIctHXC5libR8Mcr/lzkCsr34D960G+qb7tVTQGjGSs96BoIUYd69Z+cu2bVGGXq4qObpZD/D4ny9HKaoLxg==@vger.kernel.org
X-Received: by 2002:a05:6102:40cb:20b0:744:f2bf:44d2 with SMTP id
 ada2fe7eead31-7450c6bee09mr1250670137.3.1783677325709; Fri, 10 Jul 2026
 02:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709221245.146406-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260709221245.146406-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 11:55:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBJuN6ZJzTMU_Ww7ZUm2Apmp_AaubAE-My6DK334pLPQ@mail.gmail.com>
X-Gm-Features: AUfX_mwl89Zp9wNyF-c_GbFzjrveXMEBWiOpAsRGPClNvXP8eS2mrd7PvQf895c
Message-ID: <CAMuHMdVBJuN6ZJzTMU_Ww7ZUm2Apmp_AaubAE-My6DK334pLPQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Fri, 10 Jul 2026 at 00:12, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The DBSC5 DRAM controller protects DRAM content using inline ECC.
> The inline ECC utilizes areas of DRAM for its operation, which are
> in the DRAM address range, but must not be accessed or modified.
> Describe the inline ECC carveout areas used by the DBSC5 controller
> on this hardware as reserved-memory, which must not be accessed.
>
> In case of high DRAM utilization, unless the inline ECC carveouts
> are properly reserved, Linux may use and corrupt the memory used
> by the DBSC5 DRAM controller for inline ECC, which would lead to
> the system becoming unstable.
>
> Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -107,6 +107,47 @@ tee@8c400000 {
>                         reg = <0x0 0x8c400000 0x0 0x02000000>;
>                         no-map;
>                 };
> +
> +               /* DRAM controller inline ECC areas */
> +               ecc@10cccd0000 {
> +                       reg = <0x10 0xcccd0000 0x0 0x33330000>;

I think you do want to include the 64 KiB block of unprotected RAM in
each region, e.g.

    reg = <0x10 0xcccc0000 0x0 0x33340000>;

While that block is usable, it is not protected by ECC, and thus can
be subject to unnoticed corruption.

Alternatively, you could put these in separate reserved regions, to
make it easier for users to re-enable them if they don't care. But
those users might want to disable ECC completely (is that possible?),
again suggesting to keep them together.

> +                       no-map;
> +               };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
