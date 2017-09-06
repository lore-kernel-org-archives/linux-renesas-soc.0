Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:34448 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932136AbdIFQFW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 12:05:22 -0400
Received: by mail-pg0-f66.google.com with SMTP id v82so3051797pgb.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Sep 2017 09:05:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170905172631.31083-1-wsa+renesas@sang-engineering.com>
References: <20170905172631.31083-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Sep 2017 18:05:21 +0200
Message-ID: <CAMuHMdVrbiWJcodEfRhJG3w9Pdk-9hZMov5fLewhkf-mW14n2g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: alt: use correct logic for SD WP pins
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Tue, Sep 5, 2017 at 7:26 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The WP pins are ACTIVE_HIGH, fix it in the DTS.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  arch/arm/boot/dts/r8a7794-alt.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
> index e45f92b5eb1107..bd98790d964e13 100644
> --- a/arch/arm/boot/dts/r8a7794-alt.dts
> +++ b/arch/arm/boot/dts/r8a7794-alt.dts
> @@ -304,7 +304,7 @@
>         vmmc-supply = <&vcc_sdhi0>;
>         vqmmc-supply = <&vccq_sdhi0>;
>         cd-gpios = <&gpio6 6 GPIO_ACTIVE_LOW>;
> -       wp-gpios = <&gpio6 7 GPIO_ACTIVE_LOW>;
> +       wp-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
>         sd-uhs-sdr50;
>         sd-uhs-sdr104;
>         status = "okay";
> @@ -318,7 +318,7 @@
>         vmmc-supply = <&vcc_sdhi1>;
>         vqmmc-supply = <&vccq_sdhi1>;
>         cd-gpios = <&gpio6 14 GPIO_ACTIVE_LOW>;
> -       wp-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
> +       wp-gpios = <&gpio6 15 GPIO_ACTIVE_HIGH>;
>         sd-uhs-sdr50;
>         status = "okay";

Thanks, looks good, as in "the same as on the other R-Car Gen2 boards".

Doesn't seem to fix this issue, though:

[    8.792344] sh_mobile_sdhi ee100000.sd: timeout waiting for
hardware interrupt (CMD19)
[   13.912331] sh_mobile_sdhi ee100000.sd: timeout waiting for
hardware interrupt (CMD19)
[   13.972338] sh_mobile_sdhi ee100000.sd: Tuning procedure failed
[   13.978277] mmc1: tuning execution failed: -110
[   13.982854] mmc1: error -110 whilst initialising SD card

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
