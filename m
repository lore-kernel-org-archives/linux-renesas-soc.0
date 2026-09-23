Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E36F4477F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155490; cv=none; b=HLCu1dOVnasAwPiUg45BqWF9/BWX6E2LlSXSCfyX6St+wXTGUxjM6pdlVJV6VD6UrWh/P0Lrzzoaq1heJPA51zF4AvzmiaRGVXiunH6XCArcQa87aNkMlzh7ZhHSwO28RXUb/YR/bawv7eLkumQL+g3K/DGUttY1O+8zs837hvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155490; c=relaxed/simple;
	bh=giLw9ZC7rwC4GyqyRaXAh/5vOpDJdRZPgq8bl9w7pNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iS7SjytmNKIXGNc7xiO9aJuu3WF4zxmRbSRwV3pK2zgaY4yRuD4ghMSAPWSU3KcUGc+AG6Xh6AAKdqbQ7gbK0ejwCKV0e8y0Yvjn70el589lt4R5hi+kk6WjwEPcubHadKANpJ0vo78mLbW8d/mFI0zHcJ2HBkfCYAj+w3UYmCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7dba0631so258647241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 02:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790155488; x=1790760288;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kx3tronudNhFXSg3haWqBf1SOxfgb2tJlD6OgG0oOzs=;
        b=unCvW7W2NHH/HImOd7xyFC9Ozk3PcIgl12GETyNt1ecGrQVLMGQMoZ6Q9mShWFn48H
         joD+GZZ9FGAH6p+1EuBxkibUcJZKBIqHDpDtbT0f2yEVHUoTMGwQ+lj20xqE9t3e1wVE
         OP94xoBfgs0CnC10K6rAba5ypxP8xH1TvAI9k2Oxiifec6JYltwoKW0AE+/XTSpHgI6V
         wksmL7tysanfhWOaG83AGRTx5kQ6g6EJ8i//xA+uWvDh8Gh3AAMwAg6DTDYOr+b/IOjj
         WPfYvFVAcywnbPhgtWBczxPMDt2wWq5Oy7LydF4tF1ZRV9nymWQHJyUmei37xlPYlNtX
         stFw==
X-Forwarded-Encrypted: i=1; AKwUvBzvfV8fImZ7nXYNI+YC/8CwVXHp8VfPyyeFyqX+AqtwY1aYEcfvyP4Uo42VxyhYOh5GuFLd01Zx2bl2BcX+xw3l5g==@vger.kernel.org
X-Gm-Message-State: AFuF++miDOI29Ay01EcnvzjEK82p0tZwau//0eo5oPCdB65bgRMf3Rcm
	IKAnGcPaJDfbTydd+XTHKd68biqw0Cdm40bLW4mpnLsGZh1sdprzV/ucBToZJG5W3Fc=
X-Gm-Gg: AYBFou2kSc+FPUBf2Ba1U8u9BzhbItAAnzDJ4UJRl/ZkWIUX9ezreQqDVk00HWMYtXh
	cyJ6vk23NhlibY5jP7XwXfV9OXyqNZ1DGRIFwEymlyDKdDY30WlnTDFJ+Khbte4gypo1f29H89B
	a+X+uFZw763Li/Rj3Wk4I+GOjKlK3BFKbYPm4Xp+SYZDshjreBJ2hmLKxuZ129S7kWa/AIh18pv
	DNAGMIV6/DXpq0IgZC19/Uh/VdUdK7srrHtkIs85alvRw0vkhMcrCsgqDtOUYRSqYal0YWT7rKi
	I//fcmj6qYLC53+3TyidcmCSy9PTNZCbN7PbtIDfnQ0XGhk0YF+JXx/B1Wq0O+w3Jn6xU7Q1Jb2
	buHhSKUIDSnyt+ZNW1YQj7aHJ/qnFUMTUFdIG8D12aIlIcbG6pIBEJffm/8Af4Mcb1PlwAj02RK
	2yMaWGbjrNO2n52kFwjR6k3XSy91H/vy7l4exme/0jFUXhQyhlo1m57TFUgiANkRotb5dXkXnTN
	mSM7+YkSXQEneasw8UNMwerwally+9/gc1Pmk8QEv63Dcc=
X-Received: by 2002:a05:6102:8083:b0:798:8ca:3452 with SMTP id ada2fe7eead31-7ac1aad2aa1mr1809738137.1.1790155487849;
        Wed, 23 Sep 2026 02:24:47 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf5674f44sm2746579137.3.2026.09.23.02.24.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:24:47 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059fbso247468e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 02:24:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwOJc3czDz5l5U0BXFtXDOVjvEV5UtGgSXE9VEA7BKJtwArlUciLAfjAIln8zSa4DewFvTjz+A1n5tozQ/kBVGBgA==@vger.kernel.org
X-Received: by 2002:a05:6102:3ec3:b0:7a7:ce1f:6b95 with SMTP id
 ada2fe7eead31-7ac1aad345cmr2119395137.2.1790155487273; Wed, 23 Sep 2026
 02:24:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921131951.187981-1-biju.das.jz@bp.renesas.com> <20260921131951.187981-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260921131951.187981-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:24:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUQiOr1oetds27ovQy_7aYLEwc7GP_wTkokyft9UMy4w@mail.gmail.com>
X-Gm-Features: AclHuK_vMjP-0WXG5Enu7q8Kh8Ojjt6gbc3hJeq0p0vSo9g7mG-PtYy2Hv7jehg
Message-ID: <CAMuHMdVUQiOr1oetds27ovQy_7aYLEwc7GP_wTkokyft9UMy4w@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r9a08g046l48-smarc: Enable CANFD
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 21 Sept 2026 at 15:20, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable CANFD channel0 and channel1 on the SMARC carrier board.
>
> Channel0 is always enabled, while channel1 is guarded by SW_DPI_EN
> since it shares pins with the DPI interface. The CAN transceiver's
> standby GPIOs are conditionally wired up based on the carrier-board
> switch settings (SW_GPIO8_CAN0_STB, SW_GPIO9_CAN1_STB).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts

> +
> +&can_transceiver {
> +       standby-gpios =
> +#if (!SW_DPI_EN) && (!SW_SD2_EN) && (SW_GPIO8_CAN0_STB)

Please revert the order of the SW_DPI_EN and SW_SD2_EN, to match the
signal flow order.

> +                       <&pinctrl RZG3L_GPIO(K, 0) GPIO_ACTIVE_HIGH>,
> +#else
> +                       <0>,
> +#endif
> +#if (!SW_SD2_EN) && (SW_GPIO9_CAN1_STB)

Missing check for !SW_DPI_EN?

> +                       <&pinctrl RZG3L_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
> +#else
> +                       <0>;
> +#endif
> +       status = "okay";
> +};
> +
>  &ehci0 {
>         dr_mode = "otg";
>         status = "okay";

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
