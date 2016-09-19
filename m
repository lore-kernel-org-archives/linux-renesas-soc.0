Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36132 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760054AbcISITW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2016 04:19:22 -0400
MIME-Version: 1.0
In-Reply-To: <1815255.1arMxK7TDL@wasted.cogentembedded.com>
References: <3533019.Wim1Kuh1ic@wasted.cogentembedded.com> <1815255.1arMxK7TDL@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Sep 2016 10:19:20 +0200
Message-ID: <CAMuHMdXz5K66AU7d-+NsPrAyc8V53mDxzggiUk-TrFRAwBFXOg@mail.gmail.com>
Subject: Re: [PATCH RFC 6/8] ARM: dts: r8a7743: add SYS-DMAC support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 16, 2016 at 3:36 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> --- renesas.orig/arch/arm/boot/dts/r8a7743.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7743.dtsi
> @@ -90,6 +90,70 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               dmac0: dma-controller@e6700000 {
> +                       compatible = "renesas,dmac-r8a7743",

To be documented.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
