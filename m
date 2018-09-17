Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35574 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727864AbeIQOMt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 10:12:49 -0400
Received: by mail-pg1-f196.google.com with SMTP id 7-v6so7334299pgf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Sep 2018 01:46:24 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 17 Sep 2018 17:46:23 +0900
Message-Id: <153717398326.578.15513023441673714711.sendpatchset@octo>
Subject: [PATCH/RFC] iommu/ipmmu-vmsa: R-Car E3 SYS-DMAC whitelist prototype
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

For testing purpose enable IPMMU for SYS-DMAC0, SYS-DMAC1 and SYS-DMAC2
on R-Car E3. Not for upstream merge.

Not-Yet-Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Applies on top of renesas-devel-20180914-v4.19-rc3

 drivers/iommu/ipmmu-vmsa.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

--- 0001/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2018-09-17 17:09:36.083484128 +0900
@@ -756,6 +756,18 @@ static int ipmmu_init_platform_device(st
 
 static bool ipmmu_slave_whitelist(struct device *dev)
 {
+	/* R-Car E3 SYS-DMAC0 (Channel 0-15) */
+	if (!strcmp(dev_name(dev), "e6700000.dma-controller"))
+		return true;
+
+	/* R-Car E3 SYS-DMAC1 (Channel 16-31) */
+	if (!strcmp(dev_name(dev), "e7300000.dma-controller"))
+		return true;
+
+	/* R-Car E3 SYS-DMAC2 (Channel 32-47) */
+	if (!strcmp(dev_name(dev), "e7310000.dma-controller"))
+		return true;
+
 	/* By default, do not allow use of IPMMU */
 	return false;
 }
