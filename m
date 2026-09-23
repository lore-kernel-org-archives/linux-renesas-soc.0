Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0EB53B346
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 14:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174814; cv=none; b=Wu4+lQcqPMUmFqrInmfYDvRxa14Af6KvWsBZHRUV3c9IiWGeqbz3Td+DDt//ht3sRHRvf6rIIFr50OG5lEp1eimZjfcC551cDJ+/lZq1Dvs6Phs3LZx9DgrT+y3GcNJc7YJf9STm72lETbflcFW3+KLeIe71TlZb+aPw14RqZmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174814; c=relaxed/simple;
	bh=FXzg6hBNBXZZsScdwtGeM5Pmqbhre7BC03zd4cLn0Yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYBQdazDJrSSldo3BwYRiqOteHVLPGrusbJ3KgnXvgc2jpiJTddUEBLs5gbq0tV3je7pX94mE5YkaVJ43edXRY9JblxG7oxlu+nPOaS4f+p7/ql3gLhAfz9Sv4+BDB2d1xBIsAXoLeT/ib+EDDyuEqUi7IFFjNdlJIXnf5s5GUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7b4ed2so617922241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 07:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174812; x=1790779612;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ONYGJu27lrhOYpsTIFykGbM1Hkv2j9YTc036/0zk0Ug=;
        b=psPuCoFtawDD1XHqFbmct+ul/E9srAhtf2sZ5qeeokkS4ufpFJ6IcHzE2EnrXJcWtC
         8M3j4juz+Itt6Mxk9DrLN6g+2WhszGQOcu9JZWs8fm5VfbDJ5eyuXZGABBdeffT17UHv
         LpxEu+UdDqFEEnyW0QID0B/P7xGd2YxzEF7+Gh3pVB9gbSoZhdUu6MHdJBWPFhxreiec
         16phz+VlWNJFldrQ36fGubKU4um+6r/b3X7HmLbBTjkhItOG7PlNU6IuDH1MyVPg4nqR
         nG8uUN69O5L66c8fr9DBVurUQUhQ/2ZvdcigCgH9yJx+Snc1Do/rKSRoTYTbNPTDR4+E
         Uy8g==
X-Forwarded-Encrypted: i=1; AKwUvBxrZTEBgT/ZzFbxsMGMEX9P7me61Aa49IfxlP5WVHpCwm3nhJ+y3qzyw9/YpCezfrLajTTkMAx8dd8kzM+mrsitnQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k5WiN+PVWBAyR5gaEJvVNqE6b36Sgb/ovwvin4KszKBUOBovcF
	fus17qZjs48K14kAJ4jlIAz6Ajz1DoHDUIGfLBif2yQmD8m8PqG3Jw+mU9gqsp3tYKo=
X-Gm-Gg: AYBFou2dpqIErTaOMuT9PgRkcqxnVtS2fi/FpBMN3WXKtIe7hhjIAymjugjzKLkxRpk
	6+fZbDSNRrqTKtA/koJ/u4yny40FQ4yntObXXO4Tuppbj8ITHqrMrDv6V2ALldm0ueUYPYdPPtL
	gXG+3lc5TcK5yXAHcWMYGGSOiyntIfqEbER+D8H8Eb2T4NOortTeYHKaTSpBLJsE77L1NSzNl9F
	HclZPnfRJob68/BE/arIP/6oLMoZT9+CDanMHIWdeEu+MszCzz/WI5hk6XuOzXNPv+yUpCaUyM7
	0iucGT2kCtYoA3wRL8ESwy1M/nCHRChmz8Ra9NRvUWdRFqRl5Pxk+1zxphSvp91jSv99otP64/E
	yF9u3GFe6rlllrIK+6TnuROLjFiZreDsHndTlrfX9DhfDCyxObJ9YGjHDRMb8dN4+f9F59CJ1J5
	KNS5vxQ9FzExP5fTYZH7h7+c+ERRbb1tK+03clzTY4vSTZPFtGJiFNbUWVh9C36AyU0kTjZZuyN
	4WdpSH48pqiJF0nC9sDKkxyZAbAuI04XhYP7HLssKJItWCm
X-Received: by 2002:a05:6102:14a1:b0:7a7:7d3c:248c with SMTP id ada2fe7eead31-7ac1b9284c2mr2690510137.11.1790174811836;
        Wed, 23 Sep 2026 07:46:51 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98517a8ecaesm3193575241.12.2026.09.23.07.46.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:46:51 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9851d513a70so406477241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 07:46:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByXZRYP36zFagJthdR3YXUzI0ZpBB4kCEMxlKQEg3eTpb20iOcA+KALIceg3UiJNtHCSTwHcMQed0dE2ek1MC7HPw==@vger.kernel.org
X-Received: by 2002:a05:6102:5709:b0:7a1:f7e2:aadf with SMTP id
 ada2fe7eead31-7ac1d0cb10emr2412732137.17.1790174811407; Wed, 23 Sep 2026
 07:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-5-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-5-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:46:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWUt7w8Y=fmX2PtdJhZJ0k0YaKkoaC2ifx+LSYL5PijHg@mail.gmail.com>
X-Gm-Features: AclHuK_0TFDwROATeFWc5QcEb9bj6YWPyy6x8RXwybT5t7YWLi1_s9QYUiwmNRs
Message-ID: <CAMuHMdWUt7w8Y=fmX2PtdJhZJ0k0YaKkoaC2ifx+LSYL5PijHg@mail.gmail.com>
Subject: Re: [PATCH v8 05/11] arm64: dts: renesas: add support for solidrun
 rzv2l som and hb-iiot evb
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
> Add support for the SolidRun RZ/V2L [1] SoM on HummingBoard IIoT [2].
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
> The RZ/V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
> RZ/V2L is adding a powerful DRP-AI NPU which G2L lacks.
>
> Due to the similarities most code is shared, including DT overlays for
> eMMC, microSD, and RS485.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
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
