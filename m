Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:60914 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbeGYOqq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 10:46:46 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Magnus Damm <damm+renesas@opensource.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        kvm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] drivers/vfio: Allow type-1 IOMMU instantiation with Renesas IPMMU-VMSA
Date: Wed, 25 Jul 2018 15:34:51 +0200
Message-Id: <20180725133451.7083-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Renesas IPMMU-VMSA driver is compatible with the notion of a type-1
IOMMU in VFIO.

This patch allows guests to use the VFIO_IOMMU_TYPE1 API on hosts
equipped with a Renesas VMSA-compatible IPMMU.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Lightly tested with sata_rcar on Renesas R-Car H3 ES2.0.

For testing, this patch and all prerequisites are available in the
topic/rcar3-virt-gpio-passthrough-v3 branch of my git repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.
---
 drivers/vfio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index c84333eb5eb59bef..a3e21e7c066596d7 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -21,7 +21,8 @@ config VFIO_VIRQFD
 menuconfig VFIO
 	tristate "VFIO Non-Privileged userspace driver framework"
 	depends on IOMMU_API
-	select VFIO_IOMMU_TYPE1 if (X86 || S390 || ARM_SMMU || ARM_SMMU_V3)
+	select VFIO_IOMMU_TYPE1 if (X86 || S390 || ARM_SMMU || ARM_SMMU_V3 || \
+				    IPMMU_VMSA)
 	select ANON_INODES
 	help
 	  VFIO provides a framework for secure userspace device drivers.
-- 
2.17.1
