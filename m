Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:32794 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751728AbdIUVrt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2017 17:47:49 -0400
From: Magnus Damm <magnus.damm@gmail.com>
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, laurent.pinchart+renesas@ideasonboard.com,
        geert+renesas@glider.be, joro@8bytes.org,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, robh+dt@kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        robin.murphy@arm.com
Date: Fri, 22 Sep 2017 06:45:26 +0900
Message-Id: <150603032614.9664.3191963173399472802.sendpatchset@little-apple>
In-Reply-To: <150603029494.9664.3785539947602559695.sendpatchset@little-apple>
References: <150603029494.9664.3785539947602559695.sendpatchset@little-apple>
Subject: [PATCH 3/3] iommu/ipmmu-vmsa: Document R-Car D3 IPMMU DT bindings
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Update the IPMMU DT binding documentation to include the r8a77995 compat
string for the IPMMU devices included in the R-Car D3 SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt |    1 +
 1 file changed, 1 insertion(+)

--- 0003/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
+++ work/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt	2017-09-22 06:21:25.640607110 +0900
@@ -18,6 +18,7 @@ Required Properties:
     - "renesas,ipmmu-r8a7795" for the R8A7795 (R-Car H3) IPMMU.
     - "renesas,ipmmu-r8a7796" for the R8A7796 (R-Car M3-W) IPMMU.
     - "renesas,ipmmu-r8a77970" for the R8A77970 (R-Car V3M) IPMMU.
+    - "renesas,ipmmu-r8a77995" for the R8A77995 (R-Car D3) IPMMU.
     - "renesas,ipmmu-vmsa" for generic R-Car Gen2 VMSA-compatible IPMMU.
 
   - reg: Base address and size of the IPMMU registers.
