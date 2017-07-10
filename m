Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:56868 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754135AbdGJN20 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2017 09:28:26 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Olof Johansson <olof@lixom.net>,
        Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/9] ARM: shmobile: defconfig: Enable missing PCIE_RCAR dependency
Date: Mon, 10 Jul 2017 15:28:14 +0200
Message-Id: <1499693302-25120-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1499693302-25120-1-git-send-email-geert+renesas@glider.be>
References: <1499693302-25120-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

PCIE_RCAR is no longer enabled, as it now has a dependency on
PCI_MSI_IRQ_DOMAIN instead of selecting PCI_MSI and PCI_MSI_IRQ_DOMAIN.
Fix this by explicitly enabling PCIE_RCAR in shmobile_defconfig.

Fixes: 3ee803641e76bea7 ("PCI/MSI: irqchip: Fix PCI_MSI dependencies")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 3c66a422fb4df567..04cd18424016eba5 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -27,6 +27,7 @@ CONFIG_ARCH_SH73A0=y
 CONFIG_PL310_ERRATA_588369=y
 CONFIG_ARM_ERRATA_754322=y
 CONFIG_PCI=y
+CONFIG_PCI_MSI=y
 CONFIG_PCI_RCAR_GEN2=y
 CONFIG_PCIE_RCAR=y
 CONFIG_SMP=y
-- 
2.7.4
