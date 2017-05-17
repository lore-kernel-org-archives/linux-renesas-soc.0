Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: joro@8bytes.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        sricharan@codeaurora.org, will.deacon@arm.com,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
        m.szyprowski@samsung.com
Date: Wed, 17 May 2017 19:06:16 +0900
Message-Id: <149501557669.21593.1017116915706613060.sendpatchset@little-apple>
Subject: [PATCH v8 00/08] iommu/ipmmu-vmsa: IPMMU multi-arch update V8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

iommu/ipmmu-vmsa: IPMMU multi-arch update V8

[PATCH v8 01/08] iommu/ipmmu-vmsa: Remove platform data handling
[PATCH v8 02/08] iommu/ipmmu-vmsa: Rework interrupt code and use bitmap for context
[PATCH v8 03/08] iommu/ipmmu-vmsa: Break out utlb parsing code
[PATCH v8 04/08] iommu/ipmmu-vmsa: Break out domain allocation code
[PATCH v8 05/08] iommu/ipmmu-vmsa: Add new IOMMU_DOMAIN_DMA ops
[PATCH v8 06/08] iommu/ipmmu-vmsa: Use fwspec iommu_priv on ARM64
[PATCH v8 07/08] iommu/ipmmu-vmsa: Drop LPAE Kconfig dependency
[PATCH v8 08/08] iommu/ipmmu-vmsa: Fix pgsize_bitmap semicolon typo

These patches update the IPMMU driver with a modifications to support
build on multiple architectures. In the process of doing so the interrupt
code gets reworked, the foundation for supporting multiple contexts are
added and in case of CONFIG_IOMMU_DMA=y (on 64-bit or 32-bit ARM) devices
are grouped together and handled via ->xlate(). In this verison fwspec is
used on 64-bit ARM instead of archdata. Support for existing 32-bit ARM
SoCs from R-Car Gen2 is kept as-is.

Changes since V7:
 - Rebased on top of v4.12-rc1
 - Added Reviewed-by from Geert to patch 1/8 and 4/8, thanks!
 - Reworked patch 6/8 to use fwspec, thanks Robin!
 - Added patch 8/8

Changes since V6:
 - Rebased on top of v4.11-rc1 and the following fast-tracked change:
   3b6bb5b iommu/ipmmu-vmsa: Restrict IOMMU Domain Geometry to 32-bit address spac
 - Updated patch 5/7 to roll in a few patches from other series
   See individual patch for more details
 - Build tested on 32-bit and 64-bit ARM
 - Run time tested on 64-bit ARM (with additional SoC-specific patches)

Changes since V5:
 - Rebased series on top of next-20161019
 - Updated patch 5/7 to simplify domain allocation/free code - thanks Joerg!
 - Added reviewed-by tag from Joerg for patch 1-4 and 6-7.
 
Changes since V4:
 - Updated patch 3/7 to work on top on the following commit in next-20160920:
   b1e2afc iommu/ipmmu-vmsa: Fix wrong error handle of ipmmu_add_device
 - Add Kconfig hunk to patch 5/7 to avoid undeclared ipmmu_ops if COMPILE_TEST
 - Rebased patch 7/7 to fit on top of new Kconfig bits in 5/7

Changes since V3:
 - Updated patch 3/7 to fix hang-on-boot issue on 32-bit ARM - thanks Geert!
 - Reworked group parameter handling in patch 3/7 and 5/7.
 - Added patch 6/7 to fix build of the driver on s390/tile/um architectures

Changes since V2:
 - Got rid of patch 3 from the V2 however patch 1, 2 and 4 are kept.
 - V3 patch 3, 4 and 5 come from
   [PATCH 00/04] iommu/ipmmu-vmsa: IPMMU CONFIG_IOMMU_DMA update
 - Patch 5 has been reworked to include patch 3 of the V1 of this series 

Changes since V1:
 - Got rid of patch 2 and 3 from initial series
 - Updated bitmap code locking and also used lighter bitop functions
 - Updated the Kconfig bits to apply on top of ARCH_RENESAS

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of a95cfad (v4.12-rc1 + fixes):

 Compile tested on 32-bit and 64-bit ARM

 Run time tested on 64-bit ARM r8a7796 Salvator-X

 drivers/iommu/Kconfig      |    2 
 drivers/iommu/ipmmu-vmsa.c |  421 ++++++++++++++++++++++++++++++++++----------
 2 files changed, 331 insertions(+), 92 deletions(-)
