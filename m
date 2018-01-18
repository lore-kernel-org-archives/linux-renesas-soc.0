Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:48135 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753128AbeARB7d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 20:59:33 -0500
MIME-Version: 1.0
In-Reply-To: <1516206496-16612-12-git-send-email-yamada.masahiro@socionext.com>
References: <1516206496-16612-1-git-send-email-yamada.masahiro@socionext.com> <1516206496-16612-12-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 18 Jan 2018 10:58:36 +0900
Message-ID: <CAK7LNAQUJw-fjuJO68Kvskn8BRYW3rZj4YMtbo-Oxfv7c=6Ggg@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] mmc: tmio: deprecate "toshiba,mmc-wrprotect-disable"
 DT property
To: linux-mmc <linux-mmc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Ulf Magnusson <ulfalizer@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

2018-01-18 1:28 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> This property is equivalent to "disable-wp" defined in
> Documentation/devicetree/bindings/mmc/tmio_mmc.txt

This is mistake.

"disable-wp" is defined in

Documentation/devicetree/bindings/mmc/mmc.txt




> The TMIO MMC core calls mmc_of_parse(), and it sets
> MMC_CAP2_NO_WRITE_PROTECT if "disable-wp" property is present.
>
> We do not need a vendor-specific property to do the same thing.
>
> Let's remove the description from the dt-binding to prevent new boards
> from using it.
>
> I am keeping the driver code for existing DT files, but added
> comments that this is deprecated.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v3:
>   - newly added
>
> Changes in v2: None
>
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 1 -
>  drivers/mmc/host/tmio_mmc_core.c                   | 5 +++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> index 3c67624..cb7d40e 100644
> --- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> @@ -49,7 +49,6 @@ Required properties:
>           2: R7S72100
>
>  Optional properties:
> -- toshiba,mmc-wrprotect-disable: write-protect detection is unavailable
>  - pinctrl-names: should be "default", "state_uhs"
>  - pinctrl-0: should contain default/high speed pin ctrl
>  - pinctrl-1: should contain uhs mode pin ctrl
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 7ad3433c..f30ac69 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1134,6 +1134,11 @@ static void tmio_mmc_of_parse(struct platform_device *pdev,
>         if (!np)
>                 return;
>
> +       /*
> +        * DEPRECATED:
> +        * For new platforms, please use "disable-wp" instead of
> +        * "toshiba,mmc-wrprotect-disable"
> +        */
>         if (of_get_property(np, "toshiba,mmc-wrprotect-disable", NULL))
>                 mmc->caps2 |= MMC_CAP2_NO_WRITE_PROTECT;
>  }
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
