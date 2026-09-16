Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9349839EF0C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 13:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565136; cv=none; b=q4OKG+2yxZK/GN/rN929z36p+tzFMHNjv7y2ttE10PcTkOctGJCpUm2gcr/7Knt7V5OHIIJZ39SDjrqju03CiMgAhLlWE23/I6eJnwixk047kzJQkSMZCt9LlnujvH4zvoa0qEoKpIB83sHf47T27Mg4e9E8UINZl+pvuxaLF2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565136; c=relaxed/simple;
	bh=VaZO6FpC/C798PMj+SstywprO1Bb9VWpsfjFhN0hby4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CqAekFukQpZBTToBZNGcSNl9oCUdJkcVuve+8Ch520uC+CcDeYq7KAXcs/3PEprcKnZf+zxIZgrBgD4LGmxFJUUZDonqDrIndzAZZiAaumzd3l4XCDXA6pbJgyDE3jYCGAJHJEXDkQTxu8Vc2ETn4enJS0lHT5fu2Tr8kftlv60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c963a787c9so342031e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 06:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565129; x=1790169929;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=70KfOfVtjXROnDjC5Hg+f4UYV3SMq76n+6MTLdlSG2E=;
        b=WVpz+eDgKoMjpW93rW/ShIRBFQqCHXhbYSijSldVBPby/xntOfwbbO4assSCA/nm0u
         /KFvOsVKgXRTSC/dBHKdNAJhESBmbIOCn6hUMQ5+V3c9WrPElCc6E0R7+8aKj9XPevYU
         do2uLYt3mB6spOPhHoBCV+lN17kXg2M7D7ahBzbQSx3pZN2v4jPRxJL96f2ZwcDLYbSn
         g9wiY/KdM53QITZuh1qOzHBpiXbBn2FBJ77PBa1h/053u3nUh4GqeDj4X1EYruvNq81/
         F2mgXNVS0nrAAlGm8E1MX8qHy1X0D7apQAaYhOv5Lz2b8GfMamHNOUEwJ6azpRI7xdYr
         ztBg==
X-Gm-Message-State: AFuF++kAOJGSpbm3Y46Sc4ruOCgV05veW+hbewbi51o/XrjR/EwjCdYV
	Xxx1XyR2qT5Irxakyw5380pyEYS04nn0NdAIQqC+bsfSJYVJCIOrKnDI4+KNKwjRSFM=
X-Gm-Gg: AYBFou3ahU6LGDuhzY4HDlHQmS+Cp402ipjQmSyFNy3gWFTuPPXIH2KNJ6AGD0I9pdY
	I+tPg67GBQZ1LU3sih4NWXPpYfZBU2rEmeKYlj4sJDEqXUs5xX9I0sRj1i0u82ugNdmtAkJaxyq
	cNdipNpmMKGiv5lWUnARfUOkr73oHGOp5O3MZbuK6kkuowMrHaPst6kldYX3jAwFMQZjH9XkplO
	6KFyoUIhOwHZyAqFUEZr8tNlqiJjkUNmzPKF2ufeFzV6l4FCcZhjKbKdTWM3azXLgtws2h+zYR5
	nGb0gNtCiFKpL6NR/IPCS9mvZHnlvsqPBf10xrT0L2ysmwQ16NVhceshvf9Ezfyj2dQWtXhoSZA
	SEk8W74joPdzWM1fq1lRvLLMmXGbZtDO/DxHWqlVvLaaKswb8F9qz6Hf3WTfOVGpqjWHoFycHMQ
	uckAgfht+3FAsvE4Z2vejyNwy3kRHB3p6lQ55otSxPRzWkhe9+c1wwCTGebcDBnVkcSw4wFHHOc
	ifA2YniT7ZiQhamGnA/eO/S+ooeCiuQ6NXu
X-Received: by 2002:a05:6122:2986:b0:56f:6cc0:681e with SMTP id 71dfb90a1353d-5c99ab5599emr2703681e0c.1.1789565129138;
        Wed, 16 Sep 2026 06:25:29 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c998ab9cfbsm2628526e0c.14.2026.09.16.06.25.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 06:25:28 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5168ceso290748e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 06:25:28 -0700 (PDT)
X-Received: by 2002:a05:6122:4f99:b0:5c9:8bbb:3f13 with SMTP id
 71dfb90a1353d-5c99acfb6bamr2956169e0c.7.1789565128380; Wed, 16 Sep 2026
 06:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916102520.24288-1-wsa+renesas@sang-engineering.com> <20260916102520.24288-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260916102520.24288-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 15:25:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4kdESvFx5WSx4-YaTOY7jSFLQccmdwO34ThBfcKkcMg@mail.gmail.com>
X-Gm-Features: AcwNN1XaFS6p2vYEAlcQENUeFmrdt2wF7zxOMeCmx7cdZwqbLkrcHjWXnlR9UCM
Message-ID: <CAMuHMdX4kdESvFx5WSx4-YaTOY7jSFLQccmdwO34ThBfcKkcMg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: rtc: rzn1: add R-Car Gen5 support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.csengg@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 12:25, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> In general, the RTC on R-Car Gen5 is identical to RZ/T2H. X5H is an
> exception, though, because interrupts are not wired. X5H2 will have them
> wired again.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
