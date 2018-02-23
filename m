Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:41078 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751273AbeBWJ1R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Feb 2018 04:27:17 -0500
MIME-Version: 1.0
In-Reply-To: <1519326370-15805-7-git-send-email-jacopo+renesas@jmondi.org>
References: <1519326370-15805-1-git-send-email-jacopo+renesas@jmondi.org> <1519326370-15805-7-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Feb 2018 10:27:16 +0100
Message-ID: <CAMuHMdUSS_kFU+Zg40UHvtJ=PteftQW_tvViAr-d4r+jmVNfNQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: r8a77965: Add #interrupt-cells property
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 22, 2018 at 8:06 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add "#interrupt-cells" property and "interrupt-controller" label to
> "interrupt-controller@e61c0000" device node.
>
> This silences the following DTC compiler warnings:
> Warning (interrupts_property): Missing interrupt-controller or
> interrupt-map property in /soc/interrupt-controller@e61c0000
> Warning (interrupts_property): Missing #interrupt-cells in
> interrupt-parent /soc/interrupt-controller@e61c000
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -316,6 +316,8 @@
>                 };
>
>                 intc_ex: interrupt-controller@e61c0000 {
> +                       #interrupt-cells = <2>;
> +                       interrupt-controller;
>                         reg = <0 0xe61c0000 0 0x200>;
>                         /* placeholder */

(bikeshedding) Should the placeholder be at the top of the node?

>                 };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
