Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB206331EA8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156590; cv=none; b=gjYkZUKbPcvGCKv7w9QyaizzgMwRW65Rq2goP66GHkihLGBExQiRzpaDNaxBEu4Evim+Qlf2scfgjLkc106i521qEQ+nG5dT8bbuyqJrNC0DxEWKhlwYQPU2OS1pO/YYaWtO6bgw7TPud3c4iN3ayHOZNC5Ikrr9XmodQVY0p7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156590; c=relaxed/simple;
	bh=kXRIYiD+xenQqUzM6yr57E7e+H4wDyAglPgjREDARWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZ+Hpf6KY+usDYe/nfROickTowsC0u5y45YBD54wfBnSypjurej4gYBOJDSRLT9jUifp4v03KQ5a+Qt/YjW919aB0W3WeBCC6nXCOp/TT5DojHMYxjVh4v99Fca3OdCH445NdUS/ulxb6uskM9bLnlDzSCvc09fIR+CVG8xtBdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-79028ca9371so280797137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 02:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156587; x=1790761387;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SiQX30aX3aRyR4XyZV6+3F+T8bea/FfKCnzec63MSFM=;
        b=Zc8Wl+QvNFbzLW7RT/4nDwngUw+mukuFPAOHzznQD2/tBeCtaAqvVO4KjkO0U6eP/L
         MXFdJ+iKEd/yrx8Xeu9ivLGzJ+5+F0pZxym+VZcTv0oifBfBCc8+gmDQA/JwG+jnlrkC
         mYEha5Sus63gvqN/dRCdl0o9AUqyRlrEZHqC9W9JglnNhJNI5py149m+DykRlWmLaqxo
         SwJjkC0M8OrrBzZ4mRi+yezy+E1rEyakTIPfHEaPLPu0T73qR7M1YMRUGnj1sdCGR1PP
         WEuT6eUkQeV1lkHcRI64mlgx8NkOnYMQ4bMKoQobqeUdmZeA664LTApcIyHy9S8KnY8n
         ppwA==
X-Forwarded-Encrypted: i=1; AKwUvBwUWt5TLTjLAu0Sd3xxUwOh+j6U5dULlBAP/R3ayYpoXfagmfwB6jfVnE0RQB/9ajTWomxfnLwrQ7gVAuCWwhto8w==@vger.kernel.org
X-Gm-Message-State: AFuF++mOu0igBmerVZUL5JFwF4RIu91t/I4Q+3eyPSzlvSl25NFuMEUr
	7ojvf4jERypEb/RcR4CHCOvOBaRuhdmnJxHSrVKzXfQORTEoxsgEYSQ7aoZWb7Kb/cY=
X-Gm-Gg: AYBFou23+9MEnD658e1j5xEOlG9TyeKrDrXQRakS6hIdE3EVbyCS2wLJ9Eyi59dmXlP
	heF75UQ6r75lJowZh2JVGRZM+b9rWrWKheKTnZUFbqdkXnERMmphmULug92LtBzzhQpjSrbcPB/
	6F/caGBxiPw1ZzgRTuvkns6FVwGVGVceCSw17mG4rK2/ItJ6oBc1h26Uez31gAqvQQ0BP1N62ur
	YXEDBCVAwDQRZA9n2DL0xL2GVMDbhHK+/PXjs1EhQyMrRsXKTP+/ozRQHrqGlrZObU0oknxXVBS
	NAsShVsYgcU2iJ3KxtMC8MGz2aECNhtkfyzElF9rcUQPxBcW+LjBCw8+FpzfrvXro6snk8AMAMB
	SU84S13Tz5zhb0LimpkGb//oDYK+qwpUkTJDm1G1kAUHjGEJfb+43DsU+r8wc64tPBSFQCNR5ec
	jet0XyCWACoTxiPHDClUws4zLSWSJ9VpUP73lsnJOIfrYSmZH3L3v8eUUjLSPr8nZAPg2n1671K
	L9P5LB+kJLxXCv7tVyEWrlJ13f32b7UrOWXLQ==
X-Received: by 2002:a05:6102:5344:b0:7a1:f7d2:e807 with SMTP id ada2fe7eead31-7ac1b71d169mr1636110137.15.1790156587434;
        Wed, 23 Sep 2026 02:43:07 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f052e2basm2451901e0c.11.2026.09.23.02.43.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:43:07 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e504d59so302281e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 02:43:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByPtrisZq8yVQwQKnH5ZbYM1ARF4dHOugL+SFlCz33iPEACVoPHbVI43N+kLOGj7WetWAvd+1njwqzFB/aQuKmKFg==@vger.kernel.org
X-Received: by 2002:a05:6102:162a:b0:7a5:d652:2e3c with SMTP id
 ada2fe7eead31-7ac1b41557dmr1905945137.9.1790156586853; Wed, 23 Sep 2026
 02:43:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com> <540fcb8ccfe7efd15844823c030f393efb536076.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <540fcb8ccfe7efd15844823c030f393efb536076.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:42:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWFUM7xVNOfEhCN08UgdgEu7ZAnkR8GDGgT4d-wg5TpJw@mail.gmail.com>
X-Gm-Features: AclHuK-GoN-PXrLEwtbZvvcfh_d25jq7EgJX0WCMepbHIeyPLfj-FzR3-jNoD1U
Message-ID: <CAMuHMdWFUM7xVNOfEhCN08UgdgEu7ZAnkR8GDGgT4d-wg5TpJw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 USB2.0 support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 00:27, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Enable USB2.0 support on the RZ/G3E EVK board. The USB1B_1A_HOST and
> USB5_4_HOST connectors support host operation only, while USB0_OTG
> supports both host and peripheral operation.
>
> renesas-smarc2.dtsi is shared by all boards based on the RZ SMARC
> Carrier II Board. USB2.0 is not yet supported on the RZ/G3L SMARC
> EVK, so disable the common USB2.0 nodes in its board DTS until proper
> support is added.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v3->v4:
>  - Drop usb21_pins.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
