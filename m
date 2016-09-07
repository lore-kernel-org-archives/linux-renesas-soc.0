Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56984 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756483AbcIGHlg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 03:41:36 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/2] arm64: defconfig: Enable SDHI and GPIO_REGULATOR
Date: Wed,  7 Sep 2016 09:41:28 +0200
Message-Id: <6c04d2f7f1038bf6e5561827f862c6aa2beb4b37.1473233745.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1473233745.git.horms+renesas@verge.net.au>
References: <cover.1473233745.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This allows use of the SDHI SD/SDIO controller present on R-Car Gen3 SoCs
and already enabled in the DT of the r8a7795/salvator-x (H3).

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 458d891aaa8e..2c0be455230f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -229,6 +229,7 @@ CONFIG_REGULATOR=y
 CONFIG_MFD_CROS_EC=y
 CONFIG_MFD_CROS_EC_I2C=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_HI655X=y
 CONFIG_REGULATOR_MAX77620=y
 CONFIG_REGULATOR_PWM=y
@@ -287,6 +288,7 @@ CONFIG_MMC_SDHCI_OF_ESDHC=y
 CONFIG_MMC_SDHCI_TEGRA=y
 CONFIG_MMC_SDHCI_MSM=y
 CONFIG_MMC_SPI=y
+CONFIG_MMC_SDHI=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_DW_EXYNOS=y
 CONFIG_MMC_DW_K3=y
-- 
2.7.0.rc3.207.g0ac5344
