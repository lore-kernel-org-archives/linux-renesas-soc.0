Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:38737 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751554AbdITNqu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2017 09:46:50 -0400
MIME-Version: 1.0
In-Reply-To: <1505398766-4813-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1505398766-4813-1-git-send-email-vladimir.barinov@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Sep 2017 15:46:49 +0200
Message-ID: <CAMuHMdX2DHeO1b78kWdSe3M6EsQ3DANjS_HHM45aD0Ad9onzkw@mail.gmail.com>
Subject: Re: [PATCH v2 15/18] arm64: dts: ulcb-kf: enable PCA9539 on I2C4
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 14, 2017 at 4:19 PM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> This supports PCA9539 gpio expanders on I2C4 bus on ULCB Kingfisher board
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -70,6 +70,28 @@
>         };
>  };
>
> +&i2c4 {
> +       gpio_exp_76: gpio@76 {
> +               compatible = "nxp,pca9539";

Same comment about the compatible values as for [14/18].

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
