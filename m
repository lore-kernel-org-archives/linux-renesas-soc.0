Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: shmobile: fix build regressions
Date: Mon, 10 Dec 2018 22:00:23 +0100
Message-Id: <20181210210033.3276054-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <linux-renesas-soc.vger.kernel.org>

A number of Kconfig options have become available now to random ARM
platforms outside of ARCH_MULTIPLATFORM, which now causes Kconfig
warnings, and other build errors when those select options that
lack additonal dependencies, e.g.:

WARNING: unmet direct dependencies detected for HAVE_ARM_ARCH_TIMER
  Depends on [n]: CPU_V7 [=n]
  Selected by [y]:
  - ARCH_RCAR_GEN2 [=y] && SOC_RENESAS [=y]
  - ARCH_R8A73A4 [=y] && SOC_RENESAS [=y] && ARM [=y]

WARNING: unmet direct dependencies detected for SYS_SUPPORTS_EM_STI
  Depends on [n]: GENERIC_CLOCKEVENTS [=n]
  Selected by [y]:
  - ARCH_EMEV2 [=y] && SOC_RENESAS [=y] && ARM [=y]

Put the old dependency on ARCH_RENESAS back for the moment to restore
the previous behavior.

Fixes: 062887bf5ef7 ("ARM: shmobile: Move SoC Kconfig symbols to drivers/soc/renesas/")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/renesas/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 4d8012e1205c..68bfca6f20dd 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -44,7 +44,7 @@ config ARCH_RZN1
 	bool
 	select ARM_AMBA
 
-if ARM
+if ARM && ARCH_RENESAS
 
 #comment "Renesas ARM SoCs System Type"
 
-- 
2.20.0
