Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33334 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753898AbdA0GVt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 01:21:49 -0500
Received: by mail-pf0-f196.google.com with SMTP id e4so17893633pfg.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2017 22:20:45 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        joro@8bytes.org, linux-renesas-soc@vger.kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
Date: Fri, 27 Jan 2017 15:14:25 +0900
Message-Id: <148549766541.22203.15197831330522408915.sendpatchset@little-apple>
In-Reply-To: <148549764733.22203.16459470412085471955.sendpatchset@little-apple>
References: <148549764733.22203.16459470412085471955.sendpatchset@little-apple>
Subject: [PATCH/RFC v2 2/4] iommu/ipmmu-vmsa: Get rid of disabled device check
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Since of_iommu_configure() now skips over disabled devices
we can simply drop this check in the IPMMU driver.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |    7 -------
 1 file changed, 7 deletions(-)

--- 0001/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-01-27 13:09:36.840607110 +0900
@@ -1051,13 +1051,6 @@ static struct iommu_group *ipmmu_device_
 static int ipmmu_of_xlate_dma(struct device *dev,
 			      struct of_phandle_args *spec)
 {
-	/* If the IPMMU device is disabled in DT then return error
-	 * to make sure the of_iommu code does not install ops
-	 * even though the iommu device is disabled
-	 */
-	if (!of_device_is_available(spec->np))
-		return -ENODEV;
-
 	return 0;
 }
 
