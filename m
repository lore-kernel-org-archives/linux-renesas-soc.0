Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:51487 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751047AbeFDGon (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jun 2018 02:44:43 -0400
Received: by mail-it0-f67.google.com with SMTP id c132-v6so16360ith.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Jun 2018 23:44:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180601110037.3400-1-wsa+renesas@sang-engineering.com>
References: <20180601110037.3400-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 4 Jun 2018 08:44:42 +0200
Message-ID: <CAPDyKFpTG2kEEAe_hjRe-8vyuHW11i4NRmnNMeEcFxpBC=D48w@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: really fix WP logic regressions
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 1 June 2018 at 13:00, Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> This reverts commit e060d376cc61 ("mmc: renesas_sdhi: fix WP detection")
> and adds some code to really fix the regressions.
>
> It was missed so far that Renesas R-Car instantiations of SDHI chose to
> disable internal WP and used the existence of "wp-gpios" to en/disable
> WP at all.
>
> With the first refactoring by Yamada-san with commit  ("mmc:
> renesas_sdhi: use MMC_CAP2_NO_WRITE_PROTECT instead of TMIO own flag"),
> WP was always disabled even when GPIOs were present. With Wolfram's
> first fix which gets now reverted, GPIOs were honored. But when not
> available, the fallback was to internal WP and not to disabled WP. This
> caused wrong WP status on uSD card slots.
>
> Restore the old behaviour now. By default, WP is disabled. When a GPIO
> is found, the GPIO re-enables WP. We will think about possible better
> ways to handle this in the future.
>
> Tested on a previously regressing Renesas Lager board (H2) and a still
> working Renesas Salvator-X board (M3-W).
>
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Unfortunate this didn't make it for 4.17, however I have applied it for 4.18.

Thanks!
Uffe

> ---
>  drivers/mmc/host/renesas_sdhi_core.c          | 5 +++++
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 3 +++
>  3 files changed, 9 insertions(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 51e01f03fb99..45c015da2e75 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -28,6 +28,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/mmc/host.h>
> +#include <linux/mmc/slot-gpio.h>
>  #include <linux/mfd/tmio.h>
>  #include <linux/sh_dma.h>
>  #include <linux/delay.h>
> @@ -534,6 +535,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         host->multi_io_quirk    = renesas_sdhi_multi_io_quirk;
>         host->dma_ops           = dma_ops;
>
> +       /* For some SoC, we disable internal WP. GPIO may override this */
> +       if (mmc_can_gpio_ro(host->mmc))
> +               mmc_data->capabilities2 &= ~MMC_CAP2_NO_WRITE_PROTECT;
> +
>         /* SDR speeds are only available on Gen2+ */
>         if (mmc_data->flags & TMIO_MMC_MIN_RCAR2) {
>                 /* card_busy caused issues on r8a73a4 (pre-Gen2) CD-less SDHI */
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index b6edb7a695b5..f7f9773d161f 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -87,6 +87,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
>                           TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
>         .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>                           MMC_CAP_CMD23,
> +       .capabilities2  = MMC_CAP2_NO_WRITE_PROTECT,
>         .bus_shift      = 2,
>         .scc_offset     = 0x1000,
>         .taps           = rcar_gen3_scc_taps,
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index 848e50c1638a..4bb46c489d71 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -42,6 +42,7 @@ static const struct renesas_sdhi_of_data of_rz_compatible = {
>  static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
>         .tmio_flags     = TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL,
>         .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ,
> +       .capabilities2  = MMC_CAP2_NO_WRITE_PROTECT,
>  };
>
>  /* Definitions for sampling clocks */
> @@ -61,6 +62,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
>                           TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
>         .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>                           MMC_CAP_CMD23,
> +       .capabilities2  = MMC_CAP2_NO_WRITE_PROTECT,
>         .dma_buswidth   = DMA_SLAVE_BUSWIDTH_4_BYTES,
>         .dma_rx_offset  = 0x2000,
>         .scc_offset     = 0x0300,
> @@ -81,6 +83,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
>                           TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
>         .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>                           MMC_CAP_CMD23,
> +       .capabilities2  = MMC_CAP2_NO_WRITE_PROTECT,
>         .bus_shift      = 2,
>         .scc_offset     = 0x1000,
>         .taps           = rcar_gen3_scc_taps,
> --
> 2.11.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
