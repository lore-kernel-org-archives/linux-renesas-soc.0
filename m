Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:37714 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751021AbeEUOkW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 10:40:22 -0400
From: Magnus Damm <magnus.damm@gmail.com>
To: devicetree@vger.kernel.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, robh+dt@kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 21 May 2018 23:41:33 +0900
Message-Id: <152691369384.29456.13581918319106400529.sendpatchset@little-apple>
Subject: [PATCH] iommu/ipmmu-vmsa: Document R-Car V3H and E3 IPMMU DT bindings
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Update the IPMMU DT binding documentation to include the compat strings
for the IPMMU devices included in the R-Car V3H and E3 SoCs.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2018-05-15-v4.17-rc5

 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt |    2 ++
 1 file changed, 2 insertions(+)

--- 0001/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
+++ work/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt	2018-05-21 23:37:16.370607110 +0900
@@ -20,6 +20,8 @@ Required Properties:
     - "renesas,ipmmu-r8a7795" for the R8A7795 (R-Car H3) IPMMU.
     - "renesas,ipmmu-r8a7796" for the R8A7796 (R-Car M3-W) IPMMU.
     - "renesas,ipmmu-r8a77970" for the R8A77970 (R-Car V3M) IPMMU.
+    - "renesas,ipmmu-r8a77980" for the R8A77980 (R-Car V3H) IPMMU.
+    - "renesas,ipmmu-r8a77990" for the R8A77990 (R-Car E3) IPMMU.
     - "renesas,ipmmu-r8a77995" for the R8A77995 (R-Car D3) IPMMU.
     - "renesas,ipmmu-vmsa" for generic R-Car Gen2 or RZ/G1 VMSA-compatible
 			   IPMMU.
