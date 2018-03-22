Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:40931 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751595AbeCVKUB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Mar 2018 06:20:01 -0400
Received: by mail-io0-f195.google.com with SMTP id e79so10289229ioi.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Mar 2018 03:20:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180320214258.16031-1-wsa+renesas@sang-engineering.com>
References: <20180320214258.16031-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 22 Mar 2018 11:20:00 +0100
Message-ID: <CAPDyKFqa5RcT295c0nBc=7gR0CMv3JuzPHsuX7Mroh-54_pX7Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: replace EXT_ACC with HOST_MODE
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 20 March 2018 at 22:42, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>
> All our documentation says HOST_MODE, we don't really know where EXT_ACC
> came from. Rename it to reduce the confusion.
>
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied for next!

Kind regards
Uffe

> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 80943fa07db64b..51e01f03fb995f 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -38,7 +38,7 @@
>  #include "renesas_sdhi.h"
>  #include "tmio_mmc.h"
>
> -#define EXT_ACC           0xe4
> +#define HOST_MODE              0xe4
>
>  #define SDHI_VER_GEN2_SDR50    0x490c
>  #define SDHI_VER_RZ_A1         0x820b
> @@ -76,7 +76,7 @@ static void renesas_sdhi_sdbuf_width(struct tmio_mmc_host *host, int width)
>                 return;
>         }
>
> -       sd_ctrl_write16(host, EXT_ACC, val);
> +       sd_ctrl_write16(host, HOST_MODE, val);
>  }
>
>  static int renesas_sdhi_clk_enable(struct tmio_mmc_host *host)
> @@ -417,7 +417,7 @@ static int renesas_sdhi_write16_hook(struct tmio_mmc_host *host, int addr)
>         case CTL_SD_MEM_CARD_OPT:
>         case CTL_TRANSACTION_CTL:
>         case CTL_DMA_ENABLE:
> -       case EXT_ACC:
> +       case HOST_MODE:
>                 if (host->pdata->flags & TMIO_MMC_HAVE_CBSY)
>                         bit = TMIO_STAT_CMD_BUSY;
>                 /* fallthrough */
> --
> 2.11.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
