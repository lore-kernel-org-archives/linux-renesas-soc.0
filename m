Return-Path: <horms@penelope.isobedori.kobe.vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: Vinod Koul <vinod.koul@intel.com>,
	dmaengine@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RFC] dmaengine: sh: Use ARCH_RENESAS
Date: Wed,  3 Feb 2016 11:55:34 +0100
Message-Id: <1454496934-20672-1-git-send-email-horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

Make use of ARCH_RENESAS in place of ARCH_SHMOBILE.

This is part of an ongoing process to migrate from ARCH_SHMOBILE to
ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
* Based on the next branch of Vinod's slave-dma tree
---
 drivers/dma/sh/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sh/Kconfig b/drivers/dma/sh/Kconfig
index f32c430eb16c..6e0685f1a838 100644
--- a/drivers/dma/sh/Kconfig
+++ b/drivers/dma/sh/Kconfig
@@ -12,7 +12,7 @@ config RENESAS_DMA
 
 config SH_DMAE_BASE
 	bool "Renesas SuperH DMA Engine support"
-	depends on SUPERH || ARCH_SHMOBILE || COMPILE_TEST
+	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
 	depends on !SUPERH || SH_DMA
 	depends on !SH_DMA_API
 	default y
@@ -41,7 +41,7 @@ endif
 
 config RCAR_DMAC
 	tristate "Renesas R-Car Gen2 DMA Controller"
-	depends on ARCH_SHMOBILE || COMPILE_TEST
+	depends on ARCH_RENESAS || COMPILE_TEST
 	select RENESAS_DMA
 	help
 	  This driver supports the general purpose DMA controller found in the
@@ -49,7 +49,7 @@ config RCAR_DMAC
 
 config RENESAS_USB_DMAC
 	tristate "Renesas USB-DMA Controller"
-	depends on ARCH_SHMOBILE || COMPILE_TEST
+	depends on ARCH_RENESAS || COMPILE_TEST
 	select RENESAS_DMA
 	select DMA_VIRTUAL_CHANNELS
 	help
-- 
2.7.0.rc3.207.g0ac5344
