Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:9961 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753207AbdHOQWO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2017 12:22:14 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
Cc: Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: debug-ll: Add support for r8a7745
Date: Tue, 15 Aug 2017 17:21:28 +0100
Message-Id: <1502814088-29767-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable low-level debugging support for RZ/G1E (r8a7745). RZ/G1E uses
SCIF4 for the debug console.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
---
 arch/arm/Kconfig.debug | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 6dcea8e..be8916d 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -911,6 +911,13 @@ choice
 		  Say Y here if you want kernel low-level debugging support
 		  via SCIF2 on Renesas R-Car E2 (R8A7794).
 
+	config DEBUG_RCAR_GEN2_SCIF4
+		bool "Kernel low-level debugging messages via SCIF4 on R8A7745"
+		depends on ARCH_R8A7745
+		help
+		  Say Y here if you want kernel low-level debugging support
+		  via SCIF4 on Renesas RZ/G1E (R8A7745).
+
 	config DEBUG_RMOBILE_SCIFA0
 		bool "Kernel low-level debugging messages via SCIFA0 on R8A73A4"
 		depends on ARCH_R8A73A4
@@ -1451,6 +1458,7 @@ config DEBUG_LL_INCLUDE
 	default "debug/renesas-scif.S" if DEBUG_RCAR_GEN1_SCIF2
 	default "debug/renesas-scif.S" if DEBUG_RCAR_GEN2_SCIF0
 	default "debug/renesas-scif.S" if DEBUG_RCAR_GEN2_SCIF2
+	default "debug/renesas-scif.S" if DEBUG_RCAR_GEN2_SCIF4
 	default "debug/renesas-scif.S" if DEBUG_RMOBILE_SCIFA0
 	default "debug/renesas-scif.S" if DEBUG_RMOBILE_SCIFA1
 	default "debug/renesas-scif.S" if DEBUG_RMOBILE_SCIFA4
@@ -1568,6 +1576,7 @@ config DEBUG_UART_PHYS
 	default 0xe6c40000 if DEBUG_RMOBILE_SCIFA0
 	default 0xe6c50000 if DEBUG_RMOBILE_SCIFA1
 	default 0xe6c80000 if DEBUG_RMOBILE_SCIFA4
+	default 0xe6ee0000 if DEBUG_RCAR_GEN2_SCIF4
 	default 0xe6e58000 if DEBUG_RCAR_GEN2_SCIF2
 	default 0xe6e60000 if DEBUG_RCAR_GEN2_SCIF0
 	default 0xe8008000 if DEBUG_R7S72100_SCIF2
@@ -1604,6 +1613,7 @@ config DEBUG_UART_PHYS
 		DEBUG_QCOM_UARTDM || DEBUG_R7S72100_SCIF2 || \
 		DEBUG_RCAR_GEN1_SCIF0 || DEBUG_RCAR_GEN1_SCIF2 || \
 		DEBUG_RCAR_GEN2_SCIF0 || DEBUG_RCAR_GEN2_SCIF2 || \
+		DEBUG_RCAR_GEN2_SCIF4 || \
 		DEBUG_RMOBILE_SCIFA0 || DEBUG_RMOBILE_SCIFA1 || \
 		DEBUG_RMOBILE_SCIFA4 || DEBUG_S3C24XX_UART || \
 		DEBUG_S3C64XX_UART || \
-- 
2.7.4
