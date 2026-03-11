Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6DA3C3450
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 14:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239688; cv=none; b=nYySZoOpldDV0SUvYlhTVY/PQnjQUeiD64KNlrcObXKAP3Ns3BTfxHArY7n83vqm2A4m04LZdWh4sUkBWDbNaE0cqnA8Si3aE2T9iA/qLcqDQKVGv11S6oxmQMKelibS+JjCO3loCgjK7T8Yoh6MnwJBqNWBvTKAcpsgcnGuKKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239688; c=relaxed/simple;
	bh=h0DZuW9sYYcJamuzoLXZHLvqI13ncnNrtDS51eDhLzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RCaCCbV9zP0ilvToI0TqjSLKU49SWWf/wj58/QJhUm/RHHb68tWwWDkNsB5wxi+sWI/aH8KYTA7g6mkJa2Q/3dHn6Hf5NBaN0p3WZh0Eg4UenMW/Fdgp4ehtNGhxZCjOSanJ0QYvwqYrSbd83bKOLAMRM2b0flETbiS4Ph4KRhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56af41d1e0bso2857130e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 07:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773239686; x=1773844486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/8nBsnGoOuvPOKFHrGieQ7jCFEIsrq8dvQknaSfKDE=;
        b=aJP5Wj3OWvOM315qcD4eOVZRCAWpHUsjCkYhLdgvGbqlojOOic72/Lvnm6TEhqxJQY
         Rfvi27pJR9A78HdUGOEoQlcObTZXbHgniQJ0gvDjXpzK/o4JOxJ4mEPcpVcOv77VBjHt
         Z+4q9jzdTbby39U83cl2XI3Y0iqfJ0hN0y5EXAhU2KNx7tvLkQBGXQ7xoZ+OHS3EKuyI
         mraJyI9mcQxHTecQmEKUSGXwIyCqSSgrcDwYlA+pIF2QaqTiDjq6zmw7WS+HR60vY4/K
         DGhwVQu9LgOjLTwRYzwkmb6Ek9mAotKvHQR9EgVtOS4ABZcozJOuxpRHPJnBhuR/lJEU
         /f7g==
X-Gm-Message-State: AOJu0YyO4/Yt/YCTmiaT9HKy4GMdehn6FRovI2Cc+57U5v2Je2CChuTE
	t+Gehwz0+BCQVBEWPde5jcMl808Gca/M/QRUiFMa2YC/glpx6JXTa0M4dz4deWPeHW0=
X-Gm-Gg: ATEYQzyfjrFm22LaEVvYV4ma5V+1V2PVYJCwa/IxkyqUxNwvLGF8IYqjhRNaqmYz0qa
	T8i/O507Cg+y95qB78JZzo+V42sfhICPYMObCoC+F7wEJA8qXfnvo9MM4eOtqtzK4qSA0n8VwCr
	fWN4poM+y0doCLjW+uX69cg8tvUrn5iRpetrFOpInxJ514nzlAZqpYqZLIuFV6gn+Lua/3girwF
	nGr2yiOVb8TiVjK8JEtrJrWjOuCAkowJrCvpgVReDMa0i4UZArrjGRVRBA2DZDQhgCQDOaqAtbq
	Lqul4m0TcxciZUBP5J1OUFbteMwWB7DHNDNpcBTBkAn0jF6bll85VO4yV6G9n29NYnwFIhWVZjD
	iCQx+Jp797zPP/WcVGZoHzOOwpBF2+7oZ209Tmpq1Pc6Oz/cQtOpRNecJIB5TbpxKYetWG9dNnN
	OSfzmNZsQk5wrR+cmjlxIBhVilgK+8DyuPdNzBvmFSu7CAIBmf22zFnWLEeEMX6ldn
X-Received: by 2002:a05:6122:a0a:b0:54c:da0:f711 with SMTP id 71dfb90a1353d-56b47483858mr856774e0c.7.1773239685765;
        Wed, 11 Mar 2026 07:34:45 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b464a4235sm1045646e0c.16.2026.03.11.07.34.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 07:34:45 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56b49b943c1so277577e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 07:34:45 -0700 (PDT)
X-Received: by 2002:a05:6122:1dac:b0:566:36e7:8934 with SMTP id
 71dfb90a1353d-56b476770ebmr874061e0c.16.1773239684796; Wed, 11 Mar 2026
 07:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305221939.32643-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260305221939.32643-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 15:34:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVFsxsJW46Xb6BSXztAAvXqBgbD6N7A7jL_Xc-FEBCnVQ@mail.gmail.com>
X-Gm-Features: AaiRm51mmgYpVi1_pO89qn1P3q9K9zLqFKfY7oYAMzssuYebMabvxkW732abDY8
Message-ID: <CAMuHMdVFsxsJW46Xb6BSXztAAvXqBgbD6N7A7jL_Xc-FEBCnVQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: renesas: r9a06g032-rzn1d400-db: use
 interrupt for Micrel PHYs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 5 Mar 2026 at 23:19, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Make use of the interrupts wired to the Micrel PHYs via the GPIO IRQ
> mux.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> @@ -256,6 +268,13 @@ pins_cpld: pins-cpld {
>                          <RZN1_PINMUX(122, RZN1_FUNC_USB)>;
>         };
>
> +       pins_gpio2: pins-gpio2 {

Please move this below, to preserve sort order (alphabetical,
and ignoring underscores that will be removed soon).

> +               pinmux = <RZN1_PINMUX(147, RZN1_FUNC_GPIO)>,
> +                        <RZN1_PINMUX(149, RZN1_FUNC_GPIO)>;
> +               drive-strength = <6>;
> +               bias-disable;

Shouldn't this be bias-pull-up, given the pull-up resistors R20 and
R78 on the interrupt lines are marked "not assembled" in the schematics?


> +       };
> +
>         pins_eth3: pins_eth3 {
>                 pinmux = <RZN1_PINMUX(36, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
>                          <RZN1_PINMUX(37, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,

The rest LGTM, so with the above clarified:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
