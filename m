Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:37437 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751529AbdITMUN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2017 08:20:13 -0400
MIME-Version: 1.0
In-Reply-To: <1504737322-22954-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1504737322-22954-1-git-send-email-vladimir.barinov@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Sep 2017 14:20:12 +0200
Message-ID: <CAMuHMdXyWV52_kZNFGQzPpnAYowa0KZYodMAWusCX5Opj3a1iQ@mail.gmail.com>
Subject: Re: [PATCH 03/18] arm64: dts: ulcb-kf: initial device tree
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

On Thu, Sep 7, 2017 at 12:35 AM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> Add the initial common dtsi file for Kingfisher infotainment board (R-Car
> Starter Kit extension)
>
> This commit supports the following peripherals:
> - HSCIF0
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
>
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> new file mode 100644
> index 0000000..849f8b1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -0,0 +1,31 @@
> +/*
> + * Device Tree Source for the Kingfisher (ULCB extension) board
> + *
> + * Copyright (C) 2017 Renesas Electronics Corp.
> + * Copyright (C) 2017 Cogent Embedded, Inc.
> + *
> + * This file is licensed under the terms of the GNU General Public License
> + * version 2.  This program is licensed "as is" without any warranty of any
> + * kind, whether express or implied.
> + */
> +
> +/ {
> +       aliases {
> +               serial1 = &hscif0;
> +       };
> +};
> +
> +&hscif0 {
> +       pinctrl-0 = <&hscif0_pins>;
> +       pinctrl-names = "default";
> +       uart-has-rtscts;
> +
> +       status = "okay";

This serial port is driving Bluetooth and WiFi, right?
So I expect this node to gain a child node for that in the future, cfr.
Documentation/devicetree/bindings/serial/slave-device.txt.

> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
