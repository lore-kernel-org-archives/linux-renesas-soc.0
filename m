Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:35192 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752787AbeFTMv7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jun 2018 08:51:59 -0400
MIME-Version: 1.0
References: <1529496081-10571-1-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1529496081-10571-1-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Jun 2018 14:51:47 +0200
Message-ID: <CAMuHMdX=g7xq5N72cfZ8+_m+-MgmoavadaFzNq+j5EHpQ+k+=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: r8a77995: Add MSIOF device nodes
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-spi <linux-spi@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Wed, Jun 20, 2018 at 2:01 PM Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>
> This patch adds MSIOF device nodes for the R8A77995 SoC.
>
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [uli: remove unimplemented ref clock, clock-names]
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -798,6 +798,68 @@
>                         compatible = "renesas,prr";
>                         reg = <0 0xfff00044 0 4>;
>                 };
> +
> +               msiof0: spi@e6e90000 {

To preserve sort order, the msiof nodes should be inserted in between the SCIF
and VIN nodes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
