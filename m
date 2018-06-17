Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:40424 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933588AbeFQKwg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Jun 2018 06:52:36 -0400
Received: by mail-pf0-f195.google.com with SMTP id z24-v6so6824775pfe.7
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jun 2018 03:52:36 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Sun, 17 Jun 2018 19:54:12 +0900
Message-Id: <152923285268.19253.8187284565521042664.sendpatchset@little-apple>
Subject: [PATCH] arm64: dts: renesas: IPMMU deferred probe test prototype
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Here's my local modification to test IPMMU with SYS-DMAC and the SCIF
console on r8a7795 H3ULCB. The dmac1 and dmac2 devices together with
audio dmacs are added to the IPMMU white list. The dmac0 device is
disabled in DT to easily be able to associate the /proc/interrupt
counters with the console activity.

A quick test has been performed by checking the console boot log output
(no errors and DMACs are assigned to the IPMMU) and also validating that
SCIF console activity results in incrementing /proc/interrupts counters
associated with the DMAC channels. Audio has not been tested.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Used together with renesas-drivers-2018-06-05-v4.17

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    1 +
 drivers/iommu/ipmmu-vmsa.c               |   12 ++++++++++++
 2 files changed, 13 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -839,6 +839,7 @@
 			       <&ipmmu_ds0 10>, <&ipmmu_ds0 11>,
 			       <&ipmmu_ds0 12>, <&ipmmu_ds0 13>,
 			       <&ipmmu_ds0 14>, <&ipmmu_ds0 15>;
+			status = "disabled";
 		};
 
 		dmac1: dma-controller@e7300000 {
--- 0001/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c
@@ -756,6 +756,18 @@ static int ipmmu_init_platform_device(st
 
 static bool ipmmu_slave_whitelist(struct device *dev)
 {
+  	if (!strcmp(dev_name(dev), "e7300000.dma-controller"))
+  		return true;
+  
+	if (!strcmp(dev_name(dev), "e7310000.dma-controller"))
+		return true;
+
+  	if (!strcmp(dev_name(dev), "ec700000.dma-controller"))
+  		return true;
+
+	if (!strcmp(dev_name(dev), "ec720000.dma-controller"))
+		return true;
+  
 	/* By default, do not allow use of IPMMU */
 	return false;
 }
