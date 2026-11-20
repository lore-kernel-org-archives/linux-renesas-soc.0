Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179865;
	b=u5wPnATQszpxPu5bKAvDuY1K0Rvb8pGQ5W1ynC8j8SWkjubdrT/noqjyWrAzXdJs0DXv
	 tkwbhUc+aAIoiDuCG6uzyqbx9sOwiNmQ9SnxXglwiYvikbUXnoH1VzSNsvdBE2X8qiwxE
	 wrbiraXojBwhkv+kceMAJ3A+XvIDuTx32QZf7UNHUim+F42eioAF8jITTNnoF+KmIZF8d
	 KE+8aGXLjLYoaDwnUhhd5rpgiF1SFN7poewtmkowRR/SQnNKq14YnCVVtrOlegT4b0Xiz
	 bupyH6CG1N6zp7ir0cuuYDsgss6yqjLyNCs84+Mood3VLbB0xr7CufrkMjhXdIrSxXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179865;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+h9WanPVyW95i/jM7vLnjP8yYqwXvUbwgQl9DDxnzh0=;
	b=cuk+fbj/r8z6gOlhjEmdBWYbSRb0nQJl2s0bSJYwhqNt296XUTLJD646n/xiLf5N+U/p
	 m60SBY/NHKleALJUliBm0XILAviJkZQh9ynUeVV5aG8ge0+9zFx/6zZ/UUg76dnvsQuNs
	 jdrb5qe6h2PrZrxuX2e9GqNj/46FvAIid8hEM+ysJPSfK0QQfKWJh602mCQkbz2xBT8sb
	 h1jlMSf8cqNY1ItSaP/KuyabwsRgh3y5+0TQwrHSSi+DO40iPu6PbejWF36GPR1m2mF7d
	 h2W+HBWBHEg0uZmwbZ5cLtdZKGSoIfAjtxouGFOqBX94lHGurZjjvP8yNXekFljdHMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341A7606A330
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 13:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 341A7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b360828905so7060607b3.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 05:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179864; x=1795784664;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+h9WanPVyW95i/jM7vLnjP8yYqwXvUbwgQl9DDxnzh0=;
        b=2yvHnASP8aMIX5vMM6VoLGSuNI20e5u4i4R8xseBsiIRF+ag4uTPQNPtrhaz0BuLVy
         YINKrwb0SIyMWDmXM7om5mj49I0myViHNGe9GPwzQ4IQ8JAQUfeY4jvztYTKTuG/1SB9
         4M62Tbs53EGeNlUEgtwj9QYIvRxMdQWdPZ+kgsJRAQPjrXtNLcVCLODYsC5tVjDH0tXf
         pYqhGrsCiIg95nfRH3edBT+e1kGs41th6d5tCsJAwxYEeiqzgLdjswKFFLk4ZZUVHYyb
         9AJ3MbPZRo3F/4jRmozKcQeOlgx1q7uwkmiiI5XuOlvRBU0UT4o1TC1U4//+g2KMG/zN
         8BAQ==
X-Forwarded-Encrypted: i=1; AL+hErFR449+MixLeD3vuQMKOwKYnTFh6ANZ6ZRv6Y1AE8/UvMDQn6RTNwY7QeLUQy+RQPUzhJQo1kDCrWu0yoTl2jkI7g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8wAZfrKxPsWib41riR1yFXdk/K4DaZnT330w0qql8ejXLWBwmu
	goUsqgGyqwshj5v+fLGQpe0G+8bQLP03BG3ndDwViE4RGfyrs+R8IkXjDY0F72dX
X-Gm-Gg: AZFdTZdyRP4o0JRjKPfbk8bgi3cNtMVB0zD0QwtgP7wQNztPdMhb9heXCaH+kOBq4q3
	0GvQlw8/2h9FfeMjz4nLpxhueYFXTVBBjg84S+2UwuxhwVotaMNf0ZCaE/sdkKoszW7taw/N3oK
	miUWT69hh2jifuettFReWXV/XS1quzuOTxtgY00CGWzNEt0iNTKYFPV+RAhPY442Pab7QniCzuR
	OsIfSKYDi3oESj0VWW5kU1u1tHFL45Yu/2outXDj08ZY/wPeGu/3ryKeQvmqABU4z8licnjKL4t
	GP37Sj/t/7koynoKyhtKcbiAVT265/Bx8gV+6tay6csZF2efxW/SY86hdFMUesb+bSzbwMp+13P
	NGTKcVlF/+ZjM5JoqdtLRthlXEEuLeM3Dnc7zuD/GTJchJwd3k7WhiNlXLJ1UMjfEQAX0sPyeNM
	KoUesYwbZBr+JpB6Vy3LveljHtTmRr9663w720kpsRoAsbxq+zOLcOqaH+p/VJWsmOiM2WYXPha
	xo9fAHKySiqM3ycQ/SDZrZU+Nx9xovBPyAoPbsC50uWytOi7cGxA1oYmFMBzUvv8l0oDLyadZnn
	cXi2xux5HO6cd+Ljcxj1XmYcoS+n4yxqGtj72+gJoD2RhTCTUsEqIhIbJAYd+TT8AWQq6ur7PFC
	npoOmY4oczkZ8zEs4
X-Received: by 2002:a05:690c:c9e:b0:8b4:bd06:d753 with SMTP id 00721157ae682-8b520435bb4mr11383277b3.36.1795179863729;
        Fri, 20 Nov 2026 05:04:23 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b520309d3esm12680287b3.30.2026.11.20.05.04.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:04:23 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5ecd9a400cbso575106e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 05:04:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHjSsjHBaR2M7jtvIF+hrjjYTDRxxQ1/QHP/E/8QYaRizr+7ToAFhlfiqJ0cmPaMbCH/ux3G9nsB/+L8f5x37y0UQ==@vger.kernel.org
X-Received: by 2002:a05:6122:488e:b0:5ee:415e:3f41 with SMTP id
 71dfb90a1353d-5ee8af0e00bmr1534352e0c.7.1795179863003; Fri, 20 Nov 2026
 05:04:23 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com> <20261112-sdhi_rzg3l-v1-2-ca30b209615d@bp.renesas.com>
In-Reply-To: <20261112-sdhi_rzg3l-v1-2-ca30b209615d@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 14:04:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKe9XBEzJjGq756FBh_7KxWTm65zTzCYG_ciKeJ+pGWA@mail.gmail.com>
X-Gm-Features: Aa3M54qZmgJNvwjJpvCbf1Dypm4EnLng6ZEIN-JT-GreMyTUTy4luuL7Zr9nQ7c
Message-ID: <CAMuHMdUKe9XBEzJjGq756FBh_7KxWTm65zTzCYG_ciKeJ+pGWA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC
 on SDHI0
To: Biju Das <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 12 Nov 2026 at 19:48, Biju Das <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for enabling SD card or eMMC on SDHI0 on the RZ/G3L SMARC
> SoM. The selection between SD and eMMC is controlled by the
> SW_SD0_DEV_SEL macro in the board DTS, which must match the position
> of switch SYS.1 on the SoM. By default, eMMC is enabled.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi

> +
> +       sdhi0_usd_pins: sd0-usd {
> +               sd0-cd {
> +                       pinmux = <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
> +               };

> +       sdhi0_usd_uhs_pins: sd0-usd-uhs {
> +               sd0-cd {
> +                       pinmux = <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
> +               };

With s/RZG2L_PORT_PINMUX/RZG3L_PORT_PINMUX/g:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
