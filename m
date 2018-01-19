Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:32920 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754562AbeASLjE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 06:39:04 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] arm64: renesas_defconfig: add driver for PCA9654
Date: Fri, 19 Jan 2018 12:38:52 +0100
Message-Id: <20180119113852.1894-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We enabled it in the DTS, so we should have it here, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 515486b5b66f4e..3087bba06d3c40 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -132,6 +132,7 @@ CONFIG_PINCTRL_SINGLE=y
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_GENERIC_PLATFORM=y
 CONFIG_GPIO_RCAR=y
+CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_BD9571MWV=y
 CONFIG_THERMAL=y
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
-- 
2.11.0
