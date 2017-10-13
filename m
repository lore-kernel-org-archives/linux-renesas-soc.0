Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36741 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751889AbdJML1A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2017 07:27:00 -0400
Received: by mail-wm0-f65.google.com with SMTP id 131so5555225wmk.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Oct 2017 04:27:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171013110600.6858-2-horms+renesas@verge.net.au>
References: <20171013110600.6858-1-horms+renesas@verge.net.au> <20171013110600.6858-2-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Oct 2017 13:26:59 +0200
Message-ID: <CAMuHMdU_f3TCQoL3ys3_+fLK0W-YUMn12ohW6md1-TWF-Aegrw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] ARM: dts: r8a7778: Use R-Car GPIO Gen1 fallback
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

On Fri, Oct 13, 2017 at 1:05 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Use newly added R-Car GPIO Gen1 fallback compat string
> in place of now deprecated non-generation specific
> R-Car GPIO fallback compat string in DT of r8a7778 SoC.
>
> As the driver does not match on "renesas,gpio-r8a7778" there
> are some run-time considerations for this patch:
>
> * When a resulting DTB is used with kernels newer than v4.14 this should
>   not have any run-time effect as renesas,rcar-gen2-gpio is matched by the

renesas,rcar-gen1-gpio

>   driver since commit dbd1dad2ab8f ("gpio: rcar: add gen[123] fallback
>   compatibility strings")
>
> * However, when used with older kernels GPIO will be disabled as
>   no compat string match will be made by the driver.
>
> The regression documented above for the new DTB with old kernel case
> is acceptable in my opinion.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

> --- a/arch/arm/boot/dts/r8a7778.dtsi
> +++ b/arch/arm/boot/dts/r8a7778.dtsi
> @@ -88,7 +88,7 @@
>         };
>
>         gpio0: gpio@ffc40000 {
> -               compatible = "renesas,gpio-r8a7778", "renesas,gpio-rcar";
> +               compatible = "renesas,gpio-r8a7778", "renesas,rcar-gen2-gpio";

renesas,rcar-gen1-gpio

The compatible values for the other nodes are correct.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
