Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:41040 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751916AbdJDMIa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 08:08:30 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jonathan Cameron <jic23@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] iio: adc: rcar-gyroadc: Enable compile-testing on non-ARM
Date: Wed,  4 Oct 2017 14:08:25 +0200
Message-Id: <1507118906-8946-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1507118906-8946-1-git-send-email-geert+renesas@glider.be>
References: <1507118906-8946-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The rcar-gyroadc driver compiles fine on other platforms, hence increase
compile coverage.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/iio/adc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 57625653fcb6da69..383400b678c8c692 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -593,7 +593,7 @@ config QCOM_SPMI_VADC
 
 config RCAR_GYRO_ADC
 	tristate "Renesas R-Car GyroADC driver"
-	depends on ARCH_RCAR_GEN2 || (ARM && COMPILE_TEST)
+	depends on ARCH_RCAR_GEN2 || COMPILE_TEST
 	help
 	  Say yes here to build support for the GyroADC found in Renesas
 	  R-Car Gen2 SoCs. This block is a simple SPI offload engine for
-- 
2.7.4
