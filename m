Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36077 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751872AbdJPJNd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2017 05:13:33 -0400
Received: by mail-wm0-f67.google.com with SMTP id 131so6828647wmk.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2017 02:13:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171016075822.18177-2-horms+renesas@verge.net.au>
References: <20171016075822.18177-1-horms+renesas@verge.net.au> <20171016075822.18177-2-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Oct 2017 11:13:32 +0200
Message-ID: <CAMuHMdUSan7j5wf=cYwO-RdcY7KiJSAPuh7nPq4YQMc_4_sfcA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: renesas_sdhi: provide example in
 bindings documentation
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Mon, Oct 16, 2017 at 9:58 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Provide an example of the usage of the DT bindings for TMIO
> in their documentation. The example given is for the r8a7790 (R-Car H2).
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v2
> * Correct description of example, it is for the r8a7790 (R-Car H2)
>   rather than the r8a7779 (R-Car H1)

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> @@ -43,3 +43,57 @@ Optional properties:
>  - pinctrl-names: should be "default", "state_uhs"
>  - pinctrl-0: should contain default/high speed pin ctrl
>  - pinctrl-1: should contain uhs mode pin ctrl
> +
> +Example: R8A7790 (R-Car H2) SDHI controller nodes
> +
> +       sdhi0: sd@ee100000 {
> +               compatible = "renesas,sdhi-r8a7790";
> +               reg = <0 0xee100000 0 0x328>;
> +               interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&mstp3_clks R8A7790_CLK_SDHI0>;

You may want to copy the example from the current r8a7790.dtsi, which
uses the newer CPG/MSSR bindings.

> +               dmas = <&dmac0 0xcd>, <&dmac0 0xce>,
> +                      <&dmac1 0xcd>, <&dmac1 0xce>;
> +               dma-names = "tx", "rx", "tx", "rx";
> +               max-frequency = <195000000>;
> +               power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +               status = "disabled";
> +       };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
