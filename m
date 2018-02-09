Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:51320 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751091AbeBIRed (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Feb 2018 12:34:33 -0500
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: horms@verge.net.au, geert@linux-m68k.org
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: shmobile: Enable RZA1 pin controller
Date: Fri,  9 Feb 2018 18:34:18 +0100
Message-Id: <1518197658-30806-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable PINCTRL_RZA1 option in shmobile_defconfig

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
Hi Simon,
  this fixes the issue you reported on Genmai when applying shmobile_defconfig.

---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 7b4fc01..12af8f4 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -120,6 +120,7 @@ CONFIG_SPI=y
 CONFIG_SPI_RSPI=y
 CONFIG_SPI_SH_MSIOF=y
 CONFIG_SPI_SH_HSPI=y
+CONFIG_PINCTRL_RZA1=y
 CONFIG_GPIO_EM=y
 CONFIG_GPIO_RCAR=y
 CONFIG_GPIO_PCF857X=y
--
2.7.4
