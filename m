Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:42930 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751531AbeCWItK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Mar 2018 04:49:10 -0400
Received: by mail-qk0-f194.google.com with SMTP id b198so12099207qkg.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Mar 2018 01:49:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180322102423.18269-5-horms+renesas@verge.net.au>
References: <20180322102423.18269-1-horms+renesas@verge.net.au> <20180322102423.18269-5-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Mar 2018 09:49:08 +0100
Message-ID: <CAMuHMdX-Sm2fnnw7DRxNHgJqppjKuWgS6M_uE38URxM6GwHdBg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: r8a7796: sort subnodes of the
 soc node
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Mar 22, 2018 at 11:24 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Sort subnodes of the soc node.
> - The primary key is the bus address.
> - The secondary key is the IP block.
> - The tertiary key is the node name.
>
> This is part of an ongoing effort to provide consistent node
> order in the DT of Renesas SoCs to improve maintainability.
>
> This should not have any run-time effect.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
using dtx_diff, and "grep '@.*{', which tells me

> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi

>                 pciec0: pcie@fe000000 {
> @@ -1860,6 +1838,43 @@
>                         /* placeholder */
>                 };
>
> +               gic: interrupt-controller@f1010000 {

Probably gic should be before pciec0.
Currently it's after pciec1, which has a lower address than pciec1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
