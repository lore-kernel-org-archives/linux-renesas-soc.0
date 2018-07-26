Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:39449 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730173AbeGZNiz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jul 2018 09:38:55 -0400
Received: by mail-vk0-f65.google.com with SMTP id e139-v6so678574vkf.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jul 2018 05:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180725191804.3522-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180725191804.3522-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jul 2018 14:22:08 +0200
Message-ID: <CAMuHMdW9OHUpdiCHoJU_Z0gMUMA+7J9f7ngK=m8DJ=DBVcALXA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: r8a77965: Add SATA controller node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Wed, Jul 25, 2018 at 9:18 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds SATA controller node for the R8A77965 SoC.

Thanks for your patch!

> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [wsa: rebased to upstream base]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -908,6 +908,17 @@
>                         status = "disabled";
>                 };
>
> +               sata: sata@ee300000 {

Please insert this node in between sd@ee160000 and
interrupt-controller@f1010000, to preserve sort order (by unit address per
device group first, by device index second).

> +                       compatible = "renesas,sata-r8a77965",
> +                                    "renesas,rcar-gen3-sata";
> +                       reg = <0 0xee300000 0 0x200000>;
> +                       interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 815>;
> +                       power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +                       resets = <&cpg 815>;
> +                       status = "disabled";
> +               };
> +
>                 scif0: serial@e6e60000 {
>                         compatible = "renesas,scif-r8a77965",
>                                      "renesas,rcar-gen3-scif", "renesas,scif";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
