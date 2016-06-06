Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	joro@8bytes.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
	Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 06 Jun 2016 12:58:22 +0900
Message-Id: <20160606035822.31763.39713.sendpatchset@little-apple>
In-Reply-To: <20160606035723.31763.66500.sendpatchset@little-apple>
References: <20160606035723.31763.66500.sendpatchset@little-apple>
Subject: [PATCH v2 06/11] iommu/ipmmu-vmsa: Teach xlate() to skip disabled iommus
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

The ->xlate() call gets invoked even though the iommu
device has status = "disabled" in DT, so make sure we
skip over disabled devices.

In my mind it would make sense to have this at some
shared level, but I guess some users may want to
configure the iommu regardless of DT state.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V1:
 - Reworked slightly to fit on top of updated patch order

 drivers/iommu/ipmmu-vmsa.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--- 0017/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2016-06-06 10:58:18.530607110 +0900
@@ -1001,7 +1001,13 @@ static struct iommu_group *ipmmu_device_
 static int ipmmu_of_xlate_dma(struct device *dev,
 			      struct of_phandle_args *spec)
 {
-	/* dummy callback to satisfy of_iommu_configure() */
+	/* If the IPMMU device is disabled in DT then return error
+	 * to make sure the of_iommu code does not install ops
+	 * even though the iommu device is disabled
+	 */
+	if (!of_device_is_available(spec->np))
+		return -ENODEV;
+
 	return 0;
 }
 
