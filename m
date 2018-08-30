Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:45849 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728115AbeH3QbJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 12:31:09 -0400
MIME-Version: 1.0
References: <1535107429-5458-1-git-send-email-biju.das@bp.renesas.com> <1535107429-5458-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1535107429-5458-2-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Aug 2018 14:29:02 +0200
Message-ID: <CAMuHMdVWE7F84BdbiqLBfKZLwb9QNg8chsUgWsKtPdikGWeXJA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a774a1: Add USB2.0 phy and
 host(EHCI/OHCI) device nodes
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 24, 2018 at 12:50 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Add USB2.0 phy and host (EHCI/OHCI) device nodes on RZ/G2M SoC dtsi.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 73 +++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> index cd204f5..a794089 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi

> +               ehci0: usb@ee080100 {
> +                       compatible = "generic-ehci";
> +                       reg = <0 0xee080100 0 0x100>;
> +                       interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 703>;
> +                       phys = <&usb2_phy0>;
> +                       phy-names = "usb";
> +                       companion= <&ohci0>;

Please insert a space before the "=".

> +                       power-domains = <&sysc 32>;
> +                       resets = <&cpg 703>;
> +                       status = "disabled";
> +               };
> +
> +               ehci1: usb@ee0a0100 {
> +                       compatible = "generic-ehci";
> +                       reg = <0 0xee0a0100 0 0x100>;
> +                       interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 702>;
> +                       phys = <&usb2_phy1>;
> +                       phy-names = "usb";
> +                       companion= <&ohci1>;

Likewise.

> +                       power-domains = <&sysc 32>;
> +                       resets = <&cpg 702>;
> +                       status = "disabled";
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
