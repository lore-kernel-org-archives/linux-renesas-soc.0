Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:35283 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752842AbdBUO11 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Feb 2017 09:27:27 -0500
Received: by mail-it0-f66.google.com with SMTP id 203so16245847ith.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2017 06:27:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1481129067-21949-4-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1481129067-21949-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1481129067-21949-4-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Feb 2017 15:27:25 +0100
Message-ID: <CAMuHMdUGbb4CjpGzXapprrcuKAfKw3wkYc77JOn1EKNRsMm3VA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: renesas: r8a7796: Enable SCIF DMA
To: Simon Horman <horms@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Dec 7, 2016 at 5:44 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index c5f0df5..782063a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -430,6 +430,9 @@
>                                  <&cpg CPG_CORE R8A7796_CLK_S3D1>,
>                                  <&scif_clk>;
>                         clock-names = "fck", "brg_int", "scif_clk";
> +                       dmas = <&dmac1 0x51>, <&dmac1 0x50>,
> +                              <&dmac2 0x51>, <&dmac2 0x50>;
> +                       dma-names = "tx", "rx", "tx", "rx";
>                         power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
>                         status = "disabled";

Apparently the DMA properties were added to the HSCIF nodes instead
of the SCIF nodes while applying this patch?

3 lines of context is not sufficient to distinguish between the various SCIF
and HSCIF nodes :-(

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
