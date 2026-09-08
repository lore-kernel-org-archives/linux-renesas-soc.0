Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D7E533594
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868988; cv=none; b=BVQjldjsLLe13SyHIhH5c+ov7WJdvdvdmeu0K+XoVZooZ+fGz+C4zNRlRdDuFPVMphZmqHs2CBheIXikGPz/YT/ynndskR1dNV7HnJ5mbMfvsnBLPoSg6Fa64bjdrwSjsDG/mE4XdXVoZ9vFrJvDTUR7/uWzIx4V4KiQlC5iZnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868988; c=relaxed/simple;
	bh=1KjGT4jEmlgZm57thkTt2U42w8uocIKFVbOmxzSyT6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H74IXbUO70YzeDHYln0532oQIAT1Ooc/oQirJFGKm2ybu6wU9OOloRmcmBo+AeEDI0Sge/XSrjJWNKkhdmloI7JhUZps7WnccvSmt3+wpom5L9KxCVjknoqzFcNQis4rLwvC0AJ4rqfoEmNTEzv2zfBATQ1zrpEJ/KTLQaBU7i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c663437fe5so2004022e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 05:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788868984; x=1789473784;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2ewf6TAC6datJbrIguz8TlCYfKFGg/5aYhxsRPBSYo4=;
        b=OuPldwFM/e/l1IZusjM8jkcQ4INmzLGyufxjSnev5hl/laBtYy7+T+AfWZkEPm0Ib1
         9miURjuf0u+xrtqxF5aZIbuuXivj2YtTzePiPksEc8ZjO0T24TT4lr2yvBDqBxBOHMZA
         EZMv9H7UVkvmwKR2oQpS6vOjqJ8I9nk/vxAKQqD5K9qSF1jLFulk1rB4GY2L0Frn84j/
         jDEWMpEGvF7D+zO1YxWnLSP5ZQmIq7Z3Vf85q96cDl9IMBxYHZXMTrBguVQWmmrgLYbf
         Mh/uQ9VWjX5faIBnuO0lEMLeuKqlngzc4sJbUvNUyAIsTWRMym+t45dzhJfXrSWH9wwl
         Fu+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxQumIinVjg7qYFE7aFmxcWkMgZajDFlL8Mr3aenP+4GQ+d9dz6mNvSi00Kd2FYo84UXODzdMcbGGNLHBWR1SeYug==@vger.kernel.org
X-Gm-Message-State: AFuF++naF/WRXpCfEnnUefaVZHkpmqC0B+VYyRjK/K5CogJc9Ym0EO0t
	0LkQY6+Vb6bmLqCbBiJwmFypSZyas92jFH+Zwdt3WBYS+bZ3ROVnD/anzOnqMHl0
X-Gm-Gg: AYBFou0FJJoVhshnH7CQts2AZV9b5a2vxn/Tg5RNyky0OEIBheEbaA5UrXNzV2PxHrV
	IHl0P/wODNyC4v48Hz+TSs2JcEtISiJvMwXSmV1wYMoN5slLcHN8cTqFvjej3CReYuI47nz/kB4
	SSbVHtL0dqaxZgpUG81nUEk3MqeLLQpUQBQtX5gY0MaMuGqnynbCbCgBrN1qTHjBRWRt0ov9oMg
	9VRMZi/VGnHbkr1YmUkbuTuOyWc0ccFkVkfI6JoDF7582UQ9iknB9NbG9hIHOXWIEOOFGiIRll8
	iK4w8mtgtEjy3c4SSIquGa0E3n96V5BobWL8b4WWjlReAbOIP4JvGaTB9hCVwa6AEbdG/O01K/Z
	KHEDMPTfcUN99Im/XTP6SIC2IF7dxI9k1SwNVpmRFKdUjMVfXngmkrx229DkAEfDTbA99CjN8wc
	ow5fA8D5CMFhGDxf1u39Q4hLLoTYjHl0etxdDUYGVtye4fZkBtahCQQBqd3ESE9zUyv01Rbqcnb
	wKojQj2Ik/dO3SUet7iKa807iHyATDbPIvw
X-Received: by 2002:a05:6122:340a:b0:5bf:6bf4:b215 with SMTP id 71dfb90a1353d-5c7ed29e8bamr13546859e0c.2.1788868984340;
        Tue, 08 Sep 2026 05:03:04 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef7a5sm10062026e0c.5.2026.09.08.05.03.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:03:03 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-97e9fb0fc58so1127751241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 05:03:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx3jylqtgWsgF7LOtK0NosnXZCVLAMMYRkVlWilRXXqqKDu50yBY+zp1/A0jvCcY97wsdBFwkC3j7e3wjWrzUV7Rg==@vger.kernel.org
X-Received: by 2002:a05:6122:2187:b0:5c1:25d4:e29c with SMTP id
 71dfb90a1353d-5c7ed0b2b83mr13290597e0c.0.1788868982949; Tue, 08 Sep 2026
 05:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:02:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
X-Gm-Features: AcwNN1Ut5SdzvrXN_MrghHd3UEoZOGWpEZlnNMWeOIWmWWDEytJDRzefIJak2-I
Message-ID: <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 8 Aug 2026 at 04:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add a DT overlay to bind the WaveShare 2-Channel Isolated CAN FD
> Expansion HAT on the Retronix R-Car V4H Sparrow Hawk board.
>
> Current device link is at https://www.waveshare.com/2-ch-can-fd-hat.htm
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso

> +&{/} {
> +       /* Fixed clock dedicated to SPI CAN on 2-CH CAN FD HAT */
> +       clk_can0: clk-ws-2ch-canfd0 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <40000000>;
> +       };
> +
> +       clk_can1: clk-ws-2ch-canfd1 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <40000000>;
> +       };
> +
> +       /*
> +        * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
> +        * muxed on the pins allocated for SPI_1 on this CANFD HAT.
> +        */
> +       spi-ws-2ch-canfd {      /* SPI_1 */
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               compatible = "spi-gpio";

Please list the "compatible" property first (everywhere).

> +               sck-gpios = <&gpio0 10 0>;              /* CN7 pin 40 */
> +               miso-gpios = <&gpio0 9 0>;              /* CN7 pin 35 */
> +               mosi-gpios = <&gpio0 12 0>;             /* CN7 pin 38 */
> +               cs-gpios = <&gpio2 13 GPIO_ACTIVE_LOW>; /* CN7 pin 12 */
> +               num-chipselects = <1>;
> +
> +               can@0 {
> +                       compatible = "microchip,mcp2518fd";
> +                       clocks = <&clk_can1>;
> +                       /* CN7 pin 18 */
> +                       interrupts-extended = <&gpio1 25 IRQ_TYPE_EDGE_FALLING>;

Datasheet says active low, so IRQ_TYPE_LEVEL_LOW.

> +                       reg = <0>;

Please list the "reg" property second (everywhere).

> +                       spi-max-frequency = <20000000>;
> +               };
> +       };
> +};
> +
> +&msiof0 {      /* SPI_0 */
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       pinctrl-0 = <&msiof0_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       /*
> +        * Native MSIOF chipselect does not work with MCP2518FD
> +        * because MCP251xFD driver needs to keep the chipselect
> +        * line asserted between transfers. This requirement is
> +        * fulfilled only by using GPIO chipselect.
> +        */
> +       cs-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
> +
> +       can@0 {
> +               compatible = "microchip,mcp2518fd";
> +               clocks = <&clk_can0>;

Please insert a comment "/* CN7 pin 22 */".

> +               interrupts-extended = <&gpio1 26 IRQ_TYPE_EDGE_FALLING>;

IRQ_TYPE_LEVEL_LOW.

> +               reg = <0>;
> +               spi-max-frequency = <20000000>;
> +       };
> +};
> +
> +&pfc {
> +       msiof0_pins: spi-ws-2ch-canfd0 {        /* SPI_0 */

Node name should be "msiof0".

> +               groups = "msiof0_clk", "msiof0_txd", "msiof0_rxd";
> +               function = "msiof0";
> +       };
> +};
> +
> +/*
> + * PWM1 uses PWM1_B pin configuration for pin GP2_13. This conflicts
> + * with SPI_1 CE_1 signal which is also on pin GP2_13. Disable PWM1
> + * in case this hat is in use.
> + */
> +&pwm1 {
> +       status = "disabled";
> +};

Please move this node disabling pwm1 to the top, for compatibility
with dynamic DT overlays.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
