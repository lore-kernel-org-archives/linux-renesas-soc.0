Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55692 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752310AbdKAKgP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Nov 2017 06:36:15 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Joerg Roedel <joro@8bytes.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] iommu/ipmmu-vmsa: Add r8a779(70|95) DT bindings
Date: Wed,  1 Nov 2017 11:34:22 +0100
Message-Id: <20171101103423.7334-2-horms+renesas@verge.net.au>
In-Reply-To: <20171101103423.7334-1-horms+renesas@verge.net.au>
References: <20171101103423.7334-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Update the IPMMU DT binding documentation to include the
r8a77970 (R-Car V3M) and r8a77995 (R-Car D3) compat strings.

Based on work for r8a7796 by Magnus Damm.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
index 98ae900a7a76..9efa87dbcfdc 100644
--- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
+++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
@@ -17,6 +17,8 @@ Required Properties:
     - "renesas,ipmmu-r8a7794" for the R8A7794 (R-Car E2) IPMMU.
     - "renesas,ipmmu-r8a7795" for the R8A7795 (R-Car H3) IPMMU.
     - "renesas,ipmmu-r8a7796" for the R8A7796 (R-Car M3-W) IPMMU.
+    - "renesas,ipmmu-r8a77970" for the R8A7770 (R-Car V3M) IPMMU.
+    - "renesas,ipmmu-r8a77995" for the R8A77995 (R-Car D3) IPMMU.
     - "renesas,ipmmu-vmsa" for generic R-Car Gen2 VMSA-compatible IPMMU.
 
   - reg: Base address and size of the IPMMU registers.
-- 
2.11.0
