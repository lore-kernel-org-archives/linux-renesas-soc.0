Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7148471278
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536579; cv=none; b=uQcFM0wq0e/eQZ35asjht/qEXjiY8efu0zWgtXlbrRHaMXtOC2o5O3WpC5F8tOGDpchMWKNSF6kaR1Gcu3q+7OR0Rvjv+jiQQENmZISQLQAYXk1ULrlSFP+7kFx6/lQSdJmQw7CE0etG5MmIFm4WyMc8ryKrPurz5j57F+CwWp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536579; c=relaxed/simple;
	bh=4bEAll6bJapZukrKkjXZtk1Cgl7yrbg5PsFtTRWvy8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0xrQTzQU3ew5J3z4RLal/yDzEtv4DGehykZjCwj9BqhJGMXKkUEcSd35NxD0i0IyavsqzRxYJcT5NjlHmYGzGl2QRKMTb8RrMfFMluCK0ZeKlI0A1DUSQ4bg1VlzWPE1ON5yivkzrmkqHzV94bjXgztJUKUvUtsJWZ7Ml7BubE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4b28d9537bcso973699b6e.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536564; x=1789141364;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hzE9a7y7ZZDe66bPxoXer0uMhuOeucoXHc9TRbP+CZA=;
        b=OSrOz19LdTk0/qQ2tFarD6QsckGYITyelkgvUInmwUeOT+ETQD9qGSPnADHxc/x/se
         HIfTuJlRLO6wNrPDgk/XQUCftKlymMcXibDPwLrxuCeaGjAjNCNaN2Jfc4mJTfinN0Bf
         nlxkkSvFArfZbB7jCnJoZUDwUHwqXJ+EuqyVp3WER/vVb2M7sJ/DlUMLzTWMInVHBZyq
         mGYBNGmQajAeDoATn3vdCR7udgmM4cT54SwL55yvIBc5Pfl0rqedi7CUh2ikXLOyhqXR
         BLAxtJvVboXZwE2F9y/CoPxle1k0TdWjjNgvPAy9bVDilHARPp7NzTMm8wcKShktQtt5
         r6eg==
X-Forwarded-Encrypted: i=1; AKwUvBzKXxhw124CrLTTfz2UZoIYdEI04eLpRxl5quPsuUq+RHf5fQMcIGeDmNXqaNW2/nOvmA1OlPvGoGgGVKMnDJbmmw==@vger.kernel.org
X-Gm-Message-State: AFuF++nqFs463kLyTPnobPSWcLPLtCj8lgbSavNCLavDXj7zRaGhPGFK
	nRx3wLg7gW2+wdK4jH0UWgi5KnKk8bolq3EDi5xaEJiGDAZ7HzjgAGZNy/goo1ZW
X-Gm-Gg: AYBFou1VlYIj4NoV1eHhICaA4u80zfhRX7WYV6l88061cgtsbPumNf1snnR4Ptva/kw
	dulM3Nf8zOvMFAYL3V7I8onMm+N5mf6nnQ6vxDE+Y5l+JQMAdqr7Yn7MJdYU4Mu+5N2ijqKYNUW
	csupqF8PqFo6BY9hEjLKo31tPk9WYaHSqeGbynJcvbEtPtjd3Fpndzw3WZ6Eqqs6xvqkCMiwCGz
	udqzVUVSmqJwkfZYunQGl1glyxWsqZEw/KOBPA5Q7e/+OnHgjYlD3GZCMapYhlIyz0w0XnpwHzk
	Fbux7HE1QVllq21+4hTTkQzYhLqH4yfhB88bG3YJZQ6uBV1u8ozkqjXCv9XTpzJ0mr1LmDcm/9M
	on8rRAEzzwzy2jlk/4ZVhjFoJ4fhjT7a6tZcz2TWl4DozM/PMNpruGUT3xuA6eP5D1zhjCoAtx4
	kiTD4Jl+g8bOpK0DHSyBLfMgf8EZZZudib8AkNFBD0VYmVkVmVUuYTOartxWRU0YXCoOZLNaaQC
	68D9VDrOR6FBEzzMNw57/6x8Dkrd2D2grlLww==
X-Received: by 2002:a05:6808:1395:b0:496:1035:1466 with SMTP id 5614622812f47-4b97a19588fmr2452129b6e.8.1788536563695;
        Fri, 04 Sep 2026 08:42:43 -0700 (PDT)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com. [209.85.160.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971240f68sm2550827b6e.8.2026.09.04.08.42.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:42:43 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-46ad7304688so2133974fac.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:42:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzDMvVjndYMvBpDLSGBO9fc6aKW4oDoY4PGKMk8aSVWClyDIf/skFURHf0Qg5bRuCvhP6BkuwNqlPz95zkox3SW8g==@vger.kernel.org
X-Received: by 2002:a05:6102:1676:b0:785:6719:abb1 with SMTP id
 ada2fe7eead31-78a2ef7b044mr2760248137.11.1788536188830; Fri, 04 Sep 2026
 08:36:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-11-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-11-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:36:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3uLdyr+VOW-_eN3QMFpq9KV-O3HQsKY6GPpixeQhcKA@mail.gmail.com>
X-Gm-Features: AcwNN1Um6XH5hlFEECJFpWec4doGqp3W45Z0eEeDzho30JjiEWI3GGf_1U5A2yE
Message-ID: <CAMuHMdV3uLdyr+VOW-_eN3QMFpq9KV-O3HQsKY6GPpixeQhcKA@mail.gmail.com>
Subject: Re: [PATCH 10/10] arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC sub
 board support
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Fri, 21 Aug 2026 at 17:06, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> The HiHope RZ/G2M sub board sits below the HiHope RZ/G2M v3.0
> (a.k.a. R8A774A3) SoC main board.
>
> The RZ/G2M v3.0 SoC sub board is similar to the RZ/G2M v1.3 SoC sub
> board, so there are already DTSI files available in the kernel. These
> DTSI files will be included once additional support (e.g. CAN, PCIe
> and ethernet) is added for the RZ/G2M v3.0 SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m-ex.dts
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0

GPL-2.0-only OR BSD-2-Clause?

> +/*
> + * Device Tree Source for the HiHope RZ/G2M v3.0 SoC sub board
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +#include "r8a774a3-hihope-rzg2m.dts"
> +
> +/ {
> +       model = "HopeRun HiHope RZ/G2M v3.0 with sub board";
> +       compatible = "hoperun,hihope-rzg2-ex", "hoperun,hihope-rzg2m",
> +                    "renesas,r8a774a3";

Please replace each group of 8 spaces by a TAB.

> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
