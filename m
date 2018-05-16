Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:40992 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751449AbeEPHkL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 03:40:11 -0400
Received: by mail-vk0-f66.google.com with SMTP id 131-v6so1786179vkf.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 May 2018 00:40:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180515080038.7438-1-horms+renesas@verge.net.au>
References: <20180515080038.7438-1-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 May 2018 09:40:10 +0200
Message-ID: <CAMuHMdXzc3YLm8u+JgQMhXtErAgBgc4bti9cyUboPZmpB+rVyg@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: r8a7740: Add CEU1
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        jacopo mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, May 15, 2018 at 10:00 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Describe CEU1 peripheral for Renesas R-Mobile A1 R8A7740 Soc.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v2
> * Correct register range start address

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Minor question below.

> --- a/arch/arm/boot/dts/r8a7740.dtsi
> +++ b/arch/arm/boot/dts/r8a7740.dtsi
> @@ -77,6 +77,16 @@
>                 status = "disabled";
>         };
>
> +       ceu1: ceu@fe914000 {
> +               reg = <0xfe914000 0x3000>;
> +               compatible = "renesas,r8a7740-ceu";
> +               interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&mstp1_clks R8A7740_CLK_CEU21>;
> +               clock-names = "ceu21";

Why the "clock-names" property? It's not mentioned in the DT bindings, and
may cause issues if the bindings are ever amended.

> +               power-domains = <&pd_a4r>;
> +               status = "disabled";
> +       };
> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
