Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA6E4E3237
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612063; cv=none; b=EpWAiWXrDS0vsNeyKiVIRBdzclGWBDXPQ/YoIZPC+AqCDbA/dOGvTbciBb2YxHhHm+vPZSWqq0TczJwn2hBqKPCZy4LoN2bRZh/EcNgd/j0poUv0TGjBfOb6EV4ttYlB+DoGE+gRS/YV8X8G+ppoLA7qi5B16JmSSlSRWp0BrUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612063; c=relaxed/simple;
	bh=LmuWqcMyTwMuJpgDZBWpwTFm9kIaObVYzEuR7y9gTcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9uMt9B9Aq2CQ/YLyJfwMMOdWQhEOgXe8kMDQg2CJ8cFv785gBuTbp2ZE5b+xPOziDiWut/lp73k6Wbh7hNPOd01a2x62LJmt+PzcdBBNK54QKv79PZfM1b4AivQqJyIoqMgM71cQgrSSdKkIVlOOvCIBQ49zJ21KZcl0Z8NSy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-988b3761477so167541241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 09:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612056; x=1791216856;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kDbgXPFrnW3qUuObWck9tBFMLu1xDmnvb5Ge11TXK24=;
        b=B7/BYDPgqiICQgKlsWAh+33ABFsCvuymkoSKvXS6IzkXvqSVLTX7Mz9ySKAfxo8LH+
         2HIWLJ9T+9KndShnDAb8Ol0bx0ac/vaUTydKv6a4AAAevBYvtXkXGDlv59ZD/7fAPU/O
         FJS7FR73mkK6PQHUGp7NDhwAVNdu+TrtpmPQb3KF1BX0vDSBVTQbaaDi0HBRTij+XKDD
         l6NaOTZ/ksLW5wfQhJik0IqnthPp9MiH7hyQLdY7iZN4dVidjAfFbwXSMwIfp4jVHOrD
         T9MiXpyQoU2YLGRBvBZzskxuzGQiNMvdv0Hgqxymop2AcimK2rOxQa99drS350fWF6rJ
         FgRg==
X-Forwarded-Encrypted: i=1; AKwUvBzqR9/TOCyU0ja9WgQ58yIo7NI6CNEwLaJBuMikxvl6AzEYMfz2AoXT218mEsIoAguV+Yda4sSpKyeA8fEDml6a6Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIelXtk82XOHV2BozfyHPpgRIGWRvjgsEVozHJU4y8zrppMZ/Yc
	cHJ/fsBo2+LeMTqCcvzoTvJ38fxnuUud7BLseNQTAdgpfbF2PyPl0blwitzCYLYBR1U=
X-Gm-Gg: AYBFou0wtJbAAckQqd5Q8HNhrhsLi9asVdRFZD6cIoHzWXMCKVFOUR6Eg5mLDUfGMOl
	I36GANdZ7HVM5tOwIE+4Zj6CH3YnxcCfexQEd1Nb0hNqi3mdxiNNhUp+/780gz3XrWJQK6HDKuO
	kjKfw9mh1Mn5U5QQt4gtTVhixOQ9O0rNCyadB6FoqMBuDWEl0/AJi866MUIwZQMnXZnlJ6jT4Fd
	SYHyUV8ZHSASKLF/eB8qEeljmUcVKE2dYmgdz+bBkD2aUigRaiXqvgp+DGs+3tVV49I+LPAyKFF
	dbJIELYwl11eVW5rt1CY3vMuA7kYxDm/GU786zauNIaOaSrs6N17OzXqF7pvEPTR6UjU9uFlj2U
	5/7xOC574PLqhhAo5PmKYVbmzBLTHu/ozSmMUY7N9f0jV7876nxPPkpWoGKTY4+N1rGl41QaN+D
	MIjd3pOzQCTo0l1FYmSSbOx8GnaspCkeuerqrHtsHjOFohvCEJRrEbjVp9glP/fCzUhCm/R+M3p
	RmZ1KGoWZrVdnDL5gVneINHEDfnPUZgCDg1sJccSRlWrpka
X-Received: by 2002:a05:6102:5707:b0:79d:f468:9d05 with SMTP id ada2fe7eead31-7af1c79f87amr4428444137.7.1790612055502;
        Mon, 28 Sep 2026 09:14:15 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b0b36fcsm7108211241.7.2026.09.28.09.14.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:14:15 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-988b3761477so167529241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 09:14:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzT37wTZNI0IvYYQmsZnpTbQOOoRngxeIRtQeGylnpu6YOf5+gXLKGHMwr1o9llHO8zvyugNb281o+y1DgBazK3Bw==@vger.kernel.org
X-Received: by 2002:a05:6102:36d4:b0:7b1:6028:5475 with SMTP id
 ada2fe7eead31-7b1602862b3mr1908825137.12.1790612054596; Mon, 28 Sep 2026
 09:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com> <20260928-rzg2-sr-boards-v9-4-5901e0fc9e44@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v9-4-5901e0fc9e44@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 18:14:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUC2yTTnciUg0RU7N2JCRT+fLeHf6dx0bWGfhfAytrz7w@mail.gmail.com>
X-Gm-Features: AclHuK_AjFWmrE4_ymPqY0VlrZBpkft59awZIm-1fGOKVExdklYpAhT9I-Cw7Wk
Message-ID: <CAMuHMdUC2yTTnciUg0RU7N2JCRT+fLeHf6dx0bWGfhfAytrz7w@mail.gmail.com>
Subject: Re: [PATCH v9 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
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

On Mon, 28 Sept 2026 at 16:40, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2L SoM [1] on HummingBoard IIoT [2].
>
> The SoM features:
> - 2x 1Gbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard IIoT features:
> - 3x USB-2.0 Type A connector
> - 2x 1Gbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
> - 2x CAN
>
> Descriptions for eMMC, microSD and RS485 are provided as overlays due to
> their dependency on configurable mux states.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
