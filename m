Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Bjorn Helgaas <bhelgaas@google.com>, fkan@apm.com,
        linux-kernel@vger.kernel.org,
        Artemi Ivanov <artemi.ivanov@cogentembedded.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH 0/2] arm64: fix handling of DMA masks wider than bus supports
Date: Wed, 11 Jan 2017 21:31:50 +0300
Message-Id: <1484159512-28515-1-git-send-email-nikita.yoush@cogentembedded.com>
In-Reply-To: <dca35acf-1adf-aa85-7a0b-d0c6ec702fa1@arm.com>
References: <dca35acf-1adf-aa85-7a0b-d0c6ec702fa1@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> I reckon the easiest way forward would be to pass in some flag to
> arch_setup_dma_ops to indicate whether it's an explicitly-configured
> range or not - then simply initialising parent_dma_mask to ~0 for the
> default case *should* keep things working as before.

Tried to do that.

---

Nikita Yushchenko (2):
  dma-mapping: let arch know origin of dma range passed to arch_setup_dma_ops()
  arm64: avoid increasing DMA masks above what hardware supports

 arch/arm/include/asm/dma-mapping.h             |  1 +
 arch/arm/mm/dma-mapping.c                      |  3 +-
 arch/arm64/Kconfig                             |  3 ++
 arch/arm64/include/asm/device.h                |  1 +
 arch/arm64/include/asm/dma-mapping.h           |  6 +++-
 arch/arm64/mm/dma-mapping.c                    | 43 +++++++++++++++++++++++++-
 arch/mips/include/asm/dma-mapping.h            |  3 +-
 drivers/acpi/scan.c                            |  2 +-
 drivers/iommu/rockchip-iommu.c                 |  2 +-
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c |  2 +-
 drivers/of/device.c                            |  5 ++-
 drivers/staging/fsl-mc/bus/fsl-mc-bus.c        |  2 +-
 12 files changed, 64 insertions(+), 9 deletions(-)

-- 
2.1.4
