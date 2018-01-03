Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:41270 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751185AbeACKlU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jan 2018 05:41:20 -0500
Received: by mail-qt0-f195.google.com with SMTP id i40so1569317qti.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jan 2018 02:41:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171222201146.8414-1-wsa+renesas@sang-engineering.com>
References: <20171222201146.8414-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jan 2018 11:41:18 +0100
Message-ID: <CAMuHMdX7SO5rhfGOE0=HqV=5A6_vsJLgQc2Dxfnkw3uOjxYuOg@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: salvator-common: add GPIO extender
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Fri, Dec 22, 2017 at 9:11 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We need to configure its GPIOs later.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since V2:
> * added two more required properties (Thanks Geert!)
>
> And no dependency anymore (my statement for V2 was wrong).
>
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> index a298df74ca6c03..7d43ec24cf9fd0 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -338,6 +338,13 @@
>  &i2c4 {
>         status = "okay";
>
> +       pca9654: gpio@20 {
> +               compatible = "onnn,pca9654";
> +               reg = <0x20>;
> +               gpio-controller;
> +               #gpio-cells = <2>;

interrupts?

You can test them using CP16/17 and gpio-keys.

> +       };
> +
>         csa_vdd: adc@7c {
>                 compatible = "maxim,max9611";
>                 reg = <0x7c>;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
