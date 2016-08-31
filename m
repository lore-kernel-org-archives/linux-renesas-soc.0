Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:40124 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933245AbcHaJfV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Aug 2016 05:35:21 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: shmobile: Use ARCH_SHMOBILE instead of SUPERH
Date: Wed, 31 Aug 2016 11:35:13 +0200
Message-Id: <1472636113-26988-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

"i2c-sh_mobile" is used on sh7343, sh7366, sh7722, sh7723, and sh7724
only. As all of the above select ARCH_SHMOBILE, restrict its driver
dependencies from SUPERH to ARCH_SHMOBILE.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 1f3239ead0377426..6d94e2ec5b4f7183 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -836,7 +836,7 @@ config I2C_SH7760
 config I2C_SH_MOBILE
 	tristate "SuperH Mobile I2C Controller"
 	depends on HAS_DMA
-	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
+	depends on ARCH_SHMOBILE || ARCH_RENESAS || COMPILE_TEST
 	help
 	  If you say yes to this option, support will be included for the
 	  built-in I2C interface on the Renesas SH-Mobile processor.
-- 
1.9.1
