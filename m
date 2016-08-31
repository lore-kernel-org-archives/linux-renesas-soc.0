Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:55040 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759542AbcHaJii (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Aug 2016 05:38:38 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] spi: sh-msiof: Use ARCH_SHMOBILE instead of SUPERH
Date: Wed, 31 Aug 2016 11:37:05 +0200
Message-Id: <1472636225-27091-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

"spi_sh_msiof" is used on sh7723 and sh7724 only. As all of the above
select ARCH_SHMOBILE, restrict its driver dependencies from SUPERH to
ARCH_SHMOBILE.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/spi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 5c8e51e96888cc53..96087e9fc998461c 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -556,7 +556,7 @@ config SPI_SC18IS602
 config SPI_SH_MSIOF
 	tristate "SuperH MSIOF SPI controller"
 	depends on HAVE_CLK && HAS_DMA
-	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
+	depends on ARCH_SHMOBILE || ARCH_RENESAS || COMPILE_TEST
 	help
 	  SPI driver for SuperH and SH Mobile MSIOF blocks.
 
-- 
1.9.1
