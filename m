Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51650 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964853AbcKQRm7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 12:42:59 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/4] ARM: shmobile: Document DT bindings for Product Register
Date: Thu, 17 Nov 2016 15:04:36 +0100
Message-Id: <9eb11f7d133c50c21544e1f529815aa582dcccd4.1479389981.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1479389981.git.horms+renesas@verge.net.au>
References: <cover.1479389981.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add device tree binding documentation for the Product Register (PRR),
which provides product and revision information on most Renesas ARM
SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 2f0b7169f132..23c77315fdac 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -75,3 +75,21 @@ Boards:
     compatible = "renesas,silk", "renesas,r8a7794"
   - Wheat
     compatible = "renesas,wheat", "renesas,r8a7792"
+
+
+Most Renesas ARM SoCs have a Product Register that allows to retrieve SoC
+product and revision information.  If present, a device node for this register
+should be added.
+
+Required properties:
+  - compatible: Must be "renesas,prr".
+  - reg: Base address and length of the register block.
+
+
+Examples
+--------
+
+	prr: chipid@ff000044 {
+		compatible = "renesas,prr";
+		reg = <0 0xff000044 0 4>;
+	};
-- 
2.7.0.rc3.207.g0ac5344
