Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:42355 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731716AbeGZNoR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jul 2018 09:44:17 -0400
Received: by mail-vk0-f66.google.com with SMTP id t4-v6so683278vke.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jul 2018 05:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20180725193457.3999-1-wsa+renesas@sang-engineering.com> <20180725193457.3999-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180725193457.3999-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jul 2018 14:27:27 +0200
Message-ID: <CAMuHMdVdGaKQWMF1Bkq2T52Mt0TOzmgziSezwjpjJy+sg4hG=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: r8a7795: salvator-xs: enable SATA
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram

On Wed, Jul 25, 2018 at 9:35 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add the nodes to enable SATA. Note that MD12 (SW12-7) must be switched
> off for that to work.

Thanks for your patch!

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts

> @@ -176,6 +185,11 @@
>         };
>  };
>
> +       /* MD12 (SW12-7) must be set 'Off' which is not the default! */

Weird indentation?
Either drop the indentation, or move the comment inside the &sata node?

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
