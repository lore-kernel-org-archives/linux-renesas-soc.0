Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:33592 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752276AbdGJHym (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2017 03:54:42 -0400
MIME-Version: 1.0
In-Reply-To: <1499433165-62475-2-git-send-email-biju.das@bp.renesas.com>
References: <1499433165-62475-1-git-send-email-biju.das@bp.renesas.com> <1499433165-62475-2-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jul 2017 09:54:40 +0200
Message-ID: <CAMuHMdWsM_FBJ46=U69XptqpyC2cJYx_cqczaHBNq2nxZr68GQ@mail.gmail.com>
Subject: Re: [PATCH v 1/2] ARM: dts: r8a7743: Add Ethernet AVB support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Fri, Jul 7, 2017 at 3:12 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> Add Ethernet AVB support for r8a7743 SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

With the minor nit below fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
> @@ -605,6 +605,19 @@
>                         #size-cells = <0>;
>                         status = "disabled";
>                 };
> +
> +               avb: ethernet@e6800000 {
> +                       compatible = "renesas,etheravb-r8a7743",
> +                                    "renesas,etheravb-rcar-gen2";
> +                       reg = <0 0xe6800000 0 0x800>, <0 0xee0e8000 0 0x4000>;
> +                       interrupts = <0 163 IRQ_TYPE_LEVEL_HIGH>;

s/0/GIC_SPI/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
