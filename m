Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53527 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935327AbcJ0HAZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 03:00:25 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] ARM: shmobile: select errata 798181 for SoCs with CA15 cores
Date: Thu, 27 Oct 2016 09:00:06 +0200
Message-Id: <1477551606-6903-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Select ARM errata 798181 on SoCs cores affected CA15 cores.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index c48be1d332ed..6fbd9b7d2d67 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -60,6 +60,7 @@ config ARCH_R7S72100
 config ARCH_R8A73A4
 	bool "R-Mobile APE6 (R8A73A40)"
 	select ARCH_RMOBILE
+	select ARM_ERRATA_798181 if SMP
 	select RENESAS_IRQC
 
 config ARCH_R8A7740
@@ -70,6 +71,7 @@ config ARCH_R8A7740
 config ARCH_R8A7743
 	bool "RZ/G1M (R8A77430)"
 	select ARCH_RCAR_GEN2
+	select ARM_ERRATA_798181 if SMP
 
 config ARCH_R8A7778
 	bool "R-Car M1A (R8A77781)"
@@ -82,20 +84,24 @@ config ARCH_R8A7779
 config ARCH_R8A7790
 	bool "R-Car H2 (R8A77900)"
 	select ARCH_RCAR_GEN2
+	select ARM_ERRATA_798181 if SMP
 	select I2C
 
 config ARCH_R8A7791
 	bool "R-Car M2-W (R8A77910)"
 	select ARCH_RCAR_GEN2
+	select ARM_ERRATA_798181 if SMP
 	select I2C
 
 config ARCH_R8A7792
 	bool "R-Car V2H (R8A77920)"
 	select ARCH_RCAR_GEN2
+	select ARM_ERRATA_798181 if SMP
 
 config ARCH_R8A7793
 	bool "R-Car M2-N (R8A7793)"
 	select ARCH_RCAR_GEN2
+	select ARM_ERRATA_798181 if SMP
 	select I2C
 
 config ARCH_R8A7794
-- 
2.7.0.rc3.207.g0ac5344
