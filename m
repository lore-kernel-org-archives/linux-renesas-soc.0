Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:33710 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932219AbeASUNG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 15:13:06 -0500
MIME-Version: 1.0
In-Reply-To: <20180119195439.145129729@cogentembedded.com>
References: <20180119195439.145129729@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jan 2018 21:13:04 +0100
Message-ID: <CAMuHMdXOLLizyzm6wFbV-0_oYXvF5xmRQBQn20f6oCe4HOe8CA@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a77970: add LVDS support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Jan 19, 2018 at 8:42 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Define the generic R8A77970 part of the LVDS device node.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

I love your patch! Yet something to improve...

> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -654,6 +654,31 @@
>                                 port@1 {
>                                         reg = <1>;
>                                         du_out_lvds: endpoint {
> +                                               remote-endpoint = <&lvds_in>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               lvds: lvds@feb90000 {
> +                       compatible = "renesas,r8a77970-lvds";
> +                       reg = <0 0xfeb90000 0 0x14>;
> +                       clocks = <&cpg CPG_MOD 727>;

Missing resets and power-domains properties.

> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       lvds_in: endpoint {
> +                                               remote-endpoint = <&du_out_lvds>;
> +                                       };
> +                               };
> +                               port@1 {
> +                                       reg = <1>;
> +                                       lvds_out: endpoint {
>                                         };
>                                 };
>                         };
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
