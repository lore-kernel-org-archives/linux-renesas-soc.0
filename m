Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0FA3BED55
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371611; cv=none; b=J9UQ0HrljPyLNV2YGGEcWX7H6ElFzO48rFysAOI8XqoB2FIT/qmSu6tkiWXoqzpg8J/AriMBgrYFdkVnF6F11hPBWMJS6H1jA275VM3iJegwDW8YrYl8pgwFbOSa9Cqv1HRj8aree4HSpgGvDFJy6g3ZxnzqCdLoEdfUneLnM2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371611; c=relaxed/simple;
	bh=LFVUV7tv+VXxprYyb3YnUD/Y8MYj5qklAjHaW/X3Q1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mSCjmtg5ypqoSvPQrRegI3TcuEwfrito8/HlwR6C60BjPhqY6UzND8DuppytIh0KSnl8QAFbxZQ7OcyxnJqRgDDH3CL7C38Pw3uNNfuyQDqZIxtGy+SPoymbyD7gLnfPwJlxxMZBu6Bgz+OtVWzJR2EYO1LDFPj5q/DO1V/kgCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-977258a75d9so1017434241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371605; x=1786976405;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+EdnkOjvq7HGz0vsFhTeBvomTLbOigrIz1VJsvzEruM=;
        b=WN/AC00PGv2xAQ4chUnnVDYrdHd/5OJxMC8tPKKjI5y6jerUfmIMP3jtx1W5QsPgjN
         vrzW2yWsdbSOML+9UAslnIjPgH33Tw61nDhj/esWIZcZUELGxb6UDwh4Yy1jf2rtZnQW
         foXc0WomM5cMkkQy8iB8ltcJXSRZv/PMM8awcCqz99qzD5nOcwDxTaR8cOn1Lap3VTFi
         uN//qS5QlUTrsb6EoK0V9C9dvzQaVjfgmxMkbv9TChSDt+JBEM9/IlC69N2Ry26GcYho
         SbO/15WLmok+dD1rxhFLT5sF67MfTMNAVfof97Zglaer8TJ1MiTtRm/LVw6NCGw/NPqK
         FOHA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0fBTKtD9Qdc0wStbocnA4KBlPTJRgaUKIJQBYyfUwcayRn9cvoHoEtynaI11uvrk+yn/DMOGp6KEuCC5UP1VHEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgm7LrgbjjKsfkiceiZ0h7+xnoPnKYGpzuyXWZqZEBd0WE6YIi
	XBrpc68rexghSJUQq5ZtBF39bZd4GqprKm8d/1H3yATlVdOReKWpexOx9NODABSG
X-Gm-Gg: AR+sD12nnAS7yBv1tq1ubL9C5niWKKMC/ny7DzPWqIANrF4MxiNYrDISuOrGxt3bJhU
	at15Cv8qjTm1IbyxgcDNa1/q3i5qITO7e4aiqfbSQmD0FtMZ0JMdKHpZV/k020LNSoMHBwvpKV3
	KTgjzOVp3t3qQmYdyVLAFMixjkFUJe/kmzMN2ek1+COb4AKTz6lyon0HWJbyTF9Qp3x0Ds5z2xf
	FfSd19HYEqD7bXR8qR/30HyEoIDhn/PD7TdK3cgudgoRLPZ3FMe8qsUhCHoOkvFL5qOxm7CItc3
	hRONfODiBLO/2HOWoaOckwvUYnbh2Sdj/tC1jIEySZbnh2Gez4U/RMViNb3jJI5QPqvvMIFao1K
	iGsfZsOOP2yTC7LsNf1Zl3ZNIV/7EgPOyax40iMPFM3OzeKWsAVO6IiJRtwFhvYSgpD5SEoJRt2
	kzjA33Rr3z73pZQm5ob5rtYL2ZXfVuH8vnf8Y1Yyg1WPLBVeJcSNgJeNhMs8w4KfPH0zA1Q4xQr
	rQETNL3y+ZMMeGl0rXxUcDszJwxAg==
X-Received: by 2002:a05:6102:3751:b0:74a:b492:3a62 with SMTP id ada2fe7eead31-768e6137d07mr517751137.4.1786371605037;
        Mon, 10 Aug 2026 07:20:05 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f2cbe70asm3769021241.0.2026.08.10.07.20.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:20:04 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c27e38ee18so937904e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:20:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrFhjw8RGDtDNZ0h9LACJsEvauWWWaZCin8OMwEADhhql8XQ743y7HU3+RKHXWRiPdOHKWPYOu4kR08zrhI+zjM4w==@vger.kernel.org
X-Received: by 2002:a05:6102:2ad2:b0:744:a3fd:410a with SMTP id
 ada2fe7eead31-768e8940762mr560960137.14.1786371603877; Mon, 10 Aug 2026
 07:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130325.11080-1-marek.vasut+renesas@mailbox.org> <20260714130325.11080-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130325.11080-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:19:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1soMQwibF8kr+K=aStvzRoouDyAms45U_WQtWojdDjg@mail.gmail.com>
X-Gm-Features: AUfX_mzmyaFcfAhDqolFSfcUlHhBbVcrn1RxopOMapmQqRAQ7qu_SOQmReL3jC0
Message-ID: <CAMuHMdX1soMQwibF8kr+K=aStvzRoouDyAms45U_WQtWojdDjg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: dts: renesas: armadillo800eva: Specify ethernet
 PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:03, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The LAN8710Ai reference manual [1] DS00002164C page 61 FIGURE 5-3:
> POWER-ON NRST & CONFIGURATION STRAP TIMING does not indicate how
> long should the system wait after deassertion of the PHY reset and
> before start of communication with the PHY via MDIO. Opt for 300 us
> which should cover every timing option, including the 16 us delay
> required for MDIO to switch to 25 MHz listed in Note: in Chapter
> 3.8.5 RESETS.
>
> The LAN8710Ai reference manual [1] DS00002164C page 61 TABLE 5-8:
> POWER-ON NRST & CONFIGURATION STRAP TIMING VALUES row tSR Stable
> supply voltages to reset high is at minimum 10 ms. Set DT property
> reset-assert-us to 25ms because the LAN8710Ai RM does not explicitly
> spell out how long the reset has to be asserted, but this at least
> covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/LAN8710A-LAN8710Ai-Data-Sheet-DS00002164.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
