Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:55342 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932997AbeGDLnj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jul 2018 07:43:39 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/5] ARM: shmobile: defconfig: Enable reset controller support
Date: Wed,  4 Jul 2018 13:43:30 +0200
Message-Id: <20180704114333.27584-3-geert+renesas@glider.be>
In-Reply-To: <20180704114333.27584-1-geert+renesas@glider.be>
References: <20180704114333.27584-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Car Gen2 and RZ/G1 SoCs can make use of the optional reset controller
support in the Renesas CPG/MSSR driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 393697a54fb40e08..a08d0bcdca750d28 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -193,6 +193,7 @@ CONFIG_AK8975=y
 CONFIG_PWM=y
 CONFIG_PWM_RCAR=y
 CONFIG_PWM_RENESAS_TPU=y
+CONFIG_RESET_CONTROLLER=y
 CONFIG_GENERIC_PHY=y
 CONFIG_PHY_RCAR_GEN2=y
 # CONFIG_DNOTIFY is not set
-- 
2.17.1
