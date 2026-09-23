Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6944154CF54
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 15:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176610; cv=none; b=l8xTrh0kkEBDDZcPYvbzTdm2kXGVYUU8y6PKx6jNB+1mIXxyovRNHGx04pCv1P4w35EDUPjBMp5maJGTePgigCIAY0OHOdI0WB5vv2VxH5hd0a9KASioP7oREmPYQFKle95+G50fE6n09EfRO07TRJZNf1BLeuCpdGMIvUjFnU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176610; c=relaxed/simple;
	bh=3CAD3EBkGvkw8ITbSCbAKxzYiupi8Enwarxa/dgYn1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTkGaSy8KWqx1rHLuCUdy1IGpUcHPMubVUdqnuLv1N9w+G5jXPVMPenaQYWUf6IFs7UEUHuqP2CDNJrR8SSf404+0oSj4StmfoV6X4vMNIbA9E8qEAC/xwIk828uVJcRRZ6wS7aybPYHnyRHIGk0JlLv9k2R37MTB3e6DexrZ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9851d513a70so438882241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 08:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176608; x=1790781408;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6YS2k2hncr+GFNhOluY330WU9W5Yzfq4y1ZEwqZxKbc=;
        b=GnuPsiP2P4DnVqr11MvPAD43yB792gX5lO/22zCqEFmOlt652j0MjpWo6nnyr0w/wN
         TfaOgEVyC1VlgyMD3WLUDIos1lJK99g33w+C4yks1KSDgaZoVwei9TPGASHrPlA0CPfI
         1jEbq1G0xZ9LE36iWd34k7GqrS0gunxkAJNHrM7j7NuA9GKwlKm06E82EAkSbLyIQRrX
         FOUmap7laTiOGVluJWHXya3bRSkERGOUAi+f+y48/iveBzxcInzT7rWZuSWyYU26Iq+i
         Z2xv/jG72FXARw3bnb0PPL2eHhPs1qVG4Kzk6YkfSRENHg5rNqGzKwweX6A7QRPFwW2c
         KzEg==
X-Forwarded-Encrypted: i=1; AKwUvBwYnCylhaDCmEIAj/1THriHgerTWwsADUf8wVFlameAR8FyRiMjxUgeonJCv5ayXGUfWGWvSy9J/Xg5+Pyo9Xql2w==@vger.kernel.org
X-Gm-Message-State: AFuF++mn2o0AvI9bmahWUJ9irqMwVLYT1Pi/TKc+ZUzyXSI4Y0eFkym+
	E8VkNUbflyOmK2/uS1Exbt5RO3nDGukTOaP6KvoqfpUpo/3+m+tU+7w7hJ1Ox9B2Ezo=
X-Gm-Gg: AYBFou1Hwy6JIIO4+4u93dPhTtAqPr0GY5mC0KRwFb0zEChswxkuoj2+XwcAysRBs+E
	JzRF8PtuYs3W3VWB91Tjw2Qizk0AUr0ZaZy8UjgDN5q5RH2HATZZrxJPOpgqcqT3boNsV/vixt1
	NRqEbPzDtZ3RulMBMF7obMOR9VEh/GhIB5poe9K13WuN/PnbWRTRc8CXiwNx2SkD60fshGpt3n9
	5BqHHofzvxBkvrzg8bYGcav11qHJsrItNn9ZG0j4AuibIXAerddfeTR2ndm1VKDxzTvWBTC7iGd
	5sLeiz+Cwr9fLYax8mCNTc0Li0WUtsj9Q7b/lIpusVNe4wp5T4j35FcrKgFZ6aUE3WMAnEyksR4
	FvW3eyMXIzzrUVZPP+38EYuu7JzXQeJXegpAz2QOoiIPtOic+67VtwpwZdVd2rpx0HZkNJNbPMA
	B1v15GeG6DVBFwAiKGSRLNn8vPn9LMoC05qVXoZcTSBjKN2bJ8llEnEmFztDyR/yOT/JM7K+I1q
	a1Fzlh1XNuSLXOddWuvPffGshi5lz/yonKhBA==
X-Received: by 2002:a05:6102:50ab:b0:7a7:198b:674e with SMTP id ada2fe7eead31-7ac1e35455amr2724357137.35.1790176608133;
        Wed, 23 Sep 2026 08:16:48 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9851e8c4f2csm1245017241.10.2026.09.23.08.16.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:16:47 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9851d513a70so438874241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 08:16:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw2GwXsKCulSZfa0x0lkNePby1YWoCs691S6dYIwLDDygo1CXTjzgJs1RVz/xyfQo+/0qNmNTxdc3BechZZd/0IiQ==@vger.kernel.org
X-Received: by 2002:a05:6102:f83:b0:7a1:f7e2:aae3 with SMTP id
 ada2fe7eead31-7ac1d0cb103mr2545079137.21.1790176167279; Wed, 23 Sep 2026
 08:09:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-8-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-8-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:09:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzDBMVEV7VP4JeoKFvbbYs6txYqHzw+j4qnvkKZJ3Zyw@mail.gmail.com>
X-Gm-Features: AclHuK9TWKX7_LFBBJY6lEHypNQ2_JvEQbFVziKurEpWXaJo034l1OL9z_ll5Zs
Message-ID: <CAMuHMdUzDBMVEV7VP4JeoKFvbbYs6txYqHzw+j4qnvkKZJ3Zyw@mail.gmail.com>
Subject: Re: [PATCH v8 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2L
> SoM [1].
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 1Gbps RJ45 Ethernet
> - micro-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> While the variant being supported here is named "Ripple", shared include
> files are still named according to the full board for consistency with
> schematics, silk screen labels and other SoMs on same board.
>
> Description for microSD is shared with HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

I didn't compare with the board schematics, but the rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
