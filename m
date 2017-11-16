Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:44588 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932257AbdKPInd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2017 03:43:33 -0500
Received: by mail-qt0-f195.google.com with SMTP id 8so40781200qtv.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Nov 2017 00:43:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1510759510-30295-3-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1510759510-30295-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1510759510-30295-3-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Nov 2017 09:43:31 +0100
Message-ID: <CAMuHMdX1TPNtvvRo5VCzwwX6UkNax0Wv5AuJj0D5pi+jdUrdqQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: r8a7795: add DMA for SCIF2
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Wed, Nov 15, 2017 at 4:25 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Tested on Draak.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -393,6 +393,8 @@
>                                  <&cpg CPG_CORE R8A77995_CLK_S3D1C>,
>                                  <&scif_clk>;
>                         clock-names = "fck", "brg_int", "scif_clk";
> +                       dmas = <&dmac1 0x13>, <&dmac1 0x12>;
> +                       dma-names = "tx", "rx";

I guess SCIF2 can work with both dmac1 and dmac2?

>                         power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
>                         resets = <&cpg 310>;
>                         status = "disabled";

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
