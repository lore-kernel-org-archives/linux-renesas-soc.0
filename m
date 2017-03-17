Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34749 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750998AbdCQI15 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2017 04:27:57 -0400
MIME-Version: 1.0
In-Reply-To: <20170316175112.27913-4-chris.brandt@renesas.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com> <20170316175112.27913-4-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Mar 2017 09:27:54 +0100
Message-ID: <CAMuHMdXAvMoLu5azcBfX5pH_KYApcYSipBktpbfLybvnCG+bwg@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: r7s72100: add rtc clock to device tree
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

On Thu, Mar 16, 2017 at 6:51 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -117,6 +117,15 @@
>                         clock-output-names = "ostm0", "ostm1";
>                 };
>
> +               mstp6_clks: mstp6_clks@fcfe042c {
> +                       #clock-cells = <1>;
> +                       compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
> +                       reg = <0xfcfe042c 4>;
> +                       clocks = <&p0_clk>;
> +                       clock-indices = <R7S72100_CLK_RTC>;
> +                       clock-output-names = "rtc0";

"rtc"? There's only one.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
