Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:37938 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750876AbdHNNq7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2017 09:46:59 -0400
Received: by mail-pg0-f67.google.com with SMTP id 123so10760570pga.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2017 06:46:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1502181568-12299-2-git-send-email-horms+renesas@verge.net.au>
References: <1502181568-12299-1-git-send-email-horms+renesas@verge.net.au> <1502181568-12299-2-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Aug 2017 15:46:58 +0200
Message-ID: <CAMuHMdUxjAmSg=PNXhSU-M6CVVVH-Q1F+75XRpmsH7Hhye6XEQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] ARM: dts: r8a7778: Use R-Car GPIO Gen1 fallback
 compat string
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, Aug 8, 2017 at 10:39 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Use newly added R-Car GPIO Gen1 fallback compat string
> in place of now deprecated non-generation specific
> R-Car GPIO fallback compat string in DT of r8a7778 SoC.
>
> This should have no run-time effect as the driver matches against
> the per-SoC compat string before considering the fallback compat string.

That is not correct: the driver does not match against "renesas,gpio-r8a7778".
Hence this breaks using a new DTS and an old kernel (which we may decide not
to care about for R-Car Gen1, though).
But at least the DTS change should be postponed until commit d10bbd156926e65d
("gpio: rcar: add gen[123] fallback compatibility strings") has hit mainline.

> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm/boot/dts/r8a7778.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
> index 8f3156c0e575..b3975e4c75dd 100644
> --- a/arch/arm/boot/dts/r8a7778.dtsi
> +++ b/arch/arm/boot/dts/r8a7778.dtsi
> @@ -88,7 +88,7 @@
>         };
>
>         gpio0: gpio@ffc40000 {
> -               compatible = "renesas,gpio-r8a7778", "renesas,gpio-rcar";
> +               compatible = "renesas,gpio-r8a7778", "renesas,rcar-gen2-gpio";

... "renesas,rcar-gen1-gpio";

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
