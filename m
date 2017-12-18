Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:45450 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750813AbdLRKI3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 05:08:29 -0500
Received: by mail-qt0-f193.google.com with SMTP id g10so19254890qtj.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Dec 2017 02:08:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1513350890-2446-4-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1513350890-2446-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1513350890-2446-4-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Dec 2017 11:08:28 +0100
Message-ID: <CAMuHMdX1ZXtbBaC_S6xuj=7j4QkBSfbjVChHu5Wh1ksBeVWD4w@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: r8a7796: Add GSX device node
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Fri, Dec 15, 2017 at 4:14 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds GSX device node for R8A7796 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>

SoB?

> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -2241,6 +2241,14 @@
>                         };
>                 };
>
> +               gsx: gsx@fd000000 {

gpu@fd000000?

> +                       compatible = "renesas,gsx";

That compatible value sounds a bit simplistic to me.
In addition, it's not yet documented.

> +                       reg = <0 0xfd000000 0 0x3ffff>;

reg = <0 0xfd000000 0 0x40000>;

> +                       interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 112>;

According to Figure 23.2, there's an incoming reset signal, but it's not
listed in Table 8A.28.

> +                       power-domains = <&sysc R8A7796_PD_3DG_B>;

iommus?

> +               };
> +
>                 pciec0: pcie@fe000000 {
>                         /* placeholder */
>                 };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
