Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:24906 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726617AbeJCRyT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Oct 2018 13:54:19 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Carlo Caione <carlo@endlessm.com>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Alex Smith <alex.smith@imgtec.com>, linux-mmc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/6] mmc: renesas_sdhi: Add r8a77470 SDHI1 support
Date: Wed,  3 Oct 2018 12:05:41 +0100
Message-Id: <1538564744-15590-4-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1538564744-15590-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1538564744-15590-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The RZ/G1C (a.k.a. R8A77470) comes with three SDHI interfaces,
SDHI0 and SDHI2 are compatible with the R-Car Gen2 SDHIs, SDHI1
is compatible with R-Car Gen3 SDHIs and it can be used as
eMMC as well. This patch adds driver compatibility, and makes
sure both drivers get compiled for the R8A77470.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>

---
v2:
* New patch
---
 drivers/mmc/host/Kconfig                      | 4 ++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 694d082..fb654cd 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -622,9 +622,9 @@ config MMC_SDHI_SYS_DMAC
 
 config MMC_SDHI_INTERNAL_DMAC
 	tristate "DMA for SDHI SD/SDIO controllers using on-chip bus mastering"
-	depends on ARM64 || COMPILE_TEST
+	depends on ARM64 || ARCH_R8A77470 || COMPILE_TEST
 	depends on MMC_SDHI
-	default MMC_SDHI if ARM64
+	default MMC_SDHI if (ARM64 || ARCH_R8A77470)
 	help
 	  This provides DMA support for SDHI SD/SDIO controllers
 	  using on-chip bus mastering. This supports the controllers
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index e5e5015..e729c39 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -113,6 +113,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
 };
 
 static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
+	{ .compatible = "renesas,sdhi-mmc-r8a77470", .data = &of_rcar_gen3_compatible, },
 	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_r8a7795_compatible, },
 	{ .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_r8a7795_compatible, },
 	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
@@ -288,7 +289,7 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
  * Whitelist of specific R-Car Gen3 SoC ES versions to use this DMAC
  * implementation as others may use a different implementation.
  */
-static const struct soc_device_attribute gen3_soc_whitelist[] = {
+static const struct soc_device_attribute soc_whitelist[] = {
 	/* specific ones */
 	{ .soc_id = "r8a7795", .revision = "ES1.*",
 	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
@@ -296,6 +297,7 @@ static const struct soc_device_attribute gen3_soc_whitelist[] = {
 	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
 	/* generic ones */
 	{ .soc_id = "r8a774a1" },
+	{ .soc_id = "r8a77470" },
 	{ .soc_id = "r8a7795" },
 	{ .soc_id = "r8a7796" },
 	{ .soc_id = "r8a77965" },
@@ -307,7 +309,7 @@ static const struct soc_device_attribute gen3_soc_whitelist[] = {
 
 static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
 {
-	const struct soc_device_attribute *soc = soc_device_match(gen3_soc_whitelist);
+	const struct soc_device_attribute *soc = soc_device_match(soc_whitelist);
 	struct device *dev = &pdev->dev;
 
 	if (!soc)
-- 
2.7.4
