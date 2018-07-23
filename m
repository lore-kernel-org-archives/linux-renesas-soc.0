Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53230 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387854AbeGWNFU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 09:05:20 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/5] ARM: shmobile: defconfig: Enable reset controller support
Date: Mon, 23 Jul 2018 14:04:19 +0200
Message-Id: <9efd6903620f51011f3a8595ab33b9491cc3b57f.1532346690.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1532346690.git.horms+renesas@verge.net.au>
References: <cover.1532346690.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

R-Car Gen2 and RZ/G1 SoCs can make use of the optional reset controller
support in the Renesas CPG/MSSR driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index e30e51809cfc..152d16ad7c91 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -192,6 +192,7 @@ CONFIG_AK8975=y
 CONFIG_PWM=y
 CONFIG_PWM_RCAR=y
 CONFIG_PWM_RENESAS_TPU=y
+CONFIG_RESET_CONTROLLER=y
 CONFIG_GENERIC_PHY=y
 CONFIG_PHY_RCAR_GEN2=y
 # CONFIG_DNOTIFY is not set
-- 
2.11.0
