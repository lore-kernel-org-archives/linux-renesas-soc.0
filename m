Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:34693 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932223AbcITMu0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Sep 2016 08:50:26 -0400
Received: by mail-pf0-f196.google.com with SMTP id 21so951910pfy.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Sep 2016 05:50:26 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Tue, 20 Sep 2016 21:41:44 +0900
Message-Id: <20160920124144.8629.22575.sendpatchset@little-apple>
Subject: [PATCH/RFC] iommu/ipmmu-vmsa: Update ->add_device() return value
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Update the IPMMU driver to return -ENODEV when adding devices
not hooked up a particular IPMMU instance.

Currently the ->add_device() callback implementation in the IPMMU
driver returns -ENODEV for devices with no "iommus" property,
however the function ipmmu_find_utlbs() may return -EINVAL.

This patch updates the ipmmu_find_utlbs() return value to -ENODEV
for the case when multiple IPMMU instances exist. That way the
code matches the expected behaviour described in the comment of
the add_iommu_group() function in iommu.c:

 /*
  * We ignore -ENODEV errors for now, as they just mean that the
  * device is not translated by an IOMMU. We still care about
  * other errors and fail to initialize when they happen.
  */

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Applies to next-20160920 on top of:
 b1e2afc iommu/ipmmu-vmsa: Fix wrong error handle of ipmmu_add_device

 drivers/iommu/ipmmu-vmsa.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0002/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2016-09-08 18:20:06.270607110 +0900
@@ -781,7 +781,7 @@ static int ipmmu_find_utlbs(struct ipmmu
 		of_node_put(args.np);
 
 		if (args.np != mmu->dev->of_node || args.args_count != 1)
-			return -EINVAL;
+			return -ENODEV;
 
 		utlbs[i] = args.args[0];
 	}
