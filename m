Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:35107 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752633AbcIOSij (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Sep 2016 14:38:39 -0400
Received: by mail-io0-f194.google.com with SMTP id q92so33690ioi.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Sep 2016 11:38:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160914164648.31403-4-ulrich.hecht+renesas@gmail.com>
References: <20160914164648.31403-1-ulrich.hecht+renesas@gmail.com> <20160914164648.31403-4-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Sep 2016 20:38:35 +0200
Message-ID: <CAMuHMdUgsDWDhn242x3c6aTfW5gLCRvHf+5y+VnxX0CtG78QRg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: renesas: r8a7796: Enable SCIF DMA
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 14, 2016 at 6:46 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index e59ded4..d2bbf92 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -356,6 +356,8 @@
>                                  <&cpg CPG_CORE R8A7796_CLK_S3D1>,
>                                  <&scif_clk>;
>                         clock-names = "fck", "brg_int", "scif_clk";
> +                       dmas = <&dmac1 0x51>, <&dmac1 0x50>;

Same question as for i2c: please add the dmas pointing to dmac2 where
appropriate, if that works.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
