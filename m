Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:38197 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728125AbeGTMf7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 08:35:59 -0400
Received: by mail-ua0-f194.google.com with SMTP id o11-v6so7279081uak.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jul 2018 04:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20171222201313.8466-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20171222201313.8466-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Jul 2018 13:47:54 +0200
Message-ID: <CAMuHMdUNHtVfgdOtJHGv1e0w2uTfHO4OW-RNHtYa8aSPpPse4A@mail.gmail.com>
Subject: Re: [RFC v2] arm64: dts: r8a7795: salvator-xs: enable SATA
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your patch!

On Fri, Dec 22, 2017 at 9:13 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> SATA needs this GPIO hog, so is probably an overlay?

IMHO it can be part of the real board DTS, for the following reasons:
  1. SATA is multiplexed with PCIE1, but the SATA connector is on-board,
     while using PCIE1 requires plugging in an extension board in EXIO
     Connector A.
  2. PCIE1 is the default, for both MD12 and the PCIE-SATA switch, but I
     assume that is only the case because Salvator-XS supports all of R-Car
     H3 ES2, M3-W, and M3-N, while M3-W does not have SATA.

Note that for the GPIO hog to survive s2ram, the pca9654 driver needs to
be enhanced to restore its configuration after system resume.

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
> @@ -101,6 +101,19 @@
>         };
>  };
>
> +&pca9654 {

Please insert this node just before &pfc, to preserve sort order.

> +       pcie_sata_switch {
> +               gpio-hog;
> +               gpios = <7 0>;

s/0/GPIO_ACTIVE_HIGH/?

> +               output-low;
> +               line-name = "PCIE/SATA switch";

Perhaps add a comment saying MD12 must be 1 (SW12-7 must be off)?

> +       };
> +};
> +
> +&sata {
> +       status = "okay";
> +};
> +
>  &usb2_phy2 {
>         pinctrl-0 = <&usb2_pins>;
>         pinctrl-names = "default";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
