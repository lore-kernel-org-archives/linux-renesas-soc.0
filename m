Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:34731 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751601AbeCOKXh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 06:23:37 -0400
Received: by mail-io0-f196.google.com with SMTP id e7so7977866ioj.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Mar 2018 03:23:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180305204842.25391-1-wsa+renesas@sang-engineering.com>
References: <20180305204842.25391-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 15 Mar 2018 11:23:36 +0100
Message-ID: <CAPDyKFpNnFZUkMWG9ii-LygDZ_o+Lqp2RotB0mkVbHj48L0m-Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: fix WP detection
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 5 March 2018 at 21:48, Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> Commit "mmc: renesas_sdhi: use MMC_CAP2_NO_WRITE_PROTECT instead of
> TMIO own flag" activated MMC_CAP2_NO_WRITE_PROTECT for Renesas SDHI
> which incorrectly disabled WP altogether instead of only disabling the
> internal mechanism. Since the whole WP handling has been reworked, we
> can simply disable this capability to re-enable WP GPIOs.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied for next!

Kind regards
Uffe

> ---
>
> More testing revealed this. This time, I don't think squashing makes sense but
> I am open to discussion here.
>
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 -
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 3 ---
>  2 files changed, 4 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index a04f31fea72fd1..8e0acd197c43c0 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -75,7 +75,6 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
>                           TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
>         .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>                           MMC_CAP_CMD23,
> -       .capabilities2  = MMC_CAP2_NO_WRITE_PROTECT,
>         .bus_shift      = 2,
>         .scc_offset     = 0x1000,
>         .taps           = rcar_gen3_scc_taps,
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index 4bb46c489d71f8..848e50c1638aa6 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -42,7 +42,6 @@ static const struct renesas_sdhi_of_data of_rz_compatible = {
>  static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
>         .tmio_flags     = TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL,
>         .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ,
> -       .capabilities2  = MMC_CAP2_NO_WRITE_PROTECT,
>  };
>
>  /* Definitions for sampling clocks */
> @@ -62,7 +61,6 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
>                           TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
>         .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>                           MMC_CAP_CMD23,
> -       .capabilities2  = MMC_CAP2_NO_WRITE_PROTECT,
>         .dma_buswidth   = DMA_SLAVE_BUSWIDTH_4_BYTES,
>         .dma_rx_offset  = 0x2000,
>         .scc_offset     = 0x0300,
> @@ -83,7 +81,6 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
>                           TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
>         .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>                           MMC_CAP_CMD23,
> -       .capabilities2  = MMC_CAP2_NO_WRITE_PROTECT,
>         .bus_shift      = 2,
>         .scc_offset     = 0x1000,
>         .taps           = rcar_gen3_scc_taps,
> --
> 2.11.0
>
