Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:46945 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752886AbdLTMZQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 07:25:16 -0500
Received: by mail-pl0-f65.google.com with SMTP id i6so8900072plt.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Dec 2017 04:25:16 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 20 Dec 2017 21:24:13 +0900
Message-Id: <151377265378.17613.6585544315769524309.sendpatchset@little-apple>
In-Reply-To: <151377262568.17613.8610167192375932687.sendpatchset@little-apple>
References: <151377262568.17613.8610167192375932687.sendpatchset@little-apple>
Subject: [PATCH/RFC 03/03] iommu/ipmmu-vmsa: Add SYS-DMAC devices as whitelist
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

For testing purpose add a list of allowed SYS-DMAC devices to
the IPMMU driver. These may be used together with SCIF serial
ports to validate some basic operation.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |    7 +++++++
 1 file changed, 7 insertions(+)

--- 0024/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-11-22 13:26:36.270607110 +0900
@@ -756,6 +756,13 @@ static int ipmmu_init_platform_device(st
 
 static bool ipmmu_slave_whitelist(struct device *dev)
 {
+	if (!strcmp(dev_name(dev), "e6700000.dma-controller"))
+		return true;
+	if (!strcmp(dev_name(dev), "e7300000.dma-controller"))
+		return true;
+	if (!strcmp(dev_name(dev), "e7310000.dma-controller"))
+		return true;
+  
 	/* By default, do not allow use of IPMMU */
 	return false;
 }
