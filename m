Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbeLFWAE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 17:00:04 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 6/9] arm64: renesas: Move SoC Kconfig symbols to drivers/soc/renesas/
Date: Thu,  6 Dec 2018 13:59:31 -0800
Message-Id: <fa43948f6736b74c5840ec0b028d3662caf0f558.1544132474.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544132474.git.horms+renesas@verge.net.au>
References: <cover.1544132474.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

arch/arm64/Kconfig.platforms has SoC-specific Kconfig symbols for
Renesas SoCs, while other vendors have only a single Kconfig symbol.

Increase consistency with other vendors by moving the SoC-specific
Kconfig symbols to drivers/soc/renesas/Kconfig.

Increase consistency with R-Car Gen1 and Gen2 SoCs on arm32 by
introducing a family-specific Kconfig symbol for R-Car Gen3
(ARCH_RCAR_GEN3), which enables family-specific hardware features.
While so far only a single family (R-Car Gen3 and derivatives) of
Renesas arm64 SoCs is supported by Linux, this will make it easier
to add support for other SoC families later.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/Kconfig.platforms | 59 -----------------------------
 drivers/soc/renesas/Kconfig  | 90 +++++++++++++++++++++++++++++++++++++-------
 2 files changed, 77 insertions(+), 72 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 2eb02734ae45..28f052185eb6 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -159,69 +159,10 @@ config ARCH_RENESAS
 	bool "Renesas SoC Platforms"
 	select GPIOLIB
 	select PINCTRL
-	select PM
-	select PM_GENERIC_DOMAINS
-	select RENESAS_IRQC
 	select SOC_BUS
-	select SYS_SUPPORTS_SH_CMT
-	select SYS_SUPPORTS_SH_TMU
 	help
 	  This enables support for the ARMv8 based Renesas SoCs.
 
-config ARCH_R8A774A1
-	bool "Renesas RZ/G2M SoC Platform"
-	depends on ARCH_RENESAS
-	help
-	  This enables support for the Renesas RZ/G2M SoC.
-
-config ARCH_R8A774C0
-	bool "Renesas RZ/G2E SoC Platform"
-	depends on ARCH_RENESAS
-	help
-	  This enables support for the Renesas RZ/G2E SoC.
-
-config ARCH_R8A7795
-	bool "Renesas R-Car H3 SoC Platform"
-	depends on ARCH_RENESAS
-	help
-	  This enables support for the Renesas R-Car H3 SoC.
-
-config ARCH_R8A7796
-	bool "Renesas R-Car M3-W SoC Platform"
-	depends on ARCH_RENESAS
-	help
-	  This enables support for the Renesas R-Car M3-W SoC.
-
-config ARCH_R8A77965
-	bool "Renesas R-Car M3-N SoC Platform"
-	depends on ARCH_RENESAS
-	help
-	  This enables support for the Renesas R-Car M3-N SoC.
-
-config ARCH_R8A77970
-	bool "Renesas R-Car V3M SoC Platform"
-	depends on ARCH_RENESAS
-	help
-	  This enables support for the Renesas R-Car V3M SoC.
-
-config ARCH_R8A77980
-	bool "Renesas R-Car V3H SoC Platform"
-	depends on ARCH_RENESAS
-	help
-	  This enables support for the Renesas R-Car V3H SoC.
-
-config ARCH_R8A77990
-	bool "Renesas R-Car E3 SoC Platform"
-	depends on ARCH_RENESAS
-	help
-	  This enables support for the Renesas R-Car E3 SoC.
-
-config ARCH_R8A77995
-	bool "Renesas R-Car D3 SoC Platform"
-	depends on ARCH_RENESAS
-	help
-	  This enables support for the Renesas R-Car D3 SoC.
-
 config ARCH_ROCKCHIP
 	bool "Rockchip Platforms"
 	select ARCH_HAS_RESET_CONTROLLER
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 407f02c80e8b..2f5bc5a6ae2b 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -3,30 +3,94 @@ config SOC_RENESAS
 	bool "Renesas SoC driver support" if COMPILE_TEST && !ARCH_RENESAS
 	default y if ARCH_RENESAS
 	select SOC_BUS
-	select RST_RCAR if ARCH_RCAR_GEN1 || ARCH_RCAR_GEN2 || \
-			   ARCH_R8A774A1 || ARCH_R8A774C0 || ARCH_R8A7795 || \
-			   ARCH_R8A7796 || ARCH_R8A77965 || ARCH_R8A77970 || \
-			   ARCH_R8A77980 || ARCH_R8A77990 || ARCH_R8A77995
+	select RST_RCAR if ARCH_RCAR_GEN1 || ARCH_RCAR_GEN2
 	select SYSC_R8A7743 if ARCH_R8A7743 || ARCH_R8A7744
 	select SYSC_R8A7745 if ARCH_R8A7745
 	select SYSC_R8A77470 if ARCH_R8A77470
-	select SYSC_R8A774A1 if ARCH_R8A774A1
-	select SYSC_R8A774C0 if ARCH_R8A774C0
 	select SYSC_R8A7779 if ARCH_R8A7779
 	select SYSC_R8A7790 if ARCH_R8A7790
 	select SYSC_R8A7791 if ARCH_R8A7791 || ARCH_R8A7793
 	select SYSC_R8A7792 if ARCH_R8A7792
 	select SYSC_R8A7794 if ARCH_R8A7794
-	select SYSC_R8A7795 if ARCH_R8A7795
-	select SYSC_R8A7796 if ARCH_R8A7796
-	select SYSC_R8A77965 if ARCH_R8A77965
-	select SYSC_R8A77970 if ARCH_R8A77970
-	select SYSC_R8A77980 if ARCH_R8A77980
-	select SYSC_R8A77990 if ARCH_R8A77990
-	select SYSC_R8A77995 if ARCH_R8A77995
 
 if SOC_RENESAS
 
+config ARCH_RCAR_GEN3
+	bool
+	select PM
+	select PM_GENERIC_DOMAINS
+	select RENESAS_IRQC
+	select RST_RCAR
+	select SYS_SUPPORTS_SH_CMT
+	select SYS_SUPPORTS_SH_TMU
+
+if ARM64
+
+config ARCH_R8A774A1
+	bool "Renesas RZ/G2M SoC Platform"
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A774A1
+	help
+	  This enables support for the Renesas RZ/G2M SoC.
+
+config ARCH_R8A774C0
+	bool "Renesas RZ/G2E SoC Platform"
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A774C0
+	help
+	  This enables support for the Renesas RZ/G2E SoC.
+
+config ARCH_R8A7795
+	bool "Renesas R-Car H3 SoC Platform"
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A7795
+	help
+	  This enables support for the Renesas R-Car H3 SoC.
+
+config ARCH_R8A7796
+	bool "Renesas R-Car M3-W SoC Platform"
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A7796
+	help
+	  This enables support for the Renesas R-Car M3-W SoC.
+
+config ARCH_R8A77965
+	bool "Renesas R-Car M3-N SoC Platform"
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A77965
+	help
+	  This enables support for the Renesas R-Car M3-N SoC.
+
+config ARCH_R8A77970
+	bool "Renesas R-Car V3M SoC Platform"
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A77970
+	help
+	  This enables support for the Renesas R-Car V3M SoC.
+
+config ARCH_R8A77980
+	bool "Renesas R-Car V3H SoC Platform"
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A77980
+	help
+	  This enables support for the Renesas R-Car V3H SoC.
+
+config ARCH_R8A77990
+	bool "Renesas R-Car E3 SoC Platform"
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A77990
+	help
+	  This enables support for the Renesas R-Car E3 SoC.
+
+config ARCH_R8A77995
+	bool "Renesas R-Car D3 SoC Platform"
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A77995
+	help
+	  This enables support for the Renesas R-Car D3 SoC.
+
+endif # ARM64
+
 # SoC
 config SYSC_R8A7743
 	bool "RZ/G1M System Controller support" if COMPILE_TEST
-- 
2.11.0
