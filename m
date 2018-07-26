Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:36703 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730097AbeGZNp4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jul 2018 09:45:56 -0400
Received: by mail-vk0-f65.google.com with SMTP id y9-v6so691744vky.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jul 2018 05:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20180725193457.3999-1-wsa+renesas@sang-engineering.com> <20180725193457.3999-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180725193457.3999-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jul 2018 14:29:07 +0200
Message-ID: <CAMuHMdXCTon_wvFh5c2y-C2++nak0juwR8s0yz7sAZw9iHyN+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: r8a77965: salvator-xs: enable SATA
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 25, 2018 at 9:35 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add the nodes to enable SATA. Note that MD12 (SW12-7) must be switched
> off for that to work.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
> @@ -47,3 +47,17 @@
>  &hdmi0_con {
>         remote-endpoint = <&rcar_dw_hdmi0_out>;
>  };
> +
> +&pca9654 {
> +       pcie_sata_switch {
> +               gpio-hog;
> +               gpios = <7 GPIO_ACTIVE_HIGH>;
> +               output-low; /* enable SATA by default */
> +               line-name = "PCIE/SATA switch";
> +       };
> +};
> +
> +       /* MD12 (SW12-7) must be set 'Off' which is not the default! */

Weird indentation?

> +&sata {
> +       status = "okay";
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
