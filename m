Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33574 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751728AbdIUVr3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2017 17:47:29 -0400
From: Magnus Damm <magnus.damm@gmail.com>
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, laurent.pinchart+renesas@ideasonboard.com,
        geert+renesas@glider.be, joro@8bytes.org,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, robh+dt@kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        robin.murphy@arm.com
Date: Fri, 22 Sep 2017 06:45:05 +0900
Message-Id: <150603030519.9664.14832335944316103595.sendpatchset@little-apple>
In-Reply-To: <150603029494.9664.3785539947602559695.sendpatchset@little-apple>
References: <150603029494.9664.3785539947602559695.sendpatchset@little-apple>
Subject: [PATCH 1/3] iommu/ipmmu-vmsa: Document R-Car M3-W IPMMU DT bindings
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Update the IPMMU DT binding documentation to include the r8a7796 compat
string for the IPMMU devices included in the R-Car M3-W SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt |    1 +
 1 file changed, 1 insertion(+)

--- 0001/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
+++ work/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt	2017-09-22 06:20:20.720607110 +0900
@@ -16,6 +16,7 @@ Required Properties:
     - "renesas,ipmmu-r8a7793" for the R8A7793 (R-Car M2-N) IPMMU.
     - "renesas,ipmmu-r8a7794" for the R8A7794 (R-Car E2) IPMMU.
     - "renesas,ipmmu-r8a7795" for the R8A7795 (R-Car H3) IPMMU.
+    - "renesas,ipmmu-r8a7796" for the R8A7796 (R-Car M3-W) IPMMU.
     - "renesas,ipmmu-vmsa" for generic R-Car Gen2 VMSA-compatible IPMMU.
 
   - reg: Base address and size of the IPMMU registers.
