Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:37806 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751823AbdJMSXs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2017 14:23:48 -0400
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org
Cc: iommu@lists.linux-foundation.org, arnd@arndb.de,
        laurent.pinchart+renesas@ideasonboard.com, magnus.damm@gmail.com,
        geert+renesas@glider.be, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] ipmmu-vmsa cleanup
Date: Fri, 13 Oct 2017 19:23:38 +0100
Message-Id: <cover.1507918320.git.robin.murphy@arm.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Arnd reports a build warning[1] thanks to me missing ipmmu-vmsa's second
set of ops when converting io-pgtable-arm users to the new iommu_iotlb_*
callbacks. Rather than just treat the symptom with a point fix, this
seemed like a good excuse to clean up the messy #ifdeffery and
duplication in the driver that led to the oversight in the first place.

Build-tested successfully for arm64, ARM, and ARM + CONFIG_IOMMU_DMA.

Robin.

[1]:https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1510423.html

Robin Murphy (4):
  iommu/ipmmu-vmsa: Unify domain alloc/free
  iommu/ipmmu-vmsa: Simplify group allocation
  iommu/ipmmu-vmsa: Clean up struct ipmmu_vmsa_iommu_priv
  iommu/ipmmu-vmsa: Unify ipmmu_ops

 drivers/iommu/ipmmu-vmsa.c | 251 ++++++++++++++-------------------------------
 1 file changed, 78 insertions(+), 173 deletions(-)

-- 
2.13.4.dirty
