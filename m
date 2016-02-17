Return-Path: <SRS0+SfpY=OQ=gmail.com=magnus.damm@vergenet.net>
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au,Magnus Damm <magnus.damm@gmail.com>,laurent.pinchart+renesas@ideasonboard.com,geert+renesas@glider.be
Date: Wed, 17 Feb 2016 17:22:09 +0900
Message-Id: <20160217082209.18282.42215.sendpatchset@little-apple>
Subject: [PATCH] ARM: shmobile: Kconfig: Get rid of old comment
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Remove comment that used to be part of non-multiplatform
kernel support. Now with multiplatform-only we have no
Renesas-specific System Configuration entries.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Written on top of renesas-drivers-2016-02-16-v4.5-rc4

 arch/arm/mach-shmobile/Kconfig |    2 --
 1 file changed, 2 deletions(-)

--- 0001/arch/arm/mach-shmobile/Kconfig
+++ work/arch/arm/mach-shmobile/Kconfig	2016-02-17 16:37:38.220513000 +0900
@@ -95,6 +95,4 @@ config ARCH_SH73A0
 	bool "SH-Mobile AG5 (R8A73A00)"
 	select ARCH_RMOBILE
 	select RENESAS_INTC_IRQPIN
-
-comment "Renesas ARM SoCs System Configuration"
 endif
