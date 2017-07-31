Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43228 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752497AbdGaPF5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:05:57 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 5/5] ARM: shmobile: Remove ARCH_SHMOBILE_MULTI
Date: Mon, 31 Jul 2017 17:05:40 +0200
Message-Id: <84a1e84b95bb7b2596821578c3acc38d4e6e7a59.1501512320.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1501512320.git.horms+renesas@verge.net.au>
References: <cover.1501512320.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The migration from ARCH_SHMOBILE_MULTI to ARCH_RENESAS has been
completed in v4.12 by commit 9ed2d4bc5c0c244d ("ARM: dts: renesas:
Switch from ARCH_SHMOBILE_MULTI to ARCH_RENESAS"), so the
ARCH_SHMOBILE_MULTI symbol can be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index ad7d604ff001..280e7312a9e1 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -1,9 +1,6 @@
 config ARCH_SHMOBILE
 	bool
 
-config ARCH_SHMOBILE_MULTI
-	bool
-
 config PM_RMOBILE
 	bool
 	select PM
@@ -34,7 +31,6 @@ menuconfig ARCH_RENESAS
 	depends on ARCH_MULTI_V7 && MMU
 	select ARCH_DMA_ADDR_T_64BIT if ARM_LPAE
 	select ARCH_SHMOBILE
-	select ARCH_SHMOBILE_MULTI
 	select ARM_GIC
 	select GPIOLIB
 	select HAVE_ARM_SCU if SMP
-- 
2.1.4
