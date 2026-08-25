Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FB0426D2E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 12:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660606; cv=none; b=bXZMsa+PbtK9kGDrCqdtjyDNohDxCOY0Wn1+EiqQY2gHALEs3yK1rcBQ40VBqY7jQQaroJODrvftuEY6HqGX3SfnWH6fGUJCzKdtnDureSLCEu5xOWR2RYEcUKLeSju3WLG5RoTPRBFGgDVB5LTWg1b/pFlNzGvhTjQTGA5JGQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660606; c=relaxed/simple;
	bh=LOeXVgjlcIXEQ1tqGQ4m9pgLcIwtFwgr8SSVlIDD8fo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqCkWEW9xIm7z2WrIW3FA1y1JrXAsN/Nu1fFcqw7top05rCh+IGCj4yUfxdMwKauCUlYCO+IBp8B7hRnG/G2Yo/yOkBrrcK49mwt3QGk4jlW+6pF+KNVZ2mH2gNaXDnp/bZUEOuMmmK3NiEUESz1lAyZF708M/Vso7k+MJBdKtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-754ac74c495so1419885137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660602; x=1788265402;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VSaEplTD+A5C9DDSEOr1c2p2iCRAHpRcr8ETlhYSmI8=;
        b=lwrxat5QA1504ndu2n6Ru37DvcXlIQzCkpPE89As76QD+rDZlvs/ObliCmwZ3tlBL0
         CxVFzdTvjdZmuwGNcIpmIOkMQL0IZJUDpyrYBNzHkdmn9sCOPmyWdj/xkUAILEkOZpJU
         vP+H7aUgc1sPkbzUXYgU3DVhrT1xi8XTREf01j41BOUlLL+6W+OTlWJSxty81a8q9ONL
         +mrsezXkQcBy+HzALR4p3dPdADYnBNoav73+OY5+Xs+LPu4EWc53HYoiGb4omjN+iWV6
         mZdfsoGAJBWWbliNiDjm2ezAiBFJcJvr0v03wyCVdoh7gN01Z9T2gdgzlCpot+f70R0D
         UYNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMo8uuEtGmhovRscaeDbrvp4EPixv2a/cnAf7gt/osdHkEIPF1OKyd4my89caGAQwVz5UNxIB5LeGk7WYdqDDAog==@vger.kernel.org
X-Gm-Message-State: AFuF++lSa8QL0o18Uq/Z5rpcjEiFRjXyz/GmRNS+fulEUQPAncgCFE99
	RILo6zFnWryL7zKe4IGj2PQ5Gva/8iUAiweWkeGOCJIjnAsZWiUxUbiuak5cuiYruJg=
X-Gm-Gg: AR+sD10JoNwqjB8g42VS4MMHgMQratSFBRovaCj6P7T0WRBlnBnI9IrsWchaUXBIuhB
	5nD1ZjaEb7n/EZi7BU+bUWR7sZP1mJ863NXAui7YfRvsCxRWHPf9m3vzyiBaiffUMgzRqFj4XWP
	2+q7COgwawwC4cOfi3fNbe6fDHSkbKp5ha4lvmCVbz/vacL/Ru6357haD4PjtWI6XgurzTYOFhg
	5gfd3ceHwo7v0Uhsvyk0Td97ddYaNDVgjAJ/PL1P0xc91wl7o1mT7DPjdQxrpcHekAJntAa0BvW
	R2XaAHXWKYOPkCfQGkrF3Kl9hyp9hQUg6iZVniA7Kc4OLk1FE2acH20KMLG1Xoyb98/EArlGGtp
	eFd7MlsfBiRp9OsnJGJXEfhXSjs7KriY4kfb3/WLBhrQlJ3e8+MeEtkeP+1a4t9IFIG51udpONR
	gntDnfSVR10BM9gt9WdS0a5/qYgNbMfpDLfktsKEnmUQY3Q7VVgQoJSAnHDxggAtQTdkroD/NYA
	kIAMmTClSEDdzf95JosAap0zg==
X-Received: by 2002:a05:6102:2912:b0:778:71e5:45d3 with SMTP id ada2fe7eead31-77a6434e104mr9980573137.9.1787660602271;
        Tue, 25 Aug 2026 05:23:22 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c832ab30asm10176376241.0.2026.08.25.05.23.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:23:20 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-754ac74c495so1419870137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:23:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrsgKtgbtlBai3NViDeFvXjoqNdwWZ+z5wSHU4a1Xl0NmmsViZbwHz5mNEa7LfWfuBVBdNOcYCMh4gNBbnf6ah3pg==@vger.kernel.org
X-Received: by 2002:a05:6102:8020:b0:780:2dd5:cbee with SMTP id
 ada2fe7eead31-7802dd5ce25mr1216153137.0.1787660599476; Tue, 25 Aug 2026
 05:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260824075936.2904336-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260824075936.2904336-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:23:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0nnZNJwaPqhYJ05ECfQ-LcqcYQntE9kKnGNfae60zxw@mail.gmail.com>
X-Gm-Features: AcwNN1WjYRX8O6IrodLLxR7Yl56xuPwu0CaevncebLMlgS2jY6mtOAwxWyPEJUI
Message-ID: <CAMuHMdU0nnZNJwaPqhYJ05ECfQ-LcqcYQntE9kKnGNfae60zxw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2026 at 10:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable RTC support on RZ/T2H and RZ/N2H EVKs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
