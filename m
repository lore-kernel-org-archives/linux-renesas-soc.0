Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:54198 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbeIMSZD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 14:25:03 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Alex Williamson <alex.williamson@redhat.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        David Howells <dhowells@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Stephen Rothwell <sfr@canb.auug.org.au>, kvm@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] drivers/vfio: Allow type-1 IOMMU instantiation with all ARM/ARM64 IOMMUs
Date: Thu, 13 Sep 2018 15:15:29 +0200
Message-Id: <20180913131529.11837-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Currently the type-1 IOMMU instantiation depends on "ARM_SMMU ||
ARM_SMMU_V3", while it applies to other ARM/ARM64 platforms with an
IOMMU (e.g. Renesas VMSA-compatible IPMMUs).

Instead of extending the list of IOMMU types on ARM platforms, replace
the list by "ARM || ARM64", like other architectures do.  The feature is
still restricted to ARM/ARM64 platforms with an IOMMU by the dependency
on IOMMU_API.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested with sata_rcar on Renesas R-Car H3 ES2.0.

This causes a trivial merge conflict with commit c01eaa95ad30897b ("Make
anon_inodes unconditional") in vfs/for-next.

v2:
  - Make the feature just depend on ARM || ARM64, instead of adding yet
    another IPMMU_VMSA dependency, as suggested by Robin Murphy
    <robin.murphy@arm.com>.
---
 drivers/vfio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index c84333eb5eb59bef..9de5ed38da830a91 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -21,7 +21,7 @@ config VFIO_VIRQFD
 menuconfig VFIO
 	tristate "VFIO Non-Privileged userspace driver framework"
 	depends on IOMMU_API
-	select VFIO_IOMMU_TYPE1 if (X86 || S390 || ARM_SMMU || ARM_SMMU_V3)
+	select VFIO_IOMMU_TYPE1 if (X86 || S390 || ARM || ARM64)
 	select ANON_INODES
 	help
 	  VFIO provides a framework for secure userspace device drivers.
-- 
2.17.1
