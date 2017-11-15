Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:46109 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754028AbdKOQtW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2017 11:49:22 -0500
MIME-Version: 1.0
In-Reply-To: <1510146398-31805-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1510146398-31805-1-git-send-email-vladimir.barinov@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Nov 2017 17:49:21 +0100
Message-ID: <CAMuHMdX+7cHF4ZWBkZ8jQzhuycKYGNdFuZK5Ge9e9coX9pUKcQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: ulcb-kf: add pfc node for USB3.0
 channel 0
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

Hi Vladimir,

On Wed, Nov 8, 2017 at 2:06 PM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> Adds the pfc node for USB3.0 channel 0.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> ---
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> index 48a2e8f..2ecb6ac 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -173,6 +173,11 @@
>                 groups = "usb0";
>                 function = "usb0";
>         };
> +
> +       usb30_pins: usb30 {
> +               groups = "usb30";
> +               function = "usb30";

This enabled USB30_PWEN and USB30_OVC.

However, these pins are routed via CN1A pins A97/A98 to HDMI_CS_A
and HDMI_CS_B, not to a USB PHY?

USB30_PWEN of the real USB PHY is provided by the i2c GPIO
expander U11.

I'm a bit puzzled by this... What am I missing?

> +       };
>  };
>
>  &scif1 {
> @@ -191,5 +196,8 @@
>  };
>
>  &xhci0 {
> +       pinctrl-0 = <&usb30_pins>;
> +       pinctrl-names = "default";
> +
>         status = "okay";
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
