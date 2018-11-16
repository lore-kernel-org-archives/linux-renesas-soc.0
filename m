Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:55630 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbeKPXud (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 18:50:33 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: Hide ARCH_RZN1 to improve consistency
Date: Fri, 16 Nov 2018 14:38:03 +0100
Message-Id: <20181116133803.24202-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Unlike all other family-specific Kconfig symbols for Renesas ARM SoCs,
ARCH_RZN1 is user-visible.  As this symbol is already selected by the
SoC-specific ARCH_R9A06G032 symbol, there is no need for that.

Hide ARCH_RZN1 from the user, and move it up, where all other
family-specific Kconfig symbols live.  Drop the select of CPU_V7, as
this is already implied by the dependency of ARCH_RENESAS on
ARCH_MULTI_V7.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/Kconfig | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index a35eb5913dfdf4ba..70c6f557f8cd1694 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -25,6 +25,10 @@ config ARCH_RMOBILE
 	select SYS_SUPPORTS_SH_CMT
 	select SYS_SUPPORTS_SH_TMU
 
+config ARCH_RZN1
+	bool
+	select ARM_AMBA
+
 menuconfig ARCH_RENESAS
 	bool "Renesas ARM SoCs"
 	depends on ARCH_MULTI_V7 && MMU
@@ -128,11 +132,6 @@ config ARCH_R9A06G032
 	bool "RZ/N1D (R9A06G032)"
 	select ARCH_RZN1
 
-config ARCH_RZN1
-	bool "RZ/N1 (R9A06G0xx) Family"
-	select ARM_AMBA
-	select CPU_V7
-
 config ARCH_SH73A0
 	bool "SH-Mobile AG5 (R8A73A00)"
 	select ARCH_RMOBILE
-- 
2.17.1
