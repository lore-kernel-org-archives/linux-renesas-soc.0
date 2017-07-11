Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38328 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750929AbdGKLof (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2017 07:44:35 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Tejun Heo <tj@kernel.org>
Cc: linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] ata: sata_rcar: add gen[23] fallback compatibility strings
Date: Tue, 11 Jul 2017 13:44:20 +0200
Message-Id: <1499773460-8930-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add fallback compatibility string for R-Car Gen 2 and 3.

In the case of Renesas R-Car hardware we know that there are generations of
SoCs, e.g. Gen 1 and 2. But beyond that its not clear what the relationship
between IP blocks might be. For example, I believe that r8a7790 is older
than r8a7791 but that doesn't imply that the latter is a descendant of the
former or vice versa.

We can, however, by examining the documentation and behaviour of the
hardware at run-time observe that the current driver implementation appears
to be compatible with the IP blocks on SoCs within a given generation.

For the above reasons and convenience when enabling new SoCs a
per-generation fallback compatibility string scheme being adopted for
drivers for Renesas SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on libata/for-next
---
 Documentation/devicetree/bindings/ata/sata_rcar.txt | 14 +++++++++++---
 drivers/ata/sata_rcar.c                             |  8 ++++++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/ata/sata_rcar.txt b/Documentation/devicetree/bindings/ata/sata_rcar.txt
index 0764f9ab63dc..e20eac7a3087 100644
--- a/Documentation/devicetree/bindings/ata/sata_rcar.txt
+++ b/Documentation/devicetree/bindings/ata/sata_rcar.txt
@@ -1,14 +1,22 @@
 * Renesas R-Car SATA
 
 Required properties:
-- compatible		: should contain one of the following:
+- compatible		: should contain one or more of the following:
 			  - "renesas,sata-r8a7779" for R-Car H1
-			    ("renesas,rcar-sata" is deprecated)
 			  - "renesas,sata-r8a7790-es1" for R-Car H2 ES1
 			  - "renesas,sata-r8a7790" for R-Car H2 other than ES1
 			  - "renesas,sata-r8a7791" for R-Car M2-W
 			  - "renesas,sata-r8a7793" for R-Car M2-N
 			  - "renesas,sata-r8a7795" for R-Car H3
+			  - "renesas,rcar-gen2-sata" for a generic R-Car Gen2 compatible device
+			  - "renesas,rcar-gen3-sata" for a generic R-Car Gen3 compatible device
+			  - "renesas,rcar-sata" is deprecated
+
+			  When compatible with the generic version nodes
+			  must list the SoC-specific version corresponding
+			  to the platform first followed by the generic
+			  version.
+
 - reg			: address and length of the SATA registers;
 - interrupts		: must consist of one interrupt specifier.
 - clocks		: must contain a reference to the functional clock.
@@ -16,7 +24,7 @@ Required properties:
 Example:
 
 sata0: sata@ee300000 {
-	compatible = "renesas,sata-r8a7791";
+	compatible = "renesas,sata-r8a7791", "renesas,rcar-gen2-sata";
 	reg = <0 0xee300000 0 0x2000>;
 	interrupt-parent = <&gic>;
 	interrupts = <0 105 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
index ee9844758736..537d11869069 100644
--- a/drivers/ata/sata_rcar.c
+++ b/drivers/ata/sata_rcar.c
@@ -858,6 +858,14 @@ static const struct of_device_id sata_rcar_match[] = {
 		.compatible = "renesas,sata-r8a7795",
 		.data = (void *)RCAR_GEN2_SATA
 	},
+	{
+		.compatible = "renesas,rcar-gen2-sata",
+		.data = (void *)RCAR_GEN2_SATA
+	},
+	{
+		.compatible = "renesas,rcar-gen3-sata",
+		.data = (void *)RCAR_GEN2_SATA
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, sata_rcar_match);
-- 
2.1.4
