Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:37832 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932896AbeEWNfe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 09:35:34 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Dien Pham <dien.pham.ry@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: defconfig: Enable BD9571MWV regulator
Date: Wed, 23 May 2018 15:35:31 +0200
Message-Id: <1527082531-11640-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Dien Pham <dien.pham.ry@renesas.com>

The BD9571 PMIC is present on the Renesas Salvator-X(S) and R-Car
Starter Kit Premier/Pro development boards.

Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3a9096bebc74b288..8e430fce8dc97dee 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -363,6 +363,7 @@ CONFIG_MESON_WATCHDOG=m
 CONFIG_RENESAS_WDT=y
 CONFIG_UNIPHIER_WATCHDOG=y
 CONFIG_BCM2835_WDT=y
+CONFIG_MFD_BD9571MWV=y
 CONFIG_MFD_AXP20X_RSB=y
 CONFIG_MFD_CROS_EC=y
 CONFIG_MFD_CROS_EC_I2C=y
@@ -375,6 +376,7 @@ CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK808=y
 CONFIG_MFD_SEC_CORE=y
 CONFIG_REGULATOR_AXP20X=y
+CONFIG_REGULATOR_BD9571MWV=y
 CONFIG_REGULATOR_FAN53555=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_GPIO=y
-- 
2.7.4
