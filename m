Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:42995 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387673AbeHAOS0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Aug 2018 10:18:26 -0400
Received: by mail-ua0-f195.google.com with SMTP id w7-v6so12541837uan.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Aug 2018 05:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20180730111817.5636-1-marek.vasut+renesas@gmail.com>
In-Reply-To: <20180730111817.5636-1-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Aug 2018 14:32:39 +0200
Message-ID: <CAMuHMdXib8fz3c41RX-70eA5w4ThM6e02ybmX=N=xXR6=F80KA@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: silk: Add DA9063 PMIC node
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Mon, Jul 30, 2018 at 1:18 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> Add DA9063 PMIC node to the I2C bus.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Thanks for your patch!

Oneline-summary prefix should be "ARM: dts: silk:".

> --- a/arch/arm/boot/dts/r8a7794-silk.dts
> +++ b/arch/arm/boot/dts/r8a7794-silk.dts
> @@ -403,6 +403,18 @@
>         pinctrl-names = "i2c-hdmi";
>
>         clock-frequency = <400000>;
> +
> +       pmic@5a {

Hmm, the da9063 is actually connected to two i2c buses: i2c1 (3.3v)
and i2c7 (1.8v).
On Koelsch, we describe the 1.8v connection, as that i2c bus
("i2c_dvfs") is meant
for power control.

> +               compatible = "dlg,da9063";
> +               reg = <0x5a>;
> +               interrupt-parent = <&irqc0>;
> +               interrupts = <2 IRQ_TYPE_LEVEL_LOW>;

According to my schematics, the interrupt is connected to GP3_31?

> +               interrupt-controller;
> +
> +               wdt {
> +                       compatible = "dlg,da9063-watchdog";
> +               };
> +       };
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
