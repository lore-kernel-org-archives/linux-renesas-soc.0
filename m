Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:36742 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727504AbeGYPPY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 11:15:24 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <damm+renesas@opensource.se>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] iommu/ipmmu-vmsa: Whitelist SATA for IOMMU use and virtualization
Date: Wed, 25 Jul 2018 16:03:24 +0200
Message-Id: <20180725140324.8239-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SATA on R-Car H3 ES2.0 works fine with the IOMMU.
This is also needed for virtualization.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
For testing virtualization, this patch and all prerequisites are
available in the topic/rcar3-virt-gpio-passthrough-v3 branch of my git
repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.

 drivers/iommu/ipmmu-vmsa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index ef566b4989d6e2f8..f6f7b7e8cb982769 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -751,6 +751,9 @@ static int ipmmu_init_platform_device(struct device *dev,
 
 static bool ipmmu_slave_whitelist(struct device *dev)
 {
+	if (!strcmp(dev_name(dev), "ee300000.sata"))
+		return true;
+
 	/* By default, do not allow use of IPMMU */
 	return false;
 }
-- 
2.17.1
