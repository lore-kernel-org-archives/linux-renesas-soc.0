Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:44209 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbeIER3e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Sep 2018 13:29:34 -0400
Received: by mail-ua1-f67.google.com with SMTP id m11-v6so5664297uao.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Sep 2018 05:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <1535703651-5152-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1535703651-5152-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Sep 2018 14:59:10 +0200
Message-ID: <CAMuHMdVWWUZ5b+2E0=xqADfFsuCY1=7L+uY3m+onz9Hr2OUaXw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: revise properties for usb 2.0
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Fri, Aug 31, 2018 at 10:22 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> R-Car Gen3 needs to enable/deassert clocks/resets of both usb 2.0
> host (included phy) and peripheral. Otherwise, other side device
> cannot work correctly. So, this patch revises properties of clocks
> and resets. After that, each device driver can enable/deassert
> clocks/resets by its self.
>
> Notes:
>  - To work the renesas_usbhs driver correctly when host side drivers
>    are disabled and the renesas_usbhs driver doesn't have multiple
>    clock management, this patch doesn't change the order of the clocks
>    property in each hsusb node.
>  - This patch doesn't have any side-effects even if the renesas_usbhs
>    driver doesn't have reset_control and multiple clock management.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

I'm a bit confused about the HS-USB <-> EHCI/OHCI topology.
Can you please explain?

Thanks!

> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -707,7 +707,8 @@
>                                      "renesas,rcar-gen3-usbhs";
>                         reg = <0 0xe6590000 0 0x100>;
>                         interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks = <&cpg CPG_MOD 704>;
> +                       clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
> +                       clock-names = "hsusb", "ehci/ohci";

703 is EHCI/OHCI0. What about EHCI/OHCI1 and EHCI/OHCI2?

>                         dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
>                                <&usb_dmac1 0>, <&usb_dmac1 1>;
>                         dma-names = "ch0", "ch1", "ch2", "ch3";
> @@ -715,7 +716,7 @@
>                         phys = <&usb2_phy0>;
>                         phy-names = "usb";
>                         power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> -                       resets = <&cpg 704>;
> +                       resets = <&cpg 704>, <&cpg 703>;
>                         status = "disabled";
>                 };
>
> @@ -724,7 +725,8 @@
>                                      "renesas,rcar-gen3-usbhs";
>                         reg = <0 0xe659c000 0 0x100>;
>                         interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks = <&cpg CPG_MOD 705>;
> +                       clocks = <&cpg CPG_MOD 705>, <&cpg CPG_MOD 700>;
> +                       clock-names = "hsusb", "ehci/ohci";

So this one is linked to EHCI/OHCI3?

>                         dmas = <&usb_dmac2 0>, <&usb_dmac2 1>,
>                                <&usb_dmac3 0>, <&usb_dmac3 1>;
>                         dma-names = "ch0", "ch1", "ch2", "ch3";
> @@ -732,7 +734,7 @@
>                         phys = <&usb2_phy3>;
>                         phy-names = "usb";
>                         power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> -                       resets = <&cpg 705>;
> +                       resets = <&cpg 705>, <&cpg 700>;
>                         status = "disabled";
>                 };
>
> @@ -2098,11 +2100,11 @@
>                         compatible = "generic-ohci";
>                         reg = <0 0xee080000 0 0x100>;
>                         interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks = <&cpg CPG_MOD 703>;
> +                       clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
>                         phys = <&usb2_phy0>;
>                         phy-names = "usb";
>                         power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> -                       resets = <&cpg 703>;
> +                       resets = <&cpg 703>, <&cpg 704>;
>                         status = "disabled";
>                 };

The above is for the ohci0 node.
What about ohci1 and ohci2?

Same for ehci below.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
