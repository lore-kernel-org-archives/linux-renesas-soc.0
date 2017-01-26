Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:36322 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753493AbdAZKH1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 05:07:27 -0500
Received: by mail-io0-f196.google.com with SMTP id q20so4652068ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2017 02:07:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1485420750-12701-3-git-send-email-horms+renesas@verge.net.au>
References: <1485420750-12701-1-git-send-email-horms+renesas@verge.net.au> <1485420750-12701-3-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jan 2017 11:07:24 +0100
Message-ID: <CAMuHMdXSriucRXVACQoGx0S8CX0sXPmuWvAQy0+RP9PY-z7U3g@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: r8a7796: Add I2C for DVFS device node
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 26, 2017 at 9:52 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Dien Pham <dien.pham.ry@rvc.renesas.com>
>
> This patch adds I2C for DVFS device node for R8A7796 SoC.
>
> Signed-off-by: Dien Pham <dien.pham.ry@rvc.renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi

> @@ -269,6 +270,19 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               i2c_dvfs: i2c@e60b0000 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       compatible = "renesas,iic-r8a7796",
> +                                    "renesas,rcar-gen3-iic",
> +                                    "renesas,rmobile-iic";
> +                       reg = <0 0xe60b0000 0 0x425>;
> +                       interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 926>;

You may want to add dmas/dma-names.
That can be done later, though.

> +                       power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +                       status = "disabled";
> +               };
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
