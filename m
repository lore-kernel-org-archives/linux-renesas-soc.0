Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF76755820D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873936; cv=none; b=tq/Z762UQPYaixBh6Khuez2+soDuJZPaV6Xxx411OqpZMqWS3rp4afnI8tnFsDgq/ZfLvcPiENoMh5jdHts46YlQ967HWsKl+Oy1x0YOypTwMsNqQRYDQtyMrNh8otXCgOyJRmP75CfQ6mTX3rItVRsfgLoVnvGVy5utUwRnIgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873936; c=relaxed/simple;
	bh=f0mYgq709TFCq8csPg+JrqYq4OhaJnj3V0e2EFq9Hko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRdVpB9CXj0mP6/J6utl/e0zNXe0sdFoSKytoUsK4ZN/tkokvjEvXz1syU/SnbjL8AWOYNXCooGzjP75lXzqidHVaQ7nH23xMlu88be/LHaPWXH8VzzmiyGGPsc6tgj3r3Pe9cwmTiWULXvmyxFQj+WIlJdXNaFhYWrjuV2NsI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97e986f1996so1100431241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 06:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873922; x=1789478722;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+pD3ZYpu7WIufaA0yFsTdMjQPCG+yEiYTTg9rhn0Xuk=;
        b=q9wQrriqEqstXDfLu5jg7WWBp/pA/emeRM+rg97b6LJVZLOu0WV8j8uO4PELgGRPOr
         P/fk85+e9+z/zjOxlQLW0cDkF88tunGtMAedXeuBO6PnWxVXr6OPMFCsLwAZpQQxuw7T
         l28hTPA7fjxOt3NHl/JMcEYmCIvpcX04AN2dWeaQkJ8u2hfoQ+Ne98lf1NiZK8ythhC2
         xiC74E1S3Wm4+Rq88FuOPcF2UFuvp+Ntw31Lh86GM0jxwyRWeIA8A4ijnDHZ4Foy177a
         h1DJd74yJPYK6FFyMHEtVICs360huNmVe6UkklRg9sB5uXAX2wnLzCEErdmcQ6HlIt0X
         CUqg==
X-Forwarded-Encrypted: i=1; AKwUvByDblyr5JE846DrqZ0jQek8ra0q4pTr6FFIkGlIpJDNfCeM+rv96ctFo4yKZzTXtG/MuTiJotcxeVYyiLjpvHQfEg==@vger.kernel.org
X-Gm-Message-State: AFuF++k7Q5Aj31CkTHBn/2uwYV1f+2qQR2JkjlD0WsP+Vva5ARjXZldq
	f0WQ0SRpx8iIDIX/FVw5auaukG7NOQx3/OaFG/HHl6lKPTf5FfjLMPecEuUXL3eY
X-Gm-Gg: AYBFou37zsTGti52HgfIBNaNIVkMIQ+VCAzv8dcIqjFOVWXMx48syf0kK25aoG1HwXn
	3BW/Q6D+U8jw2+B5fgZI55VBSA13Ig06/J2tWFWYlLnD5lkym6F/eYR1n5ZUw7NP22adQg1L/ut
	HQuhVATrfvx5s8h44SCcd1Au5JxqQkJ92fqX4OZ9o1vtQYjFnSvCr1ebuY2ARy9nPg+0rWHS8D/
	vnWj0Ke7BYSWyzSL/4gqOLNSRf3+t6oQl9aQNojzcE8W2cnUixBaczw0xQDwtgC4925p/HEdFnc
	QBykcJkalZY8y6ioiBxZzT6vJCQRr0+cVt2CGveBOhbqWCiPFFnQ6JLzPyAYUbOgq6RgR5twBJA
	VqjQ1ETgDRi6Jtfe5/KnVpECp4gciCBkSUKOW/snoKAKKKm11MqYCxXbTJo94quKZBPFU5zriDz
	0l2Ki7PKhL/S3Q3L+NY8M3wc5qhi+sutCH5wZbYaCpHbWO06uJqNa1dEI6LihvNzrPWovSOCrE6
	dCwB2RCdvOvkMr1SnHiwWC1r4PCmMJxiw1fiw==
X-Received: by 2002:a05:6102:5814:b0:786:b28e:f980 with SMTP id ada2fe7eead31-78a4a99f7c6mr10938241137.10.1788873921882;
        Tue, 08 Sep 2026 06:25:21 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b19369sm8765251137.9.2026.09.08.06.25.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:25:20 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-777ae5e5caeso1363909137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 06:25:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy/e6pbxN5yaoq8nR6JXlKpkltDmBKXPZDWaPpmgLuv+D2As3vJL0gGXQRVYF129TJjVk+Ikad38JeNQ2sm5xSl1Q==@vger.kernel.org
X-Received: by 2002:a05:6102:8099:b0:76f:eaa2:6fa7 with SMTP id
 ada2fe7eead31-78a4a6d4adfmr10265477137.2.1788873917561; Tue, 08 Sep 2026
 06:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com> <20260826174854.199139-13-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260826174854.199139-13-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:25:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXM9HEZigwC+rDcJd52c+XMGZ6+8fK+5+kDYFYkSQMt2g@mail.gmail.com>
X-Gm-Features: AcwNN1WhYdmJJQf86GwJ_V-yVMFnAkWuQK8aLWwP6w9JLx712fQ14_b7YbLUDoA
Message-ID: <CAMuHMdXM9HEZigwC+rDcJd52c+XMGZ6+8fK+5+kDYFYkSQMt2g@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] arm64: dts: renesas: Add DSI overlay for RZ/G3L
 SMARC EVK with ADV7535
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 26 Aug 2026 at 19:49, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a Device Tree overlay (r9a08g046l48-smarc-dsi-adv7535.dtso) for the
> RZ/G3L (R9A08G046) SMARC EVK board to support DSI-to-HDMI output via the
> Analog Devices ADV7535 HDMI transmitter.
>
> The overlay enables the DSI controller with a 4-lane data path and the
> display unit (DU/LCDC), and configures the ADV7535 on I2C2.
>
> Update the Makefile to build the overlay as both a standalone .dtbo and
> a composite .dtb (base DTB + overlay).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0

Any chance this can be "(GPL-2.0-only OR BSD-2-Clause)", like all
already existing arch/arm64/boot/dts/renesas/r9a08g046* files
(and arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi)?


> +/*
> + * Device Tree overlay for the RZ/G3L SMARC EVK with ADV7535
> + * connected to DSI and LCDC enabled.
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
> +
> +&{/} {
> +       osc1: cec-clock {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <12000000>;
> +       };
> +
> +       dsi-to-hdmi-out {
> +               compatible = "hdmi-connector";
> +               type = "d";

No ddc-i2c-bus?

> +
> +               port {
> +                       dsi_to_hdmi_con_out: endpoint {
> +                               remote-endpoint = <&adv7535_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi {
> +       status = "okay";
> +
> +       ports {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               port@1 {
> +                       reg = <1>;
> +                       dsi_out: endpoint {
> +                               data-lanes = <1 2 3 4>;
> +                               remote-endpoint = <&adv7535_in>;
> +                       };
> +               };
> +       };
> +};
> +
> +&du {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       adv7535: hdmi@3d {
> +               compatible = "adi,adv7535";
> +               reg = <0x3d>;
> +
> +               interrupts-extended = <&pinctrl RZG3L_GPIO(K, 3) IRQ_TYPE_EDGE_FALLING>;
> +               clocks = <&osc1>;
> +               clock-names = "cec";
> +               avdd-supply = <&reg_1p8v>;
> +               dvdd-supply = <&reg_1p8v>;
> +               pvdd-supply = <&reg_1p8v>;
> +               a2vdd-supply = <&reg_1p8v>;
> +               v3p3-supply = <&reg_3p3v>;
> +               v1p2-supply = <&reg_1p8v>;
> +
> +               adi,dsi-lanes = <4>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               adv7535_in: endpoint {
> +                                       remote-endpoint = <&dsi_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +                               adv7535_out: endpoint {
> +                                       remote-endpoint = <&dsi_to_hdmi_con_out>;
> +                               };
> +                       };

No audio?

> +               };
> +       };
> +};

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
