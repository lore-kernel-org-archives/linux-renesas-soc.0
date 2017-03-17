Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35019 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751130AbdCQI03 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2017 04:26:29 -0400
MIME-Version: 1.0
In-Reply-To: <20170316175112.27913-3-chris.brandt@renesas.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com> <20170316175112.27913-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Mar 2017 09:17:20 +0100
Message-ID: <CAMuHMdVu0dQjptyW0F5YS+V6sixXTM3P6VWq2=8BQ5njUOXf-Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] rtc: Add rtc-sh
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        RTCLINUX <rtc-linux@googlegroups.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Thu, Mar 16, 2017 at 6:51 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> rtc-sh is a RTC for SuperH and RZ/A SoCs.

an RTC?

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-sh.txt
> @@ -0,0 +1,19 @@
> +* Real Time Clock for Renesas SH and ARM SoCs
> +
> +Required properties:
> +- compatible: Should be "renesas,r7s72100-rtc" or "renesas,sh-rtc" as a

s/or/and/

> +  fallback.
> +- reg: physical base address and length of memory mapped region.
> +- interrupts: 3 interrupts for alarm, period, and carry.

If there's a need for multiple interrupts, it's always a good idea to use
interrupt-names. The datasheet calls them "arm", "prd", and "cup", but
I wouldn't object against "alarm", "period", and "carry" ;-)

> +- clocks: the clock source for the RTC controller.

The datasheet mentions 3 possible clock sources?

> +Example:
> +rtc: rtc@fcff1000 {
> +       compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
> +       reg = <0xfcff1000 0x2e>;
> +       interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING
> +                     GIC_SPI 277 IRQ_TYPE_EDGE_RISING
> +                     GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
> +       clocks = <&mstp6_clks R7S72100_CLK_RTC>;
> +       power-domains = <&cpg_clocks>;
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
