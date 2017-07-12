Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:32921 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933165AbdGLHYY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jul 2017 03:24:24 -0400
Received: by mail-io0-f193.google.com with SMTP id z62so1312764ioi.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jul 2017 00:24:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170621093133.5677-4-laurent.pinchart+renesas@ideasonboard.com>
References: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com> <20170621093133.5677-4-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jul 2017 09:24:22 +0200
Message-ID: <CAMuHMdV93D9GVEEuOnHp08NyFKy=BZqHC_FXWNMf6hHcGXCMGg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: renesas: r8a7796: Add VSP instances
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent, Simon,

On Wed, Jun 21, 2017 at 11:31 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The r8a7796 has 5 VSP instances.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Ah, the pitfalls of reposting patches 8 months later...

> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 50 ++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 28b0e2127021..ad9cd1c3199f 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -1447,6 +1447,16 @@
>                         power-domains = <&sysc R8A7796_PD_A3VC>;
>                 };
>
> +               vspb: vsp@fe960000 {
> +                       compatible = "renesas,vsp2";
> +                       reg = <0 0xfe960000 0 0x8000>;
> +                       interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 626>;
> +                       power-domains = <&sysc R8A7796_PD_A3VC>;

... missing resets properties.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
