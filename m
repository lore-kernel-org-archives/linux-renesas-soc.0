Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:44191 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751747AbeASIEF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 03:04:05 -0500
Received: by mail-qt0-f194.google.com with SMTP id l20so567840qtj.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2018 00:04:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171221120859.14729-1-wsa+renesas@sang-engineering.com>
References: <20171221120859.14729-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jan 2018 09:04:04 +0100
Message-ID: <CAMuHMdVUcXDf82zupm0BRqjPwBV_kxbtVGhg951ypNoz9c+J_Q@mail.gmail.com>
Subject: Re: [RFC] arm64: renesas_defconfig: add driver for PCA9654
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Thu, Dec 21, 2017 at 1:08 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Do you actually want patches for renesas_defconfig?

Yes we do!

>  arch/arm64/configs/renesas_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
> index 88cbd4f769d15b..69a0e107c75bb7 100644
> --- a/arch/arm64/configs/renesas_defconfig
> +++ b/arch/arm64/configs/renesas_defconfig
> @@ -131,6 +131,8 @@ CONFIG_PINCTRL_SINGLE=y
>  CONFIG_GPIOLIB=y
>  CONFIG_GPIO_GENERIC_PLATFORM=y
>  CONFIG_GPIO_RCAR=y
> +CONFIG_GPIO_PCA953X=y
> +CONFIG_GPIO_PCA953X_IRQ=y

Why enable CONFIG_GPIO_PCA953X_IRQ if you don't want to add an
interrupts property to the device node in DT yet? ;-)

>  CONFIG_GPIO_BD9571MWV=y
>  CONFIG_THERMAL=y
>  CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
