Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65587533582
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 14:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174266; cv=none; b=ZvxZgbtFwYZp/lJ48Tw77ewZk8yAWHXWcworf3MR3QKT0mtQyGF2tVplR/LUUg/O342ui/FWWpOfsVtuST6AxwpYVtZMqriYTT4RrEizjw0MoIqNrfacBE79m5RgeuI6L+IYrTDjvmHsNEDsjDz9u7EH9dVzkEHBUa47TZazWuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174266; c=relaxed/simple;
	bh=/U1MgBD6VoBqJ/8qiTtjqod/dz4JUJFqpqKojTxWot0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSm3zx9q44TA0WkZueuFQYsgBuII33OV2trbPL+UGyh7MfWr94Wg3i34GtzVEXAuG9cA05zmrtWL8kSAlLqZ/rIR9bWOP5fkCihtnzRb0O2CbAgnDRLKFP26Y0fJq+DmUi5KBM4cV1vScWe2nIqcKr+IXNRnzfihChp/RVxnuDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98e1942dfso854828e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 07:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174264; x=1790779064;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uSSwLrH/CqP5v9Ad6ht8i1AuRmzB1BOZysjgQqfiEm0=;
        b=LMk8KoPOcJUR1ym4U82/FKllM4cAs7InXj376hSZ7f3VfDzZ682lvNJ7RNBGfnd5gc
         j2n0DyDlaKpQLJMjR0DXxIqi1Eg8sIrnpo9m9Ld5hIatKVfdbWlL+aNQK6UuybEnxYSr
         fcuQbZNtYTtnpdBinLB8Y/LqIqukWlB0mMmKeL1XmsxAZL8fcfoOGhaHeMdIgwkGwqnZ
         q6nbIaqP5Z3fI8i7vNaUZsK82HCmxY45Stpog6gfXiipvMnH6uZOhXDZgUmFk3mJ4rNY
         WxJ8O/D8+uCqJijNl/XloIIkDaDoWirPGswzmy043BIb2xMO3rLc1p0eecQ1xt4RtNZn
         ayxA==
X-Forwarded-Encrypted: i=1; AKwUvBxdDsW9Gtp0u1jRyvhmG2ZAou+xcLJzhw1VSJSG+6JzweOF6fi1zHYOZaep0qiTCOtrnvQPViVmiTdfvYwmg0DWlg==@vger.kernel.org
X-Gm-Message-State: AFuF++nsF6x0kHiWeir4eD7PUssfwxSFThLeiRnmQO8pGGHbqjCSSl8M
	Xue69Chkxn6E15ukeVxPOY8G+cMeXNF3QrxgAwr3GLFG4tiz2rSgJj8UhtYx+zI3o8g=
X-Gm-Gg: AYBFou214C9QTkqi+9Y1kz4FDNYflHxuR70w3cJ2Vee1gqZ+4J5iS/m1pObSECyRAhj
	+oKu8Xfd/w4Njfpr0xZOmayAOIClpGRivHHQVernuAJ+O+BwC0EOMIcWUcgGtUQWnHvvpt3kbYq
	52K+rykHEcVwCNsPcNpM0I9VR6cpI/Enk+dfz7gK3VvP0YKad1XcqHEZjnbivlteDmUzapZR2Fl
	RNV6ytx4djSxbqQlx81KN6lL4gOHR7D2bDjYZT3JeR3C6NoDysYAxZANY0yfHPyF9JQNFxuqrsR
	Hxp9h/5RbbpWIIgKWqqUeYHVAXM2sATrVoEFod98QevTBUX2njFwdLoMiPzz9FI2ftx3thJHYLw
	9J1sl8OzwpIa7V/qp3Bd371nqmEI01/9ZFb9YLbEJCQcFIzYhFAQzl8lizA45a0RSr5s3zJ8hSm
	MpnXorqSCZuSFkOmWMaPSlv7XliyLCZMsNFOcvBw/oj/PJfmadFlSp+Ko4Gi3k5ZeXVMIzwAvhB
	BIuBBGnIeWzi/Ycjll0k3WctuTvoCB8p30joKUYFlx1AMg=
X-Received: by 2002:a05:6102:50a6:b0:7a4:fb71:25d1 with SMTP id ada2fe7eead31-7ac1a6c6e37mr2857957137.7.1790174264168;
        Wed, 23 Sep 2026 07:37:44 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf608a27esm3411560137.10.2026.09.23.07.37.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:37:43 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78565b4db77so559119137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 07:37:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwX94UxbbEYj6zrM8LDOsSpIh7TUW7pc2lPrZexV+VhVrM0aS14KtwKbtCcgsZ8aPdCQTXVKBNNmx/2Rpacbr/ITw==@vger.kernel.org
X-Received: by 2002:a05:6102:2922:b0:7a7:198a:c2bd with SMTP id
 ada2fe7eead31-7ac1da2015fmr2739749137.37.1790174262272; Wed, 23 Sep 2026
 07:37:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-4-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-4-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:37:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGOLr6TQvfS9i2W1ihBWUUuTG0=TcfyZ-Seb02+XW_3w@mail.gmail.com>
X-Gm-Features: AclHuK-Y4yRPc5ygPTDjA1xgXgYnA6hz3s-S6a8gc_ggzPpYCTe_qr4a-TZ4I5w
Message-ID: <CAMuHMdUGOLr6TQvfS9i2W1ihBWUUuTG0=TcfyZ-Seb02+XW_3w@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] arm64: dts: renesas: add support for solidrun
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

Hi Josua,

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
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

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi

> +       aliases {
> +               gpio1 = &tca6408_u48;
> +               gpio2 = &tca6408_u37;
> +               gpio3 = &tca6416_u20;
> +               gpio4 = &tca6416_u21;

The TCA64xx driver does not seem to support gpio aliases, so please
drop these.

> +               i2c3 = &i2c_exp;
> +               i2c4 = &i2c_csi;
> +               i2c5 = &i2c_dsi;
> +               i2c6 = &i2c_lvds;
> +               rtc0 = &carrier_rtc;
> +               rtc1 = &pmic;
> +               serial3 = &scif3;
> +       };

> +       v_1_2: regulator-1-2 {

Preferred node name is "regulator-1v2"...

> +               compatible = "regulator-fixed";
> +               regulator-name = "1v2";
> +               regulator-max-microvolt = <1200000>;
> +               regulator-min-microvolt = <1200000>;
> +       };
> +
> +       v_3_3: regulator-3-3 {

... "regulator-3v3".

> +               compatible = "regulator-fixed";
> +               regulator-name = "3v3";
> +               regulator-max-microvolt = <3300000>;
> +               regulator-min-microvolt = <3300000>;
> +       };

> +&i2c0 {
> +       /* highest i2c clock supported by all peripherals is 400kHz */

We have a DT propery for that ;-)

    clock-frequency = <400000>;

Same for i2c1.

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi
> @@ -0,0 +1,480 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G2L Solidrun SoM
> + *
> + * Copyright 2023 SolidRun Ltd.
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +
> +/ {
> +       aliases {
> +               ethernet0 = &eth0;
> +               ethernet1 = &eth1;
> +               gpio0 = &pinctrl;

The pin control driver does not support gpio aliases, so please
drop this.

> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c3;
> +               mmc0 = &sdhi0;
> +               mmc1 = &sdhi1;
> +               rtc0 = &pmic;
> +               serial0 = &scif0;
> +               serial1 = &scif1;
> +               serial2 = &scif2;
> +       };

I didn't compare with the board schematics, but the rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
