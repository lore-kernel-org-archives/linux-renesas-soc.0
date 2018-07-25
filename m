Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:40682 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728939AbeGYOWL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 10:22:11 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Joerg Roedel <joro@8bytes.org>
Cc: Magnus Damm <damm+renesas@opensource.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] iommu/ipmmu-vmsa: Clarify supported platforms
Date: Wed, 25 Jul 2018 15:10:29 +0200
Message-Id: <20180725131029.5643-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Renesas IPMMU-VMSA driver supports not just R-Car H2 and M2 SoCs,
but also other R-Car Gen2 and R-Car Gen3 SoCs.

Drop a superfluous "Renesas" while at it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/iommu/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 568ae81b0e99b67b..c69dc0b29b5df37f 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -306,8 +306,8 @@ config IPMMU_VMSA
 	select IOMMU_IO_PGTABLE_LPAE
 	select ARM_DMA_USE_IOMMU
 	help
-	  Support for the Renesas VMSA-compatible IPMMU Renesas found in the
-	  R-Mobile APE6 and R-Car H2/M2 SoCs.
+	  Support for the Renesas VMSA-compatible IPMMU found in the R-Mobile
+	  APE6, R-Car Gen2, and R-Car Gen3 SoCs.
 
 	  If unsure, say N.
 
-- 
2.17.1
