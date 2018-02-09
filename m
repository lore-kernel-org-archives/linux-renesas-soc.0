Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:38710 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751097AbeBIPRL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Feb 2018 10:17:11 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Baptiste Reynal <b.reynal@virtualopensystems.com>,
        Alex Williamson <alex.williamson@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexander Graf <agraf@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        kvm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        qemu-devel@nongnu.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 2/6] vfio: Ignore real IOMMUs if CONFIG_VFIO_NOIOMMU=y
Date: Fri,  9 Feb 2018 16:16:49 +0100
Message-Id: <1518189413-2761-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1518189413-2761-1-git-send-email-geert+renesas@glider.be>
References: <1518189413-2761-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Allow use of the No-IOMMU mode even if a real IOMMU is present.
This is useful in case the device is not part of an actual IOMMU group.

Not-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Question:
  - Some devices (e.g. rcar-gpio) don't use DMA, so why do they need an
    IOMMU group?
  - Even devices using DMA may do so using a separate DMAC module,
    pointed to by "dmas" DT properties (e.g. sh-sci), hence they may be
    not part of an IOMMU group.
  - How to know which devices do DMA?
---
 drivers/vfio/vfio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 2bc3705a99bd2f1a..7736c3fbe468a3da 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -129,9 +129,13 @@ struct iommu_group *vfio_iommu_group_get(struct device *dev)
 	 * bus.  We set iommudata simply to be able to identify these groups
 	 * as special use and for reclamation later.
 	 */
-	if (group || !noiommu || iommu_present(dev->bus))
+	if (group || !noiommu)
 		return group;
 
+	if (iommu_present(dev->bus))
+		dev_warn(dev, "iommu present (%ps), ignoring\n",
+			 dev->bus->iommu_ops);
+
 	group = iommu_group_alloc();
 	if (IS_ERR(group))
 		return NULL;
-- 
2.7.4
