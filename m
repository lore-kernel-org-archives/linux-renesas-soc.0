Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	joro@8bytes.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
	Magnus Damm <magnus.damm@gmail.com>, robin.murphy@arm.com,
	m.szyprowski@samsung.com
Date: Wed, 16 Mar 2016 02:04:31 +0900
Message-Id: <20160315170431.20615.30333.sendpatchset@little-apple>
Subject: [PATCH 00/04] iommu/ipmmu-vmsa: IPMMU CONFIG_IOMMU_DMA update
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

iommu/ipmmu-vmsa: IPMMU CONFIG_IOMMU_DMA update

[PATCH 01/04] iommu/ipmmu-vmsa: 32-bit ARM may have CONFIG_IOMMU_DMA=y
[PATCH 02/04] iommu/ipmmu-vmsa: Break out utlb parsing code
[PATCH 03/04] iommu/ipmmu-vmsa: Break out domain allocation code
[PATCH 04/04] iommu/ipmmu-vmsa: Add new IOMMU_DOMAIN_DMA ops

This series updates the IPMMU driver with CONFIG_IOMMU_DMA=y support
which is present in mainline for 64-bit ARM while experimental support
has been posted for 32-bit ARM thanks to Marek Szyprowski:

[RFC 0/3] Unify IOMMU-based DMA-mapping code for ARM and ARM64

Most of the patches in this series based on code earlier included in
the series below but has been reworked to also fit on 32-bit ARM:

[PATCH/RFC 00/10] iommu/ipmmu-vmsa: Experimental r8a7795 support

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Built on top of next-20160315
 Depends on [PATCH v2 00/04] iommu/ipmmu-vmsa: IPMMU multi-arch update V2

 drivers/iommu/ipmmu-vmsa.c |  238 ++++++++++++++++++++++++++++++++------------
 1 file changed, 174 insertions(+), 64 deletions(-)
