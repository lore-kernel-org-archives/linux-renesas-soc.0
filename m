Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbeLFWAC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 17:00:02 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 5/9] ARM: shmobile: Hide ARCH_RZN1 to improve consistency
Date: Thu,  6 Dec 2018 13:59:30 -0800
Message-Id: <79aac4b9b2081235ecf9fb1683aa765e539dc0e2.1544132474.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544132474.git.horms+renesas@verge.net.au>
References: <cover.1544132474.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Unlike all other family-specific Kconfig symbols for Renesas ARM SoCs,
ARCH_RZN1 is user-visible.  As this symbol is already selected by the
SoC-specific ARCH_R9A06G032 symbol, there is no need for that.

Hide ARCH_RZN1 from the user, and move it up, where all other
family-specific Kconfig symbols live.  Drop the select of CPU_V7, as
this is already implied by the dependency of ARCH_RENESAS on
ARCH_MULTI_V7.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/Kconfig | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index a35eb5913dfd..70c6f557f8cd 100644
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
2.11.0
