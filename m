Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:36309 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750980AbdCQI3b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2017 04:29:31 -0400
MIME-Version: 1.0
In-Reply-To: <20170316175112.27913-2-chris.brandt@renesas.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com> <20170316175112.27913-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Mar 2017 09:22:53 +0100
Message-ID: <CAMuHMdXXRiUTJJRsrpyFNEwjvjPO2s5Rthn2r+UipaQgVHHMcQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] rtc: rtc-sh: add support for rza series
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
> This same RTC is used in RZ/A series MPUs, therefore with some slight
> changes, this driver can be reused. Additionally, since ARM architectures
> require Device Tree configurations, device tree support has been added.

Thanks for your patch!

> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1303,10 +1303,10 @@ config RTC_DRV_SA1100
>
>  config RTC_DRV_SH
>         tristate "SuperH On-Chip RTC"
> -       depends on SUPERH && HAVE_CLK
> +       depends on (SUPERH || ARCH_RENESAS) && HAVE_CLK

I believe the dependency on HAVE_CLK is not needed.
SuperH selects CLKDEV_LOOKUP, which selects HAVE_CLK.
ARM (and ARM64) selects COMMON_CLK, which selects HAVE_CLK.

interestingly, SuperH already did so at the time the dependency was added...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
