Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:53364 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753942AbdLOKUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 05:20:37 -0500
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, kishon@ti.com,
        yoshihiro.shimoda.uh@renesas.com, arnd@arndb.de,
        linux-kernel@vger.kernel.org
Subject: [PATCH] phy: rcar-gen3-usb2: add dependency on USB
Date: Fri, 15 Dec 2017 10:20:20 +0000
Message-Id: <1513333220-44070-1-git-send-email-vladimir.murzin@arm.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Following error showed up:

drivers/phy/renesas/phy-rcar-gen3-usb2.o: In function `rcar_gen3_phy_usb2_probe':
/work/tools/linux/drivers/phy/renesas/phy-rcar-gen3-usb2.c:444: undefined reference to `of_usb_get_dr_mode_by_phy'
Makefile:993: recipe for target 'vmlinux' failed
make: *** [vmlinux] Error 1

with CONFIG_USB_SUPPORT=n

Add dependency on USB_SUPPORT and select USB_COMMON to make sure that
of_usb_get_dr_mode_by_phy() is available.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 drivers/phy/renesas/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
index cb09245..c845fac 100644
--- a/drivers/phy/renesas/Kconfig
+++ b/drivers/phy/renesas/Kconfig
@@ -12,7 +12,9 @@ config PHY_RCAR_GEN3_USB2
 	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
 	depends on ARCH_RENESAS
 	depends on EXTCON
+	depends on USB_SUPPORT
 	select GENERIC_PHY
+	select USB_COMMON
 	help
 	  Support for USB 2.0 PHY found on Renesas R-Car generation 3 SoCs.
 
-- 
1.9.1
