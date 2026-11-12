Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496160;
	b=ewc8N164KK5WdiIBqKfkESSD8csZDf5MVuui5RvE9gCx3D5Ye+B3268MUm7cLYQKAhAO
	 Vu8d4uRdL87LUPzH7QKtTLAtYTLYKknX2yZelvjDzCZ1dW7UwYP71aNKzC3d+dyMcMCmB
	 1YY1vMbozgJljeZJA1CD++3Bz8CGOf9ZVeG2KXpEYI7AYoMPvm9Ar8xVCnBWx2sTdp2KN
	 cAraubVVxG18w0vFTSkHZ2n1scarCV8s2Zla5VXEsc52apVmE9RNMhppaqtnj/A7bEctU
	 DzMDX2tHdxGUEJI414pUiJFG7F8Mq409NCh2T0XNQqSSikvmhqcswB/6bZwyWwghfsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496160;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=f2HclZgC7BHSQ1+tdHxuenXtHwqaRuALZpayUv998n0=;
	b=tLY2bSg2qYKOcV+NZbWW+GNAr8RWu34/rO+UWM5dMxRQwO9xk7sPM8JXCTsleMCbeLUi
	 IQnVAWGn/otJdGF8L7KzXA5PFXYPH3Nn6YWcvsl7C1VP+aHK8f0m6JydId890WyTD5yCp
	 Ocye8B+PeAHR8CwxfJRbWdfw+mZBHknGhh17oazzO9EkH8AobvPr2WsEK+mGZglSu1zad
	 SCOhjQDyyJruUrcYJZylHJ6Mj7YBdfHSOGjrg2AibZbz468zAntTDAXnT4weE9kmur04p
	 RCSUixZ0fvTtnCa4donJ6d3Ng6zDVp+hL5eJJ9UHvI8FUBoLJp5qBKXdahXon4Z+sQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D546606A339
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 15:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D546606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso1055019241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 07:09:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496159; x=1795100959;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f2HclZgC7BHSQ1+tdHxuenXtHwqaRuALZpayUv998n0=;
        b=sCT0cYMN8hql9vRd1DqQKQkbbU1F8rhZrvlm+4ScpSqX17/WuTEwSs6o1Q6RtoxdLM
         KkucaZmuF1rx+XMmS+4lKV+ai1yHK9mBjBeDyI2v0FYP+MDGfljdxfWcrGaf0uM1XeZa
         WO0ToVRhx1wkc9U3T2ZlnD3nlMpySk3bNb82HXAe76RcyedY9KHC/YEA2W9C8h7F8uAA
         oUP5R3x3VFFOWhhqSHscqq4/MSPYq/cv8bjFhy1UPRzrU7QNAALtlR8C9XkluJTKJhe8
         HL9AESqoXsljssOr6eC+zZxyc8/Sy+2opVoCf+C2YHmHNMgypxdX6VfM/w0CwO1YNTc+
         JytA==
X-Forwarded-Encrypted: i=1; AL+hErGqfdN6tjm6D34W6d5W56FPmUS1ws4TzcesIzVC3mIbTE9SFYvScbDKy6+sHJVfM9sJbNnW+aOc/hKGTpiP9WbJIg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+jvHPlf3sCew2r2q05qCwkTKHYOAVK5ZMPOrZ2JwPotRw2s2RK
	gFb5ObAxz91dR1TlXv8G6B0s8PshxNPIhF/VCPBB+FTLcf0dVeewN0zFZU43AEDY1xM=
X-Gm-Gg: AYBFou1nFI1KPte8P69s56julLqEpjVxIs6A67cJIjJeYrLOFjPlrwc4W017aTi8ML/
	HoXYJa4ZMJcW0qk6hD5TrPOmA3yqSJb7DAlg0MnxITquIJFFwv3HUnciwCjERitLPJKUDurFOQp
	33mifVTHgSON0WmmXkMCZ6C3xAjmrviLhiHqlTiIsStxwZ0nlsjauf8FGHM+jD9HliymN+gOLHA
	IvGVRdV35fOgbQVmOG3F1mEKjMXZYDKFrIX4k0u2obl7dbZhi9cusx+exPHosmB/RGu6sM09GcY
	/7iKBavss9I4b7NKLlXyhfBx3zbsacTwdbwoTepL4Z70SkweFXIG+Dwa2aPtT7Hmp9ZfK4kUS6M
	3Zeo4nAJhbyFegIFoVzoEGBQq/SRrX8S0RzKexk7aZI8yaot7fYLjm8bQVI9/4iJwZbsLitIp+u
	TAzuWQjGC9NjCcQf8BNI47wHyiEn/gTImJQtOzdVF7hs23uBk+3KQcf0X+t1FArcsey0IJ/B89b
	IozjIX/ylkAUliAF45gFCj62dlPg6Nu3t5CVHNKJd43DLqGAejEvAk+vpt0XFuJ4F+bJy0T0Zmu
	X5PESq7hAAVj8YeFmjjD7/rnVu4NNkdjl4xUd+EsKXiQpLD0KYzIMre3OaI0HR+xAXyNtEI=
X-Received: by 2002:a05:6122:8f89:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5ee1c443198mr2299163e0c.14.1794496159385;
        Thu, 12 Nov 2026 07:09:19 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c200838f0sm5765435241.9.2026.11.12.07.09.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 07:09:18 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so1736288e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 07:09:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEd0dFoSZQ1fZlUQr4MPPyFs9pJnDHT3fr314vfGVat9OUhdUqM1BZlgFVQgwJ/KroBWS98Es4ccgpxpGOh73TOig==@vger.kernel.org
X-Received: by 2002:a05:6122:54b:b0:5ea:b294:f0ab with SMTP id
 71dfb90a1353d-5ee1c298abdmr2507584e0c.2.1794496158519; Thu, 12 Nov 2026
 07:09:18 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-11-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-11-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 16:09:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBEjh6YSazKAyBv8xAq1+oFG-dfEf=O58otP1wB9gRvA@mail.gmail.com>
X-Gm-Features: AclHuK9Zmur2PVIdNvv46swJ-VbufJjxD1dvyJf5R-d3EopJYyWzLSJYUjPuDQE
Message-ID: <CAMuHMdUBEjh6YSazKAyBv8xAq1+oFG-dfEf=O58otP1wB9gRvA@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] dt-bindings: Increase Renesas X5H MDLC PD
 specifier bit width
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:35, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> In the Renesas R-Car X5H, the module controller's power domain specifier
> cell's bit width has been increased. Update the bindings documentation
> to reflect this.
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> I'm guessing that the maximum number is now 512 but I can't find
> definite proof of this.

As the Module System Reset Registers are at offset 0x900 + l * 4,
and the Module System Reset Status Registers at offset 0x960 + l * 4,
there is room for 24 registers holding bitfields for 16 modules each,
thus maximum 384 modules.

> --- a/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
> +++ b/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
> @@ -12,7 +12,8 @@ maintainers:
>  description:
>    Each instance of the R-Car X5H Module Controller (MODULE CONTROL) provides
>    Power Gating for up to 64 Power Domains, and Module Standby and Reset for up
> -  to 256 modules in the Power Domain of each Module hierarchy.
> +  to 256 modules in the Power Domain of each Module hierarchy. Recent hardware
> +  versions have increased the number of supported modules.

Just change 256 to 384?

>
>  properties:
>    compatible:
> @@ -32,14 +33,14 @@ properties:
>          are always on, and for which there are no MPDG bits to control them.
>
>        - The second power domain specifier cell is the module standby part, and
> -        must be the module number (0x00-0xff), composed of the Module System
> +        must be the module number (0x00-0x1ff), composed of the Module System

0x17f

>          Reset (MSRES) register index in the high nibble, and the Module Reset
>          Destination bitfield index in the low nibble.
>      const: 2
>
>    '#reset-cells':
>      description:
> -      The single reset specifier cell must be the module number (0x00-0xff),
> +      The single reset specifier cell must be the module number (0x00-0x1ff),

0x17f

>        and thus identical to the second power domain specifier cell.
>      const: 1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
