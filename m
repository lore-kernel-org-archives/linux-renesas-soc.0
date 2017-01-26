Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:34324 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752958AbdAZKNr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 05:13:47 -0500
Received: by mail-it0-f65.google.com with SMTP id o185so4738443itb.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2017 02:13:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1485420750-12701-5-git-send-email-horms+renesas@verge.net.au>
References: <1485420750-12701-1-git-send-email-horms+renesas@verge.net.au> <1485420750-12701-5-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jan 2017 11:13:45 +0100
Message-ID: <CAMuHMdW1Okdf-D1yUCehQ9WFqCXO_t4y-Yk0sodhFL1E2FLG8g@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: r8a7795: Add I2C for DVFS core to dtsi
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
> From: Keita Kobayashi <keita.kobayashi.ym@renesas.com>
>
> This patch adds I2C for DVFS device support for R8A7795 SoC.
>
> Signed-off-by: Keita Kobayashi <keita.kobayashi.ym@renesas.com>
> Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
> Signed-off-by: Dien Pham <dien.pham.ry@rvc.renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi

> @@ -793,6 +794,19 @@
>                         status = "disabled";
>                 };
>
> +               i2c_dvfs: i2c@e60b0000 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       compatible = "renesas,iic-r8a7795",
> +                                    "renesas,rcar-gen3-iic",
> +                                    "renesas,rmobile-iic";
> +                       reg = <0 0xe60b0000 0 0x425>;
> +                       interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 926>;

Same comment about dmas/dma-names.

> +                       power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +                       status = "disabled";
> +               };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
