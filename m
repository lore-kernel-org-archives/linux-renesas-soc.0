Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:36857 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750791AbdBOJVV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2017 04:21:21 -0500
MIME-Version: 1.0
In-Reply-To: <20170213182532.4042-4-chris.brandt@renesas.com>
References: <20170213182532.4042-1-chris.brandt@renesas.com> <20170213182532.4042-4-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Feb 2017 10:21:19 +0100
Message-ID: <CAMuHMdWBRJeU+f_Bn9pFPU1_LRG6WHSie8a0v+_qxKftujWAzw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: r7s72100: Add reset handler
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 13, 2017 at 7:25 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> For the RZ/A1, the only way to do a reset is to overflow the WDT.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  arch/arm/boot/dts/r7s72100.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index 614ba79..6fb4ef4 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -371,6 +371,11 @@
>                         <0xe8202000 0x1000>;
>         };
>
> +       wdt: timer@fcfe0000 {
> +               compatible = "renesas,r7s72100-reset", "renesas,wdt-reset";
> +               reg = <0xfcfe0000 0x6>;

No clocks property, pointing to p0_clk?
No interrupts property?
Yes, those should be documented in the bindings, too.

> +       };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
