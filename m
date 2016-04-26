Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:52227 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753013AbcDZUez (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 26 Apr 2016 16:34:55 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-mmc@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>,
	linux-renesas-soc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mmc: mmcif: remove obsolete support for sh7372
Date: Tue, 26 Apr 2016 22:34:46 +0200
Message-Id: <1461702886-6873-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

There is no support for this platform in the kernel anymore. Make the
Kconfig text more generic, so it won't get stale anymore.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 04feea8354cba7..f5be219274329d 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -676,9 +676,9 @@ config MMC_SH_MMCIF
 	depends on HAS_DMA
 	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
 	help
-	  This selects the MMC Host Interface controller (MMCIF).
+	  This selects the MMC Host Interface controller (MMCIF) found in various
+	  Renesas SoCs for SH and ARM architectures.
 
-	  This driver supports MMCIF in sh7724/sh7757/sh7372.
 
 config MMC_JZ4740
 	tristate "JZ4740 SD/Multimedia Card Interface support"
-- 
2.7.0
