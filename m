Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:38569 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751059AbeCIMo7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Mar 2018 07:44:59 -0500
MIME-Version: 1.0
In-Reply-To: <82c33f37-bfbb-e515-f996-83333cd26171@cogentembedded.com>
References: <88e52531-e538-8685-110a-1a2e79a3fe49@cogentembedded.com> <82c33f37-bfbb-e515-f996-83333cd26171@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Mar 2018 13:44:57 +0100
Message-ID: <CAMuHMdVJkRuEvzmAJf2pWd9E+XVgmO122-2mHSgw7Y4aLXdfYA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: condor: add EtherAVB pins
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Mar 9, 2018 at 1:09 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the (previously omitted) EtherAVB pin data to the Condor board's
> device tree.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

According to the Condor schematics, the KSZ9031RNXVB is wired to
GEther by default. So I guess you are using a modified board?

> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> @@ -30,6 +30,9 @@
>  };
>
>  &avb {
> +       pinctrl-0 = <&avb_pins>;
> +       pinctrl-names = "default";
> +
>         phy-mode = "rgmii-id";
>         phy-handle = <&phy0>;
>         renesas,no-ether-link;
> @@ -50,6 +53,11 @@
>  };
>
>  &pfc {
> +       avb_pins: avb {
> +               groups = "avb_mdio", "avb_rgmii";
> +               function = "avb";
> +       };
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
