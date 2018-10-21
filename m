Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf1-f182.google.com ([209.85.210.182]:33193 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbeJVCGf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Oct 2018 22:06:35 -0400
Received: by mail-pf1-f182.google.com with SMTP id 78-v6so16373395pfq.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Oct 2018 10:51:29 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 22 Oct 2018 02:51:37 +0900
Message-Id: <154014429795.2869.7870954544925695802.sendpatchset@octo>
Subject: [PATCH/RFC] iommu/ipmmu-vmsa: R-Car M3-N/V3H/E3 AVB whitelist prototype
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

For testing purpose enable IPMMU for Ethernet-AVB on R-Car M3-N/V3H/E3.

Not for upstream merge.

Not-Yet-Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Applies on top of renesas-devel-20181019-v4.19-rc8

 drivers/iommu/ipmmu-vmsa.c |    4 ++++
 1 file changed, 4 insertions(+)

--- 0001/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2018-10-22 02:46:30.139880557 +0900
@@ -756,6 +756,10 @@ static int ipmmu_init_platform_device(st
 
 static bool ipmmu_slave_whitelist(struct device *dev)
 {
+	/* R-Car M3-N/V3H/E3 Ethernet-AVB */
+	if (!strcmp(dev_name(dev), "e6800000.ethernet"))
+		return true;
+
 	/* By default, do not allow use of IPMMU */
 	return false;
 }
