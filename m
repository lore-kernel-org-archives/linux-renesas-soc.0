Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:37172 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbeK3UJL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 15:09:11 -0500
MIME-Version: 1.0
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com> <1543319795-48325-12-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543319795-48325-12-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Nov 2018 10:00:21 +0100
Message-ID: <CAMuHMdWq=dP77rrdC2GzPT8gEzKgxKLpqxkzcXOS=ThFu_9=fA@mail.gmail.com>
Subject: Re: [PATCH 11/22] ARM: dts: r8a7744: Add DU support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Tue, Nov 27, 2018 at 1:05 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Add du node to r8a7744 SoC DT. Boards that want to enable the DU
> need to specify the output topology.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/r8a7744.dtsi
> +++ b/arch/arm/boot/dts/r8a7744.dtsi
> @@ -1300,8 +1300,17 @@
>                 };
>
>                 du: display@feb00000 {
> +                       compatible = "renesas,du-r8a7744";
>                         reg = <0 0xfeb00000 0 0x40000>,
>                               <0 0xfeb90000 0 0x1c>;
> +                       reg-names = "du", "lvds.0";

Please use the new DU/LVDS bindings, using a separate node for LVDS.

BTW, I believe the display won't work with a recent tree, unless you've added
a DT live patch drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7744.dts?

The same is true for RZ/G1M.

> +                       interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 724>,
> +                                <&cpg CPG_MOD 723>,
> +                                <&cpg CPG_MOD 726>;
> +                       clock-names = "du.0", "du.1", "lvds.0";
> +                       status = "disabled";
>
>                         ports {
>                                 #address-cells = <1>;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
