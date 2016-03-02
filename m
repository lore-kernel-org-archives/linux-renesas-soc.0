Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] phy: rcar-gen3-usb2, rcar-gen2: Use ARCH_RENESAS
Date: Wed,  2 Mar 2016 11:25:14 +0900
Message-Id: <1456885514-27466-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Make use of ARCH_RENESAS in place of ARCH_SHMOBILE.

This is part of an ongoing process to migrate from ARCH_SHMOBILE to
ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/phy/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

 Based on v4.5-rc1

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index e7e117d5dbbe..e097ed2dfad9 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -113,14 +113,14 @@ config PHY_MIPHY365X
 
 config PHY_RCAR_GEN2
 	tristate "Renesas R-Car generation 2 USB PHY driver"
-	depends on ARCH_SHMOBILE
+	depends on ARCH_RENESAS
 	depends on GENERIC_PHY
 	help
 	  Support for USB PHY found on Renesas R-Car generation 2 SoCs.
 
 config PHY_RCAR_GEN3_USB2
 	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
-	depends on OF && ARCH_SHMOBILE
+	depends on OF && ARCH_RENESAS
 	select GENERIC_PHY
 	help
 	  Support for USB 2.0 PHY found on Renesas R-Car generation 3 SoCs.
-- 
2.1.4
