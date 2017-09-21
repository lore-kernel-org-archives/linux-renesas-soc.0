Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:35569 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750790AbdIUNIm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2017 09:08:42 -0400
MIME-Version: 1.0
In-Reply-To: <20170915194449.538504992@cogentembedded.com>
References: <20170915194449.538504992@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Sep 2017 15:08:40 +0200
Message-ID: <CAMuHMdXQXFuVzwW7G-U7XWZUEj8qFRjtfDQF1+TgyzO0Xb+eYg@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: renesas: eagle: add EtherAVB support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Sep 15, 2017 at 9:43 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Define the Eagle board  dependent part of the EtherAVB device node.
> Enable DHCP  and NFS root for the kernel booting.
>
> Based  on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -18,10 +18,11 @@
>
>         aliases {
>                 serial0 = &scif0;
> +               ethernet0 = &avb;
>         };
>
>         chosen {
> -               bootargs = "ignore_loglevel";
> +               bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
>                 stdout-path = "serial0:115200n8";
>         };
>
> @@ -43,3 +44,14 @@
>  &scif0 {
>         status = "okay";
>  };
> +
> +&avb {
> +       renesas,no-ether-link;
> +       phy-handle = <&phy0>;
> +       status = "okay";
> +
> +       phy0: ethernet-phy@0 {
> +               rxc-skew-ps = <1500>;
> +               reg = <0>;

Any specific reason why you don't want to wire up the interrupt?

                interrupt-parent = <&gpio2>;
                interrupts = <11 IRQ_TYPE_LEVEL_LOW>;

> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
