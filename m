Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B75E446067
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 15:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534993; cv=none; b=j3tp9NyNDLcCc0CEPS3bHFNpl2dHibKsAdWirJpv/Vep/h/5FfuzmykirxynZOURtitYXLyVprL1oMwN9Fr+XpoZde8VDyvD7E9yc0CLoEdA4ax6InNUXq767ESslCkEWNAXchYpu/uh1us5jow95DY1Vs+dkBxWUK1CvhoJB2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534993; c=relaxed/simple;
	bh=3zmx8Z2M3ZeRzOKqpOgR2P10M5x7/5/EKeh+dHIiZJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JLvubNcKNRGi/sBneYMXkEyp8N/9yd5mh1YHRSc7nyjEs8ndAiKpG4mFZrKDZNg7BUZJ3iSCF+3hSd9UEJxYi3klfI66/23uAqAf0FNg81VPG0zy3zTDlbwAq4rZwPHORMZti7IG2pKx1e5kgujJwSMNRKJhjHHn7rZUt2USsVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-782af6c753cso1089199137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534991; x=1789139791;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VtnOZM9WfbSwC1inxRe0geJOr1JfkMHDy+62es74nYc=;
        b=iFY2a8n5b3xvXoau5RyxGMja7flCFX5dtiQ7fhhQgnRCnX9K/Fo4ZvroybYmKS4lY+
         iAGWJ4lkn9xL1XdQ/hSnpMkJV2+BofCeUSh5OakYE555uIJXhBpHcb5ce/8aMajbIEOQ
         5zRpLIauzWArWN8k93a4Xjw7JaFNIxN3H1WA3khq/uyxfeTZ4X7qmI4ncC91hMB4AyUo
         llplI4yeNdPDo/75J+lHPrZzLLhs3ALn1FflXXIHR2lQyoIjERjH5pbolVVQzBboR/Oa
         ZdwBdg4WwGILMkFdaUmMNOrrotkzSivpcNoLGfsatOubSTdBmpUlVwBrRjT6kXaDUB2p
         fB4w==
X-Forwarded-Encrypted: i=1; AKwUvBzJHPHgqZSxmrKRrnOLs7io5Kv9ZmK9k91gYy7o3mALHwPQ9H+WPmJPiJtu1ef5FBbdd3GtHP6YQvkigwRsLK2L6w==@vger.kernel.org
X-Gm-Message-State: AFuF++mWpWQ1WMHFyFy3CGWPeKeU71REwSBLK1hjaIvGD1U/cxPtdmZY
	aZC/sv/yN5qh5mDuOrXa95NpxHLUBMerFsRBAQkINl1FQEtaM1WGh03KiW79FR2s
X-Gm-Gg: AYBFou16Oyy5wnSGDSrDLMXYsTYS70kdcCO8wjS30ce8rkeU8xT5PLdk3jT2hSq9A+O
	RKt5eDoUHRd9eB7oSjoKlsPVXKHSprviWqcFPgLiPugk0sQoKLEveAyOay9FHgg+/wE5w0vlCoq
	RIVd41UizOLzgWYoA/7sCZ0g5STf/var+m4Q61h8zkAOJ/gAvZro+9glWeC3XBSwjSujrYhA5pL
	5B3BcZQxtDLvK5KT3OXWQ5PcyC0BJcjo6LDwd9UyPETamNwf2fCD1euq53bDsxXZX6Gks19OCod
	0Mb4Zd/ENLGa142ZCJ30DAIpdw3eABYRuwvCkVPf+UEXOInOrdaPJXnw1iLROWfBNf2Kyi6A+xP
	RnPXItznBRcshMWrm9WaxOF3C/NKA9tqo/9EItAumzeLeYYdeWMlHpe9Ij/e5gGZpnGKJ+KlRD5
	+sOMw4gfyoFE2guGtDJScjiJI9KCQhCg+iCDDV8emWjp88DG0Rc41AQ9oikDEm0bTm4ZvzyXAOm
	8uP3ol+VTPSmPwHAZUi76b2d+p54Q==
X-Received: by 2002:a05:6102:3e10:b0:781:1ac:8232 with SMTP id ada2fe7eead31-78a4a87907emr2894595137.5.1788534991094;
        Fri, 04 Sep 2026 08:16:31 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76aaasm2007397137.3.2026.09.04.08.16.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:16:30 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c66eefc868so1055206e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:16:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBUEDuKV/gXXqaFGgFQhmmQrtfV0zT8oAX0VMrAyVsOI5OXSfxm6c9HeoNoI0bTEKglrQBxKjhMIKgWPTI2ODmAQ==@vger.kernel.org
X-Received: by 2002:a05:6122:e189:b0:5bb:eebe:7ffd with SMTP id
 71dfb90a1353d-5c7ed846723mr3533958e0c.8.1788534988918; Fri, 04 Sep 2026
 08:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-8-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-8-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:16:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6GACqU4VTEk0hUO2A74RDmO3twMhEvkFAp2xiP=PN8g@mail.gmail.com>
X-Gm-Features: AcwNN1XsJHROGLoqiw2JCifUELiKV7YahAKrRzR2A5vM8Z-pkJl7ddzQiPC7x18
Message-ID: <CAMuHMdX6GACqU4VTEk0hUO2A74RDmO3twMhEvkFAp2xiP=PN8g@mail.gmail.com>
Subject: Re: [PATCH 07/10] clk: renesas: Add support for RZ/G2M v3.0
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

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC,
> including basic core clocks, and SCIF2 (serial console) and INTC-AP
> (GIC) module clocks. The RZ/G2M v3.0 CPG is similar to the RZ/G2M v1.3,
> however it lacks some modules such as the FCPCI.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
