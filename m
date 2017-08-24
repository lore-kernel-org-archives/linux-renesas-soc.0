Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:41292 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752160AbdHXJwy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 05:52:54 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH ] PCI: rcar: Add r8a7743/5 support
Date: Thu, 24 Aug 2017 10:35:44 +0100
Message-Id: <1503567344-5610-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add internal PCI bridge support for r8a7743/5 SoC. Renesas RZ/G1[ME]
(R8A7743/5) internal PCI bridge is identical to the R-Car Gen2 family.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch is tested against Linux next tag next-20170824 and
renesas-dev branch renesas-devel-20170822-v4.13-rc6. 

 Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt b/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
index 07a7509..3d03863 100644
--- a/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
+++ b/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
@@ -6,11 +6,14 @@ AHB. There is one bridge instance per USB port connected to the internal
 OHCI and EHCI controllers.
 
 Required properties:
-- compatible: "renesas,pci-r8a7790" for the R8A7790 SoC;
+- compatible: "renesas,pci-r8a7743" for the R8A7743 SoC;
+	      "renesas,pci-r8a7745" for the R8A7745 SoC;
+	      "renesas,pci-r8a7790" for the R8A7790 SoC;
 	      "renesas,pci-r8a7791" for the R8A7791 SoC;
 	      "renesas,pci-r8a7793" for the R8A7793 SoC;
 	      "renesas,pci-r8a7794" for the R8A7794 SoC;
-	      "renesas,pci-rcar-gen2" for a generic R-Car Gen2 compatible device
+	      "renesas,pci-rcar-gen2" for a generic R-Car Gen2 or
+				      RZ/G1 compatible device.
 
 
 	      When compatible with the generic version, nodes must list the
-- 
1.9.1
