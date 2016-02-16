Return-Path: <SRS0+93W/=OP=gmail.com=magnus.damm@vergenet.net>
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au,Magnus Damm <magnus.damm@gmail.com>,laurent.pinchart+renesas@ideasonboard.com,geert+renesas@glider.be
Date: Tue, 16 Feb 2016 11:26:53 +0900
Message-Id: <20160216022653.12147.84730.sendpatchset@little-apple>
In-Reply-To: <20160216022635.12147.46525.sendpatchset@little-apple>
References: <20160216022635.12147.46525.sendpatchset@little-apple>
Subject: [PATCH 02/02] arm64: renesas: Enable RENESAS_IRQC
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Select RENESAS_IRQC for Arm64 SoCs from Renesas to enable
build of drivers/irqchip/irq-renesas-irqc.c.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/Kconfig.platforms |    1 +
 1 file changed, 1 insertion(+)

--- 0001/arch/arm64/Kconfig.platforms
+++ work/arch/arm64/Kconfig.platforms	2016-02-16 11:02:55.040513000 +0900
@@ -77,6 +77,7 @@ config ARCH_RENESAS
 	select ARCH_SHMOBILE
 	select PINCTRL
 	select PM_GENERIC_DOMAINS if PM
+	select RENESAS_IRQC
 	help
 	  This enables support for the ARMv8 based Renesas SoCs.
 
