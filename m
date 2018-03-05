Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:37111 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933054AbeCEKXn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Mar 2018 05:23:43 -0500
MIME-Version: 1.0
In-Reply-To: <1519697995-6061-4-git-send-email-gaku.inami.xh@renesas.com>
References: <1519697995-6061-1-git-send-email-gaku.inami.xh@renesas.com> <1519697995-6061-4-git-send-email-gaku.inami.xh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Mar 2018 11:23:42 +0100
Message-ID: <CAMuHMdWswL8N3uTCcGmWSfa98_bpz7_11PDs=m+_RC--wBVu6w@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r8a7795: Add cpu capacity-dmips-mhz
To: Gaku Inami <gaku.inami.xh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Inami-san,

On Tue, Feb 27, 2018 at 3:19 AM, Gaku Inami <gaku.inami.xh@renesas.com> wrote:
> Set the capacity-dmips-mhz for r8a7795, that is based on dhrystone.
>
> Expected cpu capacity:
> Cortex-A57@1.5GHz: 1024, Cortex-A53@1.2GHz: 411

Thanks for your patch!

> Signed-off-by: Gaku Inami <gaku.inami.xh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

411 for the A53 cores sounds a bit low to me, though.
Documentation/devicetree/bindings/arm/cpu-capacity.txt uses 578.

Perhaps you already took into account the maximum clock frequencies?
According to the binding document, you should not do that (cfr.
"final capacities are 1024 for cluster0 and 446 for cluster1" in the
bindings doc).

> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -123,6 +127,7 @@
>                         enable-method = "psci";
>                         clocks =<&cpg CPG_CORE R8A7795_CLK_Z2>;
>                         operating-points-v2 = <&cluster1_opp>;
> +                       capacity-dmips-mhz = <411>;
>                 };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
