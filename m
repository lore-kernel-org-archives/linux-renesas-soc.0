Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:38911 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750986AbeCTGr7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 02:47:59 -0400
From: Magnus Damm <magnus.damm@gmail.com>
To: devicetree@vger.kernel.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, robh+dt@kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>
Date: Tue, 20 Mar 2018 15:48:11 +0900
Message-Id: <152152849171.7720.4760459385074072620.sendpatchset@little-apple>
Subject: [PATCH] iommu/ipmmu-vmsa: Document R-Car M3-N IPMMU DT bindings
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Update the IPMMU DT binding documentation to include the r8a77965 compat
string for the IPMMU devices included in the R-Car M3-N SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt |    1 +
 1 file changed, 1 insertion(+)

--- 0001/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
+++ work/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt	2018-03-20 15:30:50.640607110 +0900
@@ -17,6 +17,7 @@ Required Properties:
     - "renesas,ipmmu-r8a7794" for the R8A7794 (R-Car E2) IPMMU.
     - "renesas,ipmmu-r8a7795" for the R8A7795 (R-Car H3) IPMMU.
     - "renesas,ipmmu-r8a7796" for the R8A7796 (R-Car M3-W) IPMMU.
+    - "renesas,ipmmu-r8a77965" for the R8A77965 (R-Car M3-N) IPMMU.
     - "renesas,ipmmu-r8a77970" for the R8A77970 (R-Car V3M) IPMMU.
     - "renesas,ipmmu-r8a77995" for the R8A77995 (R-Car D3) IPMMU.
     - "renesas,ipmmu-vmsa" for generic R-Car Gen2 VMSA-compatible IPMMU.
