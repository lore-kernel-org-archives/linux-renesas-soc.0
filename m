Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:42245 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbeLGI2f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 03:28:35 -0500
Received: by mail-vs1-f66.google.com with SMTP id b74so1966206vsd.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Dec 2018 00:28:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1544126077.git.horms+renesas@verge.net.au> <595096daf0ac9c1741b6182eb72d636802a21006.1544126077.git.horms+renesas@verge.net.au>
In-Reply-To: <595096daf0ac9c1741b6182eb72d636802a21006.1544126077.git.horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Dec 2018 09:28:22 +0100
Message-ID: <CAMuHMdUZSqaW_Vk9GjrtKjRUKdmbFMC5CEswGc_wDWQ-d515hw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: defconfig: Enable scu-simple-card driver
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Dec 6, 2018 at 10:58 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> Enable the scu-simple-card which is used by
> the R-Car E3 (r8a77990) based Ebisu board.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index f88190463481..9d0b42d96f03 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -491,6 +491,7 @@ CONFIG_SND_SOC_RT5514=m
>  CONFIG_SND_SOC_RT5514_SPI=m
>  CONFIG_SND_SOC_RT5645=m
>  CONFIG_SND_SIMPLE_CARD=m
> +CONFIG_SND_SIMPLE_SCU_CARD=y

Shouldn't this be "m"?

>  CONFIG_SND_AUDIO_GRAPH_CARD=m
>  CONFIG_I2C_HID=m
>  CONFIG_USB=y

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
