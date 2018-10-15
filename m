Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io1-f67.google.com ([209.85.166.67]:38812 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbeJOVBX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Oct 2018 17:01:23 -0400
Received: by mail-io1-f67.google.com with SMTP id n5-v6so14197488ioh.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Oct 2018 06:16:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1538988712-17077-4-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1538988712-17077-1-git-send-email-fabrizio.castro@bp.renesas.com> <1538988712-17077-4-git-send-email-fabrizio.castro@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Oct 2018 15:15:26 +0200
Message-ID: <CAPDyKFqVZUG1J=E_s-P=UuYQm4JEUnT45faR-1qRQreENTXEOw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] mmc: renesas_sdhi: Add r8a77470 SDHI1 support
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Nan Li <nan.li@amlogic.com>, Jan Glauber <jglauber@cavium.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Carlo Caione <carlo@endlessm.com>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        tianshuliang <tianshuliang@hisilicon.com>,
        Liming Sun <lsun@mellanox.com>, Arnd Bergmann <arnd@arndb.de>,
        Alex Smith <alex.smith@imgtec.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 8 October 2018 at 10:51, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> The RZ/G1C (a.k.a. R8A77470) comes with three SDHI interfaces,
> SDHI0 and SDHI2 are compatible with the R-Car Gen2 SDHIs, SDHI1
> is compatible with R-Car Gen3 SDHIs and it can be used as
> eMMC as well. This patch adds driver compatibility, and makes
> sure both drivers get compiled for the R8A77470.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
>

Applied for next, thanks!

Kind regards
Uffe

> ---
> v2->v3:
> * No change
>
> v2:
> * New patch
> ---
>  drivers/mmc/host/Kconfig                      | 4 ++--
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 6 ++++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 694d082..fb654cd 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -622,9 +622,9 @@ config MMC_SDHI_SYS_DMAC
>
>  config MMC_SDHI_INTERNAL_DMAC
>         tristate "DMA for SDHI SD/SDIO controllers using on-chip bus mastering"
> -       depends on ARM64 || COMPILE_TEST
> +       depends on ARM64 || ARCH_R8A77470 || COMPILE_TEST
>         depends on MMC_SDHI
> -       default MMC_SDHI if ARM64
> +       default MMC_SDHI if (ARM64 || ARCH_R8A77470)
>         help
>           This provides DMA support for SDHI SD/SDIO controllers
>           using on-chip bus mastering. This supports the controllers
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index e5e5015..e729c39 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -113,6 +113,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
>  };
>
>  static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
> +       { .compatible = "renesas,sdhi-mmc-r8a77470", .data = &of_rcar_gen3_compatible, },
>         { .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_r8a7795_compatible, },
>         { .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_r8a7795_compatible, },
>         { .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
> @@ -288,7 +289,7 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
>   * Whitelist of specific R-Car Gen3 SoC ES versions to use this DMAC
>   * implementation as others may use a different implementation.
>   */
> -static const struct soc_device_attribute gen3_soc_whitelist[] = {
> +static const struct soc_device_attribute soc_whitelist[] = {
>         /* specific ones */
>         { .soc_id = "r8a7795", .revision = "ES1.*",
>           .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
> @@ -296,6 +297,7 @@ static const struct soc_device_attribute gen3_soc_whitelist[] = {
>           .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
>         /* generic ones */
>         { .soc_id = "r8a774a1" },
> +       { .soc_id = "r8a77470" },
>         { .soc_id = "r8a7795" },
>         { .soc_id = "r8a7796" },
>         { .soc_id = "r8a77965" },
> @@ -307,7 +309,7 @@ static const struct soc_device_attribute gen3_soc_whitelist[] = {
>
>  static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
>  {
> -       const struct soc_device_attribute *soc = soc_device_match(gen3_soc_whitelist);
> +       const struct soc_device_attribute *soc = soc_device_match(soc_whitelist);
>         struct device *dev = &pdev->dev;
>
>         if (!soc)
> --
> 2.7.4
>
