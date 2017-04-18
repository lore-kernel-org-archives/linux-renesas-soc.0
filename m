Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:32884 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932147AbdDRHW0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 03:22:26 -0400
Received: by mail-io0-f196.google.com with SMTP id k87so31108287ioi.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2017 00:22:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1492493267-20807-1-git-send-email-horms+renesas@verge.net.au>
References: <1492493267-20807-1-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Apr 2017 09:22:24 +0200
Message-ID: <CAMuHMdV_L_Fpm0=WQkHgVn123G4X+cUSxECqw4yi3TYvdSSGCA@mail.gmail.com>
Subject: Re: [PATCH/RFT] ARM: dts: silk: Enable UHS-I SDR-50
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 18, 2017 at 7:27 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Add the "1v8" pinctrl state and sd-uhs-sdr50 property to SDHI1.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> * Compile tested only; no access to silk board
> ---
>  arch/arm/boot/dts/r8a7794-silk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
> index 4cb5278d104d..b0ef8ea75c29 100644
> --- a/arch/arm/boot/dts/r8a7794-silk.dts
> +++ b/arch/arm/boot/dts/r8a7794-silk.dts
> @@ -226,6 +226,13 @@
>         du1_pins: du1 {
>                 groups = "du1_rgb666", "du1_sync", "du1_disp", "du1_clk0_out";
>                 function = "du1";
> +               power-source = <3300>;
> +       };
> +
> +       sdhi1_pins_uhs: sd1_uhs {
> +               groups = "sdhi1_data4", "sdhi1_ctrl";
> +               function = "sdhi1";
> +               power-source = <1800>;

Shouldn't this be inserted right after the existing sdhi1_pins?
Yes, the list is only partially sorted.

>         };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
