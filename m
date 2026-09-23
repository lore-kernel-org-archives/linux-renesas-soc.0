Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCB653B60B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176569; cv=none; b=nl/fZxMvR7UflCts8pxZN2mE2s/iixYT9PpbayBRldeRHQnzeLCfvfFQSaRyphGM5p1yZ0RwHd81oF1XDaOpozyEFes+bAN7VvOguIOObaDKAC1AMes2A05CzeU90bpPMcG8VsT0LEdnans4FiveQ5h79elePjtXR5D83WBPilw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176569; c=relaxed/simple;
	bh=4At2W+U2/moj7AT8T+hicJRX9oknEhtMUmhLAdjqwNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDv/2DOgU1/Qnkp8iiE5mS6Dbug1ta/dZgRGrFlK4qMaKqeyxLLFU26zUsBgV9N6pku5dfasnDfIyyHm0dG42zdKWW1zUV0qY+V3k7teYRqm+jxwzs0b8u1P9tYKXpNYEP/U/3a8jPnUPmJMe9o3EIkUgZgBLpweCGUbuJv4zr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso541056a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 08:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176568; x=1790781368;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cCnq/zzLYRUWzxPlHY5tjdaCgBAl1dYFcApPP+PgMMU=;
        b=iQnsL5uo8VmTBkXgg5c0wm/npI67PX/C8sPYel2idfDBYWpbYu+Fs5TEjRrkKFn6s3
         /0eJzaq88tiLDcui1nAvlOJyxZpv/G0fhuLssmuaS2SLipyeCjEjcUmYQgPGd3nclyr0
         mKkgb9B9vJMH3oIfiJyhCJt8YRrHfYwzDWcKVPlBbeHHKemP9gNvZ6FyngM/n3LIegH3
         UmlTCAAdWd7ZrQyM93EMM7rAygdpvhaGK7sX4G9M0lM6u9nWD9NP3UdnnxurXIWy3RH/
         MLfmNuqhV0Kh+uveXRH4rboMa2MQlL7SgGvF4DNlTeN5ReRqIjorF46f6Cm9RpbqCBnp
         dkEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyzoVp43Ew1bOK2uSaVokrfN3QMP4th0zshB6gWCZyRqBjXSK827lUqoWnO1lq73uV8KIpoz6uD2aFOebdYBf4hw==@vger.kernel.org
X-Gm-Message-State: AFuF++m02maVgcCfZOO/XyrdQVC6yUl2mrzPqqsrezKk6snOhaoHGIBl
	UfKxi0p1Wm3C64MXrSSGI8JYZJ72ubNlnst4nQL4xXtrD9TYnQgyByuVyxMCQKDYbrc=
X-Gm-Gg: AYBFou0odnj4Si+M1iKoWMiLdbXK1WFsaXtpSB/3zp+wXMCe2InaCL7p8yqSZNNDK0r
	jKgro+tWQY1V+1At0wdOCEPfu98hWi4deFNdbMnwbZyluK1A7FZSRWXfOvAohbZy83bd54JQobM
	D253DvsyigQx/AvCZtJm2qEeti3VnIM5oKHnQQoKsBBIfF19DzLJjsUbzulap3L0W0EldoGhNlW
	OngHCbmDZ7VZn4sYX1KK+OZ4PgGB5RxZNB+I/SX/f+lqWOAgpaCwJFNgrnJlwraB//mvC/4Kpc0
	WRIQb4TWTEuETQRNpX7KY0Abp1zt/A95IqeXxICsS0AOzp4jrHKUwsIO9CsV+tYAIQvNA6tXVYL
	Ru21GfJ012RSPMDdpiokCK1C9RuGrVuCt0fqQiK8ak/j1qDvgaasdGtC7FjcBaE/CQPxfwrQr44
	OKmr7HgZgD2hIJUJR8MEL5XYS8qS4gi6KsXEJoUCHDOq3ZiQhFfePTD+nmJjU8aRmuhGRVPDzxj
	b0oSkFutAuZAl0t2Q2fZFPl2FP9igAMw1wClw==
X-Received: by 2002:a05:6a20:7d8b:b0:3d1:be60:2816 with SMTP id adf61e73a8af0-3ddf7caabbfmr3335751637.10.1790176567839;
        Wed, 23 Sep 2026 08:16:07 -0700 (PDT)
Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com. [74.125.229.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d3894211asm1338955b3a.36.2026.09.23.08.16.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:16:07 -0700 (PDT)
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-3396cec93b6so1117357eec.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 08:16:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwfXgyH+rjugzaQzSQu1gKZGo598R5gu9e8qrDJJ0dvxGp5UZn0Y5vvBsY6vgQ4M15sIJjGEqwwECo4rj89rOH3nA==@vger.kernel.org
X-Received: by 2002:a05:6122:1d06:b0:5c9:a60b:e5d1 with SMTP id
 71dfb90a1353d-5c9f165640fmr3422858e0c.11.1790176255382; Wed, 23 Sep 2026
 08:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-10-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-10-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:10:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjRu+cPZo7V0jErowLp6n2xinAXtw9Pt=On-nshBH-Eg@mail.gmail.com>
X-Gm-Features: AclHuK-BF50Mc9e7D97YaSRELj5RHb8ahiU8YbPOF3bWrJ1zKR2oLG_CwN8d9Yc
Message-ID: <CAMuHMdWjRu+cPZo7V0jErowLp6n2xinAXtw9Pt=On-nshBH-Eg@mail.gmail.com>
Subject: Re: [PATCH v8 10/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2lc som
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
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2LC
> SoM [1].
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 100Mbps RJ45 Ethernet
> - micro-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> RZ/G2LC SoM shares SCIF2 pins between on-SoM Bluetooth and carrier
> board. Provide dt overlay changing pin function from uart to gpio led
> control.
>
> While the variant being supported here is named "Ripple", the overlay
> still carries the "pulse" suffix as it would fit all its variants.
>
> Descriptions for eMMC and microSD are shared with G2L SoM and
> HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

I didn't compare with the board schematics, but it LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
