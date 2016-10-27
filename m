Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
Cc: mark.rutland@arm.com, laurent.pinchart+renesas@ideasonboard.com,
        geert+renesas@glider.be, joro@8bytes.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, robh+dt@kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 27 Oct 2016 19:45:10 +0900
Message-Id: <20161027104510.27104.53523.sendpatchset@little-apple>
Subject: [PATCH v2] iommu/ipmmu-vmsa: Add r8a7796 DT binding
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Update the IPMMU DT binding documentation to include the r8a7796 compat
string for R-Car M3-W.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

 Changes since V1:
 - Added Acked-by from Laurent - thanks!

 Now broken out, however earlier V1 posted as part of:
 [PATCH 0/3] iommu/ipmmu-vmsa: Initial r8a7796 support

 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt |    1 +
 1 file changed, 1 insertion(+)

--- 0001/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
+++ work/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt	2016-06-06 11:27:37.560607110 +0900
@@ -16,6 +16,7 @@ Required Properties:
     - "renesas,ipmmu-r8a7793" for the R8A7793 (R-Car M2-N) IPMMU.
     - "renesas,ipmmu-r8a7794" for the R8A7794 (R-Car E2) IPMMU.
     - "renesas,ipmmu-r8a7795" for the R8A7795 (R-Car H3) IPMMU.
+    - "renesas,ipmmu-r8a7796" for the R8A7796 (R-Car M3-W) IPMMU.
     - "renesas,ipmmu-vmsa" for generic R-Car Gen2 VMSA-compatible IPMMU.
 
   - reg: Base address and size of the IPMMU registers.
