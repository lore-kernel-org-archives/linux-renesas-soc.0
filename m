Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:40604 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726286AbeHGK3k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Aug 2018 06:29:40 -0400
Received: by mail-ua0-f196.google.com with SMTP id m13-v6so15175498uaq.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Aug 2018 01:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20180804163818.23360-1-marek.vasut+renesas@gmail.com>
In-Reply-To: <20180804163818.23360-1-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Aug 2018 10:16:16 +0200
Message-ID: <CAMuHMdU8=pb1V9gPxTe6JX5waXr0aRg5PW6t_bDY2fij0PVr5A@mail.gmail.com>
Subject: Re: [PATCH V2] ARM: dts: silk: Add DA9063 PMIC node
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

On Sat, Aug 4, 2018 at 6:38 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> Add DA9063 PMIC node to the I2C bus.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Replace shmobile with dts since it's a DT patch in subject
>     - Connect the 9063_IRQ# line to GP3_31
>     - Since the DA9063 is connected to both i2c1 and i2c7, connect
>       it to i2c7, which is the dedicated dvfs i2c.

Thanks for the update!

> --- a/arch/arm/boot/dts/r8a7794-silk.dts
> +++ b/arch/arm/boot/dts/r8a7794-silk.dts
> @@ -405,6 +405,23 @@
>         clock-frequency = <400000>;
>  };
>
> +&i2c7 {
> +       status = "okay";
> +       clock-frequency = <100000>;
> +
> +       pmic@58 {
> +               compatible = "dlg,da9063";
> +               reg = <0x58>;
> +               interrupt-parent = <&gpio3>;
> +               interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
> +               interrupt-controller;
> +
> +               wdt {
> +                       compatible = "dlg,da9063-watchdog";
> +               };

Given Silk has the full da9063 (unlike the "L" version on Porter), shouldn't
you add an rtc subnode?

Oh, Silk also has the onkey pin wired, so perhaps you want to add an onkey
subnode, too? Does that feature work?

BTW, Stout also has the onkey wired, but lacks the onkey subnode.

> +       };
> +};
> +

Nevertheless:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
